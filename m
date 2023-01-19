Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA603674082
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 19:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIZHB-0003IL-I1; Thu, 19 Jan 2023 13:04:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH1-0003He-Ht
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:27 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pIZH0-000110-1r
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 13:04:27 -0500
Received: by mail-wm1-x329.google.com with SMTP id g10so2205902wmo.1
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 10:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U39jLFPoVGl6SC7W57LZvwPqPrIa2zguvlEGBzL8cVM=;
 b=dxqi6WNfUgd1AWjf6fXDDCtUU/mu50PsV5otZ2DEvt/3sWGxRmaGLNSmevLwTJ5GAr
 i78zpv33R+HmcRGTq3Pzgq0ye8zm9SSd5ZweWOV3zo/x6UOoyUT62bJEt02H+060QQxT
 EBO6SgSkazB9rxmAWtwulyCW/ZsfAQn7TDYnW7j2VOFblQmR6enM+0h9eJuJ+iR4KmO4
 jB7w0hgMNHwee/qmVUjx87jCdc7DkbdjkBIQDkjuMGyiyKERoyWaKECbmdMItij1uO/w
 nKzYJiYmMrKMwApl8DthGkXYsefaACvbzOdx5IddmHD34ry40kfKUjStRwNistFCpXzc
 XJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U39jLFPoVGl6SC7W57LZvwPqPrIa2zguvlEGBzL8cVM=;
 b=1Cka4TtC5US9y6KJWoXz5ET13VtzyqdQ6/GD6zwZ2UigdPKf0ufNKBeD+Cmaogi2R4
 dYIFg0TEBL9HgGEBs5/ZkVu1lv9BNp9K+iTlc/SuXZqdDLxoL8DDnhbfaR1cf7UPzGgv
 I0+Uk6rut3jXFLSwoIjZN/JHiqpR88SYFcqvDK07PPC/OuoKDheo0UGyZiDoHZhDoXup
 nXPEc427N433fxKRXOw5qci/U8JQeE9Ktd6askw3tN7p9cMlyeoUWvSnVZg4jAMYZEDa
 bc0QZ27yV8tlNUOoSPkSpjNDx+lUoKGLC4VW8SZOvANzhfNcOAimiPooZDVGrb/f05FA
 tgJA==
X-Gm-Message-State: AFqh2kpuG3mf+S52tWMNgTP5sOoz+PXPzkRv9F7kWNwnlNhOBSFCkkys
 f7hll1FfxTb9YInvFMK9VezHPQ==
X-Google-Smtp-Source: AMrXdXs1oGMSA92mQni3Jf81D53DUFH8B3DuvaOZYYTW+YQF4wsYoOIqDmwlm8cXkmYWJwjEhqxxWA==
X-Received: by 2002:a1c:f310:0:b0:3db:15d9:1485 with SMTP id
 q16-20020a1cf310000000b003db15d91485mr6118348wmq.39.1674151461482; 
 Thu, 19 Jan 2023 10:04:21 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a05600c379000b003db15b1fb3csm4952823wmr.13.2023.01.19.10.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 10:04:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A84171FFBA;
 Thu, 19 Jan 2023 18:04:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bandan Das <bsd@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH 02/18] gitlab: add FF_SCRIPT_SECTIONS for timings
Date: Thu, 19 Jan 2023 18:04:03 +0000
Message-Id: <20230119180419.30304-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119180419.30304-1-alex.bennee@linaro.org>
References: <20230119180419.30304-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/base.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
index 69b36c148a..50fb59e147 100644
--- a/.gitlab-ci.d/base.yml
+++ b/.gitlab-ci.d/base.yml
@@ -6,6 +6,11 @@
 # most restrictive to least restrictive
 #
 .base_job_template:
+  variables:
+    # Each script line from will be in a collapsible section in the job output
+    # and show the duration of each line.
+    FF_SCRIPT_SECTIONS: 1
+
   rules:
     #############################################################
     # Stage 1: exclude scenarios where we definitely don't
-- 
2.34.1


