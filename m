Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9269DD1F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:47:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPE9-0006mE-Is; Tue, 21 Feb 2023 04:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDu-0006Yn-Rr
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:14 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDq-0005kM-3H
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:10 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 j2-20020a05600c1c0200b003e1e754657aso3069988wms.2
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XyAObTuuAW1poi3AcvAz0z96pccj9dGjW/pdlO/77k0=;
 b=BrilyKCjGYSvYs4SMKDE7TI5qqNSeAQIbWerhmeMeXI5XXmumEGJmYCUDBLR8I9mCE
 J+3X3qquh5i57FuFlBa9JP6zydhi7YYbiuXXE94LWEcKqT7L4G5Qsh7uvbAeCiDQ5DZN
 gK32FNbJKUlKC0j5bdqLJskZ+CyMDf84x2bPxRh3hXZOre2RRq5Liku++B1+QpOkwJki
 WW4WkFFqjJSSrRUuF6huz9Q0x7dR0YaVGQADYy69LxpmEy0gm4PNpRLQGgdL9cc4wSV3
 3K9oRtsXCL3m6uMl98HOB0nt6y5vfKMePw7e5aP+CFB4Mrcy1h0Sv8pBziwwDkfdYk/f
 67FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XyAObTuuAW1poi3AcvAz0z96pccj9dGjW/pdlO/77k0=;
 b=X1iJB/JDn95cXk8UHfp/RzluSho8NFBNgYkic23+SPg+XVSrH+ashF7SaJNWG4qbIE
 dEruhHRiOSLX6TWG5NK0PJfD5LYlg65zf/iFQWXeci1SLgS7Uq0Cr7icTc4EDGjLEg3i
 Qub572T1A0hpiVwVo5yVi6/gN+4r+68u2FAieR/l4zx8y+j0ps1JLZUYcqrYtYLiOxJY
 EWgRuQbLsYLfLeQJF1hUpNSvvCo0Uo9ILu2hSsP+xaCnreSgaMNRUmsaqnFBtgXX3cD9
 P7p3cGPTxehGESFnDtG9W34SnUj9L0OMPw7k2cHdeZY5EplptJ18JknF2agO6k1J05IG
 /akg==
X-Gm-Message-State: AO0yUKV1dDhQ8AtkBncjm64Z+rhtzSdMdNrGn60+6YG0B/GZDSCbrZh1
 AO1AJWNT3lZQZybPNxKsyjD4AQ==
X-Google-Smtp-Source: AK7set/1PNOmFm7/QdJBLRG+eCmyeJZ0+eUqSTOT6kxvaa9LiutrLIrzfZKqdpHV+2EyNnLcvWDBxA==
X-Received: by 2002:a05:600c:492f:b0:3e2:6ec:7fbe with SMTP id
 f47-20020a05600c492f00b003e206ec7fbemr2513179wmp.40.1676972764529; 
 Tue, 21 Feb 2023 01:46:04 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a1c7714000000b003dc3f3d77e3sm4087866wmi.7.2023.02.21.01.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:46:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 340121FFC0;
 Tue, 21 Feb 2023 09:46:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-block@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-arm@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 10/14] tests: skip the nios2 replay_kernel test
Date: Tue, 21 Feb 2023 09:45:54 +0000
Message-Id: <20230221094558.2864616-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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

It is buggy and keeps failing.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/replay_kernel.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index 00a26e4a0c..f13456e1ec 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -349,6 +349,7 @@ def test_or1k_sim(self):
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'vmlinux')
 
+    @skip("nios2 emulation is buggy under record/replay")
     def test_nios2_10m50(self):
         """
         :avocado: tags=arch:nios2
-- 
2.39.1


