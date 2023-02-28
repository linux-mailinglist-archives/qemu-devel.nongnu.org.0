Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF4D6A5F72
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:15:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5Qr-0000Qi-IJ; Tue, 28 Feb 2023 14:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Qp-0000Pt-2w
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:14:35 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Qg-0004fL-DO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:14:34 -0500
Received: by mail-wr1-x430.google.com with SMTP id t15so10892210wrz.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=juqxsICOPp3A62rldcSyP/QqnqSG5zUxj23C7nES3tg=;
 b=aEifid6CNHyOm94lyGmnYvg9LqvQC1l38G5B8CHEY/MpZhu7C5ZZ/o5gZ7lb8B6x/R
 n52w2h5ULodce8p+8OPv2/1+R8aemxUSZ7dZ9CfhqYubBDUIlSAK0ING3I9LPoOigEp3
 hEGAyoDzS6We3/13w1+f7QekweoxMuDt3o286NQo3TqfOkEy0t+7GPkottKgca70YNg6
 hQB/7nmluBgrhLGPpuEx5g3SHHPxQp/edpypH2/NZk4etbhE75EEIKFBoIZf8mBvuAms
 h132Ji9kvGlSReoVfUE4bb6YPSRCy1mPY3N3wBC/GUc6e0mfllyCTqTtHXIPP5vnNeYI
 GMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=juqxsICOPp3A62rldcSyP/QqnqSG5zUxj23C7nES3tg=;
 b=lfJ66jQ57RIiW4j9t7Dbrcm+76c92xmEP7eRtCOkdAP5CcZcNCyEyrs15X0vSUo81M
 2y2R0apain2jGPMRkFpI3MFpe/l8QSNwurqHFlprOCrn2puRXT03VLdUVo30F6aZcJjb
 FVeqw1nDjyD5NFQmkPNuoOiVHHuoHCPR/GN/ysTi3ALjxnlqhjatLmGRyp7YEnzarbbj
 uIKcH62ZHKPTc2uXetxHRQ0isk7vTBonkSmzAdeYZu20M7UJQIPPpoEProA16GBryHtr
 3JLfvH/g/d3f1Z478jF2XnMsuOp/PuVxF6QwH/+MF+2XOrtunT0XMnTUfWtTu4YvDosd
 V28A==
X-Gm-Message-State: AO0yUKWWQkay+1TlAczlgaXQLDxLVYnRO9c4jS47hmaUWWQ727J/o7rp
 R0VD3PfYZvdGvqmJddSSmBrM5A==
X-Google-Smtp-Source: AK7set/+4482SMpdaqJ+xGzLZkSEwi1g4oHOPfe/pXxERh0QxetdO5hhID5LOO4UY5hG+0SelZr0dQ==
X-Received: by 2002:adf:f583:0:b0:2cb:8f6a:6e7f with SMTP id
 f3-20020adff583000000b002cb8f6a6e7fmr2974313wro.35.1677611662356; 
 Tue, 28 Feb 2023 11:14:22 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d51c5000000b002c70d97af78sm10764063wrv.85.2023.02.28.11.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:14:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8BCB51FFCB;
 Tue, 28 Feb 2023 19:06:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 24/24] tests/avocado: disable BootLinuxPPC64 test in CI
Date: Tue, 28 Feb 2023 19:06:53 +0000
Message-Id: <20230228190653.1602033-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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

This test is exceptionally heavyweight (nearly 330s) compared to the
two (both endians) TuxRun baseline tests which complete in under 160s.
The coverage is slightly reduced but a more directed test could make
up the difference.

tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_ppc64:

Overall coverage rate:
  lines......: 9.6% (44110 of 458817 lines)
  functions..: 16.5% (6767 of 41054 functions)
  branches...: 6.0% (13395 of 222634 branches)

tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg:

Overall coverage rate:
  lines......: 11.6% (53408 of 458817 lines)
  functions..: 18.7% (7691 of 41054 functions)
  branches...: 7.9% (17692 of 224218 branches)

So lets skip for GITLAB_CI and also unless AVOCADO_TIMEOUT_EXPECTED is
specified by the user.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/boot_linux.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index fe0bb180d9..f09f7b1dbf 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -84,6 +84,8 @@ def test_virt_kvm(self):
         self.launch_and_wait(set_up_ssh_connection=False)
 
 
+# See the tux_baseline.py tests for almost the same coverage in a lot
+# less time.
 class BootLinuxPPC64(LinuxTest):
     """
     :avocado: tags=arch:ppc64
@@ -91,6 +93,8 @@ class BootLinuxPPC64(LinuxTest):
 
     timeout = 360
 
+    @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_pseries_tcg(self):
         """
         :avocado: tags=machine:pseries
-- 
2.39.2


