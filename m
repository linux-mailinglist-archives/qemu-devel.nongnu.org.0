Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C414AF478
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 15:54:45 +0100 (CET)
Received: from localhost ([::1]:40854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoMm-0002qj-QT
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 09:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnll-00030V-P9
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:30 -0500
Received: from [2a00:1450:4864:20::535] (port=44616
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlK-0007rC-Bx
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:13 -0500
Received: by mail-ed1-x535.google.com with SMTP id bx2so5324305edb.11
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bdScUadce3PB5EhVejsK4WtSulqO9m2KlFgdBHMRJyU=;
 b=sdINQ8pavGSjrvUMbkUm5vQ6WO7D8v/TR7Iy0lRGyAR2ATwN+lEH+PXa06tchBF/Tb
 sSwWtVRVoq7So2bDHCWO77nBBkHbq2U1gvfXTkNeVl9ODnR9rvEn1tLCUtAazh15tssX
 Tj+xjXzTp/fF5t2fRn236TCtdEG6jt4kD3Utg4MJNXhZpcJtWtiB5Ub2EMb1Wsvs57CS
 qqoPDyM+150IIVyDqiecjNJaJLw9xT0BxkcUuPjJhuqDFOvAepEkhcc9qIb3UM+/G4DW
 oWYXAe/hUEOtCVnWTsYyoUX2h3qAywNHdP0H0xkYDpNlezm5dM2I+wUr0ynrlTSR9s2q
 CpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bdScUadce3PB5EhVejsK4WtSulqO9m2KlFgdBHMRJyU=;
 b=OsLEJMUtH6suCO9OCT1Lr0gmAXgn+qpVjeYY769VPG/zekpRR3I+KKn9tqYx+omsB/
 WaJ9eIsL6g3FIcDcS5X1n6wOc0e2BMCIt9k7zdygM7AK338HcEcZyL6zppLyXbYO/GV5
 dQEUYeqWd+oN1Y+w15sJNQtEG/VFklshIeLNplql4GleyRdx+jELOmEf95+gccevxT2m
 4ImTa0Mn/1bq5mGZRUSLJooTQf7c7/LBWgAqOXLy4wS9PGNfjU/ANZYWOzK5XhkuRw3r
 vC1cAGAXPQlYyztJUp0RRbK59/11RMu1iWZBd7j42nGMfgLi7HyeNmGhlv+FNXvFqRqO
 aMSg==
X-Gm-Message-State: AOAM530FTh+cpgZV3kpQX9MlOow4iMHP9UIuBAQriKfSnuGNp8s+rngc
 T+vbjOWspb+MvoUM3xgfDsq5Qg==
X-Google-Smtp-Source: ABdhPJy+Q8ChcevZud/54rdE0+oDUTI9pYY3DOu9lWWmAGuM9fjiPNw66PtTWxCItfvN3LQST1WGmg==
X-Received: by 2002:a05:6402:b3b:: with SMTP id
 bo27mr2697794edb.76.1644416138715; 
 Wed, 09 Feb 2022 06:15:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ju26sm4647246ejc.97.2022.02.09.06.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B64371FFBE;
 Wed,  9 Feb 2022 14:15:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/28] gitmodules: Correct libvirt-ci submodule URL
Date: Wed,  9 Feb 2022 14:15:07 +0000
Message-Id: <20220209141529.3418384-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Correct the libvirt-ci repository URL to avoid this warning when
cloning / refreshing the submodule:

  warning: redirecting to https://gitlab.com/libvirt/libvirt-ci.git/

Fixes: 4ebb040f1fd ("tests: integrate lcitool for generating build env manifests")
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220121154134.315047-3-f4bug@amsat.org>
Message-Id: <20220204204335.1689602-7-alex.bennee@linaro.org>

diff --git a/.gitmodules b/.gitmodules
index 84425d87e2..f4b6a9b401 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -66,4 +66,4 @@
 	url = https://gitlab.com/qemu-project/vbootrom.git
 [submodule "tests/lcitool/libvirt-ci"]
 	path = tests/lcitool/libvirt-ci
-	url = http://gitlab.com/libvirt/libvirt-ci
+	url = https://gitlab.com/libvirt/libvirt-ci.git
-- 
2.30.2


