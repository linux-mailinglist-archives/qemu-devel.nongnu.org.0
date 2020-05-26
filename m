Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D4B1DCAED
	for <lists+qemu-devel@lfdr.de>; Thu, 21 May 2020 12:22:47 +0200 (CEST)
Received: from localhost ([::1]:36410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbiLe-0007lK-8C
	for lists+qemu-devel@lfdr.de; Thu, 21 May 2020 06:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jbiKd-0007Ku-0p
 for qemu-devel@nongnu.org; Thu, 21 May 2020 06:21:43 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:42278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jbiKb-0001gs-I1
 for qemu-devel@nongnu.org; Thu, 21 May 2020 06:21:42 -0400
Received: by mail-ed1-x541.google.com with SMTP id k19so6307023edv.9
 for <qemu-devel@nongnu.org>; Thu, 21 May 2020 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eDRUUs0Bt6B3ETYta5XoOAaOPWB5Al8bLwiWuixJmW0=;
 b=cvMHfvsKjKy5XtgjZQHivr9bfKrMA+p3KQnPV5nRW+xNkGUOom91V7KXFwtmQX4kCc
 04DLaKGI6NNssjdnPHosFwvSQhYeVsETB2jdiVeuAzy/DBDY/jpSGhA79zru9gSu92pk
 ic55F8SWceqyiAqxEk8qawKdYhwaRCtBeh9U2Rb0AfBKhZtBlcQ5J1aRjLEd1lm4lKbe
 4oUs6YvF9fP3xo5dka5/EKMaoVo4Dtl2lMRO19gWqthddoJmf74OonHsbrUuZwcR2gSB
 cj0sjlN+riC1thRvfANcCETdilpa3CAcWA6rzAnt346sqYCZ29JY3qNJxm4M5SA0Si63
 mwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eDRUUs0Bt6B3ETYta5XoOAaOPWB5Al8bLwiWuixJmW0=;
 b=B0pfWVmKPCxq+BwIs9ONe0a7HiIlYv9pn44cy71MyZpniQVikvULjv7UYvZ7KY26ET
 yYL0BOuEXi9GU8wqSIRWA2h2ea5TQMQWRlE5xDjmRgRf+N70Q3gBnL9uJK0t5+4MMHXh
 APC6isXdHDsYsTgq0GZ9ZbmYM8pPl7a+9pzAY3inpyu/fcy3AMLY2469HFOhkrGzyGce
 e/me9io9KavnK1Tv6syO3iLKgeL1itcDcvPvtR6ny03WTm0wncJOGqipWg2TeLOLfbNt
 TAjy/9tnI69Y0LnzfZ1O0YyxAJM2LEaYqp1vgsT/nxfNxW3cDF9L6kzeXSXg0y/BkjDS
 MHgQ==
X-Gm-Message-State: AOAM531gMHVVH+qKKW19Eh+KnVlO0m8OpkXCvM8JZpfanRt+yxirYNqD
 zOAzqbP4R6EK84YucpRINw1ghA==
X-Google-Smtp-Source: ABdhPJyqRE0YcwgP2gvqayQB+ciwv/XHNTgQ+PLshIcoK0D3oCn5gUMhSAdEnpmpClvbv3Lazv65gA==
X-Received: by 2002:aa7:c492:: with SMTP id m18mr7053630edq.249.1590056499850; 
 Thu, 21 May 2020 03:21:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l11sm4401069edw.55.2020.05.21.03.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 03:21:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D20A41FF7E;
 Thu, 21 May 2020 11:21:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] linux-user: limit check to HOST_LONG_BITS == 32
Date: Thu, 21 May 2020 11:21:30 +0100
Message-Id: <20200521102130.17619-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <thuth@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Newer clangs rightly spot that you can never exceed the full address
space of 64 bit hosts with:

  linux-user/elfload.c:2076:41: error: result of comparison 'unsigned
  long' > 18446744073709551615 is always false
  [-Werror,-Wtautological-type-limit-compare]
  4685         if ((guest_hiaddr - guest_base) > ~(uintptr_t)0) {
  4686             ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
  4687 1 error generated.

So lets limit the check to 32 bit hosts only.

Fixes: ee94743034bf
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/elfload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 01a9323a637..797fbf2337a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2072,6 +2072,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
                          image_name, (uint64_t)guest_hiaddr, reserved_va);
             exit(EXIT_FAILURE);
         }
+#if HOST_LONG_BITS == 32
     } else {
         if ((guest_hiaddr - guest_base) > ~(uintptr_t)0) {
             error_report("%s: requires more virtual address space "
@@ -2079,6 +2080,7 @@ static void pgb_have_guest_base(const char *image_name, abi_ulong guest_loaddr,
                          image_name, (uint64_t)guest_hiaddr - guest_base);
             exit(EXIT_FAILURE);
         }
+#endif
     }
 
     /*
-- 
2.20.1


