Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECA9678DE2
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 03:06:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK8gt-0008UM-6e; Mon, 23 Jan 2023 21:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8gq-0008TD-F7
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:36 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK8go-0003ve-QD
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 21:05:36 -0500
Received: by mail-pl1-x62c.google.com with SMTP id k18so13340827pll.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 18:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OQh7lC/BpzZeduC7Wz+UgP0x9EJv+51vLIbuSepWr2I=;
 b=kBtJ2ItpRJJkRUDywV4tlsaWLuP/huDEXcMyXzz5+CsbyeqdAt/k9vPpYGn2uvC+36
 41U6SmGVnCVQ/qsG+btcAeHYn+U+7o+nFCIeViLrUGXOer2OaM82hVHFPkFc4jKq8jNB
 DvHe3aDR/yl4rOtVi8fKUE26ba1Dniej0kqTIfNXJkcO66rabogZY9P8NNpmEVMK+Hzb
 xQWiMTBWQcNQ7+3j5L8SFvWJVDzqFma34ZmAIpET7xGvRGjnJA8OVvZdip9048Z2BigK
 9RM3AydG5tmA8RRDozHakig3P9NmZLM9kPEAR9kdoY631HAEbPtAjgThJTB2I4Ve/v77
 RDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OQh7lC/BpzZeduC7Wz+UgP0x9EJv+51vLIbuSepWr2I=;
 b=PfPvOS1SINYlV9d6W3BBnMJNtPDC2EDDjNYvR1w/FcPBdwdnBQm3B2LgVyFCAwMDge
 D3q2wRSuvMnglWWEffyi7sA19/y/MZpbP+s3i2e9dWBL5HANGpXmUW1Ax2srwdfpIOJ8
 80yrujn7xHBlZH13BtfM409vTrVV48kyrF2c5+gUZ9r4YzVDa7biV5y0tlYc8J4umqbm
 niRQOc7sLR4L1jZxUR4eiwoVjhMeFaO2LcmAleCy6XidcT6OEwJKqn6gFW5unIgp0bxb
 +Zf93NvKh0HwrgPqH7PGduAOCSBOxil01DzwENiSIRs0he6Da98e57Tjwn6jeyVrQDcZ
 sLug==
X-Gm-Message-State: AO0yUKWFAsyn8+O5T8bXgz2camkKTQLZYdUuC9SvugsZKZH0nZ+wxWLt
 hvdSQ++vWMnAcLxl7TvNOBlvO3LV/7Qh0+98
X-Google-Smtp-Source: AK7set8GPsV8j2zfbTkNUd6z+3/lQsuBpZYzaQw/WaVDWibL9SUUl0fnOM5mrU5jZOBF/ZlrhgA+9A==
X-Received: by 2002:a17:90a:46:b0:22b:ecbc:8113 with SMTP id
 6-20020a17090a004600b0022becbc8113mr863864pjb.12.1674525934072; 
 Mon, 23 Jan 2023 18:05:34 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 fh3-20020a17090b034300b00228e56d375asm283936pjb.33.2023.01.23.18.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 18:05:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 14/15] tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
Date: Mon, 23 Jan 2023 16:05:06 -1000
Message-Id: <20230124020507.3732200-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124020507.3732200-1-richard.henderson@linaro.org>
References: <20230124020507.3732200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Take the w^x split into account when computing the
pc-relative distance to an absolute pointer.

Reviewed-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index 29d75c80eb..d6926bdb83 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -702,7 +702,7 @@ static void tcg_out_ldst(TCGContext *s, LoongArchInsn opc, TCGReg data,
     intptr_t imm12 = sextreg(offset, 0, 12);
 
     if (offset != imm12) {
-        intptr_t diff = offset - (uintptr_t)s->code_ptr;
+        intptr_t diff = tcg_pcrel_diff(s, (void *)offset);
 
         if (addr == TCG_REG_ZERO && diff == (int32_t)diff) {
             imm12 = sextreg(diff, 0, 12);
-- 
2.34.1


