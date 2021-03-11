Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 738C1336890
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 01:26:46 +0100 (CET)
Received: from localhost ([::1]:35648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK9A5-0001JD-FQ
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 19:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95m-0004kb-0p
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:22 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:42036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lK95f-0001LF-N0
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 19:22:14 -0500
Received: by mail-oi1-x22b.google.com with SMTP id x135so16751080oia.9
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 16:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gYenkpP8ctTtsYsLcAkytH/ttOLIsxpHVMJ4BoHnX1c=;
 b=N2oZjyCK0TMr06TruYcD6TK9JHDHd/fj1XmNVdezWfp3DZRRUuV6QVSjj5NuXgxUgH
 ftE+OJibKCSWZvt0fPqkbBTnp+zUU/qzg90zsgbb+mMcvb0ibySIFQUgP9DPjQGZ75ZU
 KS6JDSPqJBkCewPU0g1KLYuwk9tdru8T4Usiu6jRpI5WhllehO11fgGzG+inUMEDAYUv
 D8ZpyyId0QLsMo7MHuCr5getFgHwxW8HnK4D4JNQ67+A+rm94xGR7lqAowVX2EcD0s9+
 o140J4Xu7LahRW8+lLyCAw/IggRwgQraIRwdmknZjkeibJgPD0PZJpbT2NyshXQNMd5z
 aS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gYenkpP8ctTtsYsLcAkytH/ttOLIsxpHVMJ4BoHnX1c=;
 b=l2EwsDVLX6HDDci5DF5wcouHzAAU3EHqLs1i4e0E3D5f6dliSYD9dWgwP2uxanCUyy
 +gc8BkI4Ey01bLMECOe40doPhd/gKQ9gsCW9BxUqpy0Use9inr829aKmzKk3VxfInj8J
 vKyRkSBCuPzB94VrotVrmYej/t2NJg/sCoDDSCJk1/2bGNYKA8v1Obvp1t/j9YnoJl+y
 R2n8Bx0vjz+EYmMk/tdRQzUbHpwGX4CKSJws9/E67l+stXbD6bZlGYJ8ew1p/U9vxUXK
 MEQvggCkU0lkCAC7bzjWwlYRHqGl9kfZj2WMIVoXOr9vz4a92TS3sZgjEI3WpFRrTZBM
 gaew==
X-Gm-Message-State: AOAM531akq2nYzsOP79nd8gZbpfNx9qWJWLIt+fa/HyjMjVbA8eX/HvW
 Pp7hPFOUsU/OKoN9AixOJGaB5ERSzzZqFnHo
X-Google-Smtp-Source: ABdhPJwuUg7Yo314xlxZG0j97nNAPxc+bmkU0VdDleCViaRjsl1BIPFka/z3FcGBgN3pNg59K/9wAA==
X-Received: by 2002:aca:ded7:: with SMTP id v206mr4244317oig.149.1615422130720; 
 Wed, 10 Mar 2021 16:22:10 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a6sm300962otq.79.2021.03.10.16.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 16:22:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/26] accel/tcg: Inline cpu_gen_init
Date: Wed, 10 Mar 2021 18:21:39 -0600
Message-Id: <20210311002156.253711-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311002156.253711-1-richard.henderson@linaro.org>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: r.bolshakov@yadro.com, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It consists of one function call and has only one caller.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b9057567f4..6d3184e7da 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -245,11 +245,6 @@ static void page_table_config_init(void)
     assert(v_l2_levels >= 0);
 }
 
-static void cpu_gen_init(void)
-{
-    tcg_context_init(&tcg_init_ctx);
-}
-
 /* Encode VAL as a signed leb128 sequence at P.
    Return P incremented past the encoded value.  */
 static uint8_t *encode_sleb128(uint8_t *p, target_long val)
@@ -1331,7 +1326,7 @@ void tcg_exec_init(unsigned long tb_size, int splitwx)
     bool ok;
 
     tcg_allowed = true;
-    cpu_gen_init();
+    tcg_context_init(&tcg_init_ctx);
     page_init();
     tb_htable_init();
 
-- 
2.25.1


