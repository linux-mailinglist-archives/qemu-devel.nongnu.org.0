Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7B85AE390
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 10:56:23 +0200 (CEST)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVUNa-0003k8-Nt
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 04:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6E-0002WP-Vt
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVU6D-0005UN-5h
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 04:38:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id b17so958186wrq.3
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=SHzx12Rsu42Ye71toTN4bWIrkmgQVEH0DPBud2OqwOk=;
 b=Csjhu9mohES5bPcnQJYCGPV8g0GkPzTdyynIr7qrwep92I6pUW50CffLG1AyYzPoTq
 S4dA6okoYsC8Hl3GjuMu+7ZOSKVUaPorMmLuLmIVtV2SYepQ/4aCs5PX7ZpVfBCbFUzb
 jkfIZ43TJtZem5G0nLXaW7DdEwtyxlQkNYhz2KWQIpxy5ZIogULnXL82RNZLV5EBCS1U
 BsAgnWF7i44XSa1kbe3YeCQhhPT6EtGub1pGB7O45JpjYWUlCeco4C8/363G3ILvyS/U
 DMR7P8C6WXz5U3E8/WaKGHTxWpGEQwRotYDxFxGrR6ZFks7NNlHSn2H4vE3ayw4nO6Uk
 xHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SHzx12Rsu42Ye71toTN4bWIrkmgQVEH0DPBud2OqwOk=;
 b=IuKbMo9ULFAOlbEgKc3v1KbT1kOFqc8LXEF85VLfi9werS7+R7ONDCftAoB9gk0G8r
 c68OcfYRZtcZO1DTtV1w/wD3Y61r4kGnkWJDPz4I0IZddljYakNbanmgYWqTAKAlzuNb
 29sSzlbfY2wyf6hsJlGvqodgS2b3JNP6t5ulHIjYO3Bf/OGpkC3yPAc52V+rsemXnGIK
 OIUZGd1KF5jPm56czQSRGNnvqGlLmj56vFS/fRGrh0D6vyOFK/7sYPPIFCvKdoq5oF7Z
 uvT4LNkU04rcavvW17AIPhrTlS43NHpbNc4v3bW4RDm5l+mdFNh97HRSTqKB4Q/t2vgY
 MXLg==
X-Gm-Message-State: ACgBeo0lbZc8s0o8UMmg9V8I82oXth7h5VWK8Bwq+3QBSXzEAgLl6slA
 B9F225QoED8Hp1EaD398MmsTXeq6agSllLhI
X-Google-Smtp-Source: AA6agR7sZVXB9/RtZu3PWvPFdIqC2BFNsyq6IMWE2+cQXXhrV+sTOuIYBtw5alCYrAjD+VnhMxYpcw==
X-Received: by 2002:a5d:584f:0:b0:226:edcd:b467 with SMTP id
 i15-20020a5d584f000000b00226edcdb467mr15281074wrf.363.1662453503360; 
 Tue, 06 Sep 2022 01:38:23 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 g26-20020a7bc4da000000b003a54f49c1c8sm13421859wmk.12.2022.09.06.01.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 01:38:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL v3 05/20] linux-user: Clear translations on mprotect()
Date: Tue,  6 Sep 2022 09:38:00 +0100
Message-Id: <20220906083815.252478-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906083815.252478-1-richard.henderson@linaro.org>
References: <20220906083815.252478-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Currently it's possible to execute pages that do not have PAGE_EXEC
if there is an existing translation block. Fix by invalidating TBs
that touch the affected pages.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220817150506.592862-2-iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/mmap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 048c4135af..6a828e8418 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -177,9 +177,11 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
             goto error;
         }
     }
+
     page_set_flags(start, start + len, page_flags);
-    mmap_unlock();
-    return 0;
+    tb_invalidate_phys_range(start, start + len);
+    ret = 0;
+
 error:
     mmap_unlock();
     return ret;
-- 
2.34.1


