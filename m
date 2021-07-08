Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AC03C1611
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:34:53 +0200 (CEST)
Received: from localhost ([::1]:44354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W3A-0000K8-PR
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmx-0000Qg-P7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:07 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmv-0008Db-R8
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:07 -0400
Received: by mail-ed1-x52e.google.com with SMTP id m17so9027064edc.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G3GP9yNPW/jQe/C/J/4O6WqOQ/Mym8ZAXiesLvzC+94=;
 b=cA3t52OeP3cwsxb/5Jj59SyoeB1HojJEUACgEXbplTxbKNfEDiW1WddiBZF8aeelMV
 IFdIrBfWQvFVS8DEq3TrQyuszlXeN9hD2u2+FwCzKkZSZ5O6j6SKjz6b9k6XpVcLd0jq
 nja3vdWypjMCSKZk8qaJC/JJGI45tagomWDrcXyXEBNJ2KAil1ancAXXEZV0T293zL0q
 5GqnZY/Re63aUvVBOMrUt2R/YGaJdu6tlXK0jNYqmlzIFQ036njeR6mDdjAOZuWU5zPQ
 3Le9p3h699b6FQouvJz7L4Ms/69ArylqsGb3+nnQO1+BS7fimw7MToONYjleRPsSCxh2
 ypxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=G3GP9yNPW/jQe/C/J/4O6WqOQ/Mym8ZAXiesLvzC+94=;
 b=d6KS/tupTmCYmXQxsY/ziZg0MBpWal3RAYEIYaxP1ovNVl7nsYjZMiVy6PxC1aTiS/
 svYs8Ho0p7x48pszN7zZhjYVavyXrxADb62Y9yyKl17aW8j715Fbt3gAGDR1KMUbFvch
 FDv0BYRYg2rgFJXymsHKZBB2iW/MOf92knlRfbxbzyStM68TpgkhLEq44m8U6Sa8Zlpj
 xX6U3ZidMadJFVRnN9RerdB9cTmRN7l2I0gBOZ6oH+M/VeDZWduPHS8fF6hlmMHYoy5I
 WOCEtiIAIXZB9/QEiJhSFenMJdKhWVDeFjUMhqo5C/jtVykx0+PaS7kHjvOYVLIOlsmU
 ScQg==
X-Gm-Message-State: AOAM532lRQ10Uekymbj/+3KxTh1u58uOibO1OC0hcn/BHBilMNrh2Owh
 JEJVOaTDyVwUbjmmOktXDdvksIhiXZI=
X-Google-Smtp-Source: ABdhPJw3Mbge8AB4dDwqEtHCj341kbwLh80BMD/hcuz/Ci/IfyJQSW1USxyg+GU+SJmunZWaGstjzg==
X-Received: by 2002:a05:6402:d06:: with SMTP id
 eb6mr38107095edb.337.1625757484544; 
 Thu, 08 Jul 2021 08:18:04 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/48] modules: add tracepoints
Date: Thu,  8 Jul 2021 17:17:21 +0200
Message-Id: <20210708151748.408754-22-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

One for module load and one for qom type lookup.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-18-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/module.c     | 3 +++
 util/trace-events | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/util/module.c b/util/module.c
index a9ec2da997..acaaecad56 100644
--- a/util/module.c
+++ b/util/module.c
@@ -24,6 +24,7 @@
 #ifdef CONFIG_MODULE_UPGRADES
 #include "qemu-version.h"
 #endif
+#include "trace.h"
 
 typedef struct ModuleEntry
 {
@@ -176,6 +177,7 @@ static int module_load_file(const char *fname, bool mayfail, bool export_symbols
         ret = 0;
     }
 
+    trace_module_load_module(fname);
     QTAILQ_FOREACH_SAFE(e, &dso_init_list, node, next) {
         QTAILQ_REMOVE(&dso_init_list, e, node);
         g_free(e);
@@ -294,6 +296,7 @@ void module_load_qom_one(const char *type)
         return;
     }
 
+    trace_module_lookup_object_type(type);
     for (modinfo = module_info; modinfo->name != NULL; modinfo++) {
         if (!modinfo->objs) {
             continue;
diff --git a/util/trace-events b/util/trace-events
index 806cac14a7..c8f53d7d9f 100644
--- a/util/trace-events
+++ b/util/trace-events
@@ -100,3 +100,7 @@ uffd_create_fd_api_failed(int err) "errno: %i"
 uffd_create_fd_api_noioctl(uint64_t ioctl_req, uint64_t ioctl_supp) "ioctl_req: 0x%" PRIx64 "ioctl_supp: 0x%" PRIx64
 uffd_register_memory_failed(void *addr, uint64_t length, uint64_t mode, int err) "addr: %p length: %" PRIu64 " mode: 0x%" PRIx64 " errno: %i"
 uffd_unregister_memory_failed(void *addr, uint64_t length, int err) "addr: %p length: %" PRIu64 " errno: %i"
+
+# module.c
+module_load_module(const char *name) "file %s"
+module_lookup_object_type(const char *name) "name %s"
-- 
2.31.1



