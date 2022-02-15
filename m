Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B334B6BCA
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 13:12:56 +0100 (CET)
Received: from localhost ([::1]:45516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJwhT-0005io-DS
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 07:12:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJwbs-00019q-80
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:07:11 -0500
Received: from [2607:f8b0:4864:20::42b] (port=37729
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJwbp-0001Zj-MD
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:07:07 -0500
Received: by mail-pf1-x42b.google.com with SMTP id y5so34530518pfe.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 04:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NDlzhTd2cBTGXIahkORLBFSkJiYIgBcr8T5aNMdx3sA=;
 b=L9qtZn8hO3ozsMSGGZdD4zHo39uJlq2/d6XpeS8H5btcKUe5J126EZxEgr/ZUUDBxr
 oyQetBXWRvQBkuIBd+YPU5crkelD+AOwvkjZmbfi8Ui8LkWxEFqjMmxjVX7SDU5wXdAA
 Ud1zI7d83ifPFJM9t0cPtgB23Bc8MRyxv9PcoeupgySf03sB94epktfLdzV738SK1JM2
 WfDD0EO124vuXFr0wWn8oeKMdSJweTokmVEoZ9dW7OGi9uKLFnmNNB/YBI8rc0KpgqEY
 Mrg3Rd20Nkl+0jjto1Vn66g0kRQZ8KCiAnSRDWGS2zav0ivWzUCQTcTrmhbR6dFis9uh
 Kv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NDlzhTd2cBTGXIahkORLBFSkJiYIgBcr8T5aNMdx3sA=;
 b=uPPNHT/gtE/Wm77+o4lM6ggP7RjsAfhl1rhfVsi6FpyAP54oPAcampKKn8//wf3CBk
 ot2BWN55og7LiDoVdjsWUYikTO+DMg1/S9UBiT8Ls0YjPI8qohAGP1h3SYR8hoVyCTwi
 B79E/xak4T/e7S5kDC/GckyhDxIqD8b35jb1k+9lDIZ3aUSkbhbbza1lHB0MwVhThne6
 93VSXoqkhfewf/Lp+EvHPhKi5KTcbADrAtu+o9tje1kjVRc6MRcA3mKtuxnAqkRSgbNs
 TfRuhX9L6e3bh6BQMm88+Pp86459pA8NiEr942ZWolbNGK6J9Y3bHi88A6w2oTUz1Rhv
 /c0g==
X-Gm-Message-State: AOAM530nuc1H4W34pD1JIPkPnXHS4km+52gdhUOMR4ju25fvT5pIqmzm
 RLGm8sjcZ3s19U0FxewEV7Mj9gETqdA=
X-Google-Smtp-Source: ABdhPJwlsY1PDCrMosyOoOByl50t6qlF3cNGTs9cGY3clXDgJKdQ25PgPKcbN14kp1PfMlsdp24dpg==
X-Received: by 2002:a63:4813:: with SMTP id v19mr3284548pga.115.1644926823663; 
 Tue, 15 Feb 2022 04:07:03 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id y7sm2949004pfa.213.2022.02.15.04.07.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 04:07:03 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [RFC PATCH 4/4] ui/cocoa: Ignore 'initializer overrides' warnings
Date: Tue, 15 Feb 2022 13:06:25 +0100
Message-Id: <20220215120625.64711-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215120625.64711-1-f4bug@amsat.org>
References: <20220215120625.64711-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

We globally ignore the 'initializer overrides' warnings in C code
since commit c1556a812a ("configure: Disable (clang)
initializer-overrides warnings"). Unfortunately the ${gcc_flags}
variable is not propagated to Objective-C flags ($OBJCFLAGS).
Instead of reworking the configure script to test all supported
C flags in Objective-C and sanitize them, ignore the warning
locally with the GCC diagnostic #pragma (Clang ignores it).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 30702d31a5..8956694447 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -638,6 +638,9 @@ QemuCocoaView *cocoaView;
     qkbd_state_key_event(kbd, keycode, !qkbd_state_key_get(kbd, keycode));
 }
 
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Winitializer-overrides"
+
 // Does the work of sending input to the monitor
 - (void) handleMonitorInput:(NSEvent *)event
 {
@@ -702,6 +705,8 @@ QemuCocoaView *cocoaView;
     }
 }
 
+#pragma GCC diagnostic pop
+
 - (bool) handleEvent:(NSEvent *)event
 {
     if(!allow_events) {
-- 
2.34.1


