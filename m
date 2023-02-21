Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4F969DD2E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:49:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUPE6-0006iL-SX; Tue, 21 Feb 2023 04:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDs-0006YF-DR
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:08 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pUPDo-0005iO-3G
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:46:07 -0500
Received: by mail-wr1-x429.google.com with SMTP id r7so3541824wrz.6
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fPMJZKPW+lS52lKT2TCgAnBcE8BtNLFJK6252gDfDns=;
 b=ewmLyAlEqI8ExrnzJ4o629Hx+2naRUe+He88wAsS1qwvHnZpQeSwOgaRd1izFWLsPv
 djSOs7+k9bOXk0Jh/wKG0kHH0EXXAq+QYidCFblBxGPsxSckhuwnjMw92QNA3l8E6O4Y
 0WhZ+wJpUPSdrRllIWT+jG/X46HJS35zq1S4aBEd0u4zZ6ecLQSgkmY6MPPMi3xWDKPe
 ErdtZ9UoVH75EvFQ52Ldtfv/coNqWYh1/Vimsc2ZB7V8fihCsNdpUTwwTMCLS57/oFmD
 ABQ8oepZ1WgT0VynYxIqzNGOKx1iR/HorQFPjR12r7MyM7DGNup0RU4QAvYI6Edqlw9o
 O9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fPMJZKPW+lS52lKT2TCgAnBcE8BtNLFJK6252gDfDns=;
 b=0wDgNEIhlyYNZj2rz7gzABuD5XWJ2cEUXI9eec7IQdb3Tkbjyx120PZfnaZIW8CLqh
 piw52WRTKvPqaVIGrvdj8OvVYEwNnSQI70QNOQ7MQ2/0L6LFCeV0j4UTKL4tXfVmt74S
 ml6IOY+0M7Fv1R7N9dwjnNQDCBC8VV3rugCHEq2iHUKmc4ydesrGa9BUljRGEm4QRlUt
 NPJiw1YpDA2wisKZWDlvD67nrM+CQP3ws6dL72oAAJNvloEQx9PD7/QVo2/WNr9I5Kvj
 pAyxzlIHJ/H8MAcT4HRJ1RSceewVeE8I8SbzPHO70K4Fx1OzQYpRMBs+N9gPdpPYRt/r
 +kuw==
X-Gm-Message-State: AO0yUKV7TBYyTV2+DE2B3f2JGOOCLQpavtySWZW64y+6975JL+17031r
 nMcD6Mlua2dd0V4pkDqFlV160Q==
X-Google-Smtp-Source: AK7set9jOJCWcR6s8ES7zfIaBPz38gAVbQS6iqHD29AZDADm6dnxiGDDG3Sda5FoPwSI28wPo3s9tQ==
X-Received: by 2002:adf:dccb:0:b0:2c7:691:18b4 with SMTP id
 x11-20020adfdccb000000b002c7069118b4mr732405wrm.39.1676972762183; 
 Tue, 21 Feb 2023 01:46:02 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o24-20020a5d58d8000000b002c7066a6f77sm738070wrf.31.2023.02.21.01.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 01:46:00 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B010C1FFBE;
 Tue, 21 Feb 2023 09:45:59 +0000 (GMT)
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
Subject: [PATCH v2 06/14] gitlab-ci: Use artifacts instead of dumping logs in
 the Cirrus-CI jobs
Date: Tue, 21 Feb 2023 09:45:50 +0000
Message-Id: <20230221094558.2864616-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

The meson log files can get very big, especially if running the tests in
verbose mode. So dumping those logs to the console was a bad idea, since
gitlab truncates the output if it is getting too big. Let's publish the
logs as artifacts instead. This has the disadvantage that you have to
look up the logs on cirrus-ci.com now instead, but that's still better
than not having the important part of the log at all since it got
truncated.

Fixes: 998f334722 ("gitlab: show testlog.txt contents ...")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230215142503.90660-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/cirrus/build.yml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
index 7ef6af8d33..a9444902ec 100644
--- a/.gitlab-ci.d/cirrus/build.yml
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -32,6 +32,9 @@ build_task:
     - $MAKE -j$(sysctl -n hw.ncpu)
     - for TARGET in $TEST_TARGETS ;
       do
-        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
-        || { cat meson-logs/testlog.txt; exit 1; } ;
+        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1 ;
       done
+  always:
+    build_result_artifacts:
+      path: build/meson-logs/*log.txt
+      type: text/plain
-- 
2.39.1


