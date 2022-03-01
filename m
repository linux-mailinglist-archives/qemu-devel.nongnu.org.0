Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006D94C88EB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:04:52 +0100 (CET)
Received: from localhost ([::1]:48468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzNC-0000PH-QA
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:04:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6Z-0003Tx-7O
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:42 -0500
Received: from [2a00:1450:4864:20::42b] (port=46929
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6W-0007Aa-Vg
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:38 -0500
Received: by mail-wr1-x42b.google.com with SMTP id e10so1948738wro.13
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SBfeWOX3YKTOjWxwbQ6GNj0bh7YVir8jH0zEi/hdLKE=;
 b=kUUC6k3H+NsiQGBPFzDYEri7aKnOmL+WAfv9ij7KVqOpgD4CCSIuKGTtLfy1s5ZpUg
 boLAmqxQ5pzNHAXkupOSM/11YW/HePO/DqU6/jsN/AX/9VwgxlKt6suYcghdS2WdRHDs
 GJmT4ecoREOJS35tIt/T8l42hyZBRPzqpx35QDxoil8QJkIxHkg7j1D+Aat8pwl++XuB
 LS9nw8oUGR/qNydk9jwbJwMEBNadrsAVwSWQ6l2RdjK2MuS+c5AY/HUeLEIK9+CYqMb9
 OYqFKxrWhZZW45ux35hNJKS6oAzPAhfjnNeIzOJ6wRoHup1fm0i+0NXPpvUETlgX6kjL
 vyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SBfeWOX3YKTOjWxwbQ6GNj0bh7YVir8jH0zEi/hdLKE=;
 b=LLG08k6VyRZwG3b3PldDexBbt4I7p+FNHWzCelAsojp6ugudvgYNyp5EdZESBkAESF
 o2hDZLGzQXVROOnq/fPNhEpIq9l/8iheDoH4Iag6Z1qZkq27zJ1/VCMcOE5IsP1wlH3E
 GfxfT2ENhZkTKeDXsgguMcloevjS0zt6zyBabyUM3y6MdDqkLXFBrcspUrC2idrkS9Ah
 CIcq6xZRnn233/2+0DiTUt28u3PYvxrV2mZwDr4BHz9Jyeh+2/3yPVjPHiaa2hKIJ6EH
 6eyHPo9WpR3dgduN5I4uNd+ZaYybhY1W94A8ZNH62C/5rSEoWpW6OQYHrBpK0lKfjCpK
 5PhQ==
X-Gm-Message-State: AOAM532GWGD38VZq0FgXvtG49D1Wq66rXaUAPkK/qyAAAyCnvIlSqxKQ
 PVLZH3N4lmsTi2LtUsjRTUxDQQ==
X-Google-Smtp-Source: ABdhPJy7VIdJg/qPfWoYBZee/YBS8roSeXPLq2Z3xKhTZFWHaSFM3K2xg0cShaVJGAyYFx2LugZv4A==
X-Received: by 2002:a5d:550d:0:b0:1ed:c155:6c2a with SMTP id
 b13-20020a5d550d000000b001edc1556c2amr18758355wrv.470.1646128055688; 
 Tue, 01 Mar 2022 01:47:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o12-20020adfa10c000000b001efb97fae48sm7355191wro.80.2022.03.01.01.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D6A41FFC6;
 Tue,  1 Mar 2022 09:47:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/18] travis.yml: Update the s390x jobs to Ubuntu Focal
Date: Tue,  1 Mar 2022 09:47:11 +0000
Message-Id: <20220301094715.550871-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

QEMU will soon drop the support for Ubuntu 18.04, so let's update
the Travis jobs that were still using this version to 20.04 instead.

While we're at it, also remove an obsolete comment about Ubuntu
Xenial being the default for our Travis jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220221153423.1028465-1-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-15-alex.bennee@linaro.org>

diff --git a/.travis.yml b/.travis.yml
index 41010ebe6b..c3c8048842 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -1,6 +1,3 @@
-# The current Travis default is a VM based 16.04 Xenial on GCE
-# Additional builds with specific requirements for a full VM need to
-# be added as additional matrix: entries later on
 os: linux
 dist: focal
 language: c
@@ -190,7 +187,7 @@ jobs:
 
     - name: "[s390x] GCC check-tcg"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libaio-dev
@@ -233,7 +230,7 @@ jobs:
 
     - name: "[s390x] GCC (other-softmmu)"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libaio-dev
@@ -263,10 +260,11 @@ jobs:
 
     - name: "[s390x] GCC (user)"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libgcrypt20-dev
+          - libglib2.0-dev
           - libgnutls28-dev
           - ninja-build
       env:
@@ -274,7 +272,7 @@ jobs:
 
     - name: "[s390x] Clang (disable-tcg)"
       arch: s390x
-      dist: bionic
+      dist: focal
       compiler: clang
       addons:
         apt_packages:
-- 
2.30.2


