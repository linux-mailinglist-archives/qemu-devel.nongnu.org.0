Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFD66F5145
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:25:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6pG-0007cH-8Q; Wed, 03 May 2023 03:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6oq-0006pC-Qp
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:40 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6ok-0007H9-UH
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:22:29 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f37a36b713so7181955e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098545; x=1685690545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lK51qYTnNnXJZN0e/9Jj4Bv1cCHWx7/0IfdphjJpI60=;
 b=oh2uZrao4qUWQXDvSAzsI8MYUGGfVwb30UHMjoIRPMhmaYLZ25Da7qleJfSwH6sk04
 vPBAlXQHLlV51WcMyFiEGGfTwXMfZHSX7//L7lU/VAUT/tzfOjgc5ZxW87g++nhD0wnV
 TbSXVz9k5MPW/2tOFrGa+Ya4obOePdTHaUlUgUdsC+YMh1LL/msHggH8GnG09JRCSbj7
 PqLGBS5NJRWumvWhQFf5UfbhfE6L8Hm1bQSIKAVo2PFMXgVcwQt3SH8rPID7XNOmnMpg
 WivpDaZfUEMDiT2fjF8y4Qqs9Lr0PyYD5zOvfh7kdOXjg3KN+7CQlgZEAZQekepoCUab
 GapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098545; x=1685690545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lK51qYTnNnXJZN0e/9Jj4Bv1cCHWx7/0IfdphjJpI60=;
 b=NnqQRL32z7PtIUsA+JFMyUgYkgHWAL/dKUV/dMHJVSBdH+ksJBfM5IAAiTOK2fqlzc
 7kE3Vwk0X01kJ/S7wGennnUm9KFs3E/a+rPAIV7aWyiUOVsgApllN3X7PtFASu/SDC4a
 BAMpOTTMhfmR24TDk2U+wwZ9ntisjlLeFBPgdphED7xrSVyNMkH1iW6hvuYYAeXUI72r
 /vx0KlbfmTBROCfvhbR9taGeZCkjF5TZpbR356I/vdfxB9I++d9ZyIUGjlerFdRztzXK
 ZmidLjX5yDi+hJj6AgH6YmWQkEHILZJf3sa7+PSvxU4sgGFoVsIYVoSzWTmkjYBwC7AY
 I2Zw==
X-Gm-Message-State: AC+VfDwQqQHvLmMOGcNO7ay3iTcuaAF34Wl5yGWd6wHUh+yTsfYmWS4P
 9bRn78NAJo1D/c1umvxOn9D2MKHKQLZi4JMK4h5kNg==
X-Google-Smtp-Source: ACHHUZ7gIlYAmehIXerXqBEvEZKmemk6Z3HipFGak4U9H9nWKe/N2KTK5LmT4IKMK7AMxDAk9xtwMg==
X-Received: by 2002:a1c:7502:0:b0:3f2:5028:a558 with SMTP id
 o2-20020a1c7502000000b003f25028a558mr13760327wmc.0.1683098544765; 
 Wed, 03 May 2023 00:22:24 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a7bc3c4000000b003f1745c7df3sm962789wmj.23.2023.05.03.00.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:22:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL v2 02/12] accel/tcg: Uncache the host address for instruction
 fetch when tlb size < 1
Date: Wed,  3 May 2023 08:20:48 +0100
Message-Id: <20230503072221.1746802-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072221.1746802-1-richard.henderson@linaro.org>
References: <20230503072221.1746802-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x330.google.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

When PMP entry overlap part of the page, we'll set the tlb_size to 1, which
will make the address in tlb entry set with TLB_INVALID_MASK, and the next
access will again go through tlb_fill.However, this way will not work in
tb_gen_code() => get_page_addr_code_hostp(): the TLB host address will be
cached, and the following instructions can use this host address directly
which may lead to the bypass of PMP related check.
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1542.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230422130329.23555-6-liweiwei@iscas.ac.cn>
---
 accel/tcg/cputlb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e984a98dc4..efa0cb67c9 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1696,6 +1696,11 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
     if (p == NULL) {
         return -1;
     }
+
+    if (full->lg_page_size < TARGET_PAGE_BITS) {
+        return -1;
+    }
+
     if (hostp) {
         *hostp = p;
     }
-- 
2.34.1


