Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C6652D78
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:52:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tks-00072h-C3; Wed, 21 Dec 2022 02:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tke-0006zZ-RT
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:42:56 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7tkc-00048Y-Ni
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:42:55 -0500
Received: by mail-wr1-x42c.google.com with SMTP id o5so14066347wrm.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 23:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RfbfECpdzvo9MsAyyTDXftcg2yOdRURPap+Fw2ASwH4=;
 b=n8k6EFTjL/iKxNFpZaP7FAzkvaoMvXexvAxRedd+e69pKxeU0xyA8mkasRE02dBqW1
 PZTKwvUTnehKVeT81lox/2ecpIJNV6AWr3jVBaGfv1jnoQHi22tVSimm38RzgXRzyM4r
 C+9CxsWSe6RCO8U9Lk+VdUBsrA88V7bU60NoOa6UCnt4CBAYHjNqDqmTXY4gjQ9ZIqeR
 N4dW1SNgi7Fh/qL25I0v65n1BHMWY4OMlfPYzPqmzs/yU+Kx+G1UOgYcUZaR+VKxx/X0
 x2HNnKB0hAO30rhvjxhy7ssHeuhPiD3v2/Iryl6d2tOtZ3ubxWA2mTHkGC5LO+nq6NaQ
 De7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RfbfECpdzvo9MsAyyTDXftcg2yOdRURPap+Fw2ASwH4=;
 b=59+fFaBruTTvie5mwEmOFzZmfmOyOEiLFQKr1Y/PLWZdZq6lDcpd2Qe/RrzeC1YP8e
 kGvWQ+I9CCKrR+xbgdo/KL5XwGoA5pLfPE2Y6IY6nUyF/qgrGkZigtyFoDbslzhqYVsM
 MgCdc2T0JcEoxzBG0MWRT2FoGVwfIKseYU7jtN9x/5RX7Y8ARqXVj90fgFD4HQmL4mPv
 skG3wPRDPgJKRBCJf1Wxu8JTqaTSaMKS4vOUi7PGSnp98KwjvflAwivwbw4sdm06OtIf
 M9kOYR6ow4PCM4THvvYHz4aj9xhCPbTFoyukdDmdRHwCOZGvZo7Thd6VgSL0+eeDdZ49
 PABQ==
X-Gm-Message-State: AFqh2kpKqkbrY17Y61GTl/YXZqfSuVWMn1SRIZL8zEXmHDY/c10Tw1cz
 vmACToxGk5gS8gOpExTiK2VRMQ==
X-Google-Smtp-Source: AMrXdXvNGQ8zR+VUhGL0UwTp6bvwvQ5GAcU5BPkfN3DuGeS9+Pdo0RaZTeb0eNK0Hh6txSihCjE8AA==
X-Received: by 2002:a5d:453b:0:b0:242:5023:46c7 with SMTP id
 j27-20020a5d453b000000b00242502346c7mr390831wra.57.1671608573167; 
 Tue, 20 Dec 2022 23:42:53 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bj19-20020a0560001e1300b002238ea5750csm17475335wrb.72.2022.12.20.23.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 23:42:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F4DD1FFB7;
 Wed, 21 Dec 2022 07:42:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [[PATCH]--edit 0/6] current status of testing/next
Date: Wed, 21 Dec 2022 07:42:46 +0000
Message-Id: <20221221074252.1962896-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

Here is the current state of my testing/next tree. Nothing
particularly out of the ordinary but we do now have a binary release
of the hexagon tools.

The following still need review:

 - tests/tcg: fix unused variable in linux-test
 - configure: repeat ourselves for the benefit of CI

Alex Bennée (3):
  gitlab: turn off verbose logging for make check on custom runners
  configure: repeat ourselves for the benefit of CI
  tests/tcg: fix unused variable in linux-test

Mukilan Thiyagarajan (2):
  configure: Fix check-tcg not executing any tests
  tests/docker: use prebuilt toolchain for debian-hexagon-cross

Thomas Huth (1):
  gitlab-ci: Disable docs and GUIs for the build-tci and
    build-tcg-disabled jobs

 configure                                     |  11 +-
 tests/tcg/multiarch/linux/linux-test.c        |   6 +-
 .gitlab-ci.d/buildtest.yml                    |  10 +-
 .gitlab-ci.d/container-cross.yml              |  19 +--
 .../custom-runners/ubuntu-20.04-s390x.yml     |  12 +-
 .../custom-runners/ubuntu-22.04-aarch32.yml   |   2 +-
 .../custom-runners/ubuntu-22.04-aarch64.yml   |  12 +-
 MAINTAINERS                                   |   1 -
 tests/docker/Makefile.include                 |   4 -
 .../debian-hexagon-cross.d/build-toolchain.sh | 141 ------------------
 .../dockerfiles/debian-hexagon-cross.docker   |  53 +++----
 11 files changed, 47 insertions(+), 224 deletions(-)
 delete mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.d/build-toolchain.sh

-- 
2.34.1


