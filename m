Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333D66A1164
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 21:45:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVIRb-0002nl-74; Thu, 23 Feb 2023 15:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRZ-0002mo-DW
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:43:57 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVIRX-0007Qw-PL
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 15:43:57 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 il18-20020a17090b165200b0023127b2d602so569464pjb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 12:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1INiv+c7X4ecZzReDySXjMWltTGp1DftJNOlKz8t3fU=;
 b=Ud/t8ow4GQj/uSb8gvLZAv5jJV1mOrVkIVsK8xaGEaIlRHxKMYvw7p4jL1/yZ4Kak9
 BITcFUi8U7PIrHn+lG+sPrs8GN9zABh97HTxlslCKUvWcA5OuRU+53FHCFmbD2SSM5kf
 SRT+hS+CoXDA3bNefLv2UFldXcQdvxcN5ZfIbavgF7st7PySfROvZCIseDEpLFo6oQF4
 H+SguAYlxIxK4qNpgPZQhwd9lLfntdzWc4twrP92qYp0BsVDB23tXAc7Q+dgV0NgGHTs
 9ukSAFRM+f72dhbaklI1y7g1c5+50/uZFo3OCeJBa12oeexqmQRqh2va2GXWdU/Extyn
 UBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1INiv+c7X4ecZzReDySXjMWltTGp1DftJNOlKz8t3fU=;
 b=D+CJ/Ux/+Uw2EPHh+Jx/02ZwfSmuHNZu2vISHhPZejy3qX38A4+KkAyQPNfn8c2ysv
 Hl5JKzw3EyDRBbdpQb38JIqQRJeppGenMrbo6FrPiPivi4Ya4Q35UIRAvC6EsAPTAOtg
 yJ04RQG4jJCBWOoL9InYDgnsWj+LZ3giWzd9xaa8SlkZ30uNns4fd19J9t/JqkjlGu+r
 ZBRpDYJJV1PcSmGmkUPv+gp/1jHTImPuT1I44FNsO34GS0nfg38wIMjUjnKkHc6HK8EL
 JsQKzJEcyV0Cf++pEtI76lauZxC/pfPkq2LessOn3ZM26jFEA/1VvnsOF812ZjW3LJ6o
 Nl/A==
X-Gm-Message-State: AO0yUKVeovgB7KhW4En0WWjwMZZLgQAvkiHFd/1fJ3Cxj/FIstY7qT5p
 M6vuHbhRrYtO7Bhbbr7T3s8x6DUa7A2BQFqPr/M=
X-Google-Smtp-Source: AK7set/+hNJMnBBE9MFxzB7K+Znf3NkQTXMuighcKJb7pBGkvL9/HTljxlwi3lHPhyfNBwZq8N8/NQ==
X-Received: by 2002:a05:6a20:3d8b:b0:c7:4c1a:3e43 with SMTP id
 s11-20020a056a203d8b00b000c74c1a3e43mr10711126pzi.26.1677185034268; 
 Thu, 23 Feb 2023 12:43:54 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 e187-20020a6369c4000000b004b1fef0bf16sm5992850pgc.73.2023.02.23.12.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 12:43:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/13] accel/tcg: Honor TLB_DISCARD_WRITE in atomic_mmu_lookup
Date: Thu, 23 Feb 2023 10:43:33 -1000
Message-Id: <20230223204342.1093632-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223204342.1093632-1-richard.henderson@linaro.org>
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Using an atomic write or read-write insn on ROM is basically
a happens-never case.  Handle it via stop-the-world, which
will generate non-atomic serial code, where we can correctly
ignore the write while producing the correct read result.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e9848b3ab6..74ad8e0876 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1974,7 +1974,7 @@ static void *atomic_mmu_lookup(CPUArchState *env, target_ulong addr,
     }
 
     /* Notice an IO access or a needs-MMU-lookup access */
-    if (unlikely(tlb_addr & TLB_MMIO)) {
+    if (unlikely(tlb_addr & (TLB_MMIO | TLB_DISCARD_WRITE))) {
         /* There's really nothing that can be done to
            support this apart from stop-the-world.  */
         goto stop_the_world;
-- 
2.34.1


