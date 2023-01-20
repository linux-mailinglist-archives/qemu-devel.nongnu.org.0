Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2C6675614
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:44:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrfv-00012m-Fd; Fri, 20 Jan 2023 08:43:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIrfr-000111-Sb
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:43:19 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIrfq-0007WG-7T
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:43:19 -0500
Received: by mail-wr1-x436.google.com with SMTP id q5so245121wrv.0
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gXuDv/C0Rs9dQca1e1w0gMaDH945zae3nzhBwBhgYss=;
 b=aDdvOcVKHmz8bhEdKgqTPwFekE8EliPsTF+Sa5oudfNiSOWeY6HC9REVEjxaP0kaeV
 najG8MqQ5/QpV+1kb8N3jOen8oBs+cEu19dKChriLY4Az9vXM1z85Gj3RPYX9Jq1/cgE
 gfJ0/IN3RAgEga5qpdaGjgaU99e3hi5Ji+DT0s1kMBlPZuTmkoeE4kce/Pj1Um5ql1WS
 to4QpA22+taJfLjzbY3YjrIEO62HgsIELO4zV3C+JMSh9imq+dCs5LsB/yp4DWLFkvHP
 CaGHxZed66BgiQ2ucKUYejZVNcSrR2cmranV9Zg9jjpn2JY4P+WT2Hcl4qv2eg+x7SIx
 iE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gXuDv/C0Rs9dQca1e1w0gMaDH945zae3nzhBwBhgYss=;
 b=dfrTsDpTEGfoDJvQe7ff8MkHeu7Lpo0jjTHyZfuHSGZDNlO7rr4RIVo+hTbhVK8V/5
 51E2wHym/9/XR8waKKjsMkT0NtflZomlC6XvWlitmkNi57jWcDJstS1+78G9n554qRqA
 r2Aw+bc/iTFU/iJoL8dT1QAI5Legg9s7lNIuwPi3iGznztHRchdJFrK423g2z3DHG0y0
 pp9uiZwphKcc2jfNGc/rmaRVew4d8+MnYMfDZxlyTybubM7OcOw4pUviYMOBB8xrH8rl
 TxqokGN0Z5maPkWgvz9B61CSqlUwIHVa+qa23F/sEYRg22ZANs0Dexkq6Rzp6RtoEdDJ
 NcRA==
X-Gm-Message-State: AFqh2koBml2G+f1/IIQD+QC4odMXfcW19qcrjc4LLExshDX8pjgwtygP
 ZtpB11Np2s4XRIAP0CYCG5QocqFLNWh/7xg2
X-Google-Smtp-Source: AMrXdXvhikfZj7180obvBhu/tnXHo0iEpacy+u63rAoVSbRq0GDpwOgrhHJ5BnZZNwdWPI16JqW7vQ==
X-Received: by 2002:adf:cd81:0:b0:2bd:e0e8:694f with SMTP id
 q1-20020adfcd81000000b002bde0e8694fmr13257915wrj.32.1674222196127; 
 Fri, 20 Jan 2023 05:43:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d6647000000b002bbeb700c38sm31004057wrw.91.2023.01.20.05.43.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 05:43:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Subject: [PATCH v2 0/2] tests/avocado: Truncate M2S-FG484 SOM SPI flash to
 16MiB
Date: Fri, 20 Jan 2023 14:43:12 +0100
Message-Id: <20230120134314.81956-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

The M2S-FG484 SOM SPI flash is 16MiB. Truncate the file
provided with the Avocado test to avoid:

 qemu-system-arm: device requires 16777216 bytes, block backend provides 67108864 bytes

before merging the "m25p80: Improve error when the backend
file size does not match the device" patch:
https://lore.kernel.org/qemu-devel/20230119123449.531826-2-clg@kaod.org/

Since v1:
- add missing 'size' argument in file_truncate (Cédric)

Philippe Mathieu-Daudé (2):
  tests/avocado: Factor file_truncate() helper out
  tests/avocado: Truncate M2S-FG484 SOM SPI flash to 16MiB

 hw/arm/msf2-som.c                   |  5 ++++-
 tests/avocado/boot_linux_console.py | 15 +++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.38.1


