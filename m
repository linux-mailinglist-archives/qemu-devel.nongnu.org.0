Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3330E9F4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:08:21 +0100 (CET)
Received: from localhost ([::1]:38116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7U4C-0006nx-6z
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:08:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiR-0004rz-LY
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:51 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:46437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TiP-0003oJ-Vp
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:45:51 -0500
Received: by mail-pg1-x52a.google.com with SMTP id r38so1002111pgk.13
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=acbBM9pC8e1A/bvx5nB4UsPCm3LAoSp/wHIVXG+hEzA=;
 b=wMuzlzxb/KNISWtkhg14HHUfc1qQUIFCO+/mSl8xNUmhLq3lOJpKl+da5olT93LABi
 XC2mvbSjzwo+rfdcg5Lj/FSj2m8ruoEbDsXjPCl6C+bGtuSIiijXHeEbwycVv/Ng30y/
 QJKpB+GvOfMZe009/QZPMMJhH4ISnfZiRySnQpLYq+4Wk8SJYJnLanvzJmMkEzGnO4nG
 RroqCR1oTHx3FL3zq8CTV4Wom/pqGP7y/Rj3FSkWYNtUdWqjm3Jo6qaKTjog626lV1c7
 bGH51l+11VQCRAZLFJfPIHYNipjFfooxiBWYjyjBXWCofgdD+N8c/WdQa+bq18eIOUeL
 bgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=acbBM9pC8e1A/bvx5nB4UsPCm3LAoSp/wHIVXG+hEzA=;
 b=KEKjK5jh47lHi1I3poFe7OBpwCso0Df6xJP1DlSKHxcxkbDIbp0Ny2ZeiorJm4j2pu
 t1Ny/ED111gXPBC/fzEYIXE4pTmB48ed+W87Py+F/bztr2C89xc/6wsncjDPM5Mal56e
 4jff5i2qsXaAjmbW/wNjEe067zanCGdF3v6hepqhz1UTyyJdDU50BlqC5E7wiGXcsPCY
 Ky2069WhmSx3u7qZ3jgUrZ81/GA8VAJh/HOAnKSJ10g8AGUK+0FUnPphwmfawC/pjgYE
 P94tgeXS8gU101vzXr7LhQoabi7FR6gLMJwIMTH4uRm5kMq2JpTyfgMCM9BYAgyO8rk0
 0XSA==
X-Gm-Message-State: AOAM531xnZFxrzrMfZ5GzebOBT+CvxNXar35yl88oFysz1P6/bpr4zcg
 SykvB0a7zxLs8DrFn9CMN++mC/tZmVjG17Kv
X-Google-Smtp-Source: ABdhPJyolbcS7wNjSThi3lA4AYc8RRYX9mPhNZ8mM4QU1oz0319X8ODRwESneueIQ/txnKqvmNMkUw==
X-Received: by 2002:a62:ddcf:0:b029:1b7:baca:6c71 with SMTP id
 w198-20020a62ddcf0000b02901b7baca6c71mr5859469pff.43.1612403148773; 
 Wed, 03 Feb 2021 17:45:48 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:45:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/93] tcg/tci: Merge INDEX_op_st16_{i32,i64}
Date: Wed,  3 Feb 2021 15:43:55 -1000
Message-Id: <20210204014509.882821-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: sw@weilnetz.de, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 6819c97792..fe935e71a3 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -618,7 +618,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             *(uint8_t *)(t1 + t2) = t0;
             break;
-        case INDEX_op_st16_i32:
+        CASE_32_64(st16)
             t0 = tci_read_r16(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -874,12 +874,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
-        case INDEX_op_st16_i64:
-            t0 = tci_read_r16(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint16_t *)(t1 + t2) = t0;
-            break;
         case INDEX_op_st32_i64:
             t0 = tci_read_r32(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


