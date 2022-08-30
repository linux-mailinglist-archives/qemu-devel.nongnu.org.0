Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A78005A5A76
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 05:51:59 +0200 (CEST)
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSsIA-00057I-8k
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 23:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSsEo-0002N9-72
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 23:48:30 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1oSsEk-0005AN-4j
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 23:48:29 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 z3-20020a17090abd8300b001fd803e34f1so8009216pjr.1
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 20:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=YuT/SLWB/wpJ6ecNFKSwfg++fcF+ZighwZyzoJF1Z/s=;
 b=peqXhE0xKM282UVSr+5LKvzbP8sHRcSjne+xvviSg3n0nqYk4XlpabZzTOSdp1GlQf
 NuNPntZOoPCbui7zUornV/tOjV/qGGkHGx9qgY992cstOboAsj6bGcxQYoo7HRt3baD5
 s2UvJ2gJhNbgfpq5FQnXfURhHS/ZDUS7ypCK5YDKhY0/ytNDzFlmYNTXnbxF1NE5uWf8
 H2/dwLuqpslY0kYQ7SWS0PVZa8fTZeEbF+O7maR6L+TQkmWehwu0jtBNRhdAbKBUJ3os
 fzbBGSwUD0SnlaIVciXMmF6qs/jQfqIeuF8FvCkXddUVQZ5uMQYRYK4tfjgi7wFpW8la
 /C4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=YuT/SLWB/wpJ6ecNFKSwfg++fcF+ZighwZyzoJF1Z/s=;
 b=jLtWnUn1JslpB6XEDfypSt4bCOHRyee/0FP7ArLaxeh8tAGYuYrEHlo+mi0nmmOmiY
 ww+HcKnlSY3bytXnlUMKeWizZbmbucHtr0E/XIy8QbH4fbtdGPj69vdM+cf7b2fV76Zz
 N31SkBMW3mtOc1JpGVFePxiQP51caOpvYx5Gbw7H2TzRv9Qw8flQUOJs/uD0JqAFozzh
 Tngebv29Qe/1LyR8Bck8UjQUyry+LTweiHBeR7YKtIDbrxhRp4wbe1cs/n8u+hjekQ84
 75feopbds+H+2bYNy9G958Jpqs+WsR9Cx+r1dV5jSpyBM4TI9lDAB7rgjRVI00fP2hN5
 uohw==
X-Gm-Message-State: ACgBeo1K6XoRqYujiFfEn4KQWOwzVMBHp0HC2UY+JY8ZH2pkodFkk/Ik
 ZiEvgCiEUjqSl2QMzhClr8atsl+IAcDK5A==
X-Google-Smtp-Source: AA6agR48BOLR1/8gw3vyMyzI58MVN1QHIXpAThV37pSWpjmi/s4RqV+9WKyqUseFiv3gETRGY9qr1Q==
X-Received: by 2002:a17:902:aa03:b0:172:9b18:ebb1 with SMTP id
 be3-20020a170902aa0300b001729b18ebb1mr18469408plb.24.1661831304131; 
 Mon, 29 Aug 2022 20:48:24 -0700 (PDT)
Received: from localhost.localdomain (c-98-35-17-78.hsd1.ca.comcast.net.
 [98.35.17.78]) by smtp.gmail.com with ESMTPSA id
 i12-20020a170902cf0c00b0016bd8fb1fafsm8296325plg.307.2022.08.29.20.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 20:48:23 -0700 (PDT)
From: Ricky Zhou <ricky@rzhou.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 Ricky Zhou <ricky@rzhou.org>
Subject: [PATCH v3 1/2] target/i386: Read 8 bytes from cvttps2pi/cvtps2pi
 memory operands
Date: Mon, 29 Aug 2022 20:48:15 -0700
Message-Id: <20220830034816.57091-1-ricky@rzhou.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ricky.zhou@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before this change, emulation of cvttps2pi and cvtps2pi instructions
would read 16 bytes of memory instead of 8. The SDM states that
cvttps2pi takes a 64-bit memory location. The documentation for cvtps2pi
claims that it takes a a 128-bit memory location, but as with cvttps2pi,
the operand is written as xmm/m64. I double-checked on real hardware
that both of these instructions only read 8 bytes.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Ricky Zhou <ricky@rzhou.org>
---
 target/i386/tcg/translate.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index b7972f0ff5..3ba5f76156 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3621,7 +3621,11 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             if (mod != 3) {
                 gen_lea_modrm(env, s, modrm);
                 op2_offset = offsetof(CPUX86State,xmm_t0);
-                gen_ldo_env_A0(s, op2_offset);
+                if (b1) {
+                    gen_ldo_env_A0(s, op2_offset);
+                } else {
+                    gen_ldq_env_A0(s, op2_offset);
+                }
             } else {
                 rm = (modrm & 7) | REX_B(s);
                 op2_offset = offsetof(CPUX86State,xmm_regs[rm]);
-- 
2.37.2


