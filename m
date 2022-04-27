Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9331251165B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:37:16 +0200 (CEST)
Received: from localhost ([::1]:50180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njfyt-0007cp-Hs
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuS-0000tZ-3M
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:40 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuM-0001pJ-G1
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:38 -0400
Received: by mail-ed1-x532.google.com with SMTP id b24so1569672edu.10
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZeIWCK8hg6Sj8fOxFWWHzcrLf3ZpiEYw763wTq7Q2pQ=;
 b=lMj+s7Sawh/YBJHDRjaG9nHVg0wpWyp9OHC6kPr8RioYOIeYs+AVOOx0P/6mEQ4reL
 /itcselVc0FL5brGYCs8a68SqTZsBb/KS7tHOTQXCoZ64I83a5Xx6ExvPOiXXpNuEfsq
 xkC8ndwDdZOKY5VLM+tCC26yaStTJq5A9TGXmuq15KK/Gkk/oFDmeUY/6mPCvkqQeCcz
 Lg/VVpgKL3yR7m6nWilBTr3nevecO4HjrSYohNm5XbQP5NOZW5omKaSyuaxiD+2cHDVU
 0geMRupvAxsSZ4LPvxk+0B2hl5ggO4VQ/3DWtrDUijXhhJ1vKTLIl2isvWRXTSGX9RHQ
 KrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZeIWCK8hg6Sj8fOxFWWHzcrLf3ZpiEYw763wTq7Q2pQ=;
 b=f7Y2HrHxNrCWVlTM0mh6f1ZLk3imuEygZbJfgFdxKivw38RoeRxssI+Ypc5dCvemGO
 KI8QuxoTDYdmIYzfrWSxBs8wuU58otCzEzCV442aHFyN5g7Lkzh7ac+BE/x5a9UjdzyG
 ckmrFpIQzW81Oo14EXL0xwzU2L6Ccf51vQpRr1vcT/e6C/NNlEeuJeZpuVCYNTo0TSbi
 WvnTN+UGgK7Uwf+jd7aolMhNFJkdy7avxluEkShj3OLmjVDPYV2vsWZ0D+th2TMaa1rB
 W/fX0KnevxcFIbXJYP/wCKYvR2Ux47bTZNX0s3bg7We8cfBUzc2T1l+BImS2IfP1uiPx
 dQQA==
X-Gm-Message-State: AOAM53224nzD6wMw0wEtFqqEHdHMIDIr9ELP9CF8R9+PWgkTYpczhwid
 PSQxkVsrzi6c88aMAk2tUk7C+l16OOp/qg==
X-Google-Smtp-Source: ABdhPJyjT5cklD2AcL6PZn3QosXmNouptlUeilFgVunSnVxePtvdl+eelFJG/cscspgAyhkbQ/ZqKg==
X-Received: by 2002:a50:c099:0:b0:415:f5c7:700e with SMTP id
 k25-20020a50c099000000b00415f5c7700emr29400671edf.205.1651059151256; 
 Wed, 27 Apr 2022 04:32:31 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d26-20020a170906305a00b006f3a7ffbb0esm3099216ejd.70.2022.04.27.04.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:32:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 4/6] soundhw: unify initialization for ISA and PCI soundhw
Date: Wed, 27 Apr 2022 13:32:23 +0200
Message-Id: <20220427113225.112521-5-pbonzini@redhat.com>
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

Use qdev_new instead of distinguishing isa_create_simple/pci_create_simple.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/audio/soundhw.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
index 0fb64bdc8f..a9d8807b18 100644
--- a/hw/audio/soundhw.c
+++ b/hw/audio/soundhw.c
@@ -114,25 +114,27 @@ void soundhw_init(void)
     struct soundhw *c = selected;
     ISABus *isa_bus = (ISABus *) object_resolve_path_type("", TYPE_ISA_BUS, NULL);
     PCIBus *pci_bus = (PCIBus *) object_resolve_path_type("", TYPE_PCI_BUS, NULL);
+    BusState *bus;
 
-    if (!c) {
-        return;
-    }
-    if (c->typename) {
-        warn_report("'-soundhw %s' is deprecated, "
-                    "please use '-device %s' instead",
-                    c->name, c->typename);
-        if (c->isa) {
-            isa_create_simple(isa_bus, c->typename);
-        } else {
-            pci_create_simple(pci_bus, -1, c->typename);
+    if (c->isa) {
+        if (!isa_bus) {
+            error_report("ISA bus not available for %s", c->name);
+            exit(1);
         }
+        bus = BUS(isa_bus);
     } else {
-        assert(!c->isa);
         if (!pci_bus) {
             error_report("PCI bus not available for %s", c->name);
             exit(1);
         }
+        bus = BUS(pci_bus);
+    }
+
+    if (c->typename) {
+        DeviceState *dev = qdev_new(c->typename);
+        qdev_realize_and_unref(dev, bus, &error_fatal);
+    } else {
+        assert(!c->isa);
         c->init_pci(pci_bus);
     }
 }
-- 
2.35.1



