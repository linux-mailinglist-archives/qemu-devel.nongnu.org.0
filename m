Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06431460D29
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:20:04 +0100 (CET)
Received: from localhost ([::1]:41664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXD1-0002fi-3I
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:20:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzT-0004Rt-CC
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:06:03 -0500
Received: from [2607:f8b0:4864:20::52f] (port=41679
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mrWzR-0000Rz-H8
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:06:03 -0500
Received: by mail-pg1-x52f.google.com with SMTP id k4so4375774pgb.8
 for <qemu-devel@nongnu.org>; Sun, 28 Nov 2021 19:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HdGLIrBmcpm5HZc7pPQz97TjtpgKuH73SRJUsnw3v6I=;
 b=UyzAmfVic/NtafAph5XMMQMIJv4zarPD0wzakPv33zHblaMM32GfmIt+4SQczOOWEE
 /Zy6Gow4W5V9L2/6yOx4jdM2JZUZ6X6LIK11dExRNejOG5RJtfy4RLg2cGgzvaawAJ/u
 qVyHrpv6DPLc8UPdNSBkmPEY+klBKItWsp400ygaD9tsuP4cZFSkNCYljFxLWakY3/0a
 WAFrunhhGSbMRe1N4XO96+gRKI1zXEN4+XoK4GJvCEGir8vCdhXv9DkLob7fldXVfX5f
 FYDv2fAxTR6x1X8WR5rtlPRaAdBjNKQr8AjJ4MG2kT3gzyad46MqaYvOnOFW1L23AzzA
 3Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdGLIrBmcpm5HZc7pPQz97TjtpgKuH73SRJUsnw3v6I=;
 b=deCb8DweKXjPMH6Gfv1ZsH3sNbSFkHYOrCe5kRQfDuf51WNE1NOKQQAN6n8CAse+Zc
 f01GovjYD8mbJMDitXht7XPA8c8RFdGiIJzOTlGmE6S1RXxBRQzCRNTCZqUQHCv8W5Rr
 OQUlsIwoHX8KyRIp3O+jzzav/slxso1SWN4OPa7H/gqv8uR8838CjwqbEgMix1ArS3IL
 ZhAj/iHGioY536fMp+1MHfLZ34nYRcu3Vgh5eaDPcP3ViUBY7kTrN/utSDXdx4avP4LL
 XuAieTwJqvE8LXWTfy5gu62jIPmdUK6HV4zqodd8ZKlaTC+JB3bPG2twhfI/Ih8Ad+Xx
 SMog==
X-Gm-Message-State: AOAM530y9c9bYlt+byunhOdujciWSU74Z/aK5ZOFbFxTp9U3YlyV6y5P
 FXmg7+R8LtHJn9m2oQ+2JDWnr+MsPc9jPbXk
X-Google-Smtp-Source: ABdhPJxAMOCwpgUcnnd240dwGmKDpi9wiyxT+NceaRPjyOPpFM4SE1f7JMBep8sl5lQ1fR3Z0ZC2+A==
X-Received: by 2002:a63:4551:: with SMTP id u17mr19348205pgk.568.1638155160150; 
 Sun, 28 Nov 2021 19:06:00 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id oj11sm17904040pjb.46.2021.11.28.19.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:05:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v10 28/77] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Mon, 29 Nov 2021 11:02:48 +0800
Message-Id: <20211129030340.429689-29-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129030340.429689-1-frank.chang@sifive.com>
References: <20211129030340.429689-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 92a0e6fe51e..f61eaf7c6ba 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -586,7 +586,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
-vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-- 
2.25.1


