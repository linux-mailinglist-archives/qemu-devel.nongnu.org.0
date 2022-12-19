Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A5B650B61
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:22:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7M-0008Fk-7p; Mon, 19 Dec 2022 07:19:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F72-0008B4-6d
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:21 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F70-0006UJ-53
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:19 -0500
Received: by mail-wr1-x434.google.com with SMTP id co23so8441836wrb.4
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9oYjwmqrokYAXrLM3LQNNt+1oWukhEs3CkOuAlkYOto=;
 b=yEGnRYXU9mvndFig0RcHYQqpBB+gXPWOpWtwEkmLboalZjjFmI53USnfoQjatrL14A
 u9ImZucngIAib1ofZitPWf1wNtkbNRY0zrlnT0PvUPOVisGgLZLCnV8pNPxY5vKzyjS8
 lBVjCGAHSd+okDHHv131mKX0q1KRbI2kE5aKG2WYaI8azEOXeo/Bm2x7EZ4YigCnGwSz
 m4L/J5/FUNd8j0iiGCXTzHy8Gxznn2bm6/w/EXAdJ8kbvNl7trCb/ZELmDN91qgGyM68
 im8XYuxjlASEesrWlp8BbMUK8P/gj6eyr693bsyFasAgp/TkUnJGB+OqMNi+6ZuynT8S
 27VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9oYjwmqrokYAXrLM3LQNNt+1oWukhEs3CkOuAlkYOto=;
 b=2NnACH/dmJfN5FQpWqFmj0J2Nj6+vHQzOWe/AUgL5wPZxhxFYxMiLY/sCJ3Izx8quD
 V3vAV5zlTPVeTZJ6o7/QcavV4Quf3/VKG6PBlV2amPMov/eGmfEVKIkoifyvwWBRe3Aw
 zZylb1n+tAeFo5YcSj7Xvr3PKy+9hYRPBVBzYbZ4+pF+x+lU6qah+OADenHiJROyMqEQ
 HpgrRWN/9oxb9FDig8AMlsKTEbz9Mj4qfVhq41dbl2aScjNOyFbMT9Q/li2louWmRAyJ
 xcvJGdVMIaKSteJDBcD9J/+HurMT2aeixe1VsWIWS4CMaL5ECOFWybnN3xmcE1QbJm5D
 UQUA==
X-Gm-Message-State: ANoB5pkOwSHryWCAbJWP3JL/Ydy3by2st/A5rZgWyX4Ssj+ppwMmMDRU
 L6IhMG/Np7IkLnPiuO0oYVEtcw==
X-Google-Smtp-Source: AA0mqf7/ee5yh/P6UaTtb6nK5qjXKf/K5n9ZebIT9+NUl/4LiGVNopfglk2c7LuqvJ1gOeZVm5PAQw==
X-Received: by 2002:adf:e2d1:0:b0:242:9e7:3d54 with SMTP id
 d17-20020adfe2d1000000b0024209e73d54mr25630112wrj.60.1671452356780; 
 Mon, 19 Dec 2022 04:19:16 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 w4-20020adfec44000000b00241dd5de644sm9818062wrn.97.2022.12.19.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DEEF91FFBB;
 Mon, 19 Dec 2022 12:19:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Subject: [PATCH 03/11] contrib/gitdm: Add VRULL to the domain map
Date: Mon, 19 Dec 2022 12:19:06 +0000
Message-Id: <20221219121914.851488-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219121914.851488-1-alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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

Philipp I assume I'm correct that the QEMU work should be shown as a
corporate contribution?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index da51c44ccb..7ff511d5c6 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -40,6 +40,7 @@ sifive.com      SiFive
 suse.com        SUSE
 suse.de         SUSE
 virtuozzo.com   Virtuozzo
+vrull.eu        VRULL
 wdc.com         Western Digital
 windriver.com   Wind River
 xilinx.com      Xilinx
-- 
2.34.1


