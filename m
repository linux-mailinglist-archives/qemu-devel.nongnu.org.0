Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C602307170
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 09:29:39 +0100 (CET)
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l52gM-0003Bx-97
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 03:29:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52ax-0006C9-P1
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:03 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l52aw-0005l9-4H
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 03:24:03 -0500
Received: by mail-pj1-x1035.google.com with SMTP id a20so3433313pjs.1
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 00:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PGD2Hxxva1v/CL+/7AMsseVrS1hfbb671q8VvUewR3Q=;
 b=kbJIjotXkUV5lodYVh3kUQBnndyGwOHWb45JU50NIWHBcFtHDsogcgetoYbZhR0maZ
 RUG/qTLIV3Q4A2GTOzLipRDGSMKrWqK1uA0Kkm+5v/86J18mGTv+C0VHRzC//4EfjzV4
 Z3VUanK7HcxGILWwuaanp+JOw5FBJEnnVvzFot+geR0j9oaeRYe51s2gcatFv9wSCnT1
 A2KF8BCkeEDFAMCjbcANPcDIB2BIxqDWi3qzAZKqlRk8beH1sPPS0bHgWLtmKCHI0VVp
 kDhJaAjTSMTKVtOR6/g9dKIK6MvKdXS2Fg5go7EZnlqfwlIu0GTJvvlJnDN1M3sgZ6PE
 ktnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PGD2Hxxva1v/CL+/7AMsseVrS1hfbb671q8VvUewR3Q=;
 b=FRffk5BeoXcFPNMCYdvSZMlUBiqaOkleY3mzJr57Jp/777TlverAX54MGxe45OzAOP
 x4pTqHnmaSLmyym1WpwhFIJwh6LZLrYO8CRi/gQVrbLc77CKwgyrlo1/rdwAqzVH+cfQ
 i28/4EjuUA4BbukGzsd6bFwySEBVLgYZXSqmTL4vcmvclygM/wt3EiGYNrqif2+dmZX1
 xh1nEa2t31coxi3i4xOlrRlETf+coGS65vuwm53BIXdqyKgUu/viTllfoGJD09uFYncx
 JCjC/TtKrmb7ra1tTbPgABp579VQttUFWOb6OkGE3X/RXjDJcRN9x2umhEXMc8cYgatr
 tPNg==
X-Gm-Message-State: AOAM533UH9HF8q4ANaoVt4JsJarz+FVYTR4UVikiZjCRwk8SyVtuWXnL
 0rZxy5XSwQta9/uwdua0+PuqE9HG1dbSowfs
X-Google-Smtp-Source: ABdhPJzOz1vJWK63PD3Bl/LM5GYbgrFAWh7lzOXyOhFMC+k+9NhVtWVnZi85stmOn8kJPtP2WdYXJA==
X-Received: by 2002:a17:90a:7e2:: with SMTP id
 m89mr10098631pjm.2.1611822240837; 
 Thu, 28 Jan 2021 00:24:00 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id s24sm4658292pfd.118.2021.01.28.00.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 00:24:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/23] tcg/tci: Merge INDEX_op_st8_{i32,i64}
Date: Wed, 27 Jan 2021 22:23:24 -1000
Message-Id: <20210128082331.196801-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128082331.196801-1-richard.henderson@linaro.org>
References: <20210128082331.196801-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 233fc0604e..0978a5c554 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -606,6 +606,7 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             tci_write_reg(regs, t0, *(uint32_t *)(t1 + t2));
             break;
         case INDEX_op_st8_i32:
+        case INDEX_op_st8_i64:
             t0 = tci_read_r8(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
             t2 = tci_read_s32(&tb_ptr);
@@ -867,12 +868,6 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
             t2 = tci_read_s32(&tb_ptr);
             tci_write_reg(regs, t0, *(uint64_t *)(t1 + t2));
             break;
-        case INDEX_op_st8_i64:
-            t0 = tci_read_r8(regs, &tb_ptr);
-            t1 = tci_read_r(regs, &tb_ptr);
-            t2 = tci_read_s32(&tb_ptr);
-            *(uint8_t *)(t1 + t2) = t0;
-            break;
         case INDEX_op_st16_i64:
             t0 = tci_read_r16(regs, &tb_ptr);
             t1 = tci_read_r(regs, &tb_ptr);
-- 
2.25.1


