Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F35BEF75
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:56:58 +0200 (CEST)
Received: from localhost ([::1]:50050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalEf-000343-SB
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqZ-0000VB-UF
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:47 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:45609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqW-0000f9-82
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:45 -0400
Received: by mail-ed1-x532.google.com with SMTP id m3so4797497eda.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wjsUAAComu1E7rFx1ESKMnJu2Ixm3maECOUpSPdRd/Q=;
 b=mq28BbXitsS1kZOJZKqrXcodNVhCaAeGJcieKCkgZE0w+hEOovOieymKLd53Hvmwdj
 ZCtg7H9vKzpoTzBqjPhOO5qjKJjDfv5CJNstRPnOhc5PEImunidaQLU/HzOIXLv3ObRE
 qJXx0K/tImKa3B9wiePoBtAUdIYWxLyDZNdGzaX4ktRvo6aJ1fBXMleiX9+XAusr1jAk
 VxDSGo5n1kowrp/8aghsSuOXizYl06ayjm0fAlkUHpV/7356eNxTmIJCFjWJsphtgQn5
 jXJKPcc4wxCpHWlZ1187UNfYQRvEu3xcXw54TrZjdUUlqXCYhKtvYanE57XPWYduEhXH
 dWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wjsUAAComu1E7rFx1ESKMnJu2Ixm3maECOUpSPdRd/Q=;
 b=hHqZGBreTPxBk2TzU3qje+H3KRCAtF5K5TwUPmLjg3uGCHY36oM1seE9ki9KR9FnJ+
 KyhwcyP32Avl/mLahtNsohcLfZBfx6PgOAqHPBfWn34BMy/nUyXj4WemBf/BPoVwYMk2
 m//gaqtONcA4JmfV9znp+ossnN3YVTx6W0LqBf0j6QS9xfXo729rkDeGLvSj0+GWG3cJ
 /Nu7Cbh5u+SdxHSHv33i/QwwjUf4ssFL/VF1WT08g+dMPgO3lZNWcbH5zy00l7TBkYOr
 6z8q/+Q01ldyTtZ5XMSVrtQhB5W1sIyPhbyUx9YG8qTvMPJR1XzfjNGz8RgAuHOmnyV7
 KUjQ==
X-Gm-Message-State: ACrzQf0xS9VyNaM1bo79zBaC3W/0c8VHY9uzIZxwDefgUp+dr2GdiSRE
 19d8jisNXGKgsHq/fAxRTrjgdg==
X-Google-Smtp-Source: AMsMyM4m4deO7FVe2xSTmM/3wkjs9D2rAQj5L4PMSD1d7GW/C6rjQ/aQbrBwrwYOmGFBPqtNRwCang==
X-Received: by 2002:a05:6402:3718:b0:453:a46c:386c with SMTP id
 ek24-20020a056402371800b00453a46c386cmr15308054edb.97.1663694142735; 
 Tue, 20 Sep 2022 10:15:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a50ec92000000b00448176872f7sm145777edr.81.2022.09.20.10.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1D2161FFBC;
 Tue, 20 Sep 2022 18:15:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PULL 04/30] tests/avocado: add explicit timeout for s390 TCG tests
Date: Tue, 20 Sep 2022 18:15:07 +0100
Message-Id: <20220920171533.1098094-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't want to rely on the soon to be reduced default time. These
tests are still slow for something we want to run in CI though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220914155950.804707-5-alex.bennee@linaro.org>

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 67a24fe51c..4f07c27ac6 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -130,6 +130,8 @@ class BootLinuxS390X(LinuxTest):
     :avocado: tags=arch:s390x
     """
 
+    timeout = 240
+
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_s390_ccw_virtio_tcg(self):
         """
-- 
2.34.1


