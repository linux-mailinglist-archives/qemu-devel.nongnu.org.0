Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31086697436
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 03:13:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS7I3-0002lx-DM; Tue, 14 Feb 2023 21:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pS7I1-0002l1-3k; Tue, 14 Feb 2023 21:12:57 -0500
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <liweiwei@iscas.ac.cn>)
 id 1pS7Hy-0004pI-Db; Tue, 14 Feb 2023 21:12:56 -0500
Received: from localhost.localdomain (unknown [114.95.238.225])
 by APP-01 (Coremail) with SMTP id qwCowABXcNT4PexjNkcoBQ--.2339S15;
 Wed, 15 Feb 2023 10:05:54 +0800 (CST)
From: Weiwei Li <liweiwei@iscas.ac.cn>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PATCH v2 13/14] target/riscv: Simplify check for EEW = 64 in
 trans_rvv.c.inc
Date: Wed, 15 Feb 2023 10:05:38 +0800
Message-Id: <20230215020539.4788-14-liweiwei@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230215020539.4788-1-liweiwei@iscas.ac.cn>
References: <20230215020539.4788-1-liweiwei@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABXcNT4PexjNkcoBQ--.2339S15
X-Coremail-Antispam: 1UD129KBjvJXoWxJryUJryrKr4rWryrKw1xKrg_yoW8ur13pw
 4rCrWxur4DtFWfuwnakr4jqF1Yy3yrKry7Ka4jv3Z5Xa95Xr48uan0qws3tr4UXFyFqFy0
 kF4YyF15Zr42va7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4U
 JVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
 0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
 JVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxV
 A2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
 x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r
 43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF
 7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14
 v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuY
 vjfUOBTYUUUUU
X-Originating-IP: [114.95.238.225]
X-CM-SenderInfo: 5olzvxxzhlqxpvfd2hldfou0/
Received-SPF: pass client-ip=159.226.251.80; envelope-from=liweiwei@iscas.ac.cn;
 helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Only V extension supports EEW = 64 in these cases: Zve64* extensions don't
support EEW = 64 in these cases as commented before the check.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5dbdce073b..fc0d0d60e8 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1998,8 +1998,7 @@ static bool vmulh_vv_check(DisasContext *s, arg_rmrr *a)
      * are not included for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
@@ -2012,8 +2011,7 @@ static bool vmulh_vx_check(DisasContext *s, arg_rmrr *a)
      * are not included for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 GEN_OPIVV_GVEC_TRANS(vmul_vv,  mul)
@@ -2230,8 +2228,7 @@ static bool vsmul_vv_check(DisasContext *s, arg_rmrr *a)
      * for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivv_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
@@ -2242,8 +2239,7 @@ static bool vsmul_vx_check(DisasContext *s, arg_rmrr *a)
      * for EEW=64 in Zve64*. (Section 18.2)
      */
     return opivx_check(s, a) &&
-           (!has_ext(s, RVV) &&
-            s->cfg_ptr->ext_zve64f ? s->sew != MO_64 : true);
+           (!has_ext(s, RVV) ? s->sew != MO_64 : true);
 }
 
 GEN_OPIVV_TRANS(vsmul_vv, vsmul_vv_check)
-- 
2.25.1


