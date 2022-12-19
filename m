Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B10650B57
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7Q-0008If-TL; Mon, 19 Dec 2022 07:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F76-0008CG-Vd
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:25 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F72-0006Ty-VX
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:24 -0500
Received: by mail-wr1-x431.google.com with SMTP id w15so8410833wrl.9
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tdlO/1SLA4wDCdt5bVx86JYB/1vbud3PYqewb7Nb3LY=;
 b=AmtiStBlzpzmpBLMpvLgsjRW7RQDeZaLbjMWrOTS2DSkj1J9LYqS3zHbMgKIqVyMqs
 Oh66RyvI96HWUyLHchswq5kQUXE/QUlwFUJxRkP7FVVvpzVMh11fZ243MwhqgVEOdgma
 wqBPPCuMDVIukD3vg+Dpx8A1tr1XV4Gd66wC0EILN/s6Qdq/D2CTryeLD3v1VPG8daEu
 w/zERoBM6lhakuM8fgKdFp8/WGgjoakGtNdihsFBDDmT5Di5lZ4hsjZ7uchnk3tpd18T
 VFAd3xbwldw8GtotEveBrQIiscBRoaqPgOnu+2H4EvoGMPK7NqEHv0E86sGfXAyyp3qr
 1HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tdlO/1SLA4wDCdt5bVx86JYB/1vbud3PYqewb7Nb3LY=;
 b=aJm8mUeKqwjrPI+K0U7PVlWa+T+pMF991E8bYRKZ+sMur+MBdfv7W63EkkG5e80Yat
 vh4MenQC5uWERMSQraT8OE8uNj8uaLn39+vhe8aB1dm5RLvfAJsuUxJFSBbd+Lu2clSN
 68RBaRDijgdjXWenpZk6OPKRwOG5AgP70HSHYrP5uMfgkoDPQwWEt6Dh7HPWIV/tWFrM
 yQnagQox37y7ATKAfuBGOFZxJ8c4SdBZI3vmg+RePAp27n81f0bWqcjVo8lUOvFzfH/n
 RlD3edP4rcm0ZAcFultBxN88tBYy1+ZtHW4x2ferWUFPT1RAZTHvYd6iV9sES4sGrG1x
 gl5Q==
X-Gm-Message-State: ANoB5pmuHA1OIMeMPl6ThvIiuJDCzrfCgaQknHf8pKKgF1Hl7bRGJ4tl
 lTjF8K7zXPQm/PQzgaaygauuaTyXati0DhwH
X-Google-Smtp-Source: AA0mqf4wy0REbZxVpkhr55V8spFgsqZAgi4/C9so6/y1rwmO15IFWUmVt+qPNUJwxx49MGESoYxWyw==
X-Received: by 2002:a5d:5b1b:0:b0:242:814c:2cff with SMTP id
 bx27-20020a5d5b1b000000b00242814c2cffmr19238527wrb.26.1671452359065; 
 Mon, 19 Dec 2022 04:19:19 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adfeb52000000b002423dc3b1a9sm9812097wrn.52.2022.12.19.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4853D1FFBF;
 Mon, 19 Dec 2022 12:19:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 Howard Chiu <howard_chiu@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 07/11] contrib/gitdm: Add ASPEED Technology to the domain map
Date: Mon, 19 Dec 2022 12:19:10 +0000
Message-Id: <20221219121914.851488-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219121914.851488-1-alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
index 727df18879..03d12b3ba6 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -5,6 +5,7 @@
 #
 
 amd.com         AMD
+aspeedtech.com  ASPEED Technology Inc.
 baidu.com       Baidu
 bytedance.com   ByteDance
 c-sky.com       C-Sky
-- 
2.34.1


