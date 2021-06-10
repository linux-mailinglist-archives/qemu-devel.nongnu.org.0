Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77243A297C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:39:59 +0200 (CEST)
Received: from localhost ([::1]:48618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI6Q-00055R-PE
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHjO-0006OR-Rr
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:16:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHjN-00018w-5x
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623320168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8xHdI0iBHhE8SWS4ss8bjjdkfXV4HozSbySoxC7m+s=;
 b=AMR02+3FyrLek97q1fnETlak7Hfy/qVxeO9klHqJcvBthWG2WoNICSD+nWzkTqY6p/poGM
 7SlIrxxFSRTp1WJLIiP7uyk9s+7fl3/deMXlFPoVWSKxL197deRnUAzToQrv5E8zcx8AbJ
 yoXYjaVJ87kiH1MALC327a/VnjrlFYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-ClO598BrNPm_IiFDBDvezA-1; Thu, 10 Jun 2021 06:16:05 -0400
X-MC-Unique: ClO598BrNPm_IiFDBDvezA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1140C100C618;
 Thu, 10 Jun 2021 10:16:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7D7F1037E81;
 Thu, 10 Jun 2021 10:15:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 160C618007A3; Thu, 10 Jun 2021 12:15:53 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] modules: factor out arch check
Date: Thu, 10 Jun 2021 12:15:50 +0200
Message-Id: <20210610101553.943689-2-kraxel@redhat.com>
In-Reply-To: <20210610101553.943689-1-kraxel@redhat.com>
References: <20210610101553.943689-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 cfontana@suse.de, jose.ziviani@suse.com, pbonzini@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move check to helper function for easy reuse.
No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/util/module.c b/util/module.c
index 4f98cc74ae37..860c257fc56e 100644
--- a/util/module.c
+++ b/util/module.c
@@ -129,6 +129,21 @@ void module_allow_arch(const char *arch)
     module_arch = arch;
 }
 
+static bool module_check_arch(ModuleInfo *info)
+{
+    if (info->has_arch) {
+        if (!module_arch) {
+            /* no arch set -> ignore all */
+            return false;
+        }
+        if (strcmp(module_arch, info->arch) != 0) {
+            /* mismatch */
+            return false;
+        }
+    }
+    return true;
+}
+
 static void module_load_path_init(void)
 {
     const char *search_dir;
@@ -301,12 +316,9 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
     module_load_modinfo();
 
     for (modlist = modinfo->list; modlist != NULL; modlist = modlist->next) {
-        if (modlist->value->has_arch) {
-            if (strcmp(modlist->value->name, module_name) == 0) {
-                if (!module_arch ||
-                    strcmp(modlist->value->arch, module_arch) != 0) {
-                    return false;
-                }
+        if (strcmp(modlist->value->name, module_name) == 0) {
+            if (!module_check_arch(modlist->value)) {
+                return false;
             }
         }
         if (modlist->value->has_deps) {
-- 
2.31.1


