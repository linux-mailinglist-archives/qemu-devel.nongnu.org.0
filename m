Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320E02AD4CD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:22:05 +0100 (CET)
Received: from localhost ([::1]:53216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRiu-0003o4-6O
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgO-0001pe-H8
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:28 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgJ-0006mx-Ct
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:27 -0500
Received: by mail-wm1-x32a.google.com with SMTP id h62so2621555wme.3
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WJs7tlmKW/kmWkwqanCXTHgztjaLe8yma/76ieAs5o8=;
 b=OgzxRZ/RJXIUh94jWkAiVINcE0Ie4bqQpcmlukeJjTRYMyxvKmKcc10+08NS0/VQlM
 9g297idl2PelNK7csLdiUayo/tLLbs7oi0c1kpJIc7/fRNeR1u65eTHBgHVNxa/P2HYa
 bBRNB+88nxzNK2nD8YjwM9rjZZhFV7R35lrC6lN1H6juYOx0e7vowZaRNwBGXXnu2xe4
 vIKvessqwOS8H4Zt7UH8XfMs5Oj6JiJyGcIyFD9i4EsDZU1kK+7bgU2VLk59Iti7ijGC
 ao2Dq+N57ftvd5EQk58xiiV95LMcTshzWXPcGH+6PxlKy7CaMyvIh66ObYyc8mcXd7yj
 Akdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WJs7tlmKW/kmWkwqanCXTHgztjaLe8yma/76ieAs5o8=;
 b=owTIxafaNozcfKoHIy82+8I8DBgKEcj3JqXZ2CX5xpbo/IGD6VAfZwlPyntvC8aRQg
 ZUMZOvRId0OdrzomLCChn+0s6p4XHM4/iINKZUjvmS71XdntyFdf4i2C0yY+As7oCH4H
 5Eau8G54uR7tCEJ2vYLaLvgXT+PkvxbrO0fkkCg0itoFx8MZeUxJzP4vUuLRvjAGoCGI
 NG87pVc565IXeQIDrF6v9M117efY7P/pWGSKYK0/bQr0MM2ovyhlP3SErwhG9ZUQ60+T
 shZxC3Sor0og8JBFh5nrd/+ZjoZa4QH7RHPoQ/RLOV8WOPmY2rnyzfhvggGh7PD+P/xM
 56UA==
X-Gm-Message-State: AOAM530jimVKC921Ljk+iDJd5lOj5IuIQ3yR9oGEHbOH5v/HS4Ky9k1e
 sKPVuqcBxatsAT/59FbtlSGdBLbR+2rolA==
X-Google-Smtp-Source: ABdhPJwWpmHVZ1g+Vy6LbFymSVaIVqVXSXYdBpCbWFxmwITSrKRJczS6ibNjBVSP5usZ7TUlsO/s+A==
X-Received: by 2002:a1c:df8a:: with SMTP id w132mr4183531wmg.90.1605007161565; 
 Tue, 10 Nov 2020 03:19:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/16] hw/arm/Kconfig: ARM_V7M depends on PTIMER
Date: Tue, 10 Nov 2020 11:19:02 +0000
Message-Id: <20201110111917.29539-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

From: Andrew Jones <drjones@redhat.com>

commit 32bd322a0134 ("hw/timer/armv7m_systick: Rewrite to use ptimers")
changed armv7m_systick to build on ptimers. Make sure we have ptimers
in the build when building armv7m_systick.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20201104103343.30392-1-drjones@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index fdf4464b948..7d5d89e1acf 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -291,6 +291,7 @@ config ZYNQ
 
 config ARM_V7M
     bool
+    select PTIMER
 
 config ALLWINNER_A10
     bool
-- 
2.20.1


