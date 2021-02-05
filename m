Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CE231161E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 23:59:44 +0100 (CET)
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8A4l-0004Jh-4M
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 17:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2I-0001ep-OI
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:10 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:45832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8A2H-0003F0-6d
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 17:57:10 -0500
Received: by mail-pg1-x52c.google.com with SMTP id o21so4167693pgn.12
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 14:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tnzvFG8Gmy7YN7i7Jw+CtzTgCAPtOrT7NLuSzhM8paA=;
 b=ZK9eVMs1HmuWwrPAfwI6mXAx6Gi8fKddXmphBsVExjY2X+WMFtjUJ2dyo44ziyebHz
 80onARvTPmYVG2uF+PU1kgrVfKKtjzVHxF8UaRiz5F6Ef1B0L4iO+NZOV3DyI05H/lwS
 QCTU4XYPY9AgIh/aC4nw8J7yaxy6niq+tIxOWUa6YmGiNITVD8z4lXzgT0HvzZhWbwcP
 ifUKDj+A+T/BCvjjNrLzp49f95dOC0M8+zpankGQvpFORQLRj2BVDZaBmcqZS5ynb/DZ
 KYyt/tFFpkNCor71ZyTrxaLngJQsLUMS3s6UhndW7a/V2FlK2BIWY9eKVdPlXN9ol0bm
 ogfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tnzvFG8Gmy7YN7i7Jw+CtzTgCAPtOrT7NLuSzhM8paA=;
 b=jpivEFwx7p2BtqAlZ5aLGFi8yjqaEZ/n+q4G8cL1NWWnBQWrY7P0fDsRgjuBHTGMDC
 FuMq8lIW+MFfOob9W+8II/IZvJAa0zhnDpfAJAaMGNCsrzD85NZSQkvxhs3CgPy0VFHp
 sk0Ph+46vTHUWZLP1hNWBRBIMg6X8BJsKGWPem/o8lSUSw+UkYjpz242GdpJmZWRUtPb
 spR/TLLuSavnJ6zMvTQJvAHZlyJOR7oyylqdjIojw0pJ8vpbw0xIi5VP2jBsHf/4qw/H
 gvzHZg2TQO/JsiG5iim3YhuN8ECBFAon9pY1H0bd6W5TOemBLsWcPt20mgwfCHEbNraR
 3wDg==
X-Gm-Message-State: AOAM5333hVDFv1mE4wUWYbZHTWCdTpowd+RLkkfOdk92jEYsdi1BV8UQ
 N1gIYA0rC91QCXdhKUN3NhwVEuYRhH2GMLEv
X-Google-Smtp-Source: ABdhPJyif147Pc2ksdF1nEKqa0U1io7KoCa+JTZXVT+VBvdevPD5562fTwIq12ZFmzfJkKB5Ikz69Q==
X-Received: by 2002:a62:444:0:b029:1bc:ebb6:71f8 with SMTP id
 65-20020a6204440000b02901bcebb671f8mr6318620pfe.75.1612565828000; 
 Fri, 05 Feb 2021 14:57:08 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id c23sm12155149pgc.72.2021.02.05.14.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 14:57:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/46] tcg/tci: Implement INDEX_op_ld8s_i64
Date: Fri,  5 Feb 2021 12:56:11 -1000
Message-Id: <20210205225650.1330794-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205225650.1330794-1-richard.henderson@linaro.org>
References: <20210205225650.1330794-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Message-Id: <20210128020425.2055454-1-sw@weilnetz.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 2ba97da189..c3a8511dfe 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -883,7 +883,10 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg8(regs, t0, *(uint8_t *)(t1 + t2));
             break;
         case INDEX_op_ld8s_i64:
-            TODO();
+            t0 = *tb_ptr++;
+            t1 = tci_read_r(regs, &tb_ptr);
+            t2 = tci_read_s32(&tb_ptr);
+            tci_write_reg(regs, t0, *(int8_t *)(t1 + t2));
             break;
         case INDEX_op_ld16u_i64:
             t0 = *tb_ptr++;
-- 
2.25.1


