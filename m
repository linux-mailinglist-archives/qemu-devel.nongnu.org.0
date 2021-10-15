Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E6742E8B9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 08:14:09 +0200 (CEST)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbGTo-0007hp-6o
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 02:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbGRf-0004XN-Ef
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:11:55 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:33641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbGRd-0001wf-Ky
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 02:11:54 -0400
Received: by mail-pl1-x633.google.com with SMTP id y4so5787121plb.0
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 23:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LA3n51aVlEgbwHV98iyYH55ZjkabaHWokae08NAPXHA=;
 b=c6pwtFyGt4xSM5JKjSTC/Ut0RXCm1VINfS3GVAH8BtyML8lThkDUhcWCbhWj/alZQx
 LgXIoJy2c2TGERpVovpzvwzUgum8Y2eg0aU8QDb77dj80bFszwhmJJ5mgm479wxUpmER
 IkITQ4aHJXXx8oL79p++CZOqyuIdkLrhQrzsldHRnGxCB5AnlER8vCaGjNJKZaKP34/o
 Le6uoidNcRCHjWXm79vctddurl7SgHJo33Cyyr1xFMTZfeZ0TYfcYYdYxbBK56bkBSCe
 6mmkm+MLaf9tTEbbsGuVVTqnel399OeL/UOzOQJfgDxJDU65iGQClF61CMOP2wmAuHlv
 YAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LA3n51aVlEgbwHV98iyYH55ZjkabaHWokae08NAPXHA=;
 b=uCXTJfqVTxNNZ/ClFaJ5nxkU/ybteKUDG8c5jveFb900ru/3U0/4+X1I4o30jQ1pKx
 V9mF/GZ3362YZa0pz5nO/Ok2/AOQLKd7ljtCJ+6KVADj9Y7dH981eXpDp0mGu4x8vkah
 ybrpq5tpktCHF+p4HFXcT8vfdmGOktDg3veNIEIjelzVU3gv9qn/LJwrMYsAXsTD2rla
 EuJRbtdW3XbnaR8ewM45ItERcREQ+tb/hcizVKX7EqLesuj9tbLK+UZ6XX9Zw6WoXQsb
 ImKpvK2OsY1ojGsZjWbPfrRwVw2Oml2k18xefmcO99pnk9XjxWrfTYSzF+lHqwR1w//K
 JMxA==
X-Gm-Message-State: AOAM532pqTGmTM0gI6RmspEKrYbSmNjMqIwwy0nOkADlJt6J9src2IfK
 mrRFw94Qoh51/h21+nG99aq5tFByghkQ0Q==
X-Google-Smtp-Source: ABdhPJyYNV2I2Y3RbbE5Nr6urPEFWU9epJFZxq+SaBKd16dIWbvw3vbs2yIn8mj9nHWt+UvSOpPyOw==
X-Received: by 2002:a17:90b:1e4a:: with SMTP id
 pi10mr11524012pjb.142.1634278311828; 
 Thu, 14 Oct 2021 23:11:51 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id k14sm4211373pji.45.2021.10.14.23.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:11:51 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 2/2] target/riscv: change the api for single/double
 fmin/fmax
Date: Fri, 15 Oct 2021 14:11:33 +0800
Message-Id: <20211015061138.3766862-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015061138.3766862-1-frank.chang@sifive.com>
References: <20211015061138.3766862-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x633.google.com
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
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chih-Min Chao <chihmin.chao@sifive.com>

The sNaN propagation behavior has been changed since
cd20cee7 in https://github.com/riscv/riscv-isa-manual

Signed-off-by: Chih-Min Chao <chihmin.chao@sifive.com>
---
 target/riscv/fpu_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 8700516a14c..1472ead2528 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -174,14 +174,14 @@ uint64_t helper_fmin_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(rs1);
     float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_minnum(frs1, frs2, &env->fp_status));
+    return nanbox_s(float32_minnum_noprop(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fmax_s(CPURISCVState *env, uint64_t rs1, uint64_t rs2)
 {
     float32 frs1 = check_nanbox_s(rs1);
     float32 frs2 = check_nanbox_s(rs2);
-    return nanbox_s(float32_maxnum(frs1, frs2, &env->fp_status));
+    return nanbox_s(float32_maxnum_noprop(frs1, frs2, &env->fp_status));
 }
 
 uint64_t helper_fsqrt_s(CPURISCVState *env, uint64_t rs1)
@@ -283,12 +283,12 @@ uint64_t helper_fdiv_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 
 uint64_t helper_fmin_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
-    return float64_minnum(frs1, frs2, &env->fp_status);
+    return float64_minnum_noprop(frs1, frs2, &env->fp_status);
 }
 
 uint64_t helper_fmax_d(CPURISCVState *env, uint64_t frs1, uint64_t frs2)
 {
-    return float64_maxnum(frs1, frs2, &env->fp_status);
+    return float64_maxnum_noprop(frs1, frs2, &env->fp_status);
 }
 
 uint64_t helper_fcvt_s_d(CPURISCVState *env, uint64_t rs1)
-- 
2.25.1


