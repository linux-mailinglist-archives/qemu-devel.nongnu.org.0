Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E62C7652E32
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 10:05:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7v1U-00007C-1P; Wed, 21 Dec 2022 04:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7v1M-00006P-CQ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:04:16 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p7v1K-0000Dv-Ny
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 04:04:16 -0500
Received: by mail-wr1-x435.google.com with SMTP id i7so14220904wrv.8
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 01:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u3xGZ7iZEW2Z0Mc0JIUa7DYEz2uxpQXw/t3rLVcDXgw=;
 b=JYX6df+tCUAPY9RFOaOGBz0EqnVveNP+Rs4HnzHjSNotj8iQoopXAbnEb+6DokLFGh
 /pNDjxqsZgtipMyksXzvhvMfnshDy3jQWE8f1kbpsJXvbNEBTP9sTG1cd6/umR4eiCls
 qtZu6oNGyEmFR4944+/ukJDjMms+ox0LwPF+jnvvLdlx/PvQKmGJctDUCgTnZrQDX/Cn
 m7uSlcU3MOhgPf8FJ1ohMlYWmTVOnZ6xJxkpPercP4EzT/frF1qgObjrNyynHSdbRukZ
 DFY2fdNxka7574/1rTdVRNU7PYVIyjzQ6wvQhpMyuwpYSezg9lJ2lx4uuc7LhBASEQ26
 vMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u3xGZ7iZEW2Z0Mc0JIUa7DYEz2uxpQXw/t3rLVcDXgw=;
 b=a7MdVqURxnZYrRswNAosFAsHbT9gUL/hGrAXYGkJ0ukayora63kzrtfQFi5ktur6MY
 QmE8JIV7AaaLteuCGH7Hlal8T1BSDdX65idIsxfWwwRyuKjyOTuN/VF0cXniyWs8AvVq
 W8dzJYrnppWtmKaQ8VjgH12wgihprhXukbtQp4XXrdxcyaZ1XW4T2SsLFYtb5NASnf3i
 APU43JfmKiF77uhh8nrerEg8uLzs/FLMqSzOxf7xObB3oiw7gki+CeIvvdUx2Ichw0FI
 px5XWlSWh/9TOEKqxEGnKqR/PKE7XFRXlh1/2EhxHEHY8KG3Co0wvzQKVDZfgJIH20Pc
 lUwA==
X-Gm-Message-State: AFqh2koROccd4z2rhUvukimBncnS9PnnHiJXmMBbErwEQue+WYb0ksUU
 qCTVqPB5PKW/4qunKdMluZlauA==
X-Google-Smtp-Source: AMrXdXtur4bGKe9NMA/P7uEzk0XXZhyDuzxemJ8zPgYs3QK2J+a9DL7FW9AcdMDXe+kgZ0+DyxzD+w==
X-Received: by 2002:a05:6000:408b:b0:242:8404:6b66 with SMTP id
 da11-20020a056000408b00b0024284046b66mr3688453wrb.1.1671613453160; 
 Wed, 21 Dec 2022 01:04:13 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r3-20020adff703000000b002687341d563sm2764952wrp.17.2022.12.21.01.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 01:04:12 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D7F671FFB7;
 Wed, 21 Dec 2022 09:04:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, fam@euphon.net,
 berrange@redhat.com, f4bug@amsat.org, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2 0/6] current status of testing/next
Date: Wed, 21 Dec 2022 09:04:05 +0000
Message-Id: <20221221090411.1995037-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
of the hexagon tools. Hopefully this time without the header damage.

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


