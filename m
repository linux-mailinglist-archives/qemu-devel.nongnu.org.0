Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACFC31B1F5
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:24:41 +0100 (CET)
Received: from localhost ([::1]:37622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM4W-00083W-A6
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:24:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLi9-0000Bv-05
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:33 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:44572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLi7-0004bN-Hy
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:32 -0500
Received: by mail-wr1-x431.google.com with SMTP id g6so6068258wrs.11
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PPT/TRs9DBVuqLk8C2ogWVWxOhu3RGD/8/rw9TJVxIU=;
 b=kmg3JYetKuNtVr4bE5YlKtDqDturHRJrWJsiNxo+KgjXLv+CwpNRAwPrzjser4lLrw
 6NaiQ6mG+DbSpJFdw1PuZYQr5r4eAG3jNTol4TcOtt1IEiQh0kDSQZoJOWiigTx6zzfv
 BbhrT2vcooPDiyO3qBwZ81DhJNXvvsVAgF9KxclXbgEC3/Hr+Gaj4/M5O//risuTuaMA
 H7Jj7PHZtHqPUBxs99wDjY4i0/0jyzTkKojMJmw4/kIWkfbE9aUex+WAyCURE9kO8vep
 +owvm5zLowTlQ4FJglP4OnqQD3ChK5iuWIrOA5IoEmlZ3rulPFLeP3Sxy+RVJ7+KUkrB
 5pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PPT/TRs9DBVuqLk8C2ogWVWxOhu3RGD/8/rw9TJVxIU=;
 b=k3vnrklgpeeFIR9U7qIoAwUEJPBaHkTBIkm5FthH8IHsxWJxdOjYy1v+XEywC/eCDQ
 BuYgExdhwkn/uwsPOv07abgffCbIfXsJHy2KHYBFVx1LucMeAM/yP4t2aprZ26FG3zOM
 BYkMRVXNRDjyuRFMgujega3qFTNeqcbkACPH7rhBOqiamiTkvCd00ZqWnx6MYsVsScn/
 IXG73pDfqQkywXk4MGMZ/JCsQWnzs06NE78XvdAujaIg6/EAYNPlV4x3m08xHF+IFhGj
 eneH+9NJG5p40dH4GN4kC+dD22gai1rOr0qK0lykHDeKFdA/hP5x/LBAPSgtE06Aiom7
 PxyQ==
X-Gm-Message-State: AOAM533IZ3kX+TEQN8P/tWl9VVvHxPDz8oKuX1J4QUKW7v0loluTXV9K
 KNttvfH9xE0nteSSlGqktaBBp+Ud83Y=
X-Google-Smtp-Source: ABdhPJwyR9fdsY0cMiiAavx+t/mW4Qh9ul3o2Kmu+CUAJg+hz5h2wKsmta8gZ/O1fP8waUPwuhaifA==
X-Received: by 2002:adf:f5c7:: with SMTP id k7mr14992669wrp.313.1613325690148; 
 Sun, 14 Feb 2021 10:01:30 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f8sm20100594wrp.65.2021.02.14.10.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 27/42] target/mips/translate: Make gen_rdhwr() public
Date: Sun, 14 Feb 2021 18:58:57 +0100
Message-Id: <20210214175912.732946-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We will use gen_rdhwr() outside of translate.c, make it public.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 2 ++
 target/mips/translate.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index bc91ac4f53f..d2ba3524b51 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -148,6 +148,8 @@ void gen_op_addr_add(DisasContext *ctx, TCGv ret, TCGv arg0, TCGv arg1);
 bool gen_lsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 bool gen_dlsa(DisasContext *ctx, int rd, int rt, int rs, int sa);
 
+void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel);
+
 extern TCGv cpu_gpr[32], cpu_PC;
 #if defined(TARGET_MIPS64)
 extern TCGv_i64 cpu_gpr_hi[32];
diff --git a/target/mips/translate.c b/target/mips/translate.c
index bed0489997a..c1d07a4591d 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -12655,7 +12655,7 @@ static void gen_flt3_arith(DisasContext *ctx, uint32_t opc,
     }
 }
 
-static void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
+void gen_rdhwr(DisasContext *ctx, int rt, int rd, int sel)
 {
     TCGv t0;
 
-- 
2.26.2


