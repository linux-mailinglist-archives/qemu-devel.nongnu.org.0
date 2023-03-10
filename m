Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B546B4BCE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 16:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paf8P-0006cM-Tr; Fri, 10 Mar 2023 10:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7p-0006Wy-DA
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:46 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paf7e-0004Kr-UG
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 10:57:45 -0500
Received: by mail-wr1-x432.google.com with SMTP id bw19so5463719wrb.13
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 07:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678463849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DnTHLUIHzuvMqSb7OZt+pmR7+LqlfFNHqQrwYebGJyU=;
 b=IHFH+ZddhHX+QjoEuvsivowrsdbG1Gmiej81Ko5tCopEK3Yhks6Ams6QiY9GjxpGKe
 +/BYhtOR9cMy0lnM0cQceibu1uzH32dDSHIr6DT4gl4Gh3nMiM366INm3JMlMBk5S2Om
 PfDo4C0v4YYxeEyAIQEe3tYzumMupFhd+WC9CNDAdbV9HQB/TKwOL9wxOGoJwRBNA753
 WeArKnNCc8pUA+sYtuYVfNM902N4vthwvC1IPQLG94LZ2e4jqfksU7/2yy9iXFtw0n6i
 Fl9Vi/itMtslbclXclrXZ0wkFQRjrRVS4mJsbIiA/QSdUjBeEOmHe2QPW5i2RHl1yVvl
 Xyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678463849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DnTHLUIHzuvMqSb7OZt+pmR7+LqlfFNHqQrwYebGJyU=;
 b=Jgeaj5oITHm3kiRi60B1+7wznTo1+kLMOzY8oqCT/o0I+05uS5lmEu1nRbt6MnOu7+
 S2VPjVCgBH8Rp+A6XVL5vLjddVKjZNquzVKYTey5FY+crWyCbVKX5nnZKEeAkjt6yr2r
 YZ1i27lKQqqkudfl81I+H/tYiVpbDCBcvbLxtDkfDekXBPM2m43TTITiER3Ik1oLu/JQ
 B/QxC9AwqTR5vX1SHuCsybuRjEYqlTBLlpWMlVjtjYSqy/UXEcsDAVbSCXooWf+E2Hvs
 +XgzKNAXSTki1zXes37/j8HO53I8JyQwhcVf8Bwm8Wl2+K1mwBzssMLA2WB4iMuIshaK
 R7MA==
X-Gm-Message-State: AO0yUKW18eJye51EY1+8ScRZnk90A9IwCitC/x2Wve7pXFIo9sXYb8oo
 vi9OCMHwJ6c51cJ24JB9ZYE21AfEqcEDbMEpDig=
X-Google-Smtp-Source: AK7set/FNVAvk/QNbQmiC3CSq9p/5ag57SNWJvr532vxWPk+/JfsHWlX++rANR/c1Fe3nyE/N7UX+Q==
X-Received: by 2002:adf:fe86:0:b0:2c7:a9ec:12 with SMTP id
 l6-20020adffe86000000b002c7a9ec0012mr17976459wrr.11.1678463848794; 
 Fri, 10 Mar 2023 07:57:28 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a05600c2cce00b003df7b40f99fsm313907wmc.11.2023.03.10.07.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 07:57:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 22ED01FFBC;
 Fri, 10 Mar 2023 15:57:27 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Iris Chen <irischenlj@fb.com>,
 =?UTF-8?q?Daniel=20M=C3=BCller?= <muellerd@fb.com>,
 Peter Delevoryas <peter@pjd.dev>
Subject: [PULL 4/5] contrib/gitdm: Add Facebook the domain map
Date: Fri, 10 Mar 2023 15:57:25 +0000
Message-Id: <20230310155726.2222233-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310155726.2222233-1-alex.bennee@linaro.org>
References: <20230310155726.2222233-1-alex.bennee@linaro.org>
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

A number of Facebook developers contribute to the project. Peter can
you confirm your want pjd.dev contributions counted here or as
an individual contributor?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Iris Chen <irischenlj@fb.com>
Cc: Daniel Müller <muellerd@fb.com>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Message-Id: <20221219121914.851488-9-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 1ea20b9890..8913a886c9 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -12,6 +12,7 @@ citrix.com      Citrix
 crudebyte.com   Crudebyte
 chinatelecom.cn China Telecom
 eldorado.org.br Instituto de Pesquisas Eldorado
+fb.com          Facebook
 fujitsu.com     Fujitsu
 google.com      Google
 greensocs.com   GreenSocs
diff --git a/contrib/gitdm/group-map-facebook b/contrib/gitdm/group-map-facebook
new file mode 100644
index 0000000000..38589f8fb9
--- /dev/null
+++ b/contrib/gitdm/group-map-facebook
@@ -0,0 +1,5 @@
+#
+# Some Facebook contributors also occasionally use personal email addresses.
+#
+
+peter@pjd.dev
diff --git a/gitdm.config b/gitdm.config
index 288b100d89..907ffde017 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -33,6 +33,7 @@ EmailMap contrib/gitdm/domain-map
 
 GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
 GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
+GroupMap contrib/gitdm/group-map-facebook Facebook
 GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
 GroupMap contrib/gitdm/group-map-netflix Netflix
-- 
2.39.2


