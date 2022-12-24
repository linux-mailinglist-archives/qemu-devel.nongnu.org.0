Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB67655933
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjv-0007FA-74; Sat, 24 Dec 2022 03:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zjQ-0006mq-4K
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:15 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zjK-0003Pv-NI
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:11 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxKelmtaZjGUkIAA--.15066S3;
 Sat, 24 Dec 2022 16:16:38 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S12; 
 Sat, 24 Dec 2022 16:16:37 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 10/43] target/loongarch: Implement vaddw/vsubw
Date: Sat, 24 Dec 2022 16:16:00 +0800
Message-Id: <20221224081633.4185445-11-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S12
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3uFWxtFykXrykGryDGr1fCrg_yoW8Cw1DKo
 Z5Jw15Aw1xGr4ftr9rGa98ZrWDJ3yvyw4DAFWvvrnxJFyrAr13Ka4rG34kJayxJrWrKr13
 CanrAr1rt3WaqF1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcV
 CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch includes:
- VADDW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
- VSUBW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
- VADDW{EV/OD}.{H.BU.B/W.HU.H/D.WU.W/Q.DU.D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  43 ++++
 target/loongarch/helper.h                   |  43 ++++
 target/loongarch/insn_trans/trans_lsx.c.inc |  43 ++++
 target/loongarch/insns.decode               |  43 ++++
 target/loongarch/lsx_helper.c               | 243 ++++++++++++++++++++
 5 files changed, 415 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 1a906e8714..81253f00e9 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -836,3 +836,46 @@ INSN_LSX(vhsubw_hu_bu,     vvv)
 INSN_LSX(vhsubw_wu_hu,     vvv)
 INSN_LSX(vhsubw_du_wu,     vvv)
 INSN_LSX(vhsubw_qu_du,     vvv)
+
+INSN_LSX(vaddwev_h_b,      vvv)
+INSN_LSX(vaddwev_w_h,      vvv)
+INSN_LSX(vaddwev_d_w,      vvv)
+INSN_LSX(vaddwev_q_d,      vvv)
+INSN_LSX(vaddwod_h_b,      vvv)
+INSN_LSX(vaddwod_w_h,      vvv)
+INSN_LSX(vaddwod_d_w,      vvv)
+INSN_LSX(vaddwod_q_d,      vvv)
+INSN_LSX(vsubwev_h_b,      vvv)
+INSN_LSX(vsubwev_w_h,      vvv)
+INSN_LSX(vsubwev_d_w,      vvv)
+INSN_LSX(vsubwev_q_d,      vvv)
+INSN_LSX(vsubwod_h_b,      vvv)
+INSN_LSX(vsubwod_w_h,      vvv)
+INSN_LSX(vsubwod_d_w,      vvv)
+INSN_LSX(vsubwod_q_d,      vvv)
+
+INSN_LSX(vaddwev_h_bu,     vvv)
+INSN_LSX(vaddwev_w_hu,     vvv)
+INSN_LSX(vaddwev_d_wu,     vvv)
+INSN_LSX(vaddwev_q_du,     vvv)
+INSN_LSX(vaddwod_h_bu,     vvv)
+INSN_LSX(vaddwod_w_hu,     vvv)
+INSN_LSX(vaddwod_d_wu,     vvv)
+INSN_LSX(vaddwod_q_du,     vvv)
+INSN_LSX(vsubwev_h_bu,     vvv)
+INSN_LSX(vsubwev_w_hu,     vvv)
+INSN_LSX(vsubwev_d_wu,     vvv)
+INSN_LSX(vsubwev_q_du,     vvv)
+INSN_LSX(vsubwod_h_bu,     vvv)
+INSN_LSX(vsubwod_w_hu,     vvv)
+INSN_LSX(vsubwod_d_wu,     vvv)
+INSN_LSX(vsubwod_q_du,     vvv)
+
+INSN_LSX(vaddwev_h_bu_b,   vvv)
+INSN_LSX(vaddwev_w_hu_h,   vvv)
+INSN_LSX(vaddwev_d_wu_w,   vvv)
+INSN_LSX(vaddwev_q_du_d,   vvv)
+INSN_LSX(vaddwod_h_bu_b,   vvv)
+INSN_LSX(vaddwod_w_hu_h,   vvv)
+INSN_LSX(vaddwod_d_wu_w,   vvv)
+INSN_LSX(vaddwod_q_du_d,   vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 4db8ca599e..ff16626381 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -190,3 +190,46 @@ DEF_HELPER_4(vhsubw_hu_bu, void, env, i32, i32, i32)
 DEF_HELPER_4(vhsubw_wu_hu, void, env, i32, i32, i32)
 DEF_HELPER_4(vhsubw_du_wu, void, env, i32, i32, i32)
 DEF_HELPER_4(vhsubw_qu_du, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vaddwev_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwev_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwev_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwev_q_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_q_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwev_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwev_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwev_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwev_q_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwod_h_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwod_w_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwod_d_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwod_q_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vaddwev_h_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwev_w_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwev_d_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwev_q_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_h_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_w_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_d_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_q_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwev_h_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwev_w_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwev_d_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwev_q_du, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwod_h_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwod_w_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwod_d_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vsubwod_q_du, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vaddwev_h_bu_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwev_w_hu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwev_d_wu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwev_q_du_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_h_bu_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_w_hu_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_d_wu_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vaddwod_q_du_d, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index f278a3cd00..69111c498c 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -108,3 +108,46 @@ TRANS(vhsubw_hu_bu, gen_vvv, gen_helper_vhsubw_hu_bu)
 TRANS(vhsubw_wu_hu, gen_vvv, gen_helper_vhsubw_wu_hu)
 TRANS(vhsubw_du_wu, gen_vvv, gen_helper_vhsubw_du_wu)
 TRANS(vhsubw_qu_du, gen_vvv, gen_helper_vhsubw_qu_du)
+
+TRANS(vaddwev_h_b, gen_vvv, gen_helper_vaddwev_h_b)
+TRANS(vaddwev_w_h, gen_vvv, gen_helper_vaddwev_w_h)
+TRANS(vaddwev_d_w, gen_vvv, gen_helper_vaddwev_d_w)
+TRANS(vaddwev_q_d, gen_vvv, gen_helper_vaddwev_q_d)
+TRANS(vaddwod_h_b, gen_vvv, gen_helper_vaddwod_h_b)
+TRANS(vaddwod_w_h, gen_vvv, gen_helper_vaddwod_w_h)
+TRANS(vaddwod_d_w, gen_vvv, gen_helper_vaddwod_d_w)
+TRANS(vaddwod_q_d, gen_vvv, gen_helper_vaddwod_q_d)
+TRANS(vsubwev_h_b, gen_vvv, gen_helper_vsubwev_h_b)
+TRANS(vsubwev_w_h, gen_vvv, gen_helper_vsubwev_w_h)
+TRANS(vsubwev_d_w, gen_vvv, gen_helper_vsubwev_d_w)
+TRANS(vsubwev_q_d, gen_vvv, gen_helper_vsubwev_q_d)
+TRANS(vsubwod_h_b, gen_vvv, gen_helper_vsubwod_h_b)
+TRANS(vsubwod_w_h, gen_vvv, gen_helper_vsubwod_w_h)
+TRANS(vsubwod_d_w, gen_vvv, gen_helper_vsubwod_d_w)
+TRANS(vsubwod_q_d, gen_vvv, gen_helper_vsubwod_q_d)
+
+TRANS(vaddwev_h_bu, gen_vvv, gen_helper_vaddwev_h_bu)
+TRANS(vaddwev_w_hu, gen_vvv, gen_helper_vaddwev_w_hu)
+TRANS(vaddwev_d_wu, gen_vvv, gen_helper_vaddwev_d_wu)
+TRANS(vaddwev_q_du, gen_vvv, gen_helper_vaddwev_q_du)
+TRANS(vaddwod_h_bu, gen_vvv, gen_helper_vaddwod_h_bu)
+TRANS(vaddwod_w_hu, gen_vvv, gen_helper_vaddwod_w_hu)
+TRANS(vaddwod_d_wu, gen_vvv, gen_helper_vaddwod_d_wu)
+TRANS(vaddwod_q_du, gen_vvv, gen_helper_vaddwod_q_du)
+TRANS(vsubwev_h_bu, gen_vvv, gen_helper_vsubwev_h_bu)
+TRANS(vsubwev_w_hu, gen_vvv, gen_helper_vsubwev_w_hu)
+TRANS(vsubwev_d_wu, gen_vvv, gen_helper_vsubwev_d_wu)
+TRANS(vsubwev_q_du, gen_vvv, gen_helper_vsubwev_q_du)
+TRANS(vsubwod_h_bu, gen_vvv, gen_helper_vsubwod_h_bu)
+TRANS(vsubwod_w_hu, gen_vvv, gen_helper_vsubwod_w_hu)
+TRANS(vsubwod_d_wu, gen_vvv, gen_helper_vsubwod_d_wu)
+TRANS(vsubwod_q_du, gen_vvv, gen_helper_vsubwod_q_du)
+
+TRANS(vaddwev_h_bu_b, gen_vvv, gen_helper_vaddwev_h_bu_b)
+TRANS(vaddwev_w_hu_h, gen_vvv, gen_helper_vaddwev_w_hu_h)
+TRANS(vaddwev_d_wu_w, gen_vvv, gen_helper_vaddwev_d_wu_w)
+TRANS(vaddwev_q_du_d, gen_vvv, gen_helper_vaddwev_q_du_d)
+TRANS(vaddwod_h_bu_b, gen_vvv, gen_helper_vaddwod_h_bu_b)
+TRANS(vaddwod_w_hu_h, gen_vvv, gen_helper_vaddwod_w_hu_h)
+TRANS(vaddwod_d_wu_w, gen_vvv, gen_helper_vaddwod_d_wu_w)
+TRANS(vaddwod_q_du_d, gen_vvv, gen_helper_vaddwod_q_du_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 77f9ab5a36..7e99ead2de 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -558,3 +558,46 @@ vhsubw_hu_bu     0111 00000101 10100 ..... ..... .....    @vvv
 vhsubw_wu_hu     0111 00000101 10101 ..... ..... .....    @vvv
 vhsubw_du_wu     0111 00000101 10110 ..... ..... .....    @vvv
 vhsubw_qu_du     0111 00000101 10111 ..... ..... .....    @vvv
+
+vaddwev_h_b      0111 00000001 11100 ..... ..... .....    @vvv
+vaddwev_w_h      0111 00000001 11101 ..... ..... .....    @vvv
+vaddwev_d_w      0111 00000001 11110 ..... ..... .....    @vvv
+vaddwev_q_d      0111 00000001 11111 ..... ..... .....    @vvv
+vaddwod_h_b      0111 00000010 00100 ..... ..... .....    @vvv
+vaddwod_w_h      0111 00000010 00101 ..... ..... .....    @vvv
+vaddwod_d_w      0111 00000010 00110 ..... ..... .....    @vvv
+vaddwod_q_d      0111 00000010 00111 ..... ..... .....    @vvv
+vsubwev_h_b      0111 00000010 00000 ..... ..... .....    @vvv
+vsubwev_w_h      0111 00000010 00001 ..... ..... .....    @vvv
+vsubwev_d_w      0111 00000010 00010 ..... ..... .....    @vvv
+vsubwev_q_d      0111 00000010 00011 ..... ..... .....    @vvv
+vsubwod_h_b      0111 00000010 01000 ..... ..... .....    @vvv
+vsubwod_w_h      0111 00000010 01001 ..... ..... .....    @vvv
+vsubwod_d_w      0111 00000010 01010 ..... ..... .....    @vvv
+vsubwod_q_d      0111 00000010 01011 ..... ..... .....    @vvv
+
+vaddwev_h_bu     0111 00000010 11100 ..... ..... .....    @vvv
+vaddwev_w_hu     0111 00000010 11101 ..... ..... .....    @vvv
+vaddwev_d_wu     0111 00000010 11110 ..... ..... .....    @vvv
+vaddwev_q_du     0111 00000010 11111 ..... ..... .....    @vvv
+vaddwod_h_bu     0111 00000011 00100 ..... ..... .....    @vvv
+vaddwod_w_hu     0111 00000011 00101 ..... ..... .....    @vvv
+vaddwod_d_wu     0111 00000011 00110 ..... ..... .....    @vvv
+vaddwod_q_du     0111 00000011 00111 ..... ..... .....    @vvv
+vsubwev_h_bu     0111 00000011 00000 ..... ..... .....    @vvv
+vsubwev_w_hu     0111 00000011 00001 ..... ..... .....    @vvv
+vsubwev_d_wu     0111 00000011 00010 ..... ..... .....    @vvv
+vsubwev_q_du     0111 00000011 00011 ..... ..... .....    @vvv
+vsubwod_h_bu     0111 00000011 01000 ..... ..... .....    @vvv
+vsubwod_w_hu     0111 00000011 01001 ..... ..... .....    @vvv
+vsubwod_d_wu     0111 00000011 01010 ..... ..... .....    @vvv
+vsubwod_q_du     0111 00000011 01011 ..... ..... .....    @vvv
+
+vaddwev_h_bu_b   0111 00000011 11100 ..... ..... .....    @vvv
+vaddwev_w_hu_h   0111 00000011 11101 ..... ..... .....    @vvv
+vaddwev_d_wu_w   0111 00000011 11110 ..... ..... .....    @vvv
+vaddwev_q_du_d   0111 00000011 11111 ..... ..... .....    @vvv
+vaddwod_h_bu_b   0111 00000100 00000 ..... ..... .....    @vvv
+vaddwod_w_hu_h   0111 00000100 00001 ..... ..... .....    @vvv
+vaddwod_d_wu_w   0111 00000100 00010 ..... ..... .....    @vvv
+vaddwod_q_du_d   0111 00000100 00011 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index cb9b691dc7..9e3131af1b 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -473,3 +473,246 @@ DO_HELPER_VVV(vhsubw_hu_bu, 16, helper_vvv, do_vhsubw_u)
 DO_HELPER_VVV(vhsubw_wu_hu, 32, helper_vvv, do_vhsubw_u)
 DO_HELPER_VVV(vhsubw_du_wu, 64, helper_vvv, do_vhsubw_u)
 DO_HELPER_VVV(vhsubw_qu_du, 128, helper_vvv, do_vhsubw_u)
+
+static void do_vaddwev_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (int16_t)Vj->B[2 * n] + (int16_t)Vk->B[2 * n];
+        break;
+    case 32:
+        Vd->W[n] = (int32_t)Vj->H[2 * n] + (int32_t)Vk->H[2 * n];
+        break;
+    case 64:
+        Vd->D[n] = (int64_t)Vj->W[2 * n] + (int64_t)Vk->W[2 * n];
+        break;
+    case 128:
+        Vd->Q[n] = (__int128)Vj->D[2 * n] + (__int128)Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vaddwod_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (int16_t)Vj->B[2 * n + 1] + (int16_t)Vk->B[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n] = (int32_t)Vj->H[2 * n + 1] + (int32_t)Vk->H[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n] = (int64_t)Vj->W[2 * n + 1] + (int64_t)Vk->W[2 * n + 1];
+        break;
+    case 128:
+        Vd->Q[n] = (__int128)Vj->D[2 * n + 1] + (__int128)Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsubwev_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (int16_t)Vj->B[2 * n] - (int16_t)Vk->B[2 * n];
+        break;
+    case 32:
+        Vd->W[n] = (int32_t)Vj->H[2 * n] - (int32_t)Vk->H[2 * n];
+        break;
+    case 64:
+        Vd->D[n] = (int64_t)Vj->W[2 * n] - (int64_t)Vk->W[2 * n];
+        break;
+    case 128:
+        Vd->Q[n] = (__int128)Vj->D[2 * n] - (__int128)Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsubwod_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (int16_t)Vj->B[2 * n + 1] - (int16_t)Vk->B[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n] = (int32_t)Vj->H[2 * n + 1] - (int32_t)Vk->H[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n] = (int64_t)Vj->W[2 * n + 1] - (int64_t)Vk->W[2 * n + 1];
+        break;
+    case 128:
+        Vd->Q[n] = (__int128)Vj->D[2 * n + 1] - (__int128)Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vaddwev_h_b, 16, helper_vvv, do_vaddwev_s)
+DO_HELPER_VVV(vaddwev_w_h, 32, helper_vvv, do_vaddwev_s)
+DO_HELPER_VVV(vaddwev_d_w, 64, helper_vvv, do_vaddwev_s)
+DO_HELPER_VVV(vaddwev_q_d, 128, helper_vvv, do_vaddwev_s)
+DO_HELPER_VVV(vaddwod_h_b, 16, helper_vvv, do_vaddwod_s)
+DO_HELPER_VVV(vaddwod_w_h, 32, helper_vvv, do_vaddwod_s)
+DO_HELPER_VVV(vaddwod_d_w, 64, helper_vvv, do_vaddwod_s)
+DO_HELPER_VVV(vaddwod_q_d, 128, helper_vvv, do_vaddwod_s)
+DO_HELPER_VVV(vsubwev_h_b, 16, helper_vvv, do_vsubwev_s)
+DO_HELPER_VVV(vsubwev_w_h, 32, helper_vvv, do_vsubwev_s)
+DO_HELPER_VVV(vsubwev_d_w, 64, helper_vvv, do_vsubwev_s)
+DO_HELPER_VVV(vsubwev_q_d, 128, helper_vvv, do_vsubwev_s)
+DO_HELPER_VVV(vsubwod_h_b, 16, helper_vvv, do_vsubwod_s)
+DO_HELPER_VVV(vsubwod_w_h, 32, helper_vvv, do_vsubwod_s)
+DO_HELPER_VVV(vsubwod_d_w, 64, helper_vvv, do_vsubwod_s)
+DO_HELPER_VVV(vsubwod_q_d, 128, helper_vvv, do_vsubwod_s)
+
+static void do_vaddwev_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (uint16_t)(uint8_t)Vj->B[2 * n] + (uint16_t)(uint8_t)Vk->B[2 * n];
+        break;
+    case 32:
+        Vd->W[n] = (uint32_t)(uint16_t)Vj->H[2 * n] + (uint32_t)(uint16_t)Vk->H[2 * n];
+        break;
+    case 64:
+        Vd->D[n] = (uint64_t)(uint32_t)Vj->W[2 * n] + (uint64_t)(uint32_t)Vk->W[2 * n];
+        break;
+    case 128:
+        Vd->Q[n] = (__uint128_t)(uint64_t)Vj->D[2 * n] + (__uint128_t)(uint64_t)Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vaddwod_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (uint16_t)(uint8_t)Vj->B[2 * n + 1] + (uint16_t)(uint8_t)Vk->B[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n] = (uint32_t)(uint16_t)Vj->H[2 * n + 1] + (uint32_t)(uint16_t)Vk->H[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n] = (uint64_t)(uint32_t)Vj->W[2 * n + 1] + (uint64_t)(uint32_t)Vk->W[2 * n + 1];
+        break;
+    case 128:
+        Vd->Q[n] = (__uint128_t)(uint64_t)Vj->D[2 * n + 1] + (__uint128_t)(uint64_t )Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsubwev_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (uint16_t)(uint8_t)Vj->B[2 * n] - (uint16_t)(uint8_t)Vk->B[2 * n];
+        break;
+    case 32:
+        Vd->W[n] = (uint32_t)(uint16_t)Vj->H[2 * n] - (uint32_t)(uint16_t)Vk->H[2 * n];
+        break;
+    case 64:
+        Vd->D[n] = (uint64_t)(uint32_t)Vj->W[2 * n] - (uint64_t)(uint32_t)Vk->W[2 * n];
+        break;
+    case 128:
+        Vd->Q[n] = (__uint128_t)(uint64_t)Vj->D[2 * n] - (__uint128_t)(uint64_t)Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vsubwod_u(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (uint16_t)(uint8_t)Vj->B[2 * n + 1] - (uint16_t)(uint8_t)Vk->B[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n] = (uint32_t)(uint16_t)Vj->H[2 * n + 1] - (uint32_t)(uint16_t)Vk->H[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n] = (uint64_t)(uint32_t)Vj->W[2 * n + 1] - (uint64_t)(uint32_t)Vk->W[2 * n + 1];
+        break;
+    case 128:
+        Vd->Q[n] = (__uint128_t)(uint64_t)Vj->D[2 * n + 1] - (__uint128_t)(uint64_t)Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vaddwev_h_bu, 16, helper_vvv, do_vaddwev_u)
+DO_HELPER_VVV(vaddwev_w_hu, 32, helper_vvv, do_vaddwev_u)
+DO_HELPER_VVV(vaddwev_d_wu, 64, helper_vvv, do_vaddwev_u)
+DO_HELPER_VVV(vaddwev_q_du, 128, helper_vvv, do_vaddwev_u)
+DO_HELPER_VVV(vaddwod_h_bu, 16, helper_vvv, do_vaddwod_u)
+DO_HELPER_VVV(vaddwod_w_hu, 32, helper_vvv, do_vaddwod_u)
+DO_HELPER_VVV(vaddwod_d_wu, 64, helper_vvv, do_vaddwod_u)
+DO_HELPER_VVV(vaddwod_q_du, 128, helper_vvv, do_vaddwod_u)
+DO_HELPER_VVV(vsubwev_h_bu, 16, helper_vvv, do_vsubwev_u)
+DO_HELPER_VVV(vsubwev_w_hu, 32, helper_vvv, do_vsubwev_u)
+DO_HELPER_VVV(vsubwev_d_wu, 64, helper_vvv, do_vsubwev_u)
+DO_HELPER_VVV(vsubwev_q_du, 128, helper_vvv, do_vsubwev_u)
+DO_HELPER_VVV(vsubwod_h_bu, 16, helper_vvv, do_vsubwod_u)
+DO_HELPER_VVV(vsubwod_w_hu, 32, helper_vvv, do_vsubwod_u)
+DO_HELPER_VVV(vsubwod_d_wu, 64, helper_vvv, do_vsubwod_u)
+DO_HELPER_VVV(vsubwod_q_du, 128, helper_vvv, do_vsubwod_u)
+
+static void do_vaddwev_u_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (uint16_t)(uint8_t)Vj->B[2 * n] + (int16_t)Vk->B[2 * n];
+        break;
+    case 32:
+        Vd->W[n] = (uint32_t)(uint16_t)Vj->H[2 * n] + (int32_t)Vk->H[2 * n];
+        break;
+    case 64:
+        Vd->D[n] = (uint64_t)(uint32_t)Vj->W[2 * n] + (int64_t)Vk->W[2 * n];
+        break;
+    case 128:
+        Vd->Q[n] = (__uint128_t)(uint64_t)Vj->D[2 * n] + (__int128)Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vaddwod_u_s(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 16:
+        Vd->H[n] = (uint16_t)(uint8_t)Vj->B[2 * n + 1] + (int16_t)Vk->B[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n] = (uint32_t)(uint16_t)Vj->H[2 * n + 1] + (int32_t)Vk->H[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n] = (uint64_t)(uint32_t)Vj->W[2 * n + 1] + (int64_t)Vk->W[2 * n + 1];
+        break;
+    case 128:
+        Vd->Q[n] = (__uint128_t)(uint64_t)Vj->D[2 * n + 1] + (__int128)Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vaddwev_h_bu_b, 16, helper_vvv, do_vaddwev_u_s)
+DO_HELPER_VVV(vaddwev_w_hu_h, 32, helper_vvv, do_vaddwev_u_s)
+DO_HELPER_VVV(vaddwev_d_wu_w, 64, helper_vvv, do_vaddwev_u_s)
+DO_HELPER_VVV(vaddwev_q_du_d, 128, helper_vvv, do_vaddwev_u_s)
+DO_HELPER_VVV(vaddwod_h_bu_b, 16, helper_vvv, do_vaddwod_u_s)
+DO_HELPER_VVV(vaddwod_w_hu_h, 32, helper_vvv, do_vaddwod_u_s)
+DO_HELPER_VVV(vaddwod_d_wu_w, 64, helper_vvv, do_vaddwod_u_s)
+DO_HELPER_VVV(vaddwod_q_du_d, 128, helper_vvv, do_vaddwod_u_s)
-- 
2.31.1


