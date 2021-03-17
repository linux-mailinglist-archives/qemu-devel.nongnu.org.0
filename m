Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA233F497
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:52:11 +0100 (CET)
Received: from localhost ([::1]:41856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYSw-0004m0-L1
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:52:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCC-0004ws-6N
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:34:54 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:35786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYC8-000740-GO
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:34:50 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 v24-20020a9d69d80000b02901b9aec33371so2173271oto.2
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QftnUci9yl2tdGuAjLKAsqWS6tnyLkghXArP9adcKcM=;
 b=oWhUA+GP6mq0YVf9cUigSurX/ccWlrdgxolQiezEK+Pv1qibsW833drhbuZ+fo5rLm
 ZsOT3S/9xA4XHgbs+XVm/n6BxoSkdRsX1XiWHnuniaene0WAikqBfJe2Guqxb8Sfw+7X
 Z0JoWcYOYcfarS38Iuew18lHX8cCvuPPHDvYK6Wojopu+DKYW9DSVuA4jiSPd0sUBGyc
 aKDhH9dLA1ls45RHhIYYKR/bRWSxfEOEhXOj7EUIvxq4Kw7F6U0TB2u1GhFiyDe1/RU2
 /540vC9RPi/KJJc4ggYMFahx8ZeiNobdTJaLyF7jFSyfvyHELq9HPJIMgVPwnEspnpl3
 r5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QftnUci9yl2tdGuAjLKAsqWS6tnyLkghXArP9adcKcM=;
 b=X/YV5xJd0xfIAN9+a4ex79haeecpOPoCHVHxjuuXd6+VzDV5KGJTIZW2uZ3/gaXIEC
 ml1SMbSV77FphzgfYWlddmhsVo7TvqlhLYqTckV0CUdPLT3hNGVvb2DPp7HuZhsTqu5g
 656dmPU0S8XYEQ38rdEOBG4WFv/jeVOc21e11MuJhJUCIWIP0fQmcJiQ8UExfy+xbTn+
 74aLIbN21WXc57tZ8XZU3LzasQYkyAQqagN5r1eoNQPNAMXMWo0H3BgOjbGn6fjclDHW
 fEAXDwX0QNHeJGocIzsHQMFFDyVxluf0ZyWSJV3FvUyssBOSlvWE1mDpRa31l9px0fec
 W3AQ==
X-Gm-Message-State: AOAM531o4L9ly5NMH3tUm/U8OJAIEU+Q0ofhGOsQJTJItfqT7+tPfgBD
 sV5d7tRD4Bkkh/BK3ZTFxbPViHUXk5qbKfNl
X-Google-Smtp-Source: ABdhPJyM6XI0KG80ZM4EqwCkVONOpgJR5dxllyiNKHTMk58bNdp2E9TJt3jC68syU8QZWeznH5U+bg==
X-Received: by 2002:a9d:6305:: with SMTP id q5mr3682009otk.10.1615995287036;
 Wed, 17 Mar 2021 08:34:47 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:34:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/38] tcg/tci: Remove ifdefs for TCG_TARGET_HAS_ext32[us]_i64
Date: Wed, 17 Mar 2021 09:34:07 -0600
Message-Id: <20210317153444.310566-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
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
Cc: peter.maydell@linaro.org, Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These operations are always available under different names:
INDEX_op_ext_i32_i64 and INDEX_op_extu_i32_i64, so we remove
no code with the ifdef.

Reviewed-by: Stefan Weil <sw@weilnetz.de>
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


