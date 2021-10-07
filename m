Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10458425A3B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 20:02:37 +0200 (CEST)
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXj2-000534-T0
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 14:02:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUV-00043h-9B
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:39 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:46695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYXUP-0006sc-Uv
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:47:33 -0400
Received: by mail-pl1-x62a.google.com with SMTP id w11so4364882plz.13
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 10:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HrXgWQxe5rXDfowZg2OUbllL3iUHpHaeDyMxH/BRtUg=;
 b=dYJQabiiOiy8WlfGMyJ7Hpy9wz6gMdnuucUOLUhfFSYVG64KwaGQB3limVpj7c2s4P
 86os2QRDbjK0Ymj5akuDuLQxhaSLKhsfCJbjEw008p7YFozebIIcuCKdbmibX6d4J+q5
 kTlOvH+Ppl4PfdiJ7PvxONjiY+dfazZTG43j1W6N+WIYwfDLzD4czyRkhpe72YHUlh2u
 ySvF6He5Jhx+3knuMI0PhJUwB0qzsbdykOSXD7x/oUGH1iH5jUtStwtNFXPdL1+0OleE
 I/yoWIGFK5IODHRDqTsG1RRhnFHxf8NBmNDxHvRb0IdyOY/EQKJW6HPY9Jv36tFilxR9
 a9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HrXgWQxe5rXDfowZg2OUbllL3iUHpHaeDyMxH/BRtUg=;
 b=Cg51sxvTYWVcA7PLCv6Nn3H8G9a4aEt0m82VtsIMaHc1AlKIkorUbmqQpFjWBCiU++
 enpwJppvCNFt8KBd2oOPmLjra3Qr90qiXKHyLjDBO/mEC2ZuLj0LoSzcPaf0dcvTKrTy
 H43Su6AU+LXpo0x+R48xrkIZ3Z7xjd4Qg/ltVUe+wQvB48sxBu5Z7H9sfRzHGJF25uaL
 wsSFemJLbKSzhHWniAYdNLBY+n0EkMNVDS77MG4+ZndcLNUrNIZF7g4+Ma97cVrwbEJr
 hh0mBul5Y3e01vQBbi7z3wzHdDpwjZN04DZYxM/zSMg6dLQjBjEYZxoXZrEfCBAzF1EY
 JOSA==
X-Gm-Message-State: AOAM533F1sbsMTBqvckC9YTDEeOrrpWo9yQZdPCAwa6uXZelSvBLWeyw
 ASovkffXGeqcSIaBfOHD+atAVBu62VEEHQ==
X-Google-Smtp-Source: ABdhPJzpyeRGk7U1fnJAoFYOkzTFFExJBjw6u3QuN+tUQPll9VD4XTVeOutKJNKC1/LMc23FHBw9eA==
X-Received: by 2002:a17:902:8d8c:b0:13d:be20:e279 with SMTP id
 v12-20020a1709028d8c00b0013dbe20e279mr5017960plo.5.1633628848591; 
 Thu, 07 Oct 2021 10:47:28 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 197sm83318pfv.6.2021.10.07.10.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 10:47:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/13] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Thu,  7 Oct 2021 10:47:15 -0700
Message-Id: <20211007174722.929993-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007174722.929993-1-richard.henderson@linaro.org>
References: <20211007174722.929993-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alistair.francis@wdc.com, frederic.petrot@univ-grenoble-alpes.fr,
 qemu-riscv@nongnu.org, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the same REQUIRE_64BIT check that we use elsewhere,
rather than open-coding the use of is_32bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fa451938f1..bbc5c93ef1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
 
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
 {
-    return !is_32bit(s) && amo_check(s, a);
+    REQUIRE_64BIT(s);
+    return amo_check(s, a);
 }
 
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
-- 
2.25.1


