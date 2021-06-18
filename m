Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D45C3AC2C8
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 07:10:54 +0200 (CEST)
Received: from localhost ([::1]:58016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu6mL-0005y1-ER
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 01:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6Y2-0005zx-1Y
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:56:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lu6Xx-0004lQ-Gq
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 00:56:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623992160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MOj1tDTsNrMLeU1D5eiY7ntP624q1LCrH82mgp0Qpto=;
 b=ACEyqNWG5juurDPNVEtkStSlwAVo7Fasw5gaOL8ZWWPEMTN1r72k2g0YIOW4kenMR4Er3C
 2N+KzMFDsQyj1tYHQzsWfGmih/LLVbqhjjORAL9D3gspSf53Uu3g5T0+lUdrEijUDzcDh/
 MtIiRIywKXg/lL3tozaa5x5mHNawwc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-Qr8_0sPMNfWose8LDAo8pg-1; Fri, 18 Jun 2021 00:55:59 -0400
X-MC-Unique: Qr8_0sPMNfWose8LDAo8pg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25D0F3625B;
 Fri, 18 Jun 2021 04:55:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D838560E3A;
 Fri, 18 Jun 2021 04:55:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0DE3C180354E; Fri, 18 Jun 2021 06:53:55 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 20/24] accel: autoload modules
Date: Fri, 18 Jun 2021 06:53:49 +0200
Message-Id: <20210618045353.2510174-21-kraxel@redhat.com>
In-Reply-To: <20210618045353.2510174-1-kraxel@redhat.com>
References: <20210618045353.2510174-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Peter Lieven <pl@kamp.de>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Call module_object_class_by_name() instead of object_class_by_name()
for objects possibly implemented as module

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 accel/accel-common.c  | 2 +-
 accel/accel-softmmu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/accel-common.c b/accel/accel-common.c
index cf07f78421d6..7b8ec7e0f72a 100644
--- a/accel/accel-common.c
+++ b/accel/accel-common.c
@@ -44,7 +44,7 @@ static const TypeInfo accel_type = {
 AccelClass *accel_find(const char *opt_name)
 {
     char *class_name = g_strdup_printf(ACCEL_CLASS_NAME("%s"), opt_name);
-    AccelClass *ac = ACCEL_CLASS(object_class_by_name(class_name));
+    AccelClass *ac = ACCEL_CLASS(module_object_class_by_name(class_name));
     g_free(class_name);
     return ac;
 }
diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index 50fa5acaa401..67276e4f5222 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -72,7 +72,7 @@ void accel_init_ops_interfaces(AccelClass *ac)
     g_assert(ac_name != NULL);
 
     ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
-    ops = ACCEL_OPS_CLASS(object_class_by_name(ops_name));
+    ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
     g_free(ops_name);
 
     /*
-- 
2.31.1


