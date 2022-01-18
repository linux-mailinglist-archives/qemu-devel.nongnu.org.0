Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 915C44913EA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 03:08:19 +0100 (CET)
Received: from localhost ([::1]:40486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9dv0-0001uU-OG
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 21:08:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZV-0000LM-IT
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:46:07 -0500
Received: from [2607:f8b0:4864:20::1030] (port=54087
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dZS-0007Wp-KP
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:46:05 -0500
Received: by mail-pj1-x1030.google.com with SMTP id o62so149873pjo.3
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0E+jsSIyhESPgE5vQhhkoZMMUENEo08068vAmOzqG14=;
 b=YMyGDGrhEKUmzBn77M+ZTKOtrIf/LHHSs7kMB6BiGTfvLXzW/q5AF2pToBccAP7bk3
 60Zf9BlMc/GjN6SqTiXVqnK8ZroByB1NQQz5oc0TK6LaaYK6Du0PoNGOYBrFWaFJ1Gv2
 Im6TChmYUiQnIxxfFZwFBl6NVoVjiT7rmMCaJbas8y76tK425lb+N/F0N//1ZywNSaNT
 NifwYVMwcH+QUgg0dDxW8lyBS+q/6WofqMEBtp5gP9lCK/Ayj7tfzxJzIcDyZAsI4crq
 Znq/FFACUGTwdgzvf7zFkHn32GFaYP9LF1SU9JO2BQd66N++TCjhWiAUmI1wj9t9YCbp
 ku+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0E+jsSIyhESPgE5vQhhkoZMMUENEo08068vAmOzqG14=;
 b=j8H20/amuldod03zlHR0OvG023zonIdRo4nHDKeZj6XAprF+ZYfe6nueqcaCzi94fA
 EaIAT4OITei39pTvSSSGvEAxlUInbuHhVPJk5dFOc8ui30xoAKKCtyFsrCVzmf4TOWF4
 7cyRJs1xtSHSqVhSSZE9TNYMD4UVL/4LWRYsgYmPlB26/+zZM+p6FN2AaQAniBn96KNZ
 8crvV2svr0GNjqbqoozmzNLS+Xy+w03Mgi0wX2dDWVBXdboj27N64uUBPNHOyRi4HyXh
 CTqeCsmW9G8bKKvsZ6bNUekoHqI2pE9MJSZqa39CyzE99C04fN6AFo0znN1LhZkzbfPx
 w72Q==
X-Gm-Message-State: AOAM532WuerrEqtX9weGkiAPm5YC8/YLOwaNOtv9QZKVqVQlXWyU8xpN
 DpXRIUN+RG1VSq2xcQx0pDhNhdWe31ZXXJXM
X-Google-Smtp-Source: ABdhPJxzcAXcPCPbYEYxRZ42tluuoRli3d4mt5q1ecPD94GnYtNsCIaN/aVIClqAfMjZkieNBYBeMg==
X-Received: by 2002:a17:90b:4b8c:: with SMTP id
 lr12mr21913651pjb.32.1642470361093; 
 Mon, 17 Jan 2022 17:46:01 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:46:00 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/17] target/riscv: rvv-1.0: Allow Zve64f extension to be
 turned on
Date: Tue, 18 Jan 2022 09:45:13 +0800
Message-Id: <20220118014522.13613-11-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2ba22503da..4bca1cd289 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -664,6 +664,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
 
-- 
2.31.1


