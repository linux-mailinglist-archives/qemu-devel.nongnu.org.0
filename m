Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1831E049
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 21:29:00 +0100 (CET)
Received: from localhost ([::1]:35732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTRT-00067R-Ge
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 15:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLF-0007oE-Iy
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:33 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTLE-0007G6-1T
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:22:33 -0500
Received: by mail-pj1-x102d.google.com with SMTP id fa16so2147545pjb.1
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xccDHlZG+A/og+PXFW/xFbu9lxlDn8hKgHX6EMXyYhQ=;
 b=YtqmEbw+3CVvTfaofmW8HQBsfLh0yQa2t2aOmlIDcPJr0JyMO33W4x50/dNsQ5FQSn
 KF6fM0dxcflZReutsLTlOTOgAPvqdApiIKe+V0lGEyTPobWBA1tK3R7lb4fc+e882X5L
 tXa6EmC2G+S99ssGhowE/cPXoN/1bkAMmUrGcXLuo8125q9UKdj61PiPc12UM9AyJ9ZH
 SGfpZb9RvH9BT4S8zv8D0SIVFU4KHzRTyAnBd6R2GNiJAMZjRgZ/J6tXtJ6BW7kv4Q3h
 Yk4C6PPI/xd7Zw3juAMIGcQhcEogTUEmTU5LZ3Ps4ZHUdjBa7pSpyVL68y7bfKeD0Wjm
 2KIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xccDHlZG+A/og+PXFW/xFbu9lxlDn8hKgHX6EMXyYhQ=;
 b=G4gOQ9bjxSpPMNlWNM5SXHywlPcYITuvinG/766CLGqCqqG/gVE+Sfs2bV7FmueTn9
 CZmePIPq9vslCf6obkW76HUoKEk+U9vLA291dyoafAjxj0AuPTyVoEfP6AVxLmKksEmm
 WrJV4EB7kIn2RuOLIsV3vzCIi4/oh06Cy5jVd7G2jg4+enxuIbhCV8BR9150wp7Aw+Q/
 sAjpdYIQKnuwVdACktiHnSFRVp+X3vO0xwtjG7lB77W3z6GkJIO3PauQftas9f7fotya
 VlWkZAdqejv+45yeXob0V/3eotToHERNwqYtx/1klTr5y2GpsL/Ch2cTNdwUkPxD4TEv
 TP/g==
X-Gm-Message-State: AOAM530TRgBtRJcl0PMW7y8/bKSt892M2hAL1lv9LNvsOnlQZfXSSMhG
 9sRekz71Cu+qhKY1RrwIZMKbmhryXY7g0w==
X-Google-Smtp-Source: ABdhPJyUIkJJzpe8Z4E/9uHBJsXBaQXvBhMltP7Vev8uPqvRANKaCpIKplXpjujllob40+oXGvTERg==
X-Received: by 2002:a17:90b:1649:: with SMTP id
 il9mr545479pjb.62.1613593350784; 
 Wed, 17 Feb 2021 12:22:30 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id 3sm3001576pjk.26.2021.02.17.12.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:22:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/71] tcg/tci: Remove ifdefs for
 TCG_TARGET_HAS_ext32[us]_i64
Date: Wed, 17 Feb 2021 12:19:39 -0800
Message-Id: <20210217202036.1724901-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
index 73f639d23a..a5ee37eb4e 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -779,17 +779,13 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
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


