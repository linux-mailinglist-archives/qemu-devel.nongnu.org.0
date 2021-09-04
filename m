Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 039FB400D9A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:00:10 +0200 (CEST)
Received: from localhost ([::1]:58610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfZx-0004eQ-1H
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfVq-0005KK-JQ
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:55:54 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfVn-0007KF-Tr
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:55:54 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso2133463wmr.1
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HFwy1VjY0DuV7GMSXePF1zARrTAXU6u5yh5umJi4mBw=;
 b=n8eYG9jkhmbS17V9Zqx0SOB1AeTw3wwpUZv1LwXrAbEPiEufKaJCPdfXDL018l9DSC
 4ZrSoER+k15uM04pQRWoAIA9e068AHPuUFsf/cDTNl/ARSeVocWiWtximKHL75G6gTaY
 /U96EudF0anIc9e7N28tvaImBpKd+P4LCDQo7JL8r7mnPEnjLOkBImAjV5daN7al880c
 qGsK6TaOc8dMp+tlRbYRrppcGOU863gXzTQOAnSRpep94jWSsOkesMvgc7OT3rxgIIR5
 A1hk+Y0K2yiaVfewDzcXNHdFMBB+8HEe+LPwMs59RNNjqiMeSLcxycRr1tupoMoJJEc4
 PPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HFwy1VjY0DuV7GMSXePF1zARrTAXU6u5yh5umJi4mBw=;
 b=SJAk/jd8E3zqCPI27yigDk/psnJJi3DwS1Nrmuj+EIISVq1r2b9wNKe7mdlkmZruY1
 ADafIl5liXx7HFYCnM6c1eW2gMEHk1oRZleOkfnHXKajOJrGyAiP5PRSnDbfsEfnyzJX
 RoNFJDTTZbOgvbraU4KowqYRgo4i3QhlfVtDTp+BXxrBqEuzfuPV9AivPBs0SZYQXaes
 KIjUNhi7GzPpULxc872O6gU17oi7lsDjxaXuHaeNtR3ARcLbjkfhs9n1NbOv5SqGbkhf
 NICQ+mNb2wI9N3jUEv3MKaG3po3TIQF9wC7DzwAlLXzANSA9hEqeavowMEClj/ouiDNQ
 qENQ==
X-Gm-Message-State: AOAM5309m7LYZrCzb9AT5wZXyqct+j9zFCj/8KOgz/tXIVIVHI1YC6Q1
 jozR6RHUREML/or98pY13Oe8u/FmeJg=
X-Google-Smtp-Source: ABdhPJzkSx+6bTHUvPZHsyO/KLjy2PAEeRnijNmIpNWvvXry2/6r53UyG/U5dsylCq200NfmbyqC8g==
X-Received: by 2002:a7b:c769:: with SMTP id x9mr4820494wmk.75.1630799750236;
 Sat, 04 Sep 2021 16:55:50 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id t64sm3080451wma.48.2021.09.04.16.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:55:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/24] target/avr: Remove pointless use of CONFIG_USER_ONLY
 definition
Date: Sun,  5 Sep 2021 01:55:19 +0200
Message-Id: <20210904235542.1092641-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit f1c671f96cb ("target/avr: Introduce basic CPU class object")
added to target/avr/cpu.h:

  #ifdef CONFIG_USER_ONLY
  #error "AVR 8-bit does not support user mode"
  #endif

Remove the CONFIG_USER_ONLY definition introduced by mistake in
commit 78271684719 ("cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
pointer in CPUClass").

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/avr/cpu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index ea14175ca55..5d70e34dd54 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -197,10 +197,7 @@ static const struct TCGCPUOps avr_tcg_ops = {
     .synchronize_from_tb = avr_cpu_synchronize_from_tb,
     .cpu_exec_interrupt = avr_cpu_exec_interrupt,
     .tlb_fill = avr_cpu_tlb_fill,
-
-#ifndef CONFIG_USER_ONLY
     .do_interrupt = avr_cpu_do_interrupt,
-#endif /* !CONFIG_USER_ONLY */
 };
 
 static void avr_cpu_class_init(ObjectClass *oc, void *data)
-- 
2.31.1


