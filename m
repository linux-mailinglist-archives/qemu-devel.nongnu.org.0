Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5A067C3E7
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:41:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2x-0000WC-Cb; Wed, 25 Jan 2023 23:39:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2p-0000PI-1b
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:27 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2j-0004X4-Rp
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:39:23 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so5123058pjq.1
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ukwtjg9oIq7luK67vm6BnI743dBnzE6yf3C88tqi0lc=;
 b=O6uTIMBrP1eBuoMbTiV34z9pWKwJS8WeyOvvJCj8HO6jvxj8aPKrLeoieCr+aWfNUC
 kX1eU/PAlR6Y5S0NJaEufFEvwTpTSl/Lhnl2WmsQT9iDY7srxOc4GIxihwaGuGTXgkAt
 7FG0kxjgocS9rifg1Q+wHvOpYWv1QEDYB4Rk+J2W8aL5kx73CxzSWH6Y8XWSC14gR/MD
 me0SfDlsKi09vgQuQhmr3KJQvTMwqKwzo3GQe2YXvTW+LXSnPDDEu9s0k9kR9MoqfzVK
 xSW5s1huqBDQaqnVaItlYe7rPb0Tjjz6XmzeJ8ebFlO3nwI74c3QrOwVdXMiHnKvBT52
 8RAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ukwtjg9oIq7luK67vm6BnI743dBnzE6yf3C88tqi0lc=;
 b=grGg7B8tbeGm16d/BFGFO8STOrp+ya3831Pt2h4tE6HJ/xJfwU/82iIUSPvumrAZYa
 i9bgpC+Xy99DBg+iLAnCdwbo3mt1cdWxTL/DstHOVUKmc3ReXEp5GHAEuLquUpKCQedC
 l9NulSy5YafMt9bXLVfb53qR7MMRQtZJ8WeKZ9z54ymx5Nx7l3K+rxE1sr1Pc1uxZSTM
 M/d1ouVqWP38glae+ylI0sm2uoRPBAibeEhiiZ+Yx3leM3C68h0UfPIGyBzj5sXeqHnI
 EfJ6oKSnkYTShUq5WUa79Js7RMgo5hW93+gpzVs2dWR0nTygZLZuGxzaPQkhgjzUcPhC
 YEyg==
X-Gm-Message-State: AO0yUKXrcVSP32gT4k0Ske8qnGINzpCi/njFkuw/y9fGMmNtwg1fRn7E
 KOfuLf9Y0IQtxMtS2UrwjnUV8l38JQIFI1gWm68=
X-Google-Smtp-Source: AK7set+hMY2KbTRJGjNyUc7yo5UJFA/UTbFjvZXZjvzHwDg02UCV5mU6HdzDTw6vnXsZNpoVuYH3Uw==
X-Received: by 2002:a17:90b:3b51:b0:22b:f24d:e83a with SMTP id
 ot17-20020a17090b3b5100b0022bf24de83amr825217pjb.12.1674707960634; 
 Wed, 25 Jan 2023 20:39:20 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:39:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v5 33/36] target/s390x: Implement CC_OP_NZ in gen_op_calc_cc
Date: Wed, 25 Jan 2023 18:38:21 -1000
Message-Id: <20230126043824.54819-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

This case is trivial to implement inline.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
Cc: David Hildenbrand <david@redhat.com>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
---
 target/s390x/tcg/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 0dafa27dab..b8cb21c395 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -625,6 +625,9 @@ static void gen_op_calc_cc(DisasContext *s)
         /* env->cc_op already is the cc value */
         break;
     case CC_OP_NZ:
+        tcg_gen_setcondi_i64(TCG_COND_NE, cc_dst, cc_dst, 0);
+        tcg_gen_extrl_i64_i32(cc_op, cc_dst);
+        break;
     case CC_OP_ABS_64:
     case CC_OP_NABS_64:
     case CC_OP_ABS_32:
-- 
2.34.1


