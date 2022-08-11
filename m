Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7719458FF25
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 17:18:35 +0200 (CEST)
Received: from localhost ([::1]:41762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM9xC-0002In-4C
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 11:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9tE-0005B8-Am
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oM9tB-0005i8-RT
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 11:14:27 -0400
Received: by mail-wr1-x42d.google.com with SMTP id v3so21778396wrp.0
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 08:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=A4Im+0B8i1kKXa9xofWgQuBA5l5Ynpf3TEOMjj9zbKM=;
 b=BEy4XH5373rENUsQThPIfNYqgpxwBcRwvgyNj2IEZe0yCasZDq3UoDBMycqfzQhq9W
 5sHQkWov7ugLSvEyHZ9qL56NNK7iRF53IIvdA3E2bh0iqleGGjN1iqHP0fi8GI7pQCii
 LFIGUIU1I/TCjQ9cwr0iM5+RjE0aJHzyS9HzrxFgNK0PYSiUCxSFwFPOr3xoESpbY3Y0
 msZhE6QexukBqzJnDutV9zX7Z/YBpHzcA1VjPmS5YfJyf0UL94uC7jWoXPzMibzdSKre
 0EKkumYTT+F2tmfp6AgIAIg7kwxk8RUTwW1S5s9cw3dddrRPVKTzs8I5JOrls2qqCsx9
 LKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=A4Im+0B8i1kKXa9xofWgQuBA5l5Ynpf3TEOMjj9zbKM=;
 b=26o9yYjvg266RpuNkOhN+C+8IX6ViWR4oigV2qipOPJI+CDyGiOWfnOvPNXGa8zFbj
 Khg+Acb56SGVtXVWtkD2AoVvC8WoO0Jm+uZ+QZ4BUzVeiZYtnCSV/Eh9vAB31+lSpV4g
 nBYisceoQ51CJZ39RHQkG9FAo4tQVn1YyunOmjPvErXHFVFqpUZrosMlQo4BmyukD3l3
 dUXkGhRJltrbWaU/pEeHJ061+MeiSnwoo59uQvvQv5crejHnuPkbTTrD2OD72zSJpQCw
 Oqi5MPtz6i58g31sR/L2WjAvASFyaguyzeNzAE8HsSzBu3vj0pDGAWg2xEKWvha19xMu
 /dAA==
X-Gm-Message-State: ACgBeo1+nTNJzJeVt+onine1k0CuBsZEGImd8vSHTBQPoqRGoxVpy+c+
 9DM3UjY8VaqvJGwgaCuagB6ZSRsq3gAqCw==
X-Google-Smtp-Source: AA6agR4gIa16Ox2zmOy02kBBun+A2J1JHm3nkt6wlxjTKyxYYek5WWJK+JkHuOXOz52rhFai60gjKQ==
X-Received: by 2002:a05:6000:381:b0:221:7507:bb24 with SMTP id
 u1-20020a056000038100b002217507bb24mr18164061wrf.373.1660230865189; 
 Thu, 11 Aug 2022 08:14:25 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a05600010d100b002206b4df832sm19125400wrx.110.2022.08.11.08.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 08:14:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D0CDB1FFBF;
 Thu, 11 Aug 2022 16:14:13 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 7/8] tests/avocado: apply a band aid to aspeed-evb login
Date: Thu, 11 Aug 2022 16:14:12 +0100
Message-Id: <20220811151413.3350684-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811151413.3350684-1-alex.bennee@linaro.org>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

This is really a limitation of the underlying console code which
doesn't allow us to detect the login: and following "#" prompts
because it reads input line wise. By adding a small delay we ensure
that the login prompt has appeared so we don't accidentally spaff the
shell commands to a confused getty in the guest.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Acked-by: John Snow <jsnow@redhat.com>
---
 tests/avocado/machine_aspeed.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index c54da0fd8f..65d38f4efa 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -101,7 +101,9 @@ def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
         self.wait_for_console_pattern('Starting kernel ...')
         self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
         self.wait_for_console_pattern('lease of 10.0.2.15')
+        # the line before login:
         self.wait_for_console_pattern('Aspeed EVB')
+        time.sleep(0.1)
         exec_command(self, 'root')
         time.sleep(0.1)
 
-- 
2.30.2


