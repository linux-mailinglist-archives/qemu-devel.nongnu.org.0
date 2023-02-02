Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17D9687288
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:52:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNpw-00061J-Av; Wed, 01 Feb 2023 19:52:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpv-00060v-8g
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:23 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNNpt-0000Q5-Lm
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:52:22 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 cq16-20020a17090af99000b0022c9791ac39so4035515pjb.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 16:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4jgsV9G6+y0a5q4tkqKuMYyQTrPsge9HTujb3pFb78=;
 b=oyGat0RZYbBMgrafQwlMAk+EzPaep1cTa3gPHJNzSfJ143bzHIbQerH1v2bzSETwI4
 p15LNFW/A67VSelmLiN9M5Tbdbu3Pbd2tTGTb+8xCNOHsZTzXls0bnLEYnjhyoFcbR9m
 X0bOK4jHZjzjQhL2PVtI9nT5BdXviyG3xP0IvVD+EuiEpeoQozYANfgnqKjLwjCbPkNZ
 TsXailbg/lcPWOjDf2XiJ4rAHrd3qNT8cEp06zPDXI7QzMW3QCxdmK2Rv29nIPgu60tW
 GvclfVt9EdZCf1OfLbApH9lS7YKTxHxeafepixGv9FFwRgN7fyvogvTsHWLGwEIt+jDw
 7Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4jgsV9G6+y0a5q4tkqKuMYyQTrPsge9HTujb3pFb78=;
 b=kYLAKLuagXWDOfBk3347RF8gf+zyOmxmIQN0m3cQ1zKxZ6/hNLB6wNr0/yZwboBkOY
 hIqoj3YaPnTPlSFwtF/qo5VSG/Uk4us3Y2i6J4B09UDC3zrEpuSaaQB97wViFEd3BeOQ
 SAX49XJit1l15roB8kc8W3zWWp/irayPGkuYBR6ymXKh0LzvD537EjxwvHGUAaLfInCz
 gNu6+aXfqM8sPxAIhxeHphC11wKLyDIIP0E9jC7amnaKMx+cIG3j8eBm8QRIydvPeSsS
 Yo4Fmd93a3kQhiuVIc4WFwL7ZFX3BiZ7QiwC3Bryby4yiGc4mZpUKNKe7012gLtQ9/l3
 ZPHA==
X-Gm-Message-State: AO0yUKWYXU/6qZQKK40J8bWY5rTsEcxo3VZjjlOd/tsYrUOMfM7aAcU5
 omM7hfBEi9qpJOAO28jMbYz0qpGV5WSjNSXF
X-Google-Smtp-Source: AK7set8O/rZTDYT1HPLuia+G37Vlb1ylRDEC7j1UUaOBWlI/1Dt3/ls/+S+8mfsXsc6wG4BPsLNK3A==
X-Received: by 2002:a17:902:ea0a:b0:196:b66:eb74 with SMTP id
 s10-20020a170902ea0a00b001960b66eb74mr641603plg.57.1675299140441; 
 Wed, 01 Feb 2023 16:52:20 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a1709028f8300b00192cf87ed25sm12391334plo.35.2023.02.01.16.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 16:52:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk,
	laurent@vivier.eu,
	iii@linux.ibm.com
Subject: [PATCH 07/14] linux-user/sparc: Handle division by zero traps
Date: Wed,  1 Feb 2023 14:51:57 -1000
Message-Id: <20230202005204.2055899-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202005204.2055899-1-richard.henderson@linaro.org>
References: <20230202005204.2055899-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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

In addition to the hw trap vector, there is a software trap
assigned for older sparc without hw division instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/sparc/cpu_loop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/sparc/cpu_loop.c b/linux-user/sparc/cpu_loop.c
index 573d97c60b..398418174f 100644
--- a/linux-user/sparc/cpu_loop.c
+++ b/linux-user/sparc/cpu_loop.c
@@ -215,6 +215,11 @@ void cpu_loop (CPUSPARCState *env)
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
 
+        case TT_TRAP + 0x02: /* div0 */
+        case TT_DIV_ZERO:
+            force_sig_fault(TARGET_SIGFPE, TARGET_FPE_INTDIV, env->pc);
+            break;
+
         case TT_TRAP + 0x03: /* flush windows */
             flush_windows(env);
             /* next instruction */
-- 
2.34.1


