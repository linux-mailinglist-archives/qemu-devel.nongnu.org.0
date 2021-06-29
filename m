Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CB3B78BF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:35:04 +0200 (CEST)
Received: from localhost ([::1]:38176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJVf-0003j2-Ro
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwe-0004A4-9f
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:53 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIwP-00031u-Ja
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:58:52 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 in17-20020a17090b4391b0290170ba0ec7fcso2266518pjb.4
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ziCUNw7iMfXxhXUy1AbaM+Ca/hJ3SGJZ/ldvQFuxiE8=;
 b=BrGLnNAb/Jj8veNGBmHqKQ+e/DVuU1bjAm8bnfpeN2r06visn9CZ6OqfrNV3FtJZi0
 xIoRUWHsSPXDl02BD/H1MEPq+0xdvCDiXTiRbFXLARrPo55j+exgbtje4xV9zMiABA7z
 hOG2b5x3W7XTAsppnVFU6d5nCGu8VUo6YshOtZN8ulsFzJjfEBMfukNTUk2gvdYINLau
 qGDK5fryaDTIy4ZJktqRt2YJvos7G4OAul8RzydIA81eG0mc3JMJV4KNTcedOKpusEbZ
 ND7MkszDVgXxfCdY+E44RVADY8VhhreWoTz5vZGSj2qzXEGkPV70bjZknSVlLMzoIbL/
 rQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ziCUNw7iMfXxhXUy1AbaM+Ca/hJ3SGJZ/ldvQFuxiE8=;
 b=OEjuU7b8Iievz7FXkzoCLcCM4/dvPPYrUoIREplY39JBG1Ikw3I/uZTPLQ5eHCEJLA
 Ig5exUsvyWqf4Cg1AZZN955N0WUthW5xXNsHumEEawoM9EjdwP0YSbyZMXZt/CRLH46M
 onL99HM3a3bwfA3HvRfLnNyQQC2Oq0VCGZIRS0OPw95REySXt1vwwyujUlnVOTfQA4qF
 TAL66J26evbYbcRfnQo8Rym38VwYQLqKCYPUXX/9tNeGp2sr35C5YNrbjWJolbm2f7rr
 thjQ9+vRIKzrLT2Cc1HPT/w9DFHe23Vg+Ge6KEVxxB30ADfgV+3rSoGXoq/2rEFSuQTV
 5OuQ==
X-Gm-Message-State: AOAM532ed0TLg3aA8HbElwheIASRzvkVNsVRSVE3uOZMLbk8/cLUfoZa
 PAIGYjxOwgKUskxMJR8F3waybv51+S5ctQ==
X-Google-Smtp-Source: ABdhPJzfCLnKlLDqcAjh18CnMCbQ9m9Goyldg8IpuGu7JXJtku0JBplRAyCale6/DhoXSq/tT0Inzw==
X-Received: by 2002:a17:90a:f290:: with SMTP id
 fs16mr313256pjb.202.1624993115558; 
 Tue, 29 Jun 2021 11:58:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 21sm18002849pfh.103.2021.06.29.11.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:58:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 57/63] target/arm: Improve REVSH
Date: Tue, 29 Jun 2021 11:54:49 -0700
Message-Id: <20210629185455.3131172-58-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new bswap flags can implement the semantics exactly.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 669b0be578..a0c6cfa902 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -354,9 +354,7 @@ void gen_rev16(TCGv_i32 dest, TCGv_i32 var)
 /* Byteswap low halfword and sign extend.  */
 static void gen_revsh(TCGv_i32 dest, TCGv_i32 var)
 {
-    tcg_gen_ext16u_i32(var, var);
-    tcg_gen_bswap16_i32(var, var, TCG_BSWAP_IZ | TCG_BSWAP_OZ);
-    tcg_gen_ext16s_i32(dest, var);
+    tcg_gen_bswap16_i32(var, var, TCG_BSWAP_OS);
 }
 
 /* Dual 16-bit add.  Result placed in t0 and t1 is marked as dead.
-- 
2.25.1


