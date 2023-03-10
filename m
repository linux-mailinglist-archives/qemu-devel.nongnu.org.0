Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEC96B4FC1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:05:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah5k-0001ve-Iv; Fri, 10 Mar 2023 13:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5e-0001tK-Px
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:39 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5b-0004bS-Fg
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:38 -0500
Received: by mail-wr1-x431.google.com with SMTP id e13so5826047wro.10
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ko/DDPr7iBKQ2SSoe58YPtJc2r00tLHTeI7zilAnSPg=;
 b=DSVy3D0gpBXdYNvpRdYy7j27ntIMxOHXl1j21U2JvS3cze1Xfg/UuEJjxYjidR8R95
 4VAVOC6ZL3GncMx8mvWhOja5fGBQ/W+XVHMZNldijKn6E2MIRhiWTvua7wnKyqYToqo/
 xRB2O+VVTOv60NGD0wSK5k0ROH4ExTNThB8+QKur2GrZjEMuNwOdjSpouJ9sSFGz0D3g
 eWFGzAhO+7F+jnKbUdMDNQfK9pR033ULY+d2vT6hU4LYH70kZDL4O80UXCsWwMpJnMSE
 ELeHefYSGbE9q7E/62vVeA8bmMVPindJRSqu8pbHWvwiFdyBupaqCCajjuHrAg4RMPC3
 dLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471414;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ko/DDPr7iBKQ2SSoe58YPtJc2r00tLHTeI7zilAnSPg=;
 b=qQMmuT5mSojIJKCeEAvFd8SJ8NNKAOCMsJB6+wn+Wp1dJzdmtYO7eV8z9AHSMH4V+4
 tvzbEEgHt6tfJ5yi78ZNP5JDI/C/ZZp1eX8CQKOp/i+Ad1TnjDDMfxELJU1m+Enz+DC6
 zEhkJoUmaOCnXPbD7B9e5nJBSV2TMy6aSsDii4/QKt+L5h7ktT3KBDh3Yi0T8jERbDLI
 k0vrgluuPfcCoq1xcsJUg5SanojbfEVFwbxbjrxIbxwkkdsBNc/NACAnyb+PBdf6tqVu
 qA7QtV8fGR4BdjX6PGVCAd3Px5Rt2REepZgXIVPNr/YHVtbAkbDCVHu7SPr/yfZkdvye
 lS5Q==
X-Gm-Message-State: AO0yUKXl0Fxxj+4TUUQ7x5+FVQOxNkUuNcl8DHiMGaP/qZg0u6GkKnD9
 sliErCOimP1WPOi+5Jqt+Z3WaQ==
X-Google-Smtp-Source: AK7set9JB0Ws7BoQeXR4VW99s3drtL/J1JM+DtKgM6Aa1CUbyW9OkXIAs7IseE/xOGYrlUhQiHXnpA==
X-Received: by 2002:adf:ee86:0:b0:2c5:4d17:f688 with SMTP id
 b6-20020adfee86000000b002c54d17f688mr18880036wro.15.1678471413723; 
 Fri, 10 Mar 2023 10:03:33 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n4-20020adffe04000000b002c54c92e125sm410375wrr.46.2023.03.10.10.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:03:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF2431FFB8;
 Fri, 10 Mar 2023 18:03:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Atish Patra <atishp@rivosinc.com>, Dao Lu <daolu@rivosinc.com>,
 Andrew Bresticker <abrestic@rivosinc.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Vineet Gupta <vineetg@rivosinc.com>
Subject: [PATCH v2 01/10] contrib/gitdm: Add Rivos Inc to the domain map
Date: Fri, 10 Mar 2023 18:03:23 +0000
Message-Id: <20230310180332.2274827-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310180332.2274827-1-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
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

Whatever they are up to a number of people for the company are
contributing to QEMU so lets group them together.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Atish Patra <atishp@rivosinc.com>
Cc: Dao Lu <daolu@rivosinc.com>
Cc: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Vineet Gupta <vineetg@rivosinc.com>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 8913a886c9..7a8077e241 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -32,6 +32,7 @@ oracle.com      Oracle
 proxmox.com     Proxmox
 quicinc.com     Qualcomm Innovation Center
 redhat.com      Red Hat
+rivosinc.com    Rivos Inc
 rt-rk.com       RT-RK
 samsung.com     Samsung
 siemens.com     Siemens
-- 
2.39.2


