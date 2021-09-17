Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA56140F01B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 05:03:52 +0200 (CEST)
Received: from localhost ([::1]:60606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR4AJ-0001iy-Vx
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 23:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43W-0006fA-HY
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:50 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:44858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43V-0005vY-1g
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:50 -0400
Received: by mail-io1-xd32.google.com with SMTP id g9so10411698ioq.11
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 19:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+vTeyxw0Y7XMbUlb9ar4nVtg7R/vO/Nf/AXyGz84LM=;
 b=tBZMyBYr/NCclqQ3apNIjCpNcSa+LT3jcN91rYDLEHLYnsCGJNNuQ3Z3NBWTCF3pFS
 LJqW4fQmdoT3NvzmKg4A3Guhi0wrZVKCWJsux/VEL6hP4vZu4CO+y0oyAy99XB1DfAZ2
 JfKHfjkvV+JUFMIotxh7qOrUY1Qqho6Hzv5oCOuukOie6OSehT67D6IQPnt5NoKX3G46
 +5+M/K1RNfCT/ljUf5WXxD/eWgSl+P6jbsgJVEaT/DtfFds6GPbu0knSCWHtPRWPMtyG
 y3VZSvE9mQjP6UllI3bn6jbE87lKd3xGPnMACCSTI4eVTALl7SPBQjRmb84BkrNqOpjO
 0irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+vTeyxw0Y7XMbUlb9ar4nVtg7R/vO/Nf/AXyGz84LM=;
 b=IBs2wu/o5S1uFvszhD5FOi+ZebRGxiSPRgcN5ChWuGczacYBl+XkmjdeRgz/rvAaqi
 VW8pqCUFtfv1SMQaz6EqFvYoLKUK96BGSh/GrDQHm1yH6ghAO+RGSXbJdiwwH8BFCNvg
 cAaBQAwhTPNIttxjeZM7F1XJbD/6meJCHrSpkO6uBUc6kleDRrO6F2Snu0Vg50LGWhfV
 asynaOnuoiNhQDj3ISoTcXFTs7MTo0+z/GPsOWS77nEYZ6XejN2SJvCiGbwLfuiBIioV
 2Vxl49N2kGuwii/4nLMrkeXZv3ZSXox2mmfcdXBUANFFnvah/cvcPadwAm+Kf1skc+R4
 g1ZA==
X-Gm-Message-State: AOAM531D3j88eUcRU47YfFxHF/y2yP90pQcEYeF23v/T+2I/bfhq5Fe6
 vcP5yBxRp9C4dCzYpffW5Hd9ZTbFmZj8sLizccw=
X-Google-Smtp-Source: ABdhPJzrUYUGyRn68LISycxfq8tdJPy8yiwr0XkToHWS/jyN9FOSLYVgmHHY5YPCed5L+zX2q5hrSg==
X-Received: by 2002:a5d:9355:: with SMTP id i21mr7014142ioo.12.1631847407557; 
 Thu, 16 Sep 2021 19:56:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id e10sm2603738ili.53.2021.09.16.19.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 19:56:47 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 9/9] bsd-user: Apply 86abac06c14 from linux-user
 (target_mprotect can't fail)
Date: Thu, 16 Sep 2021 20:56:35 -0600
Message-Id: <20210917025635.32011-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210917025635.32011-1-imp@bsdimp.com>
References: <20210917025635.32011-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Riku Voipio <riku.voipio@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

linux-user: assert that target_mprotect cannot fail

All error conditions that target_mprotect checks are also checked
by target_mmap.  EACCESS cannot happen because we are just removing
PROT_WRITE.  ENOMEM should not happen because we are modifying a
whole VMA (and we have bigger problems anyway if it happens).

Fixes a Coverity false positive, where Coverity complains about
target_mprotect's return value being passed to tb_invalidate_phys_range.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 792ff00548..4ddbd50b62 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -591,10 +591,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                 goto fail;
             if (!(prot & PROT_WRITE)) {
                 ret = target_mprotect(start, len, prot);
-                if (ret != 0) {
-                    start = ret;
-                    goto the_end;
-                }
+                assert(ret == 0);
             }
             goto the_end;
         }
-- 
2.32.0


