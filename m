Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8562DC5EA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 19:07:34 +0100 (CET)
Received: from localhost ([::1]:41420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpbD3-0006IO-8Z
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 13:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbB9-0005Dq-KZ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:05:37 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:34435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpbB6-0006nr-Sx
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 13:05:35 -0500
Received: by mail-ot1-x32d.google.com with SMTP id a109so23848512otc.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 10:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7CGCSff3VEKRV2nP/08rGbxv5YE6OT4TSr8+RbKmF64=;
 b=KIyVRP2OqGJAHcLn94mT1YcytMX9kP1b2pPVtqPdyjDlaaTY8ZLwd6fWLmIKxlzyWG
 PmkDQX1FoXx769KKl4jZZm/VaKbuuhX4VTx0Qnqf6yvCEhFAzANONFA2YjmVdIck+J/h
 lwJwA+OP/ocStrzMgl8SyFfdbXhXJdN1GAGbN2Q+/J+X5V5lsNrU/zFtYcymbY6NVK2J
 kb7kkxl1chDExj+8EgfhvaBNe7JcuNvViR+zsz6m+rxzrhsC2wZUlPSSZUZSt8d1+n1y
 YeDTRYQrkbalDn43OqQtv2lM6t2mYCBENy4TRTuN1CTNeaSUm5QaoDdfTEfT+wT5J4k4
 vGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7CGCSff3VEKRV2nP/08rGbxv5YE6OT4TSr8+RbKmF64=;
 b=QYnskRfImM/zg14EzxelsSgOh0XYiyiYVuRMbqUQN6k03hFYIB3woL37HFHUeKip2a
 VZqfgGSTXz05qi3oJad8RqTW47MbohAA3EotWN+eR/BX76T+iaVwqTVlAvbifcuWpmUh
 icj2EzE/35G4JUNM02ryQgnoK6GVoNQIWRoYh9hwguyNBVNTsmwqhoSCP8a7BP4WYA91
 7GPvnhm4IpAaicT4gkJDJb2//fyujTNSN5y9sIfZmw4NSMpS572WknHhC8uzCB4uFwJw
 /JAfziQAoEXprJwWVSXTzptBSNtscYV+NvoVekc4COnphrH2EGLZWSbhUjzwxjw9G1n0
 klZg==
X-Gm-Message-State: AOAM530Rw5WPS+1oxp0IDro3Ro0hiRrhzqHPG9mw82QWUMJShzLhjNWP
 vtx0zK9Qupn5Dc9oOSp6VZwzHTsqlMjp1DTN
X-Google-Smtp-Source: ABdhPJycTa6OTDD+KXqXQ8WIHD01ohCTMuzu5pyNdk/6mhYyE2mQSux+/4LvO1vNrCmK0Kc8f+CJgg==
X-Received: by 2002:a9d:372:: with SMTP id 105mr22670819otv.118.1608141931247; 
 Wed, 16 Dec 2020 10:05:31 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s23sm707304oot.0.2020.12.16.10.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 10:05:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Add tcg_gen_bswap_tl alias
Date: Wed, 16 Dec 2020 12:05:28 -0600
Message-Id: <20201216180528.187152-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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
Cc: frank.chang@sifive.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The alias is intended to indicate that the bswap is for the
entire target_long.  This should avoid ifdefs on some targets.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index 5abf17fecc..5b3bdacc39 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1085,6 +1085,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_bswap16_tl tcg_gen_bswap16_i64
 #define tcg_gen_bswap32_tl tcg_gen_bswap32_i64
 #define tcg_gen_bswap64_tl tcg_gen_bswap64_i64
+#define tcg_gen_bswap_tl tcg_gen_bswap64_i64
 #define tcg_gen_concat_tl_i64 tcg_gen_concat32_i64
 #define tcg_gen_extr_i64_tl tcg_gen_extr32_i64
 #define tcg_gen_andc_tl tcg_gen_andc_i64
@@ -1197,6 +1198,7 @@ void tcg_gen_stl_vec(TCGv_vec r, TCGv_ptr base, TCGArg offset, TCGType t);
 #define tcg_gen_ext32s_tl tcg_gen_mov_i32
 #define tcg_gen_bswap16_tl tcg_gen_bswap16_i32
 #define tcg_gen_bswap32_tl tcg_gen_bswap32_i32
+#define tcg_gen_bswap_tl tcg_gen_bswap32_i32
 #define tcg_gen_concat_tl_i64 tcg_gen_concat_i32_i64
 #define tcg_gen_extr_i64_tl tcg_gen_extr_i64_i32
 #define tcg_gen_andc_tl tcg_gen_andc_i32
-- 
2.25.1


