Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0548E5BB710
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 10:07:20 +0200 (CEST)
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZSr8-00039t-Ri
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 04:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1oZSk3-0006Xf-6Y
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:59:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57646 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1oZSjz-0008Sg-T8
 for qemu-devel@nongnu.org; Sat, 17 Sep 2022 03:59:58 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxBOJ2fiVjHQccAA--.40868S4; 
 Sat, 17 Sep 2022 15:59:51 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 alex.bennee@linaro.org, gaosong@loongson.cn, maobibo@loongson.cn,
 yangxiaojuan@loongson.cn
Subject: [PATCH 2/5] target/loongarch: bstrins.w need set dest register
 EXT_SIGN
Date: Sat, 17 Sep 2022 15:59:47 +0800
Message-Id: <20220917075950.1412309-3-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220917075950.1412309-1-gaosong@loongson.cn>
References: <20220917075950.1412309-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxBOJ2fiVjHQccAA--.40868S4
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW8AF1Utr48XrWrtr45Awb_yoW8Xry3pF
 yUCr1UKr4UXr93Zr97Za1DXFnrJFs5Kw47WF4I9345Ca90qry0gr4Ig39Igryrtwn7XrWv
 yan5u3yjgw4UJ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/insn_trans/trans_bit.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/insn_trans/trans_bit.c.inc b/target/loongarch/insn_trans/trans_bit.c.inc
index 9337714ec4..33e94878fd 100644
--- a/target/loongarch/insn_trans/trans_bit.c.inc
+++ b/target/loongarch/insn_trans/trans_bit.c.inc
@@ -37,7 +37,7 @@ static bool gen_rr_ms_ls(DisasContext *ctx, arg_rr_ms_ls *a,
                          DisasExtend src_ext, DisasExtend dst_ext,
                          void (*func)(TCGv, TCGv, unsigned int, unsigned int))
 {
-    TCGv dest = gpr_dst(ctx, a->rd, dst_ext);
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
     TCGv src1 = gpr_src(ctx, a->rj, src_ext);
 
     if (a->ls > a->ms) {
@@ -206,7 +206,7 @@ TRANS(maskeqz, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_maskeqz)
 TRANS(masknez, gen_rrr, EXT_NONE, EXT_NONE, EXT_NONE, gen_masknez)
 TRANS(bytepick_w, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_w)
 TRANS(bytepick_d, gen_rrr_sa, EXT_NONE, EXT_NONE, gen_bytepick_d)
-TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
+TRANS(bstrins_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, gen_bstrins)
 TRANS(bstrins_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, gen_bstrins)
 TRANS(bstrpick_w, gen_rr_ms_ls, EXT_NONE, EXT_SIGN, tcg_gen_extract_tl)
 TRANS(bstrpick_d, gen_rr_ms_ls, EXT_NONE, EXT_NONE, tcg_gen_extract_tl)
-- 
2.31.1


