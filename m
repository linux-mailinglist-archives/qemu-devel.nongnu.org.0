Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795D96266E0
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 05:26:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oti5q-0004zI-4k; Fri, 11 Nov 2022 23:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oti5m-0004z2-AS
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 23:26:06 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oti5i-00080r-PT
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 23:26:05 -0500
Received: by mail-pf1-x42e.google.com with SMTP id m6so6526094pfb.0
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 20:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EwtCFO19ZBhHavGSSjEACcNFIqLsY87dxQ9PhcSTieM=;
 b=Zj79tZ4hgBHWnM5WBgN9kvTZFp8KVhOn6vbp3MalDCaVpOQcRZ27DFXHkTOy4aElPE
 DBCBblBQB6loX9aY7a5QK3rtTiy/HmqFaieYilpGSFo8Ri4aV1dSRCKP+26SW2jNYFF+
 e8+tmZo+Xko6SOHGnqnQnzbY7g2oolm2TxbpIVj6jmDoLe0F28fV1kDtH+MWReZ2WXqi
 KdSFec04cYbMmPpUseTb/0dqvMwKTq6j8gSeUPKJe2I8whq9Tk0K8+LmaT28sVWF34/N
 AnRsnxSGCYrZNTzZxF+QpctjuH6jSn+XvFcnqtglPBvJSK0JlchISDoS70iKUfR/so7n
 VgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EwtCFO19ZBhHavGSSjEACcNFIqLsY87dxQ9PhcSTieM=;
 b=dNascmEyOXE3W7zpBFnZbjH6hoNQ/XbxgsKmVL3KzPfVb9t9MiZLPW4V+SCA9y/Ue8
 AYWMxcdrVBWfR2qGyMxDpCRc1BTpup9qpwNQj1RKXhH1XVls/73hWzVl6yvKFXMN12Qc
 UfFjPGTKa8LWedNEwoJynvU8sI1J3HV3LAuRWbAtfjvugXW4DAILBqxGZA0LD4CTfCil
 D+wg89GgQpfZ+4yIo3h6FyghRUDg6SA+iOIQWlbtE2FtlAb6YxzLylggGoWpOVY5n+RA
 l2MvKqXrm0BAeYm6O0Yep7CA3iCcKmN4yhETzYfKRvYXYxLRlajrSBjxaMBHXihhnfWv
 PCRA==
X-Gm-Message-State: ANoB5pnftDlzxC8P26hepZ+rh8r6/qOOAXvT7u4C3tYQOoQ02yBDRclZ
 rgPoHA5LuO/RYxfB8fEVTog7T3RkzVJKPUGv
X-Google-Smtp-Source: AA0mqf50ZcatWdEHYh4Y3IYt83qK+0CCETdGh4ByOLOC8b/Q/nbNcs5f1D83LqcfDrg/PT8usu6ZcA==
X-Received: by 2002:aa7:84d2:0:b0:56c:3fbb:7eb1 with SMTP id
 x18-20020aa784d2000000b0056c3fbb7eb1mr5695375pfn.7.1668227161151; 
 Fri, 11 Nov 2022 20:26:01 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a170902784600b001869ba04c83sm2522003pln.245.2022.11.11.20.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 20:26:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH for-8.0 0/2] target/arm: Use tcg_gen_atomic_cmpxchg_i128
Date: Sat, 12 Nov 2022 14:25:53 +1000
Message-Id: <20221112042555.2622152-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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

Use the new common function and avoid rolling our own helper(s).

r~

Based-on: 20221111074101.2069454-1-richard.henderson@linaro.org
("tcg: Support for Int128 with helpers")


Richard Henderson (2):
  target/arm: Use tcg_gen_atomic_cmpxchg_i128 for STXP
  target/arm: Use tcg_gen_atomic_cmpxchg_i128 for CASP

 target/arm/helper-a64.h    |   8 --
 target/arm/helper-a64.c    | 147 -------------------------------------
 target/arm/translate-a64.c | 121 +++++++++++++-----------------
 3 files changed, 53 insertions(+), 223 deletions(-)

-- 
2.34.1


