Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B852650BFC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:43:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7O-0008GM-9w; Mon, 19 Dec 2022 07:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F73-0008B8-9w
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:21 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F71-0006UY-9s
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:21 -0500
Received: by mail-wm1-x331.google.com with SMTP id v7so6312343wmn.0
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7FzWPlNaZRqPTOaRpsaBpnmKSGhNniVNvI41HP2T7Cs=;
 b=V6MZ6bqHa8y588VDu+xYqfrWJzISfAs92WRaZFKJd2Ja9KrWuMMVNTsCmccTzGWHm8
 WzmIg1eSkchG3sIfDqY5C9iJsmr3+3QqVR455tIS2s2yAfK/eVoJsjXUaJY3H8looNhQ
 Xn0it0HIbhedofOp8rgGoqadzU8vahsv+Y20HPJeEABERmL1XLl55J/OXUWcTaIyNBFE
 qlrzTo3oaXMQWxfsyWnvg/BCYOJvm1pzJXhWW7lUV3fkfNMQ2hYouIpqfAOd1KG9O9ed
 Bb6wPvz7tj6CPkCSZT6V+M9tzNyQOyiKR0bfb4cqGM2fatq/z68FiMyRXyj/vzlmuG7m
 awhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7FzWPlNaZRqPTOaRpsaBpnmKSGhNniVNvI41HP2T7Cs=;
 b=4NnNFOIVOU9mABk4AViFOoxxCMnARUH7qC8JB2JkDFi/IyIGfddMZDxIL4XfhJlZ7R
 Q6b99sgG5X+9mSL8xjnStQx9CrFjphnJMUD4cNT5zcFLdN/Q3VoaenJDmm9eYonMdM0p
 ViFkKvGUe9eFBYyDlswVYwvvZxFyN5sGeXjC4hfCLWpLZwNCmU8uE++PwNdClFjXbz69
 nPfnZ/D6CAAK/zKqrTJaI67Qzgft5owoDOTaEtWduU1k0lRuzIEFQWXmGJNKzdordvBd
 1GAaupn3sjHmbAeDW3SZyIFpyPGJbCqdE2mrUGaJAccJnBRlGLBuoAcuqRKYjAivZ+rp
 P46Q==
X-Gm-Message-State: ANoB5pnuEXQ+kfrCTPQ90qIA0l9pqPpe9016oPqU7zhtMl0Yi0zPWCJ9
 pz4UVyb7pxdi6d+cFPf7Dm9M1A==
X-Google-Smtp-Source: AA0mqf7vtTaLg06wWBJPnibhqL0WXlSEgB/xrUOObOnrk51/4PG/fO3/3qhkXt7v5CU5aBV2+iTlfA==
X-Received: by 2002:a05:600c:1c23:b0:3d2:2f48:9443 with SMTP id
 j35-20020a05600c1c2300b003d22f489443mr18864613wms.15.1671452357803; 
 Mon, 19 Dec 2022 04:19:17 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a05600c221300b003a3170a7af9sm12093470wml.4.2022.12.19.04.19.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 62C011FFC0;
 Mon, 19 Dec 2022 12:19:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Iris Chen <irischenlj@fb.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?Daniel=20M=C3=BCller?= <muellerd@fb.com>
Subject: [PATCH 08/11] contrib/gitdm: Add Facebook the domain map
Date: Mon, 19 Dec 2022 12:19:11 +0000
Message-Id: <20221219121914.851488-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219121914.851488-1-alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Peter Delevoryas <pdel@fb.com>
Cc: Peter Delevoryas <peter@pjd.dev>
Cc: Daniel Müller <muellerd@fb.com>
---
 contrib/gitdm/domain-map         | 1 +
 contrib/gitdm/group-map-facebook | 5 +++++
 gitdm.config                     | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 contrib/gitdm/group-map-facebook

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 03d12b3ba6..22d7f953e1 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -14,6 +14,7 @@ citrix.com      Citrix
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
index f79d39df63..75b55b3603 100644
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
2.34.1


