Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F09730880F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:07:22 +0100 (CET)
Received: from localhost ([::1]:51614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RcX-0004iZ-MF
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:07:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW8-0004Yi-7Q
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:44 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVv-0006zP-IK
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:43 -0500
Received: by mail-wr1-x431.google.com with SMTP id s7so5397577wru.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=H8+6iM9UPg6CtT6aaD4pRiWzKNKK/cDriKvv+fclduU=;
 b=ooVFQI5onsv5dXiHEq4isV1+BXuPWHHtmxkMJ3ydJn9KU85GwEwXfNVFQYnj7OVl0B
 bzTZynwPZAzXON/U13Ssf/z1NmEH+RYBgVKdzzzcCYL+wM6JntOMWruCKgreNph6Ts4q
 ZpOMdmligNvsWm6Cv1ORTFl/wEYAZ3RvQ6eqix4hUgr3tEVP2pOyRXC70YZQy439QpCq
 qSLEJLgiNX3PmlDxg0lDKeIaiPCCQXpzeyhLImdTiRl9Y7vEX2f3aj0RBa4og+tRAmWA
 DTX/oHaAxA9UKcksvF9zbH2/axsyOLli0Y+mgxXLWEu6qZ/6tudZnAWQGqgbgx8D1qXN
 2zxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H8+6iM9UPg6CtT6aaD4pRiWzKNKK/cDriKvv+fclduU=;
 b=UbsbRgU6hQRVDaB3B9WN509XonG4vx0C8KIhg54Js8F0YAt3ziBFEI6HhZB9UcjSeX
 BsrgaeD+NcwKS/o93mQVAOFvWUWpU71zvQMbe5YK/5f5a2Y8FPEoW6UdyQnbf4sOocZp
 AxN0DxGus1SyLp3R/SeHP/S6DqWsLyuqxIPIOXSa1WEkgDy5Zd6UQSOm9q33iZs2m+R+
 vW7ursWQdHktUMF/HwO0AiLDj1UkU8mzvFQ2TmFNDYurHLNLB/cKqbcawlf5Ydc3rSe7
 s2mGn1SOS/WYaVEKx18T7LigepUkt5Vb0UBL21arUm8XDClvJC+MWIxqs2bEIC847xzT
 5yuw==
X-Gm-Message-State: AOAM530GWGHeved6oMRG8gMdtKS0XsQuk7SGaaXzWXFf2fpyQgEvXNy7
 jo+Sx0dlCBuXAa4F+oUePyubVKNRAD7jAw==
X-Google-Smtp-Source: ABdhPJyWmJCDhI3ZgRhu6nM2en9ws/x80kcdwp7VJM4tedZSkuvdvoWantCwvh4VCBDQfw3jh5EG1w==
X-Received: by 2002:adf:e80f:: with SMTP id o15mr3873493wrm.366.1611918027679; 
 Fri, 29 Jan 2021 03:00:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/46] configure: cross compile should use x86_64 cpu_family
Date: Fri, 29 Jan 2021 10:59:40 +0000
Message-Id: <20210129110012.8660-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Joelle van Dyne <j@getutm.app>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-id: 20210126012457.39046-9-j@getutm.app
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index e520a434065..5cf075ac60e 100755
--- a/configure
+++ b/configure
@@ -6305,9 +6305,12 @@ if test "$cross_compile" = "yes"; then
         echo "system = 'darwin'" >> $cross
     fi
     case "$ARCH" in
-        i386|x86_64)
+        i386)
             echo "cpu_family = 'x86'" >> $cross
             ;;
+        x86_64)
+            echo "cpu_family = 'x86_64'" >> $cross
+            ;;
         ppc64le)
             echo "cpu_family = 'ppc64'" >> $cross
             ;;
-- 
2.20.1


