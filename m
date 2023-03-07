Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717406AF0D1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:36:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9e-0003dV-L5; Tue, 07 Mar 2023 13:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9c-0003cV-Kk
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:16 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9b-0007kl-04
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:16 -0500
Received: by mail-pl1-x62f.google.com with SMTP id x11so10583047pln.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gpKNIHDff/Si/rvKhy6WY0gB11IUIaDAfVrzJbPyus0=;
 b=MGkQlMoZw2UppWGiM0FBFEnrveliHV7/IPk65Fx6oinSz1HxQJ60yw/mELCsJzqV44
 VWGqflqMQRBEx+m3B9zuU7XLcTEiKrqXUvnPQW//tHHPtkR6JFgojF8i58XRPharo5kl
 85C4C0el6wNSwgC4Rc6o2bpFBpG++aKVmOvV/hNicfxLtf+1mmmOB3FCFrloSm875txE
 EmYox5rKfvYRY/8MAN8oJXeYag2ShoMx+vxwOFF4T2YiHaBOIMpcVl2uDGWlfrY6QPtV
 MSGeCZbj2Cy81Eck7bC/0Snt3IxR0lekb5UN50UnzvG9mCH0C4zc7VYUSjf/PT3Y979A
 vINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gpKNIHDff/Si/rvKhy6WY0gB11IUIaDAfVrzJbPyus0=;
 b=lgA/iRL+LucS+AYzPwbRgrQ/CoFsRwpoqkqLUG5XZvoGIvx2xlcxgpz6doISDPNYfv
 0CDawm9fjbQNqV+twjbEdCwuzUtGbwcHLh3AfvUF1oOgIQW0n+ii+n2Y5hoNMaMEPBNF
 z3dlMB2ZVDGAm9IQ7qGvgr2LyirxZ1LV/OBgPNgzygtRkL1sJH/moMmwqafEMf3vNjnH
 OFMwTUGu934VDRStI1M8V3QRcHkm9Lq0rVK/PgGhXWr8aJnUA+0XvgQ8jspP86hXZ+Qe
 ve4Yr0C3DiQUGevGE2TKGf3Cc9rENweFhCJMysB8n1JjWMF3x3wuGWIZz72rYJbbxRm8
 vD8A==
X-Gm-Message-State: AO0yUKUDZHuHYJz199elJGFeJ6MwTU1Clc4cn71O2e1H9kHWCsNFpOvK
 FnvUY3Lpzyq15tbVOcjyJ1NqfdNQchwD/YbS3so=
X-Google-Smtp-Source: AK7set+79lPXa7r/Dnw8sVJY1TzCw27oyIJIkrEOdnhNrTrCAlysFtALyZABVgXcKzyVw0eOq3dj/w==
X-Received: by 2002:a17:90b:4b4b:b0:233:a6b7:3770 with SMTP id
 mi11-20020a17090b4b4b00b00233a6b73770mr16106109pjb.14.1678214113699; 
 Tue, 07 Mar 2023 10:35:13 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 12/25] target/m68k: Reject immediate as destination in
 gen_ea_mode
Date: Tue,  7 Mar 2023 10:34:50 -0800
Message-Id: <20230307183503.2512684-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In theory this should never happen, as all such instructions
are illegal.  This is checked in e.g. gen_lea_mode and
gen_ea_mode_fp but not here.  In case something higher up
isn't checking modes properly, return NULL_QREG.  This will
result in an illegal instruction exception being raised.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 44c3ac0bc3..fc65dad190 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -894,6 +894,10 @@ static TCGv gen_ea_mode(CPUM68KState *env, DisasContext *s, int mode, int reg0,
         case 3: /* pc index+displacement.  */
             goto do_indirect;
         case 4: /* Immediate.  */
+            /* Should never be used for an output or RMW input. */
+            if (what == EA_STORE || addrp) {
+                return NULL_QREG;
+            }
             /* Sign extend values for consistency.  */
             switch (opsize) {
             case OS_BYTE:
-- 
2.34.1


