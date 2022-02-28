Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422644C7751
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:14:15 +0100 (CET)
Received: from localhost ([::1]:53846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkXG-00045m-BV
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:14:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkSf-00051f-Hb
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:09:29 -0500
Received: from [2607:f8b0:4864:20::102a] (port=55835
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOkSd-0005xb-3f
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:09:29 -0500
Received: by mail-pj1-x102a.google.com with SMTP id gb21so11844438pjb.5
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iaKreptzWVFs7oP+uIr5THCG4Jhde8CcYeoZWHUObC4=;
 b=XY4nLN0NWK0J7bs0dTCcpH6Fd7WReCg8Y+uj8cdJ863pI37hQLA7RAi2w1vRdbpzmR
 fMHl8IeEFTctY34xpLzTsk2etEaK+OhTVF5eGJE7xK7aJJDAQ4OpJN/gbxb1TbBOQfIj
 tN3qP5O6nSyckgdaodhw49JPJC4oUGNZZiU3wZGWw6UIu5RUVfV4YEGaU/M604u1hUfz
 pBPxunje8RD69SrhVRNrk2IDuGESJDiFD/dAkkvHTyTZferpKhULxDJeHtnyPXAuexBr
 6zoB1aVbzDqqWd7gfpPEQy0AriwA2zIqS5DF1vUitH7fP3Up5BchwL9HI5h6mYyUmro1
 /S+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iaKreptzWVFs7oP+uIr5THCG4Jhde8CcYeoZWHUObC4=;
 b=vz7M9LBh4cukGSNkpG+rfwFfzEb376LpEkghK9yQ2vQSQiGR81lcOSg5vVC2vwRelB
 hv3Jn2+Op9RCsrHPjhMwUnidr+YCOWj2I4KudxuhNve1jdmx5stQcRGbx78TCsttWnRd
 uD/cU9RhIBW/YJE1fv352GXQtYgw+UjqsEVPwnLzY3Mp5xWDjQYQyp1PPQgkBtNP3jlG
 FTu8y01GgKLupWChblfnRlZDKeqKZON0h1KD0ezg6rrjRhuL/Y5xjoMFmj4+Uf+PEYBP
 Gpu/RKXJCLPPP34UJnorAfzLtIjoMv/tKxtNZc7y9zFURoRp8X9JYp+eFm93QZVuoX3w
 x1RA==
X-Gm-Message-State: AOAM531oSIOW4egvYrPqSxlTskfCiCWYcjihWPH7lEIZEeOzf5Rl0cLR
 gOGuVjLbidPrdDs5Nw1OQuAdOHERa436uA==
X-Google-Smtp-Source: ABdhPJzxtLGujpWJgBrI9uGCFb0gM2at2QOkZ6OHCDvTe/e/ofhxEshMpKpyEG7oHQKVqWmo7PyR9w==
X-Received: by 2002:a17:902:ce05:b0:14f:8ba2:2339 with SMTP id
 k5-20020a170902ce0500b0014f8ba22339mr21973521plg.152.1646071765653; 
 Mon, 28 Feb 2022 10:09:25 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-483f-d486-138f-7868.res6.spectrum.com.
 [2603:800c:1201:c600:483f:d486:138f:7868])
 by smtp.gmail.com with ESMTPSA id
 q24-20020aa79618000000b004e0e89985eesm13463223pfg.156.2022.02.28.10.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:09:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] tcg/tci: Use tcg_out_ldst in tcg_out_st
Date: Mon, 28 Feb 2022 08:09:18 -1000
Message-Id: <20220228180918.38188-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228180918.38188-1-richard.henderson@linaro.org>
References: <20220228180918.38188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tcg_out_ldst helper will handle out-of-range offsets.
We haven't actually encountered any, since we haven't run
across the assert within tcg_out_op_rrs, but an out-of-range
offset would not be impossible in future.

Fixes: 65089889183 ("tcg/tci: Change encoding to uint32_t units")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 0cb16aaa81..9ff1fa0832 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -790,14 +790,13 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
 static void tcg_out_st(TCGContext *s, TCGType type, TCGReg val, TCGReg base,
                        intptr_t offset)
 {
-    stack_bounds_check(base, offset);
     switch (type) {
     case TCG_TYPE_I32:
-        tcg_out_op_rrs(s, INDEX_op_st_i32, val, base, offset);
+        tcg_out_ldst(s, INDEX_op_st_i32, val, base, offset);
         break;
 #if TCG_TARGET_REG_BITS == 64
     case TCG_TYPE_I64:
-        tcg_out_op_rrs(s, INDEX_op_st_i64, val, base, offset);
+        tcg_out_ldst(s, INDEX_op_st_i64, val, base, offset);
         break;
 #endif
     default:
-- 
2.25.1


