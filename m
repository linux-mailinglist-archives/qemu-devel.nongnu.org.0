Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF8B400D9B
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 02:00:17 +0200 (CEST)
Received: from localhost ([::1]:59034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMfa4-0004vn-TD
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 20:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfW0-0005PH-Fs
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:05 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mMfVx-0007Qo-MX
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 19:56:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id d6so3415990wrc.11
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 16:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NZvvlRpa8DC97DN+aH7Pj/vVpZZsHFPzTcOdAGwjWjs=;
 b=XW8I/h4eWrBw9c6yrVw65c1frN7Vwmw8cmKYS/hxeKTVM2Oh8i3hEwVJjlQS8GwkiJ
 A1SK1zR2oV/tGQMzF7F7UDNYNAjmytkc1D3pi1QwPTMXROBllWFkJs7SJW/fJA9ZaRDi
 lzH/fomUXRmugqZedeGlH+gNQl1mS5XTTLtWzl+4tOGXrZo0HD6VLm9CP3YvZywjABTB
 rZC905wtFgbtjrA/FbJ+6czurfgt6DHxwfJerbuRVXhD3UPdEbbZpCTQO9uFY8f8Nt/I
 aCJAbr17AQR5Ax786KLvhd6uvwtKEtdMTydVgEszamtnA/zC1F5urBZ6VBGzasiqiJQC
 vFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NZvvlRpa8DC97DN+aH7Pj/vVpZZsHFPzTcOdAGwjWjs=;
 b=ZI+BZf9k1lCl76iEUxT7a0fltQyvzqPLsnH3jtxD/FzrAre5+8qslbwbWUsyviyeF0
 w3Q42Bev3aVs82L5fHGK+/mFjRpvjh2VBoGbw0xFoCep4JXExyxKnu+Uu1Nz5JOt9mOM
 rcaZbH3/5hv0HSTyQ2N62VL15qaDbXt1SiYrts5Pbwyho7AiN6yYWURHmq8Mn6VWROgV
 WfJtktPLswNbw2TzecNmjr/6kuwFdHvZ0Fatq7ldC3czDpTzV4/3UkzenAcp6f1LJ7lJ
 GEG2bvPD59Tn4XbPELwMp83c/nNoxAwXR1i3e/qf6bfVNRmldNkPpsiLL5hFF9W366wO
 LMfA==
X-Gm-Message-State: AOAM5306owWGHE8oRtPXKZdG+O5mgOyXL9xomsuk8vDSktpdr546clLw
 05/RLDcyRhp5VWDWN7Rm/SS1apWJ6CQ=
X-Google-Smtp-Source: ABdhPJzLeBumLslvdggp9vQd/aW9HJUURPIuRQ6qQuA2hfQ5+He0OzIkKmHxf4XZMAyuG454/MF4MA==
X-Received: by 2002:a05:6000:352:: with SMTP id
 e18mr5764908wre.238.1630799760166; 
 Sat, 04 Sep 2021 16:56:00 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id o7sm3100271wmq.36.2021.09.04.16.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 16:55:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/24] target/i386: Simplify TARGET_X86_64 #ifdef'ry
Date: Sun,  5 Sep 2021 01:55:21 +0200
Message-Id: <20210904235542.1092641-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904235542.1092641-1-f4bug@amsat.org>
References: <20210904235542.1092641-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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

Merge two TARGET_X86_64 consecutive blocks.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/tcg/seg_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 3ed20ca31d7..dee7bef68c6 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -929,9 +929,7 @@ static void do_interrupt64(CPUX86State *env, int intno, int is_int,
                    e2);
     env->eip = offset;
 }
-#endif
 
-#ifdef TARGET_X86_64
 void helper_sysret(CPUX86State *env, int dflag)
 {
     int cpl, selector;
@@ -984,7 +982,7 @@ void helper_sysret(CPUX86State *env, int dflag)
                                DESC_W_MASK | DESC_A_MASK);
     }
 }
-#endif
+#endif /* TARGET_X86_64 */
 
 /* real mode interrupt */
 static void do_interrupt_real(CPUX86State *env, int intno, int is_int,
-- 
2.31.1


