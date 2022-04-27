Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614C2511664
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 13:48:52 +0200 (CEST)
Received: from localhost ([::1]:35412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njgA7-0000cG-7B
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 07:48:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuS-0000tV-1a
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:40 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njfuL-0001pC-78
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 07:32:36 -0400
Received: by mail-ej1-x636.google.com with SMTP id dk23so2779123ejb.8
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/pSiiolR4M6W1WjSd8pasEM62dxnIZG2DNdUhvZONkg=;
 b=IGj99rax8KfteX3MMQyO2VAmehcg9zNsJu4DsGQQ6/PRFgaj4zU6rgBpty5GCTLxqs
 sD55tDNJh5Tzdma3jDbgUR81milWIIrHeRrVgWrm6TsziEn6fuo+28gB/KBqE+Ay96s5
 BMGSxOkwu0ncI93RXQILSwFeB4HzhB20r54PL09L93MXWM8h6HFhwxyS5yU1OYC/UU1i
 MRT/OoE2ZIEpBkoYZb5dDKgpiH7w0aSANsFtnQu/L1ZuLLOohcTR/kK/oOUP7jNWXdqn
 irLY7CJ0KApphHw7C9eUVYBp0KHHJdnNR84VT8Ik24V8aLiZKsqiqQFEF2rdg7cL1Qmt
 uKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/pSiiolR4M6W1WjSd8pasEM62dxnIZG2DNdUhvZONkg=;
 b=ROcyPwF7FPcnAKU0BmbAaLay2OC/7kLHoUfRYB3TK8BGkzS3N+24STNOVOXYb4EMxg
 y753LsMGJPJPH55JzZKPdawT77vrDC9+1XoEP5OtfmJTyTSAfKKZQWhCKNOZCOUCyWy7
 QkevAj+waRhLVEifteyfqV7QdOKG7yVRoOq3Tcb5/RtbUlu3a3ZuiTHwbhlIlsZ644Km
 ulBvyhdHFBmRhWYwxMB8B1WFfiok2k3vDrvzzho+lwemUDjCkAFTasAptNX8ccHoz8H7
 dHtRrv+JCjqMvqU1Lea3/i6QWpVbnuJSDUHsZmVCW43nrzF2HhOLK2k5kU7C0EYAC+gA
 P+iQ==
X-Gm-Message-State: AOAM531nNCYBt2sWQhNsTNIxgCblV9RVrktrfAA7Tf92tkN2sVGmP6B2
 mblhl5fV8t7az6z0k3YIcpFCgbR/45GcNw==
X-Google-Smtp-Source: ABdhPJyWltN7Hp/Vl54lwuAPKdSQsioP1kBTh7hkn+Tc3c+sJFY9P4eE1Og1jp4dQzhrpcRG5PQ+Eg==
X-Received: by 2002:a17:907:c31a:b0:6f3:cd46:4092 with SMTP id
 tl26-20020a170907c31a00b006f3cd464092mr1803142ejc.592.1651059150301; 
 Wed, 27 Apr 2022 04:32:30 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 d26-20020a170906305a00b006f3a7ffbb0esm3099216ejd.70.2022.04.27.04.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 04:32:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/6] soundhw: extract soundhw help to a separate function
Date: Wed, 27 Apr 2022 13:32:22 +0200
Message-Id: <20220427113225.112521-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427113225.112521-1-pbonzini@redhat.com>
References: <20220427113225.112521-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/audio/soundhw.c         | 33 +++++++++++++++++++--------------
 include/hw/audio/soundhw.h |  1 +
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/hw/audio/soundhw.c b/hw/audio/soundhw.c
index 097501fee1..0fb64bdc8f 100644
--- a/hw/audio/soundhw.c
+++ b/hw/audio/soundhw.c
@@ -64,6 +64,21 @@ void deprecated_register_soundhw(const char *name, const char *descr,
     soundhw_count++;
 }
 
+void show_valid_soundhw(void)
+{
+    struct soundhw *c;
+
+    if (soundhw_count) {
+         printf("Valid sound card names (comma separated):\n");
+         for (c = soundhw; c->name; ++c) {
+             printf ("%-11s %s\n", c->name, c->descr);
+         }
+    } else {
+         printf("Machine has no user-selectable audio hardware "
+                "(it may or may not have always-present audio hardware).\n");
+    }
+}
+
 static struct soundhw *selected = NULL;
 
 void select_soundhw(const char *optarg)
@@ -75,19 +90,8 @@ void select_soundhw(const char *optarg)
     }
 
     if (is_help_option(optarg)) {
-    show_valid_cards:
-
-        if (soundhw_count) {
-             printf("Valid sound card names (comma separated):\n");
-             for (c = soundhw; c->name; ++c) {
-                 printf ("%-11s %s\n", c->name, c->descr);
-             }
-             printf("\n-soundhw all will enable all of the above\n");
-        } else {
-             printf("Machine has no user-selectable audio hardware "
-                    "(it may or may not have always-present audio hardware).\n");
-        }
-        exit(!is_help_option(optarg));
+        show_valid_soundhw();
+        exit(0);
     }
     else {
         for (c = soundhw; c->name; ++c) {
@@ -99,7 +103,8 @@ void select_soundhw(const char *optarg)
 
         if (!c->name) {
             error_report("Unknown sound card name `%s'", optarg);
-            goto show_valid_cards;
+            show_valid_soundhw();
+            exit(1);
         }
     }
 }
diff --git a/include/hw/audio/soundhw.h b/include/hw/audio/soundhw.h
index e68685fcda..dec5c0cdca 100644
--- a/include/hw/audio/soundhw.h
+++ b/include/hw/audio/soundhw.h
@@ -7,6 +7,7 @@ void deprecated_register_soundhw(const char *name, const char *descr,
                                  int isa, const char *typename);
 
 void soundhw_init(void);
+void show_valid_soundhw(void);
 void select_soundhw(const char *optarg);
 
 #endif
-- 
2.35.1



