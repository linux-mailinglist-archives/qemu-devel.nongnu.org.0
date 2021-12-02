Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440FB466B37
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:55:49 +0100 (CET)
Received: from localhost ([::1]:51390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mst7M-0003Io-Br
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0y-00008l-0G
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:12 -0500
Received: from [2607:f8b0:4864:20::435] (port=33705
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0v-0005UC-Rk
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:11 -0500
Received: by mail-pf1-x435.google.com with SMTP id x5so776030pfr.0
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UY3jRtieYn7ImJypeaHV8rzjXB4D2FU0tmTATHNFJVU=;
 b=MUb1KEnxkB8SmPYAieAPZrGUxPDZcAuEjbOSjuSGlpGxAztiaknnIlNqUzI22ZVhNk
 t/RG04zglaP7qFgBS6SrgDZrMfIk93Lfl4ufP6x6lUNR9eWoEv5EAf8HR4F7kEwyGyRB
 QHnVpArev1iA6m2FXNL57wwStA9zKSIkiJ5eIN4YPOxGRoJ4oko/ldHsLrCXveeB87Wh
 Hpwe+NsLC5TCqqU/7BMa5NXXQGfLxzzFUnpQNwzpvz5/+HFyo3MDCzhkIGD0g+Hbcfcy
 sfVPVplbAfhbYx9BxpRriGSJUGBTLx/ujy87i8R5y5HsPJIu7fImbVd+yWVEyqqwbF8f
 8cgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UY3jRtieYn7ImJypeaHV8rzjXB4D2FU0tmTATHNFJVU=;
 b=lNujfvBD95CKJFRVUqgnonmkqhVR1O49sf6K3ZaR+gAlhZ8aVkyE1QfGhsqrOUVeKH
 qrtRREJoQH+eDf3PguvNi8N4OiZg5CpO56u4VdGvxvCQdiZywU3pdZVSnOiEuJ8a/23u
 NFzELNK3CrFb8gl2JN8gK9pViQNzWMICb0r5Y+FRyabvk6weHDkozuEn65AmljBMJ69I
 UOWMdTUDZrsNOqWm/TJjpWVPEnnsXFe3mmtrmxsOei4z+Hp/zilzI+marzIDzswVEzaj
 hqt93aVnJazxhcGSRn2+/khewIkC6v++JFTNx8LkP2DjitztMNSOSS6OxmsccKXGB7G1
 2XKA==
X-Gm-Message-State: AOAM530vU9f37y2bhAvdffeTNdhQPAt4PBFhtV9xGLfENuCwZbJfdgST
 lQCAG+bqsDGquLR8pbBtN5/y0+avWMzxmQ==
X-Google-Smtp-Source: ABdhPJwiMauDmPRPp2vJ2B6cITn9PYpqNNxhZzLJQaFr1870S93iO+qlXFBcg0M4ruygS7KtUIKXSA==
X-Received: by 2002:a05:6a00:1945:b0:44c:a955:35ea with SMTP id
 s5-20020a056a00194500b0044ca95535eamr14702767pfk.85.1638478148683; 
 Thu, 02 Dec 2021 12:49:08 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/15] target/m68k: Implement TRAPV
Date: Thu,  2 Dec 2021 12:48:55 -0800
Message-Id: <20211202204900.50973-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/translate.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index e5338b50ad..cfe292c929 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4916,6 +4916,14 @@ DISAS_INSN(trapcc)
     do_trapcc(s, &c);
 }
 
+DISAS_INSN(trapv)
+{
+    DisasCompare c;
+
+    gen_cc_cond(&c, s, 9); /* V set */
+    do_trapcc(s, &c);
+}
+
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
 {
     switch (reg) {
@@ -6079,6 +6087,7 @@ void register_m68k_insns (CPUM68KState *env)
     BASE(nop,       4e71, ffff);
     INSN(rtd,       4e74, ffff, RTD);
     BASE(rts,       4e75, ffff);
+    INSN(trapv,     4e76, ffff, M68000);
     INSN(rtr,       4e77, ffff, M68000);
     BASE(jump,      4e80, ffc0);
     BASE(jump,      4ec0, ffc0);
-- 
2.25.1


