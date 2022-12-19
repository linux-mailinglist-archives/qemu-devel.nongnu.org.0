Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A24AC650B58
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 13:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7F7P-0008Gu-6P; Mon, 19 Dec 2022 07:19:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F75-0008CA-Ly
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:25 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7F74-0006Vk-69
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 07:19:23 -0500
Received: by mail-wr1-x42f.google.com with SMTP id h7so8434868wrs.6
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 04:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kF28ZrwnZySdhRsN76Umj9672Car53maEea20t4NZaM=;
 b=hSDtv4GCuUb6cHVSIb01lOFgtNmQv5K/8KsTn//Kh8WRl0cKY8W1cP8mELnhxaOUhp
 g49lsHycxm0pomlQzXs9qyDs7lTHwiQLQVotMUyLDt37itlbOCELG0gQKj/4J6OFU7Hu
 WsYJ3DfPEHSU+RAmZwMKHa+PQnSJUE9phCIcOKySgxN2sujTXQTNJ9ru6lr1iWLT53dp
 BjmSBU4dJItzRbSWDIx2HRt39FmRwkcVujhSRBNeSI/l5qEQW4aMyssdw31StYau4I/4
 XD4D1+WDZ3+MFzls8wMvCzcjlCDpO1IMrMs/och5JINHUfYvWp7Ay7qGNuelS+FGJSZQ
 Q74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kF28ZrwnZySdhRsN76Umj9672Car53maEea20t4NZaM=;
 b=wXaNd9+CZg1mqZo7puNXZ5y/LOYGndxSzu8NWFC5XwnF5fKECTRyeJzYrWjVEjKeWl
 ZxiBO3QC9xWK3Nkm4O+QcLCdtr/76cfIPsYGV7up436/YMOmQXJBndmDGc7M7aotoGq8
 HkdCnV0DyqqJRDgCcCUGY+HKPUZkTw0XMwJXjU7uUMo+W4AJLMz36MlDAFHwqTnCE9VF
 2oVeSes6AZY6/pW109YTMFWTTUXbAM6IrtVN+/hESYjHpTntFPYC4Jy+HIG++6m4xS5+
 C372Q/58H5s2raajqzvSCZ4yk6oFDAAQpdM5uHANxXfuaTqRNrkpnVcvIwZdU8jTH5UX
 gh8Q==
X-Gm-Message-State: ANoB5pmqYiV6lJ8hz+rJ1HtK60zAn0K8A60NaNpiX8TkMjopPNbJxVqH
 Ldjfe/LM6STMwlulndaxp3vpSg==
X-Google-Smtp-Source: AA0mqf4HZiQ/CixHL2mTIkz8GkjvdfeWYodeeqJL+MmqpfnRMLn16mB81mK4ht3RzECAHyWILHmpMw==
X-Received: by 2002:a05:6000:1d9c:b0:242:75a8:31b8 with SMTP id
 bk28-20020a0560001d9c00b0024275a831b8mr26600630wrb.12.1671452359722; 
 Mon, 19 Dec 2022 04:19:19 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 ck13-20020a5d5e8d000000b002425c6d30c6sm11470935wrb.117.2022.12.19.04.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 04:19:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A5961FFB7;
 Mon, 19 Dec 2022 12:19:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marc Zyngier <maz@kernel.org>
Subject: [PATCH 09/11] contrib/gitdm: add a group map for Google
Date: Mon, 19 Dec 2022 12:19:12 +0000
Message-Id: <20221219121914.851488-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219121914.851488-1-alex.bennee@linaro.org>
References: <20221219121914.851488-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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

Long standing community contributors often use their upstream email
addresses when working on project.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 contrib/gitdm/group-map-google | 5 +++++
 gitdm.config                   | 1 +
 2 files changed, 6 insertions(+)
 create mode 100644 contrib/gitdm/group-map-google

diff --git a/contrib/gitdm/group-map-google b/contrib/gitdm/group-map-google
new file mode 100644
index 0000000000..8c53e0cf67
--- /dev/null
+++ b/contrib/gitdm/group-map-google
@@ -0,0 +1,5 @@
+#
+# Some Google employees contribute using their upstream email addresses.
+#
+
+maz@kernel.org
diff --git a/gitdm.config b/gitdm.config
index 75b55b3603..4b52ee47be 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -34,6 +34,7 @@ EmailMap contrib/gitdm/domain-map
 GroupMap contrib/gitdm/group-map-cadence Cadence Design Systems
 GroupMap contrib/gitdm/group-map-codeweavers CodeWeavers
 GroupMap contrib/gitdm/group-map-facebook Facebook
+GroupMap contrib/gitdm/group-map-google Google
 GroupMap contrib/gitdm/group-map-ibm IBM
 GroupMap contrib/gitdm/group-map-janustech Janus Technologies
 GroupMap contrib/gitdm/group-map-netflix Netflix
-- 
2.34.1


