Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8399831165B
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 00:03:31 +0100 (CET)
Received: from localhost ([::1]:57152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8A8Q-0000Lh-Gf
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 18:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2I-0001cE-3F
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:10 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2F-0003Ej-4E
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:09 -0500
Received: by mail-pj1-x102d.google.com with SMTP id my11so7280894pjb.1
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=onZUWhtxKDVzYiKYm4mcVALF5M4RSZvicSg1zN9qm0A=;
 b=rRqbavEkSdzF62xluHGJYEZ8pXsYRCMlTwKs9yY+BHwOk2yO84rwfevjS2i3Ail8jd
 UVmZyLjTGda4OmribsxTmBA2DfyoxIeZMugSpFmFxMYspT2FNTCa1xDVgWfn4aRFAXzb
 HvNtsA5WLiS19Eu8p4f4i12UIDnld/lGgfprxHoVsOHA5FvKGcUasK63YzOS+LSSU/vn
 eIbgzdGZ3SQnwDJMGfw874qRi/U6qURtR4TZD/23dDW5hpptJU7UodKgQQ93GVDm0AfK
 WNjgFOjbeKN9opLrYi+tHUshwJn36fsvI2Kfl+/wo1p/eRgOikbke5anQpKYB3VmwpRL
 jFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=onZUWhtxKDVzYiKYm4mcVALF5M4RSZvicSg1zN9qm0A=;
 b=hHsdb2kl8sgQyfTfWkU8l3FndUW64xy59x7gnfqwNLu2TIRYLikeKgSX3jS3bPOcGA
 JRVy2efSVonv742Z4pM5Gnx9BNDn03MrwrMIwLPFMMBXd0gAb2t1oYI5uHPSUvDyt6aa
 L56XD2Gkhlr6G866AnW/rSi3atRp9/vgvQoW1x1PQYtzriPAk1UqgRet3WA9PNA5+5yZ
 m0gtNVX9MHXTeDOYtk9wEkFaCMhoQ8Nplk6OYJUrBtDjg56J38jQyvvdPAuHMF970JH6
 KyMBijANTQkVMzj20K/jX9nWeWTxcWl5ogvlvJLS/9QoR/HHUHz8uEIaOCgrla7Yzcgk
 ai4w==
X-Gm-Message-State: AOAM530uC/2mIPhvp3Np1PrkxULmPrumq4etqw7GZDj/3UDlCwSargVO
 HkRre4M5yz87MdMymUZJlV9GrZE2iqMkREaq
X-Google-Smtp-Source: ABdhPJyaKrfa1pe4US1jyPYUr7GvZhGHG4gKuZyLJUynRQOd2BB37ByXo/UvsTu6yI0qXPjdb88CHA==
X-Received: by 2002:a17:90a:d09:: with SMTP id
 t9mr6523369pja.139.1612565825805; 
 Fri, 05 Feb 2021 14:57:05 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/46] tcg/tci: Implement INDEX_op_ld16s_i32
Date: Fri,  5 Feb 2021 12:56:10 -1000
Message-Id: <20210205225650.1330794-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Weil <sw@weilnetz.de>

That TCG opcode is used by debian-buster (arm64) running ffmpeg:

    qemu-aarch64 /usr/bin/ffmpeg -i theora.mkv theora.webm

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20210128024814.2056958-1-sw@weilnetz.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index b3f9531a73..2ba97da189 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -615,7 +615,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             TODO();
             break;
         case INDEX_op_ld16s_i32:
-            TODO();
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(int16_t *)(t1 + t2));
             break;
         case INDEX_op_ld_i32:
             t0 = *tb_ptr++;
-- 
2.25.1


