Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF2C2173FA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 18:31:10 +0200 (CEST)
Received: from localhost ([::1]:53440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsqUv-0004uW-8M
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 12:31:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsq7S-0002le-Cs
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:06:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:24569
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsq7A-0006sT-T4
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 12:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594137996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JQWTI7WTeDdO2edvJDu9MrJg5B9I43B3w/8uGdZTAJ8=;
 b=gbahNoQ7ChK/AdEAmrAE30oKftXRxnNy0mUjpTAx7jsGHV3qvhWHei1yOUHF16Z2/ZE6Hy
 0JwkQHUY7/AkqGr6zh9rm9HKa12Yd3obCdglVAY3IOGNvns1KyKXxfmXLtsi3H/b7POHMo
 YRApD4Ft7D49RsIJP9CLt7v0xwP9dvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453--wX3hp5JNnmBLFNhljFLwQ-1; Tue, 07 Jul 2020 12:06:34 -0400
X-MC-Unique: -wX3hp5JNnmBLFNhljFLwQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B43518829C0;
 Tue,  7 Jul 2020 16:06:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D985919D7B;
 Tue,  7 Jul 2020 16:06:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3292A10C4AE7; Tue,  7 Jul 2020 18:06:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 44/45] qdev: Ignore Error objects where the return value
 suffices
Date: Tue,  7 Jul 2020 18:06:12 +0200
Message-Id: <20200707160613.848843-45-armbru@redhat.com>
In-Reply-To: <20200707160613.848843-1-armbru@redhat.com>
References: <20200707160613.848843-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 00:46:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, groug@kaod.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 hw/core/qdev-properties.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 2bec8a80b8..098298c78e 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -742,7 +742,6 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
     Property *prop = opaque;
     int32_t value, *ptr = qdev_get_prop_ptr(dev, prop);
     unsigned int slot, fn, n;
-    Error *local_err = NULL;
     char *str;
 
     if (dev->realized) {
@@ -750,9 +749,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (!visit_type_str(v, name, &str, &local_err)) {
-        error_free(local_err);
-        local_err = NULL;
+    if (!visit_type_str(v, name, &str, NULL)) {
         if (!visit_type_int32(v, name, &value, errp)) {
             return;
         }
-- 
2.26.2


