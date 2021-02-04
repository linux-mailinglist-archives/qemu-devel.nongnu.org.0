Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836BD30EA03
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:15:04 +0100 (CET)
Received: from localhost ([::1]:54726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7UAh-0005Yk-Fp
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:15:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TjE-0005Nb-Bg
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:40 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7Tiz-0003x8-60
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:46:34 -0500
Received: by mail-pl1-x631.google.com with SMTP id u15so904465plf.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MfW3tSMzNg4i1sVQnx6Ri1BGJD02W5/7jILfn3srnPM=;
 b=B1I0nlhuH5exjTJ7ZCYHW25afTk+3ZZegud7dSIjUSBIWWWr+O/N0GN6yGzo02hTEN
 /brIxOsF1/IxtZ9fPS0Smk/8yACBXWKeIDzWyKon7dKugPy6CpkN6VxPEUQOu6iV7+k0
 eaopuszqhdBmRY8MNpYyY3innNkRjQY34w5x8IBcHVmCCUCVFu27IImc7KbS+aiLV+Oj
 16XAv0lMqrgkXmjvkMOz2U1k5nZZjf+2t8t6hEdNV4fDJo2dA8kGXZhOfyahYYyJm9VH
 2gO8e2gtrb5wscZmA0e8bharEZpnhIdkuS1s/wjq6RsFZxrjS+6DnatefCXaKXJzfKVa
 WChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MfW3tSMzNg4i1sVQnx6Ri1BGJD02W5/7jILfn3srnPM=;
 b=hClOV/Z9rONKMom5neOtRKE3C+CvsRiUFrWtoU15BzaXo2EMVzKE1RvOEMZg4sZVNf
 BpfGg3vJaZ6bSV0Td1cCSuwC1mRuCDC5KsE+mSyAje3W8H9I8+2252F7RP0LzB5dqggW
 whHeGw+QhCtAeEcPhGai9GGhKBD4js/dnNahYBXen/UPGDd2yihMxwpff4PykTutUjHL
 Ix6oH8Dm4bZcvmq04CHTG/5NUSnDOhFlvf9ReX/xoOfnUVHAQ1vw4+hWVpbZoZogDYUJ
 vmb8ULxmJAvmUTlVVmnwAZnS3RfGJjjhsro6SZtL9TDia7rPu8Fc4+dJ8fgEXDpYIlfi
 NQ9w==
X-Gm-Message-State: AOAM530jPv8hhX6S3k7VFOvQbt3CPF9YM6sWsYE5EWNWOl89iw+h4zvX
 F/C2O0co0xbNHJ6O+b4AyqFUti3jufz/drnW
X-Google-Smtp-Source: ABdhPJyB7O/YlauJ1N3A6nPGumlf+RQSMsKLd//EKw8vrWFif++Fe0HjxmGTgrhEjh04QKWco+qifg==
X-Received: by 2002:a17:90b:1996:: with SMTP id
 mv22mr5871769pjb.121.1612403184024; 
 Wed, 03 Feb 2021 17:46:24 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id q132sm3835462pfq.171.2021.02.03.17.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:46:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 39/93] tcg/tci: Remove ifdefs for
 TCG_TARGET_HAS_ext32[us]_i64
Date: Wed,  3 Feb 2021 15:44:15 -1000
Message-Id: <20210204014509.882821-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These operations are always available under different names:
INDEX_op_ext_i32_i64 and INDEX_op_extu_i32_i64, so we remove
no code with the ifdef.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index cdfd9b7af8..1819652c5a 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -796,17 +796,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 continue;
             }
             break;
-#if TCG_TARGET_HAS_ext32s_i64
         case INDEX_op_ext32s_i64:
-#endif
         case INDEX_op_ext_i32_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
             tci_write_reg(regs, t0, (int32_t)t1);
             break;
-#if TCG_TARGET_HAS_ext32u_i64
         case INDEX_op_ext32u_i64:
-#endif
         case INDEX_op_extu_i32_i64:
             t0 = *tb_ptr++;
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


