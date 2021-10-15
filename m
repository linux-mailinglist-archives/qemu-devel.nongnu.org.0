Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B888842EB1D
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:08:42 +0200 (CEST)
Received: from localhost ([::1]:55174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIGf-0002ua-Pl
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHw9-0006Q2-5f
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:30 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvy-0002Hv-RW
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:28 -0400
Received: by mail-pj1-x1036.google.com with SMTP id kk10so6674193pjb.1
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvPwk7n9vJdvdYsmVlfOuImPXPXG52Au8SLcvzIOpkg=;
 b=nGmjhCV4EEv3A2lZPsGSg56k7Lt0AHpyDVr2Wd87VUyy8OpIuAH6C5P4Uz8lO7MwPL
 fVPN2Qxvv+u9yPux3WcKQ4crcZoD9w/ewWaryL07oHyOmCRJCoUTpFpdf/XsKgEz2Ir7
 mzwfyw9Y7Mo0iLQkG1Pceh99ZVKLXZ21VXs6imJXhcHmxmZbejlaYKPtepZ6/tefQmk5
 2dDcp3VySyl3BmTu6cvmvnuZWzyVPinUoSJQ46+AkmzVNeVsOGWBngTsJe57/fPDcIsw
 br5Z500fZ+D23+lnYf4rmbio2/A9l6Lx/GToq84od9iOEshKYn65oy0w2kzSvc+NFYHV
 bKpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvPwk7n9vJdvdYsmVlfOuImPXPXG52Au8SLcvzIOpkg=;
 b=hlSlW4is1TsQOEHVvUyVAgU6s3s1jBzLvgjL8j2XWFJ59b75DZrY5wL9iUwvtOh06F
 9CIiyInKL90nE46MESk2xBvOC8Ro+9xNP/vz25Mxw/PD8VTEttNsWBah4SYiVykt7yKP
 FLXu7tq1ljTG/AOQPYFn7KjzQrMtqlCT9qZWI/PUSYehyJkw0lxq1k5anUyr00ASKcWb
 1CN2+x1V8jeDsrVX56e9Nmg25INVTkDlwVSBJKEiwrUZh1q/ej3EllCosYtM5lBBWA5K
 edTngIrPRZ46rc8WSfA/TdBQ4pPEIG0AfqOnfolRPZ1uSwya8yzN0JGgbo2fs14AQVCt
 wJDA==
X-Gm-Message-State: AOAM532uVu+oamsIXGC7EEAXionIVxKgYzcuStA7ixP8a0YMaM658uFH
 PLAlGzJd7DkvdjMEsp3BfvhqN2pcx5wVTQ==
X-Google-Smtp-Source: ABdhPJym1/kzkg+MEV6dIUsHZKOMLijIxfR/AbtcYvJoda0q24LrX3prWHi/Gv77bfufd4xHlCtMEg==
X-Received: by 2002:a17:902:f24c:b0:13f:4db1:976 with SMTP id
 j12-20020a170902f24c00b0013f4db10976mr9841055plc.28.1634284037421; 
 Fri, 15 Oct 2021 00:47:17 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:47:17 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 11/78] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
Date: Fri, 15 Oct 2021 15:45:12 +0800
Message-Id: <20211015074627.3957162-12-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

If VS field is off, accessing vector csr registers should raise an
illegal-instruction exception.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 0fb71875654..688dc1533b6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -48,6 +48,11 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
     if (env->misa & RVV) {
+#if !defined(CONFIG_USER_ONLY)
+        if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
+            return RISCV_EXCP_ILLEGAL_INST;
+        }
+#endif
         return RISCV_EXCP_NONE;
     }
     return RISCV_EXCP_ILLEGAL_INST;
-- 
2.25.1


