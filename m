Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9805F4459
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:39:01 +0200 (CEST)
Received: from localhost ([::1]:40092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofi8S-0000F8-Pm
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgR-0007WZ-1m
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:03 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgO-00009r-Tv
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:10:02 -0400
Received: by mail-wr1-x430.google.com with SMTP id c11so21255325wrp.11
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=U2/AriSXMOEMkyTzF4SI8zkGiR/vAMpS3OCva9QGR3s=;
 b=k6oSafXjnBUiIGHFxGDjAedTydPArNiD79+EEQ214OqEx/2SDxI4MHtva4f3RZJG+f
 QKSYSB0iX8sDIoDjMlXYu6/dQFMwRzOO/GtikkW7RPH3ljxec6HkntmYEfz7vKK7KxWG
 eNHzGJEZ0YurfOzA+P+nzRdc03rM1sLvcrVPcJwq1+OrWMTUmv2Ep8caZFFMGb0CWb0w
 O3KqQdSRydGjvaHXW+uKhgaku5tYDd9OMVpd9xjAxDSyDif7AZtybT9KPff8PBaxMI6J
 bD3MRjZ1w7Zs9eYyC3t51LbA++dj3q3DoMOAvzp2Ik/ezPbYH4won+1wAr13npSFm7Zi
 NEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=U2/AriSXMOEMkyTzF4SI8zkGiR/vAMpS3OCva9QGR3s=;
 b=DQegur5YL4gC53mv847YbwOIdSN7O0RaYc3AvSKUKnazSORxk9QBbh5wZNDPu3hoMc
 WIWv02mTvhWfA58MoGJiJNwPx9uSMG19cqQc5uNVuHFf7UqItq4gsgPhwruxWVO4AxsZ
 9K9vsOUvSk0Lpg/bZEaoiaoOBRkXq7KfkJX1LsHqywfaNw6ToDf4R+vroQrjc28moG/Z
 Xy52WUbMWTEfI5Vu047oe+Cx+VvsdVNUxvukTU0//iBrk5PDW6OZj/4HxdaXnRpLJc1x
 0M/yfMFGFJfl2xvb/xISGPZ8lRvko5heRk3l4goOgpuSo11vgYA9rkP5xyWasHqwO36L
 HTVQ==
X-Gm-Message-State: ACrzQf1XHYzugttHKb7PsoRVH+7LtNpT/dC5GNU0uMQQv2eZKtVJRrQN
 DvIZ1eeldBaVRIVnnrw/+l+4Zg==
X-Google-Smtp-Source: AMsMyM62FBRsP5hCoYsXhm9O7DrkoOzhv6SdwFHkL6QjzF2859m6WhKdES142H/qg4RiQMB1uunnIA==
X-Received: by 2002:a5d:5909:0:b0:22e:57b2:260b with SMTP id
 v9-20020a5d5909000000b0022e57b2260bmr980463wrd.597.1664888999508; 
 Tue, 04 Oct 2022 06:09:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n189-20020a1ca4c6000000b003a8434530bbsm626277wme.13.2022.10.04.06.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:09:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18A3E1FFE4;
 Tue,  4 Oct 2022 14:01:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Weiwei Li <liweiwei@iscas.ac.cn>
Subject: [PULL 50/54] contrib/gitdm: add ISCAS to the academics group
Date: Tue,  4 Oct 2022 14:01:34 +0100
Message-Id: <20221004130138.2299307-51-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The English website (http://english.is.cas.cn/) in on a slightly
different domain but has the same logo as http://www.iscas.ac.cn/.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Message-Id: <20220929114231.583801-51-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/group-map-academics b/contrib/gitdm/group-map-academics
index 44745ca85b..877a11e69b 100644
--- a/contrib/gitdm/group-map-academics
+++ b/contrib/gitdm/group-map-academics
@@ -19,3 +19,6 @@ edu.cn
 
 # Boston University
 bu.edu
+
+# Institute of Software Chinese Academy of Sciences
+iscas.ac.cn
-- 
2.34.1


