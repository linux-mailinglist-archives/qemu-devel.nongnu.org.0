Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0721D407F14
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 19:54:25 +0200 (CEST)
Received: from localhost ([::1]:38142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPTgO-0001AO-3j
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 13:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIT-0001c3-VC
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:34621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPTIS-0005TD-Lf
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 13:29:41 -0400
Received: by mail-wr1-x42a.google.com with SMTP id m9so10933462wrb.1
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 10:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VemHoIpzCWAjrdpINoZRube8+PIa9Kx0uhyP77PRsf8=;
 b=XJrT0X/V1GA19zTwUJrQMC+XqOiImUQ+8CKwV23cyaUfj6etfBxxOvpejp3cxrrvab
 yoswblaENikBpWkTCUw/kAVGpBg5jZVI1pkDu+i6YVA9v+TwXA3VF4Orb0cqDRapa13w
 G6x7gHO1Bh5ljiyirTTWqQudGZODKw6Vp+yuQiIes+N6NLbhS4DuFt6Aj2b9T9CDDCiJ
 uBV8AaB6+Yf0xdqoYwY3OHDGItf0n2Me+C2WA2S5NF1cr5m3/U+tb37p/VVisRKvxS8Y
 e94y0BAEVO3tMizgN41q4Q+VhJd7/oyZUU4ghz3ZWfZusALg/kai7PGQ41Xr7Pas2yAc
 8CSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VemHoIpzCWAjrdpINoZRube8+PIa9Kx0uhyP77PRsf8=;
 b=VgGQKoPqpWctXhQ1LJZ9ERMOva6wEOwRrwrW91HeA7V1gOIPsfAuT5LTrA69mKfL+1
 A6SIszcBFd4jYxitYxyAAnRDHrAZmC9Lrq0zxOk9epj/r1nxHpoVPF828+yItGSrwt/1
 txvP/HH/etGqxWvFL46TendnqXYbbrTGiO8xUJa8Q9ofTGlgpvHRMIjt6DJCNFYwtFEP
 AtWGAQskaNhoF91FPYoBWh338nBL14FPvkDKTBIs8R5SvM8bYb2k9bEU2zUBnuZaZqlb
 ddT/RsJzHUlGGkIDDMMnYUOkTeUO94459G6CKj44cgRhaq7UDdq59F6/Qkr9CyKFMGD1
 V3Cw==
X-Gm-Message-State: AOAM5337AClGyK5nGBaqhRudkMP9TZbMEVtrXb3nhN06nIKb2TGLeAAo
 Ybq9/51ITIe1gnrbN9+FBOFt6VdPpuM=
X-Google-Smtp-Source: ABdhPJye+2OyLZxT56SQP/lToZG28UoS5iGsakOMuQ8thxTbr65Na5Wl1//STr3OJ+nlbNIyUd01nQ==
X-Received: by 2002:a5d:5003:: with SMTP id e3mr8538840wrt.118.1631467779246; 
 Sun, 12 Sep 2021 10:29:39 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id s10sm5097713wrg.42.2021.09.12.10.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 10:29:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/30] target/sparc: Remove pointless use of CONFIG_TCG
 definition
Date: Sun, 12 Sep 2021 19:27:27 +0200
Message-Id: <20210912172731.789788-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210912172731.789788-1-f4bug@amsat.org>
References: <20210912172731.789788-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SPARC target only support TCG acceleration. Remove the CONFIG_TCG
definition introduced by mistake in commit 78271684719 ("cpu: tcg_ops:
move to tcg-cpu-ops.h, keep a pointer in CPUClass").

Reported-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/cpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 5a8a4ce7506..e83e305aa9d 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -859,7 +859,6 @@ static const struct SysemuCPUOps sparc_sysemu_ops = {
 };
 #endif
 
-#ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
 
 static const struct TCGCPUOps sparc_tcg_ops = {
@@ -874,7 +873,6 @@ static const struct TCGCPUOps sparc_tcg_ops = {
     .do_unaligned_access = sparc_cpu_do_unaligned_access,
 #endif /* !CONFIG_USER_ONLY */
 };
-#endif /* CONFIG_TCG */
 
 static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 {
-- 
2.31.1


