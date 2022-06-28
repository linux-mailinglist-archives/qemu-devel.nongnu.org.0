Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A80A55BE8E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:58:01 +0200 (CEST)
Received: from localhost ([::1]:43748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64Ea-0000ob-FI
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FE-0002iE-AN
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:36 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:39754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63FB-0008Jf-QJ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:54:36 -0400
Received: by mail-pf1-x42b.google.com with SMTP id p14so10944154pfh.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3TB52VZeYKmQPEU6Mg2AiRo2hCWAnODIZkda7yxBiTA=;
 b=aKzIKpewPKPhdX0XxgkVhILt0Q475E7HjSjknS/5lJINuRoaXgTEhxZJjxbx16Vz51
 i6Wx27Tz6wqbAlJWsX9F91p/pt4kAMyLmt/7EhWq+/QvDPYa/cU3qIEKT1Qv94sWk1p9
 x9CzIk0hTvTcTUWtME4GMECv7enSZtXcZDL8fWRZVxr7oh3fgknBsVvjx6u6BotgQRNs
 /i725pXT5/sJ1tAgm+LVe2gbHCw5XTXeFKYBpdl4WHaOvKqo24lbE1TpxCVdmyCgdAni
 Yio+nHaqMplb17XTQDr7ywReNHZU8BGYuoE4YWrq9XyUA8JpirLunvcPZIpteU1B6pr2
 7eZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3TB52VZeYKmQPEU6Mg2AiRo2hCWAnODIZkda7yxBiTA=;
 b=AeyHxJFV9wxuIbEXDbz0YAk1CLvBoNpqsgCBplCP1J5WZxC10rivud4VeOCVsXFlh2
 qSllTbwedQteEOY1hTvgq3knnbT6p3YsxHO1+l09prvpyFeLlP0YGyvBLgiW1B9al8Xh
 bdoPdXthN3enKgGHKQWEt4DkKczI2H9Jd1AUWvCOjgJoV7w2yFvvOEg/r9hn4JkhUHVZ
 cKDeB/dvAa5wZrHwB1ihiT8v7hPOFQcIE6lRRLpyAMLy/ww6hZIJo8fSaRTxcnunQmlH
 UQsgp8Vue6VDAFmj6W+U4lQWGx0jqvFdmMlyvgEWdQ0A6VmecPuh4ZAk2w25vM6z6D9c
 Dd5w==
X-Gm-Message-State: AJIora+yrspxaM8yxtJ6BQRWz/eBYgk0xQoCE/R2rqXJgwuoW6HuV05D
 sKqMpYHAsL/pvjnuNTzxOWfWpElnwIEuDA==
X-Google-Smtp-Source: AGRyM1uf80a/nSz9jLo9wbnz2AT8sA8qmfg64lEjGvekkHBc4YK+EeTFoCAkhm9bgvMsAhQVeZMuRQ==
X-Received: by 2002:a63:68c4:0:b0:3fb:984f:6779 with SMTP id
 d187-20020a6368c4000000b003fb984f6779mr15789994pgc.444.1656392071894; 
 Mon, 27 Jun 2022 21:54:31 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:54:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 10/60] semihosting: Adjust error checking in common_semi_cb
Date: Tue, 28 Jun 2022 10:23:13 +0530
Message-Id: <20220628045403.508716-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The err parameter is non-zero if and only if an error occured.
Use this instead of ret == -1 for determining if we need to
update the saved errno.

This fixes the errno setting of SYS_ISTTY, which returns 0 on
error, not -1.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 9d1f13ea8b..88d6bdeaf2 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -290,7 +290,7 @@ static target_ulong common_semi_syscall_len;
 
 static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
 {
-    if (ret == (target_ulong)-1) {
+    if (err) {
 #ifdef CONFIG_USER_ONLY
         TaskState *ts = cs->opaque;
         ts->swi_errno = err;
-- 
2.34.1


