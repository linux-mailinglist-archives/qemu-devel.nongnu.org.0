Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A50A6B4FB6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:04:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah5n-0001xI-6y; Fri, 10 Mar 2023 13:03:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5h-0001tv-II
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:41 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5d-0004bi-2E
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:41 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso6676111wmq.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DH9d0Q+vvilg4Dne3iVcYKZRMvVXPz/C/t62yxOMiF0=;
 b=Eez2e36NTigVnDpxFuAOfLsRGsxZ+2fndCDUqer7J+nJWIJstYN+rM/GpmXrlRfnFv
 LTtkZqHdzD+r5r+itYkvaYU0fUT2VUhN3V4nV0rbtK0AtiYSc7SAX/NVogeuCIvSbc0J
 F15Tfn+APeVFLMlTNYAijHSNTrD08WERw0eNfn3ndH++7QoHdccjFPoRIkrB9nQlka9b
 ooasS/rru2oDBO4RzDPuWnCbZN6HZfvhMJXouQHJk45xwrGd2RXvS06IvNBsj2RDHRFz
 pYnZFES36TGQ1r/JCRX7zCBzLJK3i9Q3t1lGy+GWoXbqHUOmb0kk+4tsbE8XPc9aQh6C
 30ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DH9d0Q+vvilg4Dne3iVcYKZRMvVXPz/C/t62yxOMiF0=;
 b=N/ZLgFjriDRKJMsd0fa5Dljhu8Q/KDo5r2toielvZ/GN8AC2RlU3kH+hQxs1Zg+L9u
 PdW9lxyjG/BfitJ+4sUkpn96rGYdFLMsIe+tjDQcK7tbIzOF0VarCicqZMYVkQQ4DJmm
 mJFBEyyijbXvvBW3JBNyR5YNoPOXRGW8jfwCRuHb4Muq+05sjRyg7mQcPFtFzV0/1zo0
 WqtFokKx62GBSuKQYt3O1lbcS6rA1s9RC9EeXHLyM1BeewsmsbuWThGbPeBy53el3+h3
 +kf5LNniZpDH2uyz62Q2/1+vFCQBseRetr4Z4q52VlE1DAzlouJHMfnzSrfEI/haA+O+
 OcGw==
X-Gm-Message-State: AO0yUKUaeYA/sFe9hI/He79rRtc90w1V3Am5tsZqFPU9KNZCrtrXk3Mb
 PtyNjtaeUCy4DTK4avYBIzFAtw==
X-Google-Smtp-Source: AK7set+PbSHpdWCB9A3SvhZpRSx3S36ynUCj4RtTaLjzUZNdMeibj+rEj3i3IuLr0d5vwZK8EFuN3g==
X-Received: by 2002:a05:600c:458f:b0:3eb:4162:7344 with SMTP id
 r15-20020a05600c458f00b003eb41627344mr3922563wmo.22.1678471414756; 
 Fri, 10 Mar 2023 10:03:34 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t1-20020a05600c2f8100b003e896d953a8sm617499wmn.17.2023.03.10.10.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:03:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B39A1FFBB;
 Fri, 10 Mar 2023 18:03:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Howard Chiu <howard_chiu@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v2 03/10] contrib/gitdm: Add ASPEED Technology to the domain
 map
Date: Fri, 10 Mar 2023 18:03:25 +0000
Message-Id: <20230310180332.2274827-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310180332.2274827-1-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

We have a number of contributors from this domain which looks like it
is a corporate endeavour.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Steven Lee <steven_lee@aspeedtech.com>
Cc: Troy Lee <troy_lee@aspeedtech.com>
Cc: Howard Chiu <howard_chiu@aspeedtech.com>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 7a8077e241..bd989d065c 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -5,6 +5,7 @@
 #
 
 amd.com         AMD
+aspeedtech.com  ASPEED Technology Inc.
 baidu.com       Baidu
 bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
-- 
2.39.2


