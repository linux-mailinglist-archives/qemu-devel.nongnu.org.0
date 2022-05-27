Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E12B5364C9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 17:38:36 +0200 (CEST)
Received: from localhost ([::1]:40888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuc2t-00030i-6m
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 11:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0a-0000Gl-Lb
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:12 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nuc0Z-0002Pq-67
 for qemu-devel@nongnu.org; Fri, 27 May 2022 11:36:12 -0400
Received: by mail-ej1-x62f.google.com with SMTP id wh22so9520200ejb.7
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K0aDCVCigtWeuYHZimiv2l38HXr+Qp/1QfyEKgkPNu8=;
 b=BBDY1D2XyRORTSPLsr6a7oo9qGPQb9ZKSpBF2ddlqQmw+Gk1jspGA+Hm0GT1+R5eGR
 U62zNNkPYsh5uM35mG25ZH+rYXv01iVIj7HYozVGKeQVt/xMNIpNFBUcgl78stL1URWp
 KI9td9fG7XN20UjbI6/OCG7x3oBbBg7WTcm3MuJ/IoLe2h2PJ8DA7efGyN4Qo+IAvPy0
 FZtZrkFUWRgNFfOC4eVlwk+IGB1by8J+HGWlesd36I1gzLmSeEiqyNxFKzNEi71+QmAc
 ZcR9WT0eUfDwvChJHODkX02+ppdsaiZRbQ53KMGozXDeQqJOIA0n9I6DL8qFDcU+p32b
 yogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K0aDCVCigtWeuYHZimiv2l38HXr+Qp/1QfyEKgkPNu8=;
 b=JicDni9Kwhghm88ifUvAxtx1KQe6DE/HhEFrIqZ8cvHSyJbR4ICGZQnCUzkPEv+g9G
 pefl11VlkjrCeFzIA1d1ZwGdPUrrVh2cdbOAuzPx0/3pHCK2D/DjfH5du1UUsEozr9hC
 +mOdrf3HqNRxQNbr3S11JJtSvou+JREQChF2PesBGA6WiVjA++L0LHt+dVBDPUXpGREK
 +9wag2/mHmYx6Qme/7z1rROd7Bu/7I8u9o/FkaDtv/a1Hi8+4tGMII6PlJZJcwFy5B1/
 SYcv8aFxjee+wVFFHIYTZRTjjwt2/3h0iwAEy1VZJI858jE854FDEUFf7Nzlq8gv6mUo
 O98A==
X-Gm-Message-State: AOAM533OI92TnXEpGAOY/OxzXn3NvfaX6dTnkw+yCrN2sIKHQWMobxX7
 nFjfxDil3LJ93Ej41Yx0SLCnKw==
X-Google-Smtp-Source: ABdhPJyyf61HcydmA77CnRQZyW8psRCYwJEOtqC6vwmXW6MI+a/ly50yzQKzMgtMdE34ozqL+kmTOw==
X-Received: by 2002:a17:907:3ea9:b0:6fe:b416:fe20 with SMTP id
 hs41-20020a1709073ea900b006feb416fe20mr31938454ejc.358.1653665769836; 
 Fri, 27 May 2022 08:36:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056402348500b0042b607daf7dsm2344679edc.45.2022.05.27.08.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 08:36:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E979B1FFBB;
 Fri, 27 May 2022 16:36:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 03/33] gitlab-ci: add meson JUnit test result into report
Date: Fri, 27 May 2022 16:35:33 +0100
Message-Id: <20220527153603.887929-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220527153603.887929-1-alex.bennee@linaro.org>
References: <20220527153603.887929-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220525173411.612224-1-marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest-template.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index dc6d67aacf..b381345dbc 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -44,6 +44,8 @@
     expire_in: 7 days
     paths:
       - build/meson-logs/testlog.txt
+    reports:
+      junit: build/meson-logs/testlog.junit.xml
 
 .avocado_test_job_template:
   extends: .common_test_job_template
-- 
2.30.2


