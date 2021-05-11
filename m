Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4EC37A536
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:56:31 +0200 (CEST)
Received: from localhost ([::1]:39454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQ3y-0005vX-BI
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWr-00028a-Jg
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:18 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=7584e029c=alistair.francis@wdc.com>)
 id 1lgPWn-0006TG-S1
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620728532; x=1652264532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HRFnRKpT6eIKGkJmmSWcNkwahgPJ7f2r03ru00s2A0o=;
 b=Q8PZTEqP0DWVxfrvxBuYPLD3lcxKrixZBBTxAZN17dwSpd0iGIPIRTr4
 +sOVUtjLGJ1q6yUo9twVfXs4VZ8osCMbbGyT50mfplSlHiTvAu0dCV3f+
 CWyVnHdIUViy+WVU1DbPHHZwqY4IEh79Hg58cPA6Qblb+EC7Me3/iyMDg
 gYCWTyoUcVKhpIoYGjS497E7tv7k/ASyVQKCCYKrlbeWmSZA186KBU8kl
 rnvT6SJjd04bcvM2zPyIwshCcH3DQa0G2zk1KjGK+4Q4LZVP+NN1CA99J
 U/lFrHmwnhr7ZL3Na87eAk6vKg+820TEJPe4+Nh3gP/IHdHh6uApvgzXr g==;
IronPort-SDR: C6e4Y52y3jZuoHhOut4HlqGpfXglS9VlmaM7SuyHdrXrXvhc9YfOZtaCQ3iDTju3QyuMlteC3F
 VJi41M1ZHYscLmInEVkY0GndvAwrejY6d2Fyn3LguDnhufX1ne3zi9VwWKU8bAsxTgHNAzrgaB
 XqVR3euClcrBOI1ZNuwFUETKMHxvRi09ZnBCqX/V0zeNgB2DdX121e/MVIVrDhjMtLF1uiz+pD
 Qn9Qwa340dr0tC6bJLphtKpOIA3iuoKngCeADwvWxc8I3eAkcmS1jTQwrwNThTnjXprOkQIDZ3
 P8s=
X-IronPort-AV: E=Sophos;i="5.82,290,1613404800"; d="scan'208";a="167735465"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 May 2021 18:21:34 +0800
IronPort-SDR: obC5hgSJrKQrs4SpJjpQi2pzkX4wAPBnXQXv7LjNki95rj1zeDwHPv/ZVUn14X6sPrPsXfGfeG
 8b7VaW3ZuUXJLxbq3NvDej0p4CL2+huk/hUuyXZWE/XglGUvrJzW35AJPsmVPW6uR8os7L7Vf/
 wTOW/6BNtvjlz6ugEwzv0lby1ShYulvZTerJG2ly3MbflrQNj/KQYt+xgzIfdItQXb9KZKJ5PH
 4Zc9eyxrtuEdBLxqYNCVFcaGajMjV+IIYmN/qSfgXbEpS+2MJ17f0JdoO1CYj1k24GY7rrQeBH
 J0dxMugPgvs9x3AE6jzzd1Yq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 03:01:34 -0700
IronPort-SDR: KSrScgw1pJ94opK/R7DkGNihmFrBDAWgt7Pjl9faDJ6neChGlVXT7aVbUXfoBR5Cu77FAreiEh
 zT95h3L/tIEZYtquN8R/ZHw+48DQQMrUBmKxCp52XxyzxV/vVH4YZGAt16+35Q70pqdAHYpoI3
 zQNxRhy170EaKGEY9mmbMN6LsPymdzzuKTVVPZK4KZoyOJSoAaosTvMfsspFx9dpy2dDOnT2YQ
 4G78PHSayYlKzwnShgl+ZgcoeQZIe1TEKmR1shkisKCOcQC0KtRCaMLycArDodfu3ddfi73HzW
 k20=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.48])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 May 2021 03:21:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v3 28/42] target/riscv: fix vrgather macro index variable type
 bug
Date: Tue, 11 May 2021 20:19:37 +1000
Message-Id: <20210511101951.165287-29-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511101951.165287-1-alistair.francis@wdc.com>
References: <20210511101951.165287-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=7584e029c=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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


