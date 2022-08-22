Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795BA59C4F7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 19:26:22 +0200 (CEST)
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQBBt-00072Y-Iq
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 13:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ol-0004gS-EA
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:34 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:36442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Og-0001co-Ev
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 11:31:30 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 r14-20020a17090a4dce00b001faa76931beso14355830pjl.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 08:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mlHd+wwiv8pBaZCez3yDRMnKt1mN27booBhwkoA66eA=;
 b=EL0IBj80XfawSZQ7+1JraUZ4oAKZlwgsFbjXEzE4aBarpo9aqP0BUSKUbMiwo86Izz
 zYPo0TWIxtZAVVFycN7J7ujFIY4fknLTMMKLrmT92Ih3BAgBKfGa48rInmttqJjTqJGg
 wS/wohjiv4V1H9FIjG6xEJy4cdrUV+JspjRUTdXsxmc1woL6QC2QbmikW1BVdsnnfFgS
 eQFfbYOcsWbxy7ljUySXVf9dLIJzrM+8dPguqEG9u3tDrL8EVUldNWc6n80FohbIFfwM
 xFyUtWQvi2k++L5JUSWli5/UtFP4saUQ1SVkN7eI9ARqhKMlDnK0vnuJeA8XMfxrmz9n
 yCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mlHd+wwiv8pBaZCez3yDRMnKt1mN27booBhwkoA66eA=;
 b=T0lPjnOF8wQHGIpTBYvfkCLV7HnRHWDV2Q9NSbjlrlqelc/pNg7SzjQvW+mvvtARac
 OfHpSwANuuMmZY/eP8xX0wlU5RuYVn56MPSsDqK0KDer2Q5b9xPsh8jK1DdU0V6EteDk
 e22thTl2XB1FcQl0ziB6xHm/J8qAGW1MD7dDuaVhaj9Yd61A516MSarczi1Rrb5sk+6T
 CUP+3BPE2m3skOPH78UN3wBI4xek6m2aGXX5YhoeaQJgEsams0uvTtzG9Z9bkdHDsyYe
 fQzYjzDDio1UudP4xppmp5exxN1QNHlvA6Tsc8IYcpzLYtIEODnUfCiFC77Fp3QNmZP1
 8Caw==
X-Gm-Message-State: ACgBeo3dOPF3wP5MoP7eLLHgr+FEwiJKmbPf7/QJApQvRtaDDo61xEnT
 45BryYWv8Cwx4Lqcq3uvp7sowlo5E3TbXw==
X-Google-Smtp-Source: AA6agR735+xWBDGFW7Rqj+OSidpuFz/awuGmbmucmHnWmbKsQjl+1e0BSGIE1rn3XTv2Ld7nxY34wg==
X-Received: by 2002:a17:902:e809:b0:172:eded:e879 with SMTP id
 u9-20020a170902e80900b00172edede879mr4863328plg.54.1661182285051; 
 Mon, 22 Aug 2022 08:31:25 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 47/66] include/exec: Remove target_tlb_bitN from MemTxAttrs
Date: Mon, 22 Aug 2022 08:27:22 -0700
Message-Id: <20220822152741.1617527-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

We have now moved all uses to PageEntryExtra.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..1bd7b6c5ca 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -47,16 +47,6 @@ typedef struct MemTxAttrs {
     unsigned int requester_id:16;
     /* Invert endianness for this page */
     unsigned int byte_swap:1;
-    /*
-     * The following are target-specific page-table bits.  These are not
-     * related to actual memory transactions at all.  However, this structure
-     * is part of the tlb_fill interface, cached in the cputlb structure,
-     * and has unused bits.  These fields will be read by target-specific
-     * helpers using env->iotlb[mmu_idx][tlb_index()].attrs.target_tlb_bitN.
-     */
-    unsigned int target_tlb_bit0 : 1;
-    unsigned int target_tlb_bit1 : 1;
-    unsigned int target_tlb_bit2 : 1;
 } MemTxAttrs;
 
 /* Bus masters which don't specify any attributes will get this,
-- 
2.34.1


