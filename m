Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD586B4FB7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 19:04:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pah5l-0001wT-V3; Fri, 10 Mar 2023 13:03:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5e-0001tJ-QC
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:39 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pah5c-0004bh-7V
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 13:03:38 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 p23-20020a05600c1d9700b003ead4835046so5244840wms.0
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 10:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678471415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=66O6js5YuYKZ11w3iRdKDgQbrfENXcjOpmWM7mo37Z8=;
 b=URomjHUUxmt8j3S+yPK/AqaWJLzeHwDd2JJ+Pb6LAbJl5ns5RHqeQLmW69eBTknei8
 cPw7CyvsYW8TvCMWSbOK5mrJaG9VoL1U/XZ0F3DqNCRgrEiOVh7/ieuRx6lNSOguibsK
 ut0mHSD2Ag/cMGUA0YzvpHVujhbDvrTeOu3yS+c2yb6909LohXqBgZrvtFuICH5FCgjp
 XDnFX1ZfFz6Au3yJYhJ//pwVC3l2CxI5QKMIHCSuFh9Ps8tHk6OTNNYuOjDJvsq8i+v7
 C31hBT8TBARd+5rjUWL1wD+DiCZ/LbxclnOUd6ss6HSnIdkfOPZQPbTAabmrDx1ly4/k
 cvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678471415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=66O6js5YuYKZ11w3iRdKDgQbrfENXcjOpmWM7mo37Z8=;
 b=cCqqc4dvBnWJVuYdRJxXbDj67B6QOvNn/O4Vw6ZeLRAVfodAk3i5vHTay+DI6YtyDA
 sr8YNVKl+tOc7A/1x412szayS5dx2n9Alh3QF6OgUT4rImKTZdQJAt6lMtnRUU/vAmSD
 ibTVRPW5EBDLTeeFZgbsANUZUmkzl7tm9cs8kFlG6dVlstHbRI4jtTgE1M/IPBb12rNM
 dyjYDPEwzdlot2u6991hw35WZ1i0+sImBUmNGp/j4FQyCSbsnzGsmxOiAU0MPgJlLBQd
 2AgYfHMOqsEjvssbNmNcBYh3Km6NVnV6RjNxv5tDrgqYZF1YoDG/bkSOaQ/gDz4RHBiq
 iqhQ==
X-Gm-Message-State: AO0yUKXF2D0fzT72zTiT511YcOL7JqITN8WSRMCpp57eWmxOiAtAB4y7
 ydd/emyXGsPMsuj3v5gytLodZmWo+pCGZMMfd2k=
X-Google-Smtp-Source: AK7set/H3YicqkGXGmFARnbpkn6DNPBmN24G9GOaNEE5S7sNOzsfJO0hiVqFVHn3dq0DRp1mJ58ngw==
X-Received: by 2002:a05:600c:b8a:b0:3eb:578d:ded3 with SMTP id
 fl10-20020a05600c0b8a00b003eb578dded3mr3539135wmb.35.1678471414966; 
 Fri, 10 Mar 2023 10:03:34 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a05600c350600b003e1fee8baacsm637320wmq.25.2023.03.10.10.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 10:03:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 42FBE1FFBC;
 Fri, 10 Mar 2023 18:03:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 04/10] contrib/gitdm: add a group map for Google
Date: Fri, 10 Mar 2023 18:03:26 +0000
Message-Id: <20230310180332.2274827-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310180332.2274827-1-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
2.39.2


