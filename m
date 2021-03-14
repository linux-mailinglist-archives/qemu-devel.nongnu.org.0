Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5962A33A8F1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 00:53:26 +0100 (CET)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLaY1-0004eN-E8
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 19:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLaTD-0001ie-Jw
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:48:31 -0400
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLaTB-0003oT-F3
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 19:48:27 -0400
Received: by mail-qv1-xf2e.google.com with SMTP id h3so6970069qvh.8
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 16:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wNCxluSBSDLQf80mm1IAxRjvrsypZp9PbQQJIGVe3gs=;
 b=jbvw42eWcjDrm7NBRH0KB8lQ10kMcTuYdeKVbVKkxLZQnLM6yT5buJZ5t3DKDbzMw3
 gbUH+sN6DZhD7gGQoXe3RGXJmK1a/PDsxm21rz2kRTr/VxnlFPjyrCgLOFW4pTniaO32
 Om4KGxDNkGTP3Wkbv6zU8NcVfPtYWHMRCevXGtOdG4Rqk5ItHuZ2+RGgfq3XbU8C1uJB
 RrN5llivISAOY6M00Xt9Muzom3FI0AUh8r7vQqT/s3wpfo7cMWKgELTxLmVk/SXt4LzY
 ulycO9123musKHUkik6h7mCPodVB/0g7Y3RBfNF3U6uQVRUfLp9Q6twD8uP97IVE4Y5i
 0ZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wNCxluSBSDLQf80mm1IAxRjvrsypZp9PbQQJIGVe3gs=;
 b=bfvn17S++fSByPckw1S4xpzesgN5/jIeLrY6jZR9Kmkl7q1HoMjnEnx1A3zkc6RsJ8
 oTAYT7NeqCSe5HmiWD4sIMIs7qgQs4nQSGxEDca43agpxKUJUgS3Dp7NKENPvImp8dYa
 +PO4GLIznET7Wx2GiXeVTDJsQFFgVbO35EXIl+fHgetkJeZjuyIyBuoWezytU4gJrhcJ
 ts9gd1u0mOU2oLVj0pLugBwPSX5rPxnHuVtCmsviSuTeplUk9UTSiE3aUfuDjaACQyuu
 5zol8tm9n0z+ZrMS1YL2bV0BrYrIQfPJn15rrmGVgTgSfFROfJxT6okbE1H4gizgV7Sr
 jI/w==
X-Gm-Message-State: AOAM530rxVjmC+Zn6LL2XgGpxFGb9q8tOxKg787IKNjOhP2Zesmy4fqZ
 8FSP/X+8cWzhGaYa8HdCRoQkgTIYEC0P8Y7h
X-Google-Smtp-Source: ABdhPJwSNvOCQ6a3ncIBEqrBGSgNbJM4t/zQirsB8/2tSHNsoP5utHPqKi+AfQmD2yft6vVyiArY8A==
X-Received: by 2002:a0c:fe0c:: with SMTP id x12mr8187095qvr.16.1615765703978; 
 Sun, 14 Mar 2021 16:48:23 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id f186sm11192370qkj.106.2021.03.14.16.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 16:48:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] utils: Use fma in qemu_strtosz
Date: Sun, 14 Mar 2021 17:48:21 -0600
Message-Id: <20210314234821.1954428-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2e.google.com
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use fma to simulatneously scale and round up fraction.

The libm function will always return a properly rounded double precision
value, which will eliminate any extra precision the x87 co-processor may
give us, which will keep the output predictable vs other hosts.

Adding DBL_EPSILON while scaling should help with fractions like
12.345, where the closest representable number is actually 12.3449*.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/cutils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/cutils.c b/util/cutils.c
index d89a40a8c3..f7f8e48a68 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -342,7 +342,7 @@ static int do_strtosz(const char *nptr, const char **end,
         retval = -ERANGE;
         goto out;
     }
-    *result = val * mul + (uint64_t) (fraction * mul);
+    *result = val * mul + (uint64_t)fma(fraction, mul, DBL_EPSILON);
     retval = 0;
 
 out:
-- 
2.25.1


