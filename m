Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7474CB120
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 22:18:01 +0100 (CET)
Received: from localhost ([::1]:36616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPWMC-0004Q4-NB
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 16:18:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxm-0005qR-SL
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:47 -0500
Received: from [2a00:1450:4864:20::432] (port=34601
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPVxl-000896-Dm
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 15:52:46 -0500
Received: by mail-wr1-x432.google.com with SMTP id d3so4711639wrf.1
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cRu0ONP9iJRS52TXzF5kbcfgXqfx58WUEunHKG1fNWY=;
 b=g9wsUoT7t/OyiAlKggZhUFscxbxonxhiO5zdIh23igdbvzMs5reynbfpkFiYCwut9K
 x02c6v4+/IHDZEWMy4ke9KwilvFTr5gLnyiq/sPb7hhF/tS8PZcyQjLpqx/3bz2J7zSe
 jiXoVAZEbscDy7RnmEq4Fa5/yB47ukymsIfEiZT/fL80YzDETlKwDHvVPe0FktdFI0mi
 GpWDIinBtKVPTh6k5j4NQ3UJs8bTybeSlwKf3A19bbv7Rd5/Sshno4qrTgJXTZiTDHof
 VF2c3xehlNYz6/mfk9/nkGHOqjXj6b9z4hW32Ar4qme1L1w3rTLjABhwjg8KnGtoUtF4
 bKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cRu0ONP9iJRS52TXzF5kbcfgXqfx58WUEunHKG1fNWY=;
 b=Qxt2gy+nB9ZaZpzoI3XR+Z9AZtQCtA6srpSocD5tmnpRCa9ha+jLFPHmE2QFZTRNMU
 KxTrJxIUV+tBBjwTG1PEj9K6damnxsk8XVVv0a/G0y6lv8fBCvfUWovDg+i4ReaMu9wk
 ya3G68PT7F5GW1tDdv1/AT9tAtFL71roZhWR1NzWZhnyBFwPtHrxQAhrOMY3ePll6iKj
 qCOHqp/+gClFozOg9/7QlC/gMsbGH8bsuk8rIAyOWmbNOzL2v2mU5t8NTnHA3RoqOU8W
 fM+tmVZxBzfFIT34eGT/SBNO+XmWVfVykt+zoMOpK2lL3QFrqp41t171eSvwjZ2giEca
 AliA==
X-Gm-Message-State: AOAM532GExYc7xnKc8idbEzDocTTKcNBYCXmADGtjVTKji6xsUbPUUDi
 EU8dWTC008vfwWTcKzHkhQnsyqVnBudcsw==
X-Google-Smtp-Source: ABdhPJz6XekabZQuQu0mt+OI/rKT0UjWUx8L1F5QHW6HtU3yiZu2JxpslM7BfjR0Vk7fH37EBzJ/QQ==
X-Received: by 2002:a5d:64e7:0:b0:1e4:bb8b:d3eb with SMTP id
 g7-20020a5d64e7000000b001e4bb8bd3ebmr24247409wri.403.1646254364116; 
 Wed, 02 Mar 2022 12:52:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfec0d000000b001e31279cc38sm90801wrn.11.2022.03.02.12.52.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 12:52:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/26] target/arm: Use MAKE_64BIT_MASK to compute indexmask
Date: Wed,  2 Mar 2022 20:52:17 +0000
Message-Id: <20220302205230.2122390-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220302205230.2122390-1-peter.maydell@linaro.org>
References: <20220302205230.2122390-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The macro is a bit more readable than the inlined computation.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220301215958.157011-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 431b0c14052..675aec4bf30 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11518,8 +11518,8 @@ static bool get_phys_addr_lpae(CPUARMState *env, uint64_t address,
         level = startlevel;
     }
 
-    indexmask_grainsize = (1ULL << (stride + 3)) - 1;
-    indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
+    indexmask_grainsize = MAKE_64BIT_MASK(0, stride + 3);
+    indexmask = MAKE_64BIT_MASK(0, inputsize - (stride * (4 - level)));
 
     /* Now we can extract the actual base address from the TTBR */
     descaddr = extract64(ttbr, 0, 48);
-- 
2.25.1


