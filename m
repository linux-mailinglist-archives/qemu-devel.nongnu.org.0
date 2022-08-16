Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DB9595BD0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:36:36 +0200 (CEST)
Received: from localhost ([::1]:45238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNvoA-0004Nf-Nd
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:36:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNveQ-0004jj-HD
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:26:30 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oNveO-0001js-6q
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:26:30 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v3so12474233wrp.0
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 05:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=Qx6wBS0awIg5wJT+Q1AQmTWd+527vRCxS4thMsgW8xg=;
 b=pti8qqDLiXclsQN0cICI/ZjmG95UnefekqiwFqmNALMjvvdcRY1P+04BKSO/VFRhqx
 ZgM3h9RoiLikS9l2RljNWHV7kZHSSd1R/YSoiU7SSYdUGR8tridjr17jFaQDjUF0tBgf
 Mqjx+ACPzmPphN0uxI1Y/XIJQsTirCBRWkr0htRP67AEvfH8yxJZyGThx7SqW6JMxFzE
 xVSnqiPTG5QbkqWzVSaCUFmJRZ1DYCyRmjiOfxN4TNIgYmG/JJjenWCZtWEGdVE9BPo3
 HfBxc3OwUK+Q6JBJjevs21SRVrAcH+5ggF+w9n4+tKsglcAurMzKpvX4OxLadzaj7UrC
 178w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=Qx6wBS0awIg5wJT+Q1AQmTWd+527vRCxS4thMsgW8xg=;
 b=t6dFufj6kVcMPWwvKC2H0BjFoD/rDX5LCTbYKaFprWCaFb3o3h5zEaYNmy39kOevSx
 fFJEzxiWW4ZS6SQVguIKi2PmW4gjpbW+BSVwf4XdJO/muYaSQMmx2sIMYD8JFtPYW8VY
 b0YxlgR3Mv1acrjByf/IoF70Z1SSLlNd1Iq6FG0MkAz72HYO2Brxk1mzCwLbSIHqtciC
 ZuPX/SCZ8vGOSBRpddW8CXZ9+kIvced8b90rV8eU+f/TsLsH0s0S60je2fTsrEYxq9uq
 rEL8mqxIRFgqOJuZk3xGnMXRp77hra05EaMaeqItXQH1HmWdUKF1lBZ558lEJVpQXTJE
 bVOg==
X-Gm-Message-State: ACgBeo0zTWajdeB31+dwW7clpl5ErKzmRh7s5zGce/iENo2cW6uTfZYM
 MdTgE+kq6rKoWVAVdv1QOPCfkA==
X-Google-Smtp-Source: AA6agR7hbJukTquDxJP/c+s5y430UEbOj4ZmjOhCLW4G3NldGObpb8i7g9JDYcjS1auSY7WZ2idcYg==
X-Received: by 2002:a5d:6f17:0:b0:225:325:59cd with SMTP id
 ay23-20020a5d6f17000000b00225032559cdmr5813768wrb.83.1660652786746; 
 Tue, 16 Aug 2022 05:26:26 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a05600c2ca300b003a5ea1cc63csm9238720wmc.39.2022.08.16.05.26.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 05:26:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 182771FFBB;
 Tue, 16 Aug 2022 13:26:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 3/3] tests/avocado: apply a band aid to aspeed-evb login
Date: Tue, 16 Aug 2022 13:26:21 +0100
Message-Id: <20220816122621.2066292-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220816122621.2066292-1-alex.bennee@linaro.org>
References: <20220816122621.2066292-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Message-Id: <20220811151413.3350684-8-alex.bennee@linaro.org>

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


