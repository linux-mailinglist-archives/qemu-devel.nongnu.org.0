Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF7D6E4A36
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 15:44:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poP92-00010A-FM; Mon, 17 Apr 2023 09:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8o-0000wK-FX
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:35 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1poP8g-0006MK-9r
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 09:43:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f0aabd1040so41423065e9.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 06:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681739003; x=1684331003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/AgPMEkJj5uDNj5jnrln7+4tm9L02eo8Q2wwYkrP4dg=;
 b=nBKvT7OqUIRWbNLUT7LIF5k+FKkNvL1j5A53WcDnX3NAVruUo+P40n8XIep+TGvOiq
 IVJd/Iu56ocGPGRgJ74FSA83iSOo18TLLuCvitriFrcTk8emKCtnvCv8g+5NCpNF403v
 ZbCW0H21PGNiyqt3IFfy5MCoGgu5u7H5frKdNIaRnCurs5V4RB3hgm+cuQ1xGkgWR7g1
 nok5+qaFUs7DlvUYCN6NVUArFqx3+q+apOpSK4Qql9TtYA2bTEKXsVkYZnWejt2xgCDr
 C2+H9QN5k2ntsl6022jzn0tcaG7hLAJ7Bux2AfXetKGn55g0/EdlpaYUzqYY0SNjFdJ9
 EUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681739003; x=1684331003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/AgPMEkJj5uDNj5jnrln7+4tm9L02eo8Q2wwYkrP4dg=;
 b=hrI9Ikzx0BWgyhPBPR71vy9WGS0pjbwfrCZxip1H9m7tAGkvJACfMb+UYINc2/36zM
 1SN4nb6jjIY2+phSMTpzdKV3U6xtGiH4m3YUdcqkkBh03m7+vK4JqykTjyyVb+wIuLg4
 6MhK6r7ZO4BWO2J0GEpubR4bnEipq9swxOvhPcBXD9JqO46KZJCkXZ/zYrPMVxS1PrDB
 2X2JFQZDbEQ7J9+Ik73dqntuWT2Wh9FWi1N0jqPecYA6x+1J7G3gPSE8z9hZ5KcfIwgV
 GvE6F3WrBDEZ9aMaxhYPvjsswix+YWPk5d537L/JeWqeRRZY+GEGKIFqSFlQ9DTUXYSG
 cdvQ==
X-Gm-Message-State: AAQBX9cITv9ys/4Uc9ndm0eg2rHEYEF0vyhgn4c06xMfogKcqd25AeG+
 /JCik57ZQVdT5joFUlzU5P0O9g==
X-Google-Smtp-Source: AKy350bivPTiNHNJ4uIQQa85RKOc2lP8hRAIMXVFodJMp95MTc1DUuPQlkFZdxDcTHUCQWxQ+6Briw==
X-Received: by 2002:a5d:6b89:0:b0:2fa:88d3:f8b8 with SMTP id
 n9-20020a5d6b89000000b002fa88d3f8b8mr2307948wrx.12.1681739003631; 
 Mon, 17 Apr 2023 06:43:23 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a5d55c4000000b002f74578f494sm8171246wrw.41.2023.04.17.06.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 06:43:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDDB81FFB7;
 Mon, 17 Apr 2023 14:43:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Markus Armbruster <armbru@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 0/6] testing/next: avocado, docs, gitlab
Date: Mon, 17 Apr 2023 14:43:15 +0100
Message-Id: <20230417134321.3627231-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This is the current state of my testing tree. It contains a few
patches that didn't make it into 8.0 and more testing fixes including
a bump to the avocado release including Thomas' --max-parallel-tasks
hack to avoid running the tests in parallel. So far it doesn't look
like its causing any problems although I am seeing some timeouts on
the BSDs.

The following patches need review:

tests/avocado: use the new snapshots for testing
tests/requirements.txt: bump up avocado-framework version to 101.0 (0 acks, 1 sobs, 1 tbs)

Alex Bennée (2):
  tests/avocado: use the new snapshots for testing
  qemu-options: finesse the recommendations around -blockdev

Kautuk Consul (1):
  tests/requirements.txt: bump up avocado-framework version to 101.0

Philippe Mathieu-Daudé (1):
  tests/avocado: Add set of boot tests on SBSA-ref

Thomas Huth (2):
  gitlab-ci: Avoid to re-run "configure" in the device-crash-test jobs
  scripts/device-crash-test: Add a parameter to run with TCG only

 MAINTAINERS                              |   1 +
 .gitlab-ci.d/buildtest.yml               |   6 +-
 qemu-options.hx                          |  24 +++-
 scripts/device-crash-test                |   4 +-
 tests/Makefile.include                   |  18 ++-
 tests/avocado/machine_aarch64_sbsaref.py | 158 +++++++++++++++++++++
 tests/avocado/tuxrun_baselines.py        | 170 +++++++++++++++++++----
 tests/requirements.txt                   |   2 +-
 8 files changed, 343 insertions(+), 40 deletions(-)
 create mode 100644 tests/avocado/machine_aarch64_sbsaref.py

-- 
2.39.2


