Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD53B2CB5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:43:56 +0200 (CEST)
Received: from localhost ([::1]:33252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMpv-0008UP-BN
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:43:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMlh-0007f4-Bt
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwMld-0006qD-Pu
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624531169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HVkjQbly3dsiItgADM//9yMkxJsBU/36GStGQA/SeE=;
 b=FYl8HmwxPasmz5ttMWAi7EUp28xm7FiVy/J2zLQz5vlm90YcS8IUUNWFymmih06Wj+cu5A
 HROq+7pUT7AWXp3Nb78yE7kZnwvRyeCmIniYEyOX1cxgboq4vB4MHnRRGRB9HEwUsX8SHW
 3SxLYyfx/VVYdkX9SHApxqCl6sQ3nf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-xpF5H4k-OI6sRPvfFue0Qw-1; Thu, 24 Jun 2021 06:39:28 -0400
X-MC-Unique: xpF5H4k-OI6sRPvfFue0Qw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 836DA106B7E0;
 Thu, 24 Jun 2021 10:39:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CB8C5C1BB;
 Thu, 24 Jun 2021 10:39:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4A7B11800902; Thu, 24 Jun 2021 12:38:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/34] modules: add chardev module annotations
Date: Thu, 24 Jun 2021 12:38:09 +0200
Message-Id: <20210624103836.2382472-8-kraxel@redhat.com>
In-Reply-To: <20210624103836.2382472-1-kraxel@redhat.com>
References: <20210624103836.2382472-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x@nongnu.org, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 chardev/baum.c  | 1 +
 chardev/spice.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/chardev/baum.c b/chardev/baum.c
index 5deca778bc44..79d618e35045 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -680,6 +680,7 @@ static const TypeInfo char_braille_type_info = {
     .instance_finalize = char_braille_finalize,
     .class_init = char_braille_class_init,
 };
+module_obj(TYPE_CHARDEV_BRAILLE);
 
 static void register_types(void)
 {
diff --git a/chardev/spice.c b/chardev/spice.c
index 1104426e3a11..3ffb3fdc0dac 100644
--- a/chardev/spice.c
+++ b/chardev/spice.c
@@ -366,6 +366,7 @@ static const TypeInfo char_spice_type_info = {
     .class_init = char_spice_class_init,
     .abstract = true,
 };
+module_obj(TYPE_CHARDEV_SPICE);
 
 static void char_spicevmc_class_init(ObjectClass *oc, void *data)
 {
@@ -396,6 +397,7 @@ static const TypeInfo char_spiceport_type_info = {
     .parent = TYPE_CHARDEV_SPICE,
     .class_init = char_spiceport_class_init,
 };
+module_obj(TYPE_CHARDEV_SPICEPORT);
 
 static void register_types(void)
 {
@@ -405,3 +407,5 @@ static void register_types(void)
 }
 
 type_init(register_types);
+
+module_dep("ui-spice-core");
-- 
2.31.1


