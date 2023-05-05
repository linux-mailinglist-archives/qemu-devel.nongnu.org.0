Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77FB6F8ADF
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:26:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vm-0000sO-2D; Fri, 05 May 2023 17:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vW-0000pi-Td
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:18 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vP-0004fn-0y
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:25:18 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-306281edf15so2130124f8f.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321909; x=1685913909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePGQgjAgeqBpbV0KhHIgImg7evASXxc6+J4X6wS7qUw=;
 b=PoJFVQmNC4JODmzmFFJcuuY9BoF2sBO0MY4msxPJWJsLpHwEj8inGAdm3uqcZS0wvD
 pj+MgPjUwr/RrXKD3jweYq2tQngH/8PQtvqeoKCoRco6iEkaescFYjjAZzcYEpQ3oHia
 wOXSLkie7RtM5DvZYACKUR2k/9a7i0FOdSY02hfNECl9+LXTCH4EBeKS4nUqjH85igm7
 Gb/qXJuuw+vKzD5zynNJRWjmcAPFQ8xGf1V/wR8U1dLFutwsBiE9O5upyCwsicLRWan+
 CaaZGhmPBCxQRtMf2BZtsFpX2oEi0E3/FYXyPbF4WgA4Z0YPHbEUfZNb+4ATyM3iJ6rJ
 Cjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321909; x=1685913909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePGQgjAgeqBpbV0KhHIgImg7evASXxc6+J4X6wS7qUw=;
 b=XQK9zSem0kWNglDiUALXQII1h9HSrF874OEQuH8BznyU2U0fbc/dbNUOS9PIQ9jA2Y
 IRPayB6d4fHkoDkO+ulZLRfd3wISIu5gUjpOAVdsyUIzaQGvFZhhSTCu0X7N3NFQTXpp
 HoUVxR89oK3vJuWILZKq/UdqB/CWsu6tsXLFPvIicmwOwWUxxxVdk4Qh8zDi8KmHQCTL
 o5enuHIxTrdvlyN5maJvgQN9PaPdNRj0sxOTVJpZ0fsxcKsB5uR3Wp/qgkr4zX4up+91
 Bd5CkqSVklbjtE/9QcgennWXF8uv2DQ86vBlR3T8S5wBhydyjyjX4ohL2CHDZSSoHHv7
 dl9A==
X-Gm-Message-State: AC+VfDz7lO0QdqTIJIphplRpep5SlqTgLR1tCKa5AzWiZYt+uARt8Zc3
 fx2OkstorShJPp2Gdh4E3fhFKM2Eetjzfo3rPJyA4Q==
X-Google-Smtp-Source: ACHHUZ5BPRQA+pcRxu8KoxXh+7H4tzKb0QoRc3njipk/kngjt7hAV34uWMisV4LsxesmSQY08dGEhg==
X-Received: by 2002:adf:fcc7:0:b0:2fa:36db:8060 with SMTP id
 f7-20020adffcc7000000b002fa36db8060mr2267977wrs.60.1683321909631; 
 Fri, 05 May 2023 14:25:09 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:25:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 37/42] tcg/sparc64: Drop is_64 test from tcg_out_qemu_ld data
 return
Date: Fri,  5 May 2023 22:24:42 +0100
Message-Id: <20230505212447.374546-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In tcg_canonicalize_memop, we remove MO_SIGN from MO_32 operations
with TCG_TYPE_I32.  Thus this is never set.  We already have an
identical test just above which does not include is_64

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 4f477d539c..dbe4bf96b9 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1220,7 +1220,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
     tcg_out_movi(s, TCG_TYPE_I32, TCG_REG_O2, oi);
 
     /* We let the helper sign-extend SB and SW, but leave SL for here.  */
-    if (is_64 && (memop & MO_SSIZE) == MO_SL) {
+    if ((memop & MO_SSIZE) == MO_SL) {
         tcg_out_ext32s(s, data, TCG_REG_O0);
     } else {
         tcg_out_mov(s, TCG_TYPE_REG, data, TCG_REG_O0);
-- 
2.34.1


