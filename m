Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10531278D04
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 17:43:53 +0200 (CEST)
Received: from localhost ([::1]:51856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLpt1-0004u1-0d
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 11:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kLpq1-0002u6-Op
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 11:40:47 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kLppz-0007dP-BY
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 11:40:45 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w5so4063388wrp.8
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3x5PcaA6AWZdD4AuM7M28/4PeqHLmPGilZe5KYRdCFE=;
 b=Ou/yZ/XMN+Aq4KvP6SeFI9e+Y8nlh8wk1kHq0WhIs2lceqK7ljSEqSHvu5erWk3a/j
 HD662YawxlDiEdPZ1Y3AgJgc9alqeW/m4NivaoMTc4MFhmxtZUBVL/u6KEL4VsTv/YV0
 8XUAkuT0RjY2iKnSKX4KrFZ41Fj/dbH4AyQqGeIw6EZD3o7zaMlmahVmsD7G7vMsd8+B
 IDdqQLk5xq0eYrgMfGoPMC7An+SORK4pzXiJt69ycAivaEQ1pSWPhlPWSwyt5wy51Glr
 fySh4Jdgp1jOOq0NNPAzK8hBnTPhHa4bXEaF4cRQlk2METz9wxLNX+MmR/xp/dDM16ru
 L0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3x5PcaA6AWZdD4AuM7M28/4PeqHLmPGilZe5KYRdCFE=;
 b=S+qEb/CIXkldjQkUOqTMrw0ouUqvhk2CqYsF/1PZS+VBQEh8CwFyZ94kfWkpBcjF+j
 SO2jgdO57v1pYr/h9EIN3uFVzYrFBpumhMR4FIiHbjbhWN4LwcduBVKJtz6InB2Ga0mi
 PED69ZahNCOt1L0wgsjdfv+/PVrsG2WHBbZWbEz/Ir8z8DW15v7oILzzSx1Y2HAqR+2Y
 N6bJzgH3wbqN9bX0GMmrSzhSEv7dnp5kWGGPxFECRCwp84lZG2eCb55BqAbuXZuIAXwS
 p2lGBvZ6fE/MrZRApYSNwqkibB45bM+XXGUb2rarAkTZ8uqjgsbYNfZZnvylY+ox3nHi
 foqA==
X-Gm-Message-State: AOAM530qndhuwf38zslHxNHBA0Yskt4zr+lu8BI3BlwHNYus4rxd6+73
 gqCppjSozdyJcawI3WSeOkpTkrNhf7gXVg==
X-Google-Smtp-Source: ABdhPJxOa+p56mXjaHG83TmP7xzIL71/Js7TKzmufvzfSYvluy2tjgGpguclPc9AiIoBb1bki/XWUA==
X-Received: by 2002:adf:f44d:: with SMTP id f13mr5133821wrp.224.1601048441516; 
 Fri, 25 Sep 2020 08:40:41 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m4sm3567484wro.18.2020.09.25.08.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 08:40:37 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FB1E1FF93;
 Fri, 25 Sep 2020 16:40:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 07/15] travis.yml: Drop the superfluous Python 3.6 build
Date: Fri, 25 Sep 2020 16:40:19 +0100
Message-Id: <20200925154027.12672-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925154027.12672-1-alex.bennee@linaro.org>
References: <20200925154027.12672-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

Python 3.6 is already the default Python in the jobs that are based
on Ubuntu Bionic, so it does not make much sense to test this again
separately.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20200918103430.297167-7-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 80da4ebc8ea8..023fcf71190c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -263,14 +263,6 @@ jobs:
       python: 3.5
 
 
-    - name: "GCC Python 3.6 (x86_64-softmmu)"
-      env:
-        - CONFIG="--target-list=x86_64-softmmu"
-        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-default"
-      language: python
-      python: 3.6
-
-
     # Using newer GCC with sanitizers
     - name: "GCC9 with sanitizers (softmmu)"
       dist: bionic
-- 
2.20.1


