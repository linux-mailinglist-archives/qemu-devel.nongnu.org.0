Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1CE311668
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:09:25 +0100 (CET)
Received: from localhost ([::1]:49594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8AE8-0000Zb-GZ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2f-0002Ka-O4
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:34 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2b-0003Ps-68
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:32 -0500
Received: by mail-pj1-x102c.google.com with SMTP id e9so4656554pjj.0
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=06+ir6ny4Ln0oN97wv1SB2Wg0mLnpqdVB1qEhcqxE0Q=;
 b=DSgz8liFJVhbDG23AdG0cQdmFwQZCm35hRnO40Lv0SBw/H1pLXCqji2WfOqISV7rfV
 rdGsXgrHU7GCqDttodhn/4INZxDiL7XvYIT/APKfyevDkzxHMy7O1PCjHUEqhWA36EAl
 2c6ECsS7eXnJm8EcZfI/PxrSC1bX6v22KQyRTdm2W9SI1tQ+VIkJ1nqSV1UhsHptE4oJ
 b+mnBOC8aGELmRXoSfZU0nup0gGuP88XTGzTE1ci+Cn2+sVlnZp54aRKJa/loxpkCury
 EXQloGhcv8/N5PN/87ZR5S08h8h1g2kGD+d9upvg1lmJ6yHuTeC+LihBW3RcwguI3GvZ
 PRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=06+ir6ny4Ln0oN97wv1SB2Wg0mLnpqdVB1qEhcqxE0Q=;
 b=YHGmvajdwyiPzrWWKvOFXyu4BrJYQwcDG1iqI9BD5svtuwjNSw9FEeTkG3GtBiTYEW
 cwFZNcEYyVOWnmISORphLmnPTXR12RTpC5WMD067GsKaFE6E2RD/JwJZUp98DOAvF0Lc
 DG9Kz8NmdYoRTZrfpXmLuT6REoRO8UiFpINEUN5lTc6chl7JJuqmEYiVbCluVeLndxin
 pLNR/Q3hSejMeE5h28NcCor5srVgVKFPW008clJJQyUcR4hF2R92vOkWu21sADwVCvee
 wT5it0uBtqhCzRdbWDm0PggbF4iL5pEcSkM2VeZUu16OFDpqD1Y5csgOza6rDdc1VSZn
 9dHA==
X-Gm-Message-State: AOAM532cLroTzE1D0OMbSvZwBh1oMD/H9qZADzqWMuUi2c7kOO90mQEH
 OwnNxU7HHzzwqSTmUFbrfz6zaspKPa7nRIfX
X-Google-Smtp-Source: ABdhPJxnHW3xixh2BthAgRUk4WC/s+nBm9EmUcU8hlm0lNJvS+8R2jGcbiYRlpp3iMJy30gdlsKQdQ==
X-Received: by 2002:a17:90a:ab07:: with SMTP id
 m7mr6092852pjq.74.1612565847161; 
 Fri, 05 Feb 2021 14:57:27 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/46] tcg/tci: Merge INDEX_op_st8_{i32,i64}
Date: Fri,  5 Feb 2021 12:56:22 -1000
Message-Id: <20210205225650.1330794-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 55863f76a7..6819c97792 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -612,7 +612,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
-        case INDEX_op_st8_i32:
+        CASE_32_64(st8)
             t0 = tci_read_r8(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -874,12 +874,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
-        case INDEX_op_st8_i64:
-            t0 = tci_read_r8(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint8_t *)(t1 + t2) = t0;
-            break;
         case INDEX_op_st16_i64:
             t0 = tci_read_r16(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


