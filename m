Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AED6F4E4A44
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 02:01:34 +0100 (CET)
Received: from localhost ([::1]:43430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWpNV-0001Ox-6S
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 21:01:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWpKo-0007qG-7x
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:58:46 -0400
Received: from [2607:f8b0:4864:20::62e] (port=37413
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWpKl-0001U2-Lj
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:58:45 -0400
Received: by mail-pl1-x62e.google.com with SMTP id e5so147738pls.4
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 17:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=psUT9PP67BXC/jcNLauF9QNYPP3mG8Y0II9HnOXSZC4=;
 b=b5MdNggYoNQvM/s16a4xwegHOsE2WdaHAr9d7FqxWAefFg+Vzi3DLBby2i+zK10oou
 hL+oM7l1vg1sPn8i/+Vaw62SJ2w5XSZcUQQAS+/+5bMuK7RJjlwYl7LW8zDe2KK+/prW
 oAE1HSEcFL3ueYhmNxx8D/mBovE5+qOl70UTYChkTxs8McEjD727m7Lq2iKzo7If8P5A
 681vAvRwT3qYhJKRKkq+it1TG6fU8YWYnq4jiOn7Tc+N2KcdhdvzPs1tnUqU7LRR5xyL
 oVMxxcGXuNxq6DGknOzQPBtXt+WoC7XSWkqGQiydlxB+nbbM3ipDY0QZbUVp8eqNu5LO
 1OpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=psUT9PP67BXC/jcNLauF9QNYPP3mG8Y0II9HnOXSZC4=;
 b=V4qJ7qLi1JiRwyXUpq6qE3nSHSNg/OxdCaOIYoW6EZuluG7ryKQefN8Pnz8FAYLDQe
 jjYZbzDEm5fe0kOpeX3/ZTSSnTUOlLqRSeKY2W0C26cCMd4zcvRq9/TKfL+mgKAIjGQu
 tYTgB5eFnJYw8gBIFEFStBl7Iwpk2+gNY82mvDiAf5+M1UCz5Dpe+3hIr3tTKpfNlsOm
 o6LKLu7A8TcWocTKoyF99dBHwFw/vU/qHJJZ9MCaRXAAtcrQfL6lFQ6ZsVlFetg+MPQN
 y96j/JtfvHLa3MetV648ccMZLIvO0Z8p0kJCdlkqagieM0WaXmpFEjwfQYc1PDYU7Nov
 SONw==
X-Gm-Message-State: AOAM530uxh5Fk0rXwUhgkT6pLXu9BzGAb96bAjKRJRAenBkI9Z2YtP7o
 VU24dCz+ZSdNDFZ5CAVo8FBwHXbMQErhIA==
X-Google-Smtp-Source: ABdhPJw/XwGwE0m9fySSUFFgYC9qkKQadqGFFWhHtwi3CAbxVQULf2qIchHPHNVEUPto5UE6NutOLg==
X-Received: by 2002:a17:902:a714:b0:154:6dfe:bba9 with SMTP id
 w20-20020a170902a71400b001546dfebba9mr10031304plq.124.1647997121752; 
 Tue, 22 Mar 2022 17:58:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g70-20020a636b49000000b003823dd39d41sm11569167pgc.64.2022.03.22.17.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 17:58:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] linux-user/arm: Improvements for commpage atomics
Date: Tue, 22 Mar 2022 17:58:36 -0700
Message-Id: <20220323005839.94327-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Only the memory_barrer one is a bug; the rest improve system-wide
interaction, and would only affect pre-armv6.

Changes for v2:
   * Adjust atomic_mmu_lookup as per laurent.
   * Fix alignment check for arm_kernel_cmpxchg32_helper.

r~


Richard Henderson (3):
  linux-user/arm: Implement __kernel_memory_barrier
  linux-user/arm: Implement __kernel_cmpxchg with host atomics
  linux-user/arm: Implement __kernel_cmpxchg64 with host atomics

 linux-user/arm/cpu_loop.c | 168 +++++++++++++++++++++++---------------
 1 file changed, 101 insertions(+), 67 deletions(-)

-- 
2.25.1


