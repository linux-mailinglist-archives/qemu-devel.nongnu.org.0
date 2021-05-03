Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F88372325
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:44:20 +0200 (CEST)
Received: from localhost ([::1]:35346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhIZ-0001Hs-Fc
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgr1-0006U5-2z
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:51 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgqw-0000ID-Fi
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080146; x=1651616146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HRFnRKpT6eIKGkJmmSWcNkwahgPJ7f2r03ru00s2A0o=;
 b=ZVWZvrYRVNKfDT4kBDSbt3TGwz9PQtuwr6j/o5LiJTY9J4ndMFdED5kR
 zSFJ/sxhMIQ+IHi9/PNe/MTr86CiY+lYglDhZB3hmAD3u1wFW85PvrdfO
 jmlKlmvX/VZoELxIuIwitq05+wPHZWOSyMreTXxe/eIv4Gh6FcsL7TfqL
 IOX+HpkEYnZD+9G8upeUKJ8FV26qn1DpAMsaS4G1JTXps5qunXp37CQYt
 vBJPxMZCUCxTN660mdDdv8Hni4OAGIlZ1Q8q20fBztOd0Ew8roaA5DiA4
 IqCmPtbDwCyQH2FAGpXDs+taZ2+YiBk//LbUJh8UegMfeWzu8Sq4IJZy8 w==;
IronPort-SDR: cIesQ2HCxVaslFOLu5/RqWdxbZIy0bpn32RuYPvtMUTJc9DX0bkM8dH7ln72VVv27MmQfMJVQ4
 CQrVUagwbyNMAdeidd09XAGEJQ8VlIvuqoLYJiHSj9dTm3KyOg4ubuK5xUSOOVF1QVgR2yAPb7
 biks6GZhdYxf268TOsPzd+AAOoDvbK5h/6SnU9ldq3qv9YkTSLt4oZWmpRzQ11kholReyVAJdJ
 Ukai4qAskytSeF4gF38jE4x23/uNFhNDP4dxS4Z2N9gC+2XHfjBromyQvGrfJe29rKIYx39C1P
 Nco=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114689"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:13 +0800
IronPort-SDR: bWuwaNmqbk0ljbhCQcNNhU9xqWDU92foIzCE6ogSwYCGtYtnFyNSRkwJ7Q3YV4WEswwQmtYOTL
 JTY1OITOb8hJ2e7bamCPi9AD1PGiUUnIG/zs9HnqQWq2ovWkP0j8K7RqwpGqeClh4rgnxHyMKN
 zbrjBItSsn5SzOqD76atufhL6COnyRxihAPZWbdn0dEQqQ/nlLJaSfeOkCeg/s94j5Buir14aI
 nKALqTdrCkkZxPlQrngzQzag6M8U/29Tf//DFbjqZqh/rx6FwyaxBEvzJgjwtGaxGMM8JyD2hP
 wawEqjGalcCf72RKIK4zn+vy
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:24 -0700
IronPort-SDR: TbwpdVMz8kmfE0VlQ1eN9CVC3kQLaA8KuB+XBL5FUODCJhpsgOk4cE5+bRZ6bHraEQ7rDzy0b3
 mAruNVUBP5rgRlBI5oDesMe1r1mvfvv2b3z1J+zo3kSN+n7Q+baKhipHkONzphGB4fB1i0ITrV
 x2NkwfLfYu+9rdYicaLCrQkCDJhEpM7ACHezy9whGObCF4XqRZt81q1j1BrRmmgC+x8GMOZtFY
 pfMS3xPNo+pgSGXkBdec1MC2TNcjTolq+RpPE+vzeizmzuvpKeuMltYwGWNH38KftdJOVcCXyl
 1eY=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:11 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 28/42] target/riscv: fix vrgather macro index variable type bug
Date: Tue,  4 May 2021 08:13:13 +1000
Message-Id: <20210503221327.3068768-29-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

ETYPE may be type of uint64_t, thus index variable has to be declared as
type of uint64_t, too. Otherwise the value read from vs1 register may be
truncated to type of uint32_t.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419060302.14075-1-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 356cef8a09..4651a1e224 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4796,7 +4796,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    uint32_t index, i;                                                    \
+    uint64_t index;                                                       \
+    uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
@@ -4826,7 +4827,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    uint32_t index = s1, i;                                               \
+    uint64_t index = s1;                                                  \
+    uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
-- 
2.31.1


