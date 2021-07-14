Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1553C824B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:59:49 +0200 (CEST)
Received: from localhost ([::1]:35776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bgC-0000iz-EM
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQC-0005C9-5Q
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:17 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQ8-00008s-GQ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:15 -0400
Received: by mail-wr1-x432.google.com with SMTP id k4so2391868wrc.8
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X8T4PtRFdtaY06IZK3sz9mBtVF7NeBTX8I+sA2XF8rw=;
 b=Tm9ZIyK66qEfV9i/u1PIBSCJtk6PJL8IJ7JuD9wZPBfCsW6YxUz+cFRdaVrtcHVCMj
 T+4qN1h3L3JT7f1xa5wtuzcYptU+6bSOf4OZXf9fZzS3/bNKCyAntYUN0q5RaSFIpTtS
 A/hdlZCTgc68kKvLG7aWsXjWvxJlnTM8jIcUh2uVOOniqkf3NW8qy+3aNg1hp7P2ct8g
 WQO2HtSRvWW+PnWXpIkLfLk3nhvFHMeKT9Th29inevH7goeyTX4PrGQII2d61VbPUzxA
 Afq3/7jWFS9pj4ovjWovMoTyMjZbhS3BoYoOhAwEC7rrkepr9oEdhJLa8OVVwOF+ChFe
 NpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8T4PtRFdtaY06IZK3sz9mBtVF7NeBTX8I+sA2XF8rw=;
 b=XKi+ZIitmkPWKEMG6fHRSVnM4/iETu1831/61CRamAO4He6LD9HPrtQlN6bz/KWdod
 Ib/kXzwJGAVFoImfcLw+/A87jnwOhIFcHCG4npcqXzbDRu0RKReifYMnxhkijEW8aTYh
 oP3dxZwazx7b4+zHSsFthzh+WxMrqWOrJFIyJZJbEjwQ+RLVSMbSKwMY71DygV35PlYP
 HeSCMKLk3RecV848VN8PnMvy1ec1ET2KwOD+e63H2JXuWS1t5dU3rhJIgMTPl6XW+xT0
 DvjBQbB6kNU+5iQJYee16KS1S0IO2FCQ5kiy7E7cVAoJIaku4N+mCTmmjahQpa2T5hLA
 tYfw==
X-Gm-Message-State: AOAM531byQ2/CEnOn7ytof7/36jXdD/Ys4YQZd3t+SGtmBXqKDzIMaT+
 x35Ip3H4QMv7AGA/vjsZwxEKlw==
X-Google-Smtp-Source: ABdhPJzHwOMpuLfzDWoIlzacIgJXMFRJmw32Ve95QXIFzsS0d6cIFQJ353UZ7QzwfGgs5oycByAz8A==
X-Received: by 2002:adf:f70a:: with SMTP id r10mr11665382wrp.401.1626255791263; 
 Wed, 14 Jul 2021 02:43:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t6sm1968338wru.75.2021.07.14.02.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:43:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 392DA1FFB1;
 Wed, 14 Jul 2021 10:37:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 17/21] contrib/gitdm: add domain-map for NVIDIA
Date: Wed, 14 Jul 2021 10:37:15 +0100
Message-Id: <20210714093719.21429-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Kirti Wankhede <kwankhede@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Kirti Wankhede <kwankhede@nvidia.com>
Cc: Yishai Hadas <yishaih@nvidia.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 0b0cd9feee..329ff09029 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -24,6 +24,7 @@ microsoft.com   Microsoft
 mvista.com      MontaVista
 nokia.com       Nokia
 nuviainc.com    NUVIA
+nvidia.com      NVIDIA
 oracle.com      Oracle
 proxmox.com     Proxmox
 quicinc.com     Qualcomm Innovation Center
-- 
2.20.1


