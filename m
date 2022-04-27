Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB08351165D
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:39:49 +0200 (CEST)
Received: from localhost ([::1]:55550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njg1M-0002iI-Li
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuQ-0000s0-Jt
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:38 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:45824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuJ-0001oZ-VX
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:34 -0400
Received: by mail-ed1-x532.google.com with SMTP id be20so1560590edb.12
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XcEbAj7DkotRRBN7FgHWWPGt3A08+JD5zJxGjzXCVh8=;
 b=QZx4PIrTJXaSqwJJBTNC8sJYqYseKQNpNANMnEtjQm+JKQBPJsUECazHjLEdZKjOrJ
 2RKb6f03w5HRyw98dcX22457Ve/QQFC86w0I3DtVe0eWl+HzEI/gCpzlF0oQTcARiHSC
 mhEhYJzC3k02sMfefgsSQBEquN5AC/YWaxYOT+GO22jGwNnnuUrsO0PbenQ6dGYdAVsk
 AUh6IpHyGDvsvXqOfSg87pSzpjiz1koCNMMLAU7eoUyexg/V69D1OOr0MX9bg1sWt7yE
 jF5p7w1GYwkpg8NADpy2uPSDls6ukiQxoBmXr9PjXKRRgCl27oHQ6cbZuRNB7r0MzEjU
 2BPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XcEbAj7DkotRRBN7FgHWWPGt3A08+JD5zJxGjzXCVh8=;
 b=0yFtDrAuUQ3I4CsDtaqtD5wgQ2vXVEiMz/YaC4W3Qbghw9zTojvvNQSFEY/EH4uDfn
 tGhh7HcxhrNWElWermiH65jS0P4y65sGfT3IqtCEAujix9iLlC3AFeoahdGYpg5nWFi6
 shcn56IDraKnMYTzCJjrHfnGBVRkjiNZiNQlQ/qIviwNQzYb34VBatdeBWnIVs6DfmTj
 D3GMTmyMYNGK1fAGZEt5OnI0QvOdQcahPi1/H+goAypNlSV+ruxe2DIv97Jb/hEzI1jo
 fceqxur2ZOX99QY0gVMLnn8BVqeUaqw42g8r5uRtKaEmPCX65sFcFW+RpdJcYc8Q162K
 YsJw==
X-Gm-Message-State: AOAM530zuo8tKLTx0pJ8I2sWQS8zySx+TV/FrvaceLm+qAe2ZGiWt8Q6
 i8lUc7wVFF9tRu6A4p2mOea8eQsPlZV9jw==
X-Google-Smtp-Source: ABdhPJxu+69Wc1f/roEQDTL2P13UwJvZ1UCzxMEJevOTbW17j9wY0mwY/lfyaQPLAxwXXs75sfdbrQ==
X-Received: by 2002:aa7:c3ca:0:b0:425:ecfc:4258 with SMTP id
 l10-20020aa7c3ca000000b00425ecfc4258mr14880066edr.266.1651059149472; 
 Wed, 27 Apr 2022 04:32:29 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d26-20020a170906305a00b006f3a7ffbb0esm3099216ejd.70.2022.04.27.04.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:32:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/6] soundhw: remove ability to create multiple soundcards
Date: Wed, 27 Apr 2022 13:32:21 +0200
Message-Id: <20220427113225.112521-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427113225.112521-1-pbonzini@redhat.com>
References: <20220427113225.112521-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: mkletzan@redhat.com, berrange@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The usefulness of enabling a dozen soundcards is dubious.  Simplify the
code by allowing a single instance of -soundhw, with no support for
parsing either comma-separated values or 'soundhw all'.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/audio/soundhw.c | 88 +++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 56 deletions(-)

diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
index f7d94d7dfa..097501fee1 100644
--- a/hw/audio/soundhw.c
+++ b/hw/audio/soundhw.c
@@ -25,6 +25,7 @@
 #include "qemu/option.h"
 #include "qemu/help_option.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
 #include "qom/object.h"
 #include "hw/isa/isa.h"
 #include "hw/pci/pci.h"
@@ -34,7 +35,6 @@ struct soundhw {
     const char *name;
     const char *descr;
     const char *typename;
-    int enabled;
     int isa;
     int (*init_pci) (PCIBus *bus);
 };
@@ -64,10 +64,16 @@ void deprecated_register_soundhw(const char *name, const char *descr,
     soundhw_count++;
 }
 
+static struct soundhw *selected = NULL;
+
 void select_soundhw(const char *optarg)
 {
     struct soundhw *c;
 
+    if (selected) {
+        error_setg(&error_fatal, "only one -soundhw option is allowed");
+    }
+
     if (is_help_option(optarg)) {
     show_valid_cards:
 
@@ -84,44 +90,15 @@ void select_soundhw(const char *optarg)
         exit(!is_help_option(optarg));
     }
     else {
-        size_t l;
-        const char *p;
-        char *e;
-        int bad_card = 0;
-
-        if (!strcmp(optarg, "all")) {
-            for (c = soundhw; c->name; ++c) {
-                c->enabled = 1;
+        for (c = soundhw; c->name; ++c) {
+            if (g_str_equal(c->name, optarg)) {
+                selected = c;
+                break;
             }
-            return;
         }
 
-        p = optarg;
-        while (*p) {
-            e = strchr(p, ',');
-            l = !e ? strlen(p) : (size_t) (e - p);
-
-            for (c = soundhw; c->name; ++c) {
-                if (!strncmp(c->name, p, l) && !c->name[l]) {
-                    c->enabled = 1;
-                    break;
-                }
-            }
-
-            if (!c->name) {
-                if (l > 80) {
-                    error_report("Unknown sound card name (too big to show)");
-                }
-                else {
-                    error_report("Unknown sound card name `%.*s'",
-                                 (int) l, p);
-                }
-                bad_card = 1;
-            }
-            p += l + (e != NULL);
-        }
-
-        if (bad_card) {
+        if (!c->name) {
+            error_report("Unknown sound card name `%s'", optarg);
             goto show_valid_cards;
         }
     }
@@ -129,30 +106,29 @@ void select_soundhw(const char *optarg)
 
 void soundhw_init(void)
 {
-    struct soundhw *c;
+    struct soundhw *c = selected;
     ISABus *isa_bus = (ISABus *) object_resolve_path_type("", TYPE_ISA_BUS, NULL);
     PCIBus *pci_bus = (PCIBus *) object_resolve_path_type("", TYPE_PCI_BUS, NULL);
 
-    for (c = soundhw; c->name; ++c) {
-        if (c->enabled) {
-            if (c->typename) {
-                warn_report("'-soundhw %s' is deprecated, "
-                            "please use '-device %s' instead",
-                            c->name, c->typename);
-                if (c->isa) {
-                    isa_create_simple(isa_bus, c->typename);
-                } else {
-                    pci_create_simple(pci_bus, -1, c->typename);
-                }
-            } else {
-                assert(!c->isa);
-                if (!pci_bus) {
-                    error_report("PCI bus not available for %s", c->name);
-                    exit(1);
-                }
-                c->init_pci(pci_bus);
-            }
+    if (!c) {
+        return;
+    }
+    if (c->typename) {
+        warn_report("'-soundhw %s' is deprecated, "
+                    "please use '-device %s' instead",
+                    c->name, c->typename);
+        if (c->isa) {
+            isa_create_simple(isa_bus, c->typename);
+        } else {
+            pci_create_simple(pci_bus, -1, c->typename);
         }
+    } else {
+        assert(!c->isa);
+        if (!pci_bus) {
+            error_report("PCI bus not available for %s", c->name);
+            exit(1);
+        }
+        c->init_pci(pci_bus);
     }
 }
 
-- 
2.35.1



