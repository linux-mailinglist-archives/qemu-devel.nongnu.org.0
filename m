Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2365BEF6D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:54:05 +0200 (CEST)
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalBs-0005nS-Rq
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqW-0000Qa-0h
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:47 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:46818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqU-0000eh-Fj
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:43 -0400
Received: by mail-ed1-x534.google.com with SMTP id z13so4775344edb.13
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=N17HHU9yrrmBbTr01LSTUzVVxN6Q3/Gwl12Sohrp4oE=;
 b=HHTZKyCfrbe30kYFCkCBEbMOz3f0DQmQ369vTAB5u079yyPT9FHr/7umo6x9/qPRuu
 +yXxoQzJRo1lOKNebZS4SMjffSREamblDi9+hZMI7bVVhHQkg4b3VurgNkfCJNJXdJzq
 iRswGJe4TbCkma+Tdlpk8X4ZwrXa07GC9NeLDpyc0CoeHMImgGEKxAdPj07XM0+EPgAR
 11roU7L13VRzKvH3QCihTbnHjuJsAfnO9tOThfTnnoaMO9GQBywaTtoRtWuom69bpTU9
 V0NzEEnC3gM2lsEs3T72EZeIom83vTJZg2+RfyE0YOSoeMwQ4OeAnkJZkiR9ILnS+5NS
 2Z1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=N17HHU9yrrmBbTr01LSTUzVVxN6Q3/Gwl12Sohrp4oE=;
 b=n++b4eANgDV5HtZiTx6Ivrn2WqJh6av/76LdgFnt7vZPrv3AYrjlaXVes3aAi0kg86
 k/2jEzr/0iYSuxaJPFoOBay1lR1WbYI8ipMf2YCpS6jO9bwqizfYOZj+Nu97u8FfA5SS
 qelzKxneiSBukFs16mV7DbrPBTg6ANX6yZFo1lMfwpgUWCCZMRb/E6189MWVjbXTrtfb
 8iLEhflNSCgqESjExh1Uii21Mm0ffQzdoWhNpwVzpeAXRKq1zTiXVX+rZGZDLwpLAhhy
 9o6GYVg1UL7ombxZd/IpWjjxEs5k64/D1o0/oTUR/Xzc8F+rohUn2vfSZGTusUpwjGGK
 9jmA==
X-Gm-Message-State: ACrzQf27/J+raxX49H83EvCfSSOtOdkGRvS/ttg5KuNJMgY2MpNkAm8x
 v3xbH5qNLcZPuYZwQ0tTPE70pw==
X-Google-Smtp-Source: AMsMyM6HkmpP8n1FE1JXoqj7D0DiQmulRsZzRskYtonggJGuj/tAAElNDnCFlF3VQtbJqVxnKPfaVg==
X-Received: by 2002:a50:fe8c:0:b0:454:31ad:b99a with SMTP id
 d12-20020a50fe8c000000b0045431adb99amr8199566edt.165.1663694140970; 
 Tue, 20 Sep 2022 10:15:40 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 kx21-20020a170907775500b0073d5948855asm193228ejc.1.2022.09.20.10.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:34 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 06B211FFBB;
 Tue, 20 Sep 2022 18:15:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 03/30] tests/avocado: add explicit timeout for Aarch64 TCG tests
Date: Tue, 20 Sep 2022 18:15:06 +0100
Message-Id: <20220920171533.1098094-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't want to rely on the soon to be reduced default time. These
tests are still slow for something we want to run in CI though.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-4-alex.bennee@linaro.org>

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index ee584d2fdf..67a24fe51c 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -63,6 +63,7 @@ class BootLinuxAarch64(LinuxTest):
     :avocado: tags=machine:virt
     :avocado: tags=machine:gic-version=2
     """
+    timeout = 240
 
     def add_common_args(self):
         self.vm.add_args('-bios',
-- 
2.34.1


