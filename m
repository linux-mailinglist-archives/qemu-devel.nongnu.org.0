Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232EA3F8CF8
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:26:43 +0200 (CEST)
Received: from localhost ([::1]:54964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ9G-0003K9-5o
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn4-0006HQ-6o
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:47 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:51172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn1-0000B9-V2
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:45 -0400
Received: by mail-wm1-x32b.google.com with SMTP id m2so2278556wmm.0
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oiyXNGxu9IIMHJpXStpM0zzZ7SVtpaA14aPib5MdPfI=;
 b=ek3f95U5IrtJzZg8Tj8XGUMYsBUZzUG0GIT9vTEdmR6wPOU8kdCprOyxZkCzhVvEZi
 1ScFkHXsV5wWxCmEQfjHl5MZE6VArLa97DXL1FA+kdENNpo+rUHRlZ7ShbgviW18pMZg
 Nqi7uJOJqtCye7POWgY0paVWuDQny9mtpwzLiMTqF7O1DzyN44LZYN6g60zx7FcL33Lw
 7adkG+oNBUHBzKSc+gJJRV785MY5j36UxVqi40k2GzVZZTL3jvfDE7CLXhJnGSyOjrWx
 +KJr1I5kvt+Yy/K5GVx5Zsx0aCQ22FFlsMPHYQjnsPYpVkDL4TEiqghn4knHxphAnBxE
 NkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oiyXNGxu9IIMHJpXStpM0zzZ7SVtpaA14aPib5MdPfI=;
 b=h/oLixTm4QcIU7vz1d7P6+2aWEu4iTYAV8pRNuaVA+gs5Zo0cQ3wOcmpK6FmSP//ow
 nUlx1AHZcTcFeSlKjG+By/gts9iAZD/pdL3URL9Upf3iwBTawVlQKT+BjBtHJBOtnbpC
 nAyq1UWdcUheW8pomasAi1TGFQWXy7KbQlL3lXc7370V+0jvbiMTrqb5PlKBCbLN57qc
 ZCHqHMo9b9iAWsWK2yAdWN+sVWznDhbcFnMysU5vpjpDteRJ4B+RAbUzHqgDDtgiGBtn
 dg6q0veVjTfpJNAvDKhfDnLbe+Kqg4J2BbORbrwbIKwvvkMM3CprQh50pmS1/2KCdig7
 NFeg==
X-Gm-Message-State: AOAM531S4eP/1JzmU4QTvXD9Ix2xhzIOkd+tpwtkzk9ifNXrOqUMdeis
 tHS4tKqXqCP6S0cBsFb0mjyRN22tOxQiTg==
X-Google-Smtp-Source: ABdhPJwENaOgQyo01Wq2mE29T/mBdojLbLudWe1AG6PRcRUTrI9goO9I8zfZ7AYwF2acwhr3+Pcerg==
X-Received: by 2002:a05:600c:299:: with SMTP id
 25mr2673547wmk.107.1629997422549; 
 Thu, 26 Aug 2021 10:03:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/37] hw/arm/virt: Delete EL3 error checksnow provided in CPU
 realize
Date: Thu, 26 Aug 2021 18:03:02 +0100
Message-Id: <20210826170307.27733-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the CPU realize function will fail cleanly if we ask for EL3
when KVM is enabled, we don't need to check for errors explicitly in
the virt board code. The reported message is slightly different;
it is now:
  qemu-system-aarch64: Cannot enable KVM when guest CPU has EL3 enabled
instead of:
  qemu-system-aarch64: mach-virt: KVM does not support Security extensions

We don't delete the MTE check because there the logic is more
complex; deleting the check would work but makes the error message
less helpful, as it would read:
  qemu-system-aarch64: MTE requested, but not supported by the guest CPU
instead of:
  qemu-system-aarch64: mach-virt: KVM does not support providing MTE to the guest CPU

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210816135842.25302-4-peter.maydell@linaro.org
---
 hw/arm/virt.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 81eda46b0bb..86c8a4ca3d7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1852,11 +1852,6 @@ static void machvirt_init(MachineState *machine)
     }
 
     if (vms->secure) {
-        if (kvm_enabled()) {
-            error_report("mach-virt: KVM does not support Security extensions");
-            exit(1);
-        }
-
         /*
          * The Secure view of the world is the same as the NonSecure,
          * but with a few extra devices. Create it as a container region
-- 
2.20.1


