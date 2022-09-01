Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F0F5A9049
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 09:29:30 +0200 (CEST)
Received: from localhost ([::1]:36114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTedl-0007KJ-Gl
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 03:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4I-0005vk-AG
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:52 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTe4A-0003Hi-Jn
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 02:52:45 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m17-20020a7bce11000000b003a5bedec07bso802567wmc.0
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 23:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=SHzx12Rsu42Ye71toTN4bWIrkmgQVEH0DPBud2OqwOk=;
 b=wbzy/ksNA0SlkUV1s8PhRlgkyUksszXHWERNT9qmG1ysVn+FPq/H5cqzO8g15LpgOt
 T7Aj/wy+TYP4W3IqIOr/0KYvUjRUWMevR3R7AYhWMmVw5I1QcGVSyhGjrw9fpEA4l8FS
 oUy9BWBK0cNfV88Qu3bRSnonAbl6fuXn2+SYuFbMFI5NaoRbZzAJnyvLmMGh+orfImXi
 N9Kn8u+sUcrbTLt/sy4n627hBKkUEpTeGsSOJse/YORzWj2xIswUZbIhvffa75VxnKE6
 I3aVp8mi+gw4OTQPDNQL9PPl10nJCOjXHp9Jzy13bXXug6nhQ4hAb3qMm/Eeyz0S0Tyl
 Auag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=SHzx12Rsu42Ye71toTN4bWIrkmgQVEH0DPBud2OqwOk=;
 b=FlXSCFBeV1d5lbZXp4Pk5qOHLNYslhKzLv/HlBgzMetUhFQez2T0/LwxzjISbst5zr
 85jPEuxDam6E1EPYO5bCgvOKTVBlefDqJ4Q7uWYL2I8aYkBgWnBSXIzI8UVTyvHmkSmG
 5QZYfdtcx5C/YR3270TslhJp/24gfFzyksWAREFtOcjGj7KFVM3U1QTTdE3fanxO6fJj
 S1o9LfD8Zlu0rPL3rHxMsL1zIGn/vHxbJAM3OI+qED9DQ5ilQzVuHEp9YfYZiE+XYQjo
 0orUB1mgENXURznwQo1+xUcw6QK+knnxDFQIPXmi8/8GaYFfSaUEOPO2JvIkZo4N/btP
 fkjQ==
X-Gm-Message-State: ACgBeo2/a95zavOH9TMKY4GGsZNth6GEOaX0FjzOnC3y57JGngSkKBHx
 F60GFZJ+JT/Je83PQOd4Iqf1ekb/cdX+VNaP
X-Google-Smtp-Source: AA6agR5dY7amNurjCy1COxfxoYjugTqfIo+aoPrNnMHCPF1yUgTV5DqTsnnQPbL8e81XJow3Bo98bw==
X-Received: by 2002:a05:600c:25ce:b0:3a5:a3b7:bbfe with SMTP id
 14-20020a05600c25ce00b003a5a3b7bbfemr4249120wml.115.1662015161030; 
 Wed, 31 Aug 2022 23:52:41 -0700 (PDT)
Received: from stoup.. ([87.192.221.83]) by smtp.gmail.com with ESMTPSA id
 a6-20020a5d4d46000000b00226dedf1ab7sm8308153wru.76.2022.08.31.23.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 23:52:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 05/20] linux-user: Clear translations on mprotect()
Date: Thu,  1 Sep 2022 07:51:55 +0100
Message-Id: <20220901065210.117081-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
References: <20220901065210.117081-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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


