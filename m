Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75966B4FB9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:04:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah5p-0001yW-Ey; Fri, 10 Mar 2023 13:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5k-0001wL-WC
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:45 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5f-0004cg-1U
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:44 -0500
Received: by mail-wm1-x336.google.com with SMTP id p16so3960074wmq.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o9n6ogOMDz+94jrIaXkLzWHkm9H/D6Gy4kKaqkRCkug=;
 b=JNcxg3L9A+tNPzCfMiLk8L3CCAIsucuiuIHUlYY3XlZnZO0N++VrP93S/G58pm6pMw
 H7vlpR8UXRQco1Zny8LOpkKEgK39TZ1nc9gOR5TVwcd71T+GqdRE+UOGeEXUBtlmQlWX
 kPG+WZhv2EL4w0u28hV/cnSfwqAQXWTcKMipimxH9+xjJNf0hXbVTJO+j1z3USgPCPZz
 XWqR3wM9mL8e1abQ6Aia8r0PGzCd0aLb87sS55Fd5qrjTwAYZVDfA/uC3i5vH5pNRIsY
 K3KC8oHCHOfGg0PAg3rN0r/eepNf3GZ3OlU1t4B8etzwsvslSA4xjj8IozEZ5do068iP
 c5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o9n6ogOMDz+94jrIaXkLzWHkm9H/D6Gy4kKaqkRCkug=;
 b=sQ5Df5YitbG8e7JjMlh8awHIszxEKSzRAbu9ZeW/rZl6ZkkCsSK03sIXFS2YNKcPPh
 lBRXcfo2g5J1OyXazoWTQ2h0RolRJjf47sF5Zr3Ck+pmsdWLRhn2Fr0nV+8eyhXmJSKy
 1UQCdo99OLFirzxcXqI/72E7F8ejJTjoNBnwSbkOAnx2CuYI9uC7D3eZCQiqaFF+Gjxr
 +1IjD94C89UME1FJOPQ15zlZGIVQSwYuHtytK+1iD8VstTQOFHLvfFqA2qYW68/M9CHo
 8WWLmfnbm6LvFYFuBgJ+ZD7/wBgY+aoccr1wq1n4VCBZnYzVulR0fSWGLjNSdgC4Kyks
 0/Hg==
X-Gm-Message-State: AO0yUKUqwdyP0SOCT3Evgb/WXbiFPIgZqkv/MELoY2+xf/w/3x6tRxqS
 HUZgSJ1PPNzSRJY/xhQg3BLL+w==
X-Google-Smtp-Source: AK7set/ZqjPAVNLK8RMc045fwIPFgcZQbOH2riO9YKakzZlwag8AUtkKL/CYwqkJNr5kYJXar98uBA==
X-Received: by 2002:a05:600c:4f14:b0:3eb:598d:6494 with SMTP id
 l20-20020a05600c4f1400b003eb598d6494mr2133943wmq.16.1678471417539; 
 Fri, 10 Mar 2023 10:03:37 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a1ce904000000b003dd1bd0b915sm539138wmc.22.2023.03.10.10.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:03:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6ECC11FFBE;
 Fri, 10 Mar 2023 18:03:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Graf <graf@amazon.com>, Paul Durrant <pdurrant@amazon.com>,
 David Wooodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v2 06/10] contrib/gitdm: add Amazon to the domain map
Date: Fri, 10 Mar 2023 18:03:28 +0000
Message-Id: <20230310180332.2274827-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310180332.2274827-1-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We have multiple contributors from both .co.uk and .com versions of
the address.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Alexander Graf <graf@amazon.com>
Cc: Paul Durrant <pdurrant@amazon.com>
Cc: David Wooodhouse <dwmw@amazon.co.uk>
---
 contrib/gitdm/domain-map | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 570e63c9e1..0261533990 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -4,6 +4,8 @@
 # This maps email domains to nice easy to read company names
 #
 
+amazon.com      Amazon
+amazon.co.uk    Amazon
 amd.com         AMD
 aspeedtech.com  ASPEED Technology Inc.
 baidu.com       Baidu
-- 
2.39.2


