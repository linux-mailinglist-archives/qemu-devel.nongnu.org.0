Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA3D68376D
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 21:22:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMx7X-0006va-9r; Tue, 31 Jan 2023 15:20:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx7Q-0006tW-A0
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:20:40 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1pMx7M-0002rb-DE
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 15:20:37 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so5989926wms.1
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 12:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yvHIRBCasGI/M7FOrkWVgk4VvqK1NIRoMsNprIYB95I=;
 b=BDko/+ssRjluYDfvKBYy0smVa0kz9wSGdnF99Zx7twGkCx0HfngosH1ne5KFp3PW0p
 PetLcKcxq22u5Ww3pGyYwrtThbsDvEviuz/rvsHhP0Z4UUNWSXpLWuaAmUDzrVtQzHca
 JiiG8h0FxJgqDJE4D2w3xgc6DL9nDojxnSa/FjKQHaAFUS1hTocSRLr6XQEaIBwvO005
 eIjQOi6Zy3pd+MwycdsbVYn+02Vh88Bm4EQwIZ5AWdt6XZIeby3BoWDoUG7wQVZcyFK7
 Fv2Hb6TYMbpF7Rw8ASd+QbbxyMNm00QdU+grsZsh5mUXvuDgpPwXOxTpzHhKgUkZP2d6
 yxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yvHIRBCasGI/M7FOrkWVgk4VvqK1NIRoMsNprIYB95I=;
 b=GgMP0gacNF/sjWpQd5X9SW5MFnxJb/BWZEjONKZtWx4WOeRto0EeGXgqDCl1NiygQH
 QAPFPu3hcNKdaiqIbRtt7hKjtaW4bvtjPfKYHf2Ht+ghHI6kjqkhAEzFC7WHO39+dvnL
 nzfsy+SQaDM88uc76HVLHtEXRit7uzANGOIjUwbilHFU3Y3tNF5PzccrLUPTM0S4/rtD
 it1Ubqh3bJRtnDSyo69Y3R7r3JAM4uMsUhBFBJMEtVx0ampT+pJpPn17rgoJlvQe3tvK
 e6L4I6yQBp14GhGKaGMPbUSUpP4IbiMXFrxJQ5P4JtOGxsoa8DYR3MUbnsNSn6zKvtR6
 B+aQ==
X-Gm-Message-State: AO0yUKUWpyJts0ymnFRaNSGPbrHl+7hnl0X6b4zy0id2WR5xXzErCVFk
 1hV/K7ZycV6kKQBwu8IFpu6i/w==
X-Google-Smtp-Source: AK7set8vfYp+x4QI1WlbuxSnLwDyUs9v98U5JH1WVfDdyc/tyiBnIuOOWB5DREF6vUUSRRbriAhfEQ==
X-Received: by 2002:a05:600c:314d:b0:3dc:2039:1710 with SMTP id
 h13-20020a05600c314d00b003dc20391710mr25222101wmo.20.1675196434782; 
 Tue, 31 Jan 2023 12:20:34 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b002bdec340a1csm15391977wri.110.2023.01.31.12.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 12:20:34 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v5 11/14] RISC-V: Set minimum priv version for Zfh to 1.11
Date: Tue, 31 Jan 2023 21:20:10 +0100
Message-Id: <20230131202013.2541053-12-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
References: <20230131202013.2541053-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

There are no differences for floating point instructions in priv version 1.11
and 1.12. There is also no dependency for Zfh to priv version 1.12.
Therefore allow Zfh to be enabled for priv version 1.11.

Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Christoph Müllner <christoph.muellner@vrull.eu>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5679e2cb83..3078556f1b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -77,7 +77,7 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zifencei, true, PRIV_VERSION_1_10_0, ext_ifencei),
     ISA_EXT_DATA_ENTRY(zihintpause, true, PRIV_VERSION_1_10_0, ext_zihintpause),
     ISA_EXT_DATA_ENTRY(zawrs, true, PRIV_VERSION_1_12_0, ext_zawrs),
-    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_12_0, ext_zfh),
+    ISA_EXT_DATA_ENTRY(zfh, true, PRIV_VERSION_1_11_0, ext_zfh),
     ISA_EXT_DATA_ENTRY(zfhmin, true, PRIV_VERSION_1_12_0, ext_zfhmin),
     ISA_EXT_DATA_ENTRY(zfinx, true, PRIV_VERSION_1_12_0, ext_zfinx),
     ISA_EXT_DATA_ENTRY(zdinx, true, PRIV_VERSION_1_12_0, ext_zdinx),
-- 
2.39.1


