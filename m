Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4333375F3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:42:52 +0100 (CET)
Received: from localhost ([::1]:44714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMWZ-0004ty-Aw
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTs-0002zW-SP
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:04 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:43906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMTr-00069J-4j
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:04 -0500
Received: by mail-qk1-x735.google.com with SMTP id b130so20745639qkc.10
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gdsri8NtLGIq10NLJyptLqzIl0zCgbJ5tQAy5aBqD2o=;
 b=zEQ/ApxMVC6i5ceftR5Lfwc4QvOVIhDxNlMRPhESeQVBc2u+E7jJdgGC3zN76rIGbK
 eHCKiiCW3IvgbYZ6FqP1qyJ8GQdZlhYQ2qsXthYvxQnsN9BRi3blCn5XzeVI3TM9rW/0
 LpCkoewhl39CFSpcoj1pODctQD7MYTSQIDFM1oA2Mr4MXAKkd1KM8gAotjps5Qju3mIO
 ZAmHzZ+cKPvr9qQaV8tGmZwizDmO+Zc/3UdZ8ImvEpBSm8mJgW/CWmEQXi3FGNX5ramX
 dP9JX5FyudJkOhXOC1HPjRo9RPZtDrdNfGs8supTmW9lWuS2k605/zfJ86TuTXQWUcwQ
 GmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gdsri8NtLGIq10NLJyptLqzIl0zCgbJ5tQAy5aBqD2o=;
 b=e5k/gBOvgbzCVxGcXJnn+fRWFmWjvSBhpuFC3G7CjbxNAqkgXMkvOyNCSwSEjBh6WI
 x725d1VFY4ItBLQifUXxQxXoZHs/nk3idSh7rG+Ue6/U0PKA+gONQU3Rqkn/Ee8Aompv
 Dop8ugvENxB4TfDYVL8NZGsWs9XH7+xcs/bPGVsu0yjcG2+ZQpOR8IqpovGGFpk2J7Oh
 VdCVyAgfPdJGNbI1P+uSjoq7rSDVjqW6vBqcY/EK04EmTPXg5YZ+wRcwzgr2AkCxdT6k
 pB68yT3QhAHEW50Kj3gIET1TazVEY3Gn9myL9ntAazHvocU1v37wFovDXeU35TS1ySlI
 O00w==
X-Gm-Message-State: AOAM5318EGivNR39N6FwHYvfBiXnRB4cxbq6JwgZX1IXcMhSRMuxAg0R
 jCfW1DVZtV8Jt8oEni3ZIxUSHo5TAmhsMlQA
X-Google-Smtp-Source: ABdhPJx7s3E0gaWeUlB1sqAkDKLO1O9E6fjGm+k9/IWzzthdBeMi5x/dUVRZ2tcuu8/iocGFYRWcNg==
X-Received: by 2002:a37:4d86:: with SMTP id a128mr7743491qkb.115.1615473602205; 
 Thu, 11 Mar 2021 06:40:02 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/57] tcg/tci: Remove ifdefs for
 TCG_TARGET_HAS_ext32[us]_i64
Date: Thu, 11 Mar 2021 08:39:02 -0600
Message-Id: <20210311143958.562625-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
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
index 3ccd30c39c..6a0bdf028b 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -774,17 +774,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


