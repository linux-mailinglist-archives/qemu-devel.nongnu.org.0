Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A75C86B3C60
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:36:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa25-0007TG-4i; Fri, 10 Mar 2023 05:31:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa23-0007ST-I5
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:27 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa21-0004F0-QG
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:27 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so3077713wmi.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hb83LjY966OCKQVmAb1v5YQSk0XWE0vHOGiBVzfem3s=;
 b=wfwFe8H1RW8Fil+SN4Dqs6Csj+Lr52KXt0AyZxAlt97gWVmFXOSCaDPiqXkd/4sp+n
 nAr1LatHAN8DQTKDoGltjhDIBslVGNkRzEVYgw8HrVCCcZc6MnpqmYnqmFqGxgy7+Fxi
 INjT9w25d4jFXdTs5x5dA4Ef26qOTh2YxBxJnPXg9+S7NpDAEiPLzodij+NXT6wygk4p
 RnmZQvFCJ9FVzalK0Z70OwQYA6FIidY2RJ4/cnmWB6qQK5660Gj+v4MOwgxo8RC5Yt95
 AEK9yZMgfie5DjOGJGYalYvsX5qrHnWgJ3KgeDS6iVWbaRVqmUufx8awhiB6+KUieV6j
 lWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hb83LjY966OCKQVmAb1v5YQSk0XWE0vHOGiBVzfem3s=;
 b=fWE3jgnxdxkFwKPDe4GQXDqnigs4buXbGFFShIPJj/32vM+jt9iw/1fezjOdbRhgd7
 9iTylepVb/wt18KqG/c4UF5j8+Qud/rgcwsvnNlPeryxHu47ykO02jPr5lCR1PnAH/dF
 JwbnavSpD0Bl3TDzWlRKP0UQAF3dYfDJT3LU04EZvI0WyMSG/gZvavLjAQFQHTu8fLxM
 Y3U52yRDrJyj4rFWZsa7OB5G+sfCisIM/rFQdUlKeyYOQBbgWNpCu/4sQubRCWV2Cb20
 XWp+wRyY+iHT4ezzO4ww9mROOoVMRsRtQRumULOU/mCmTJdJ/hXFF/jPryKs1MrCEaJ3
 4jGA==
X-Gm-Message-State: AO0yUKWT7W93Q36arq+B/7qHsVS1oRulGEABM5i7WB8D6zP0j9kuktoR
 YxHh3eh1Rnbu0Yxw/QwYHXZh1Q==
X-Google-Smtp-Source: AK7set9wZKhJagQoFxnTJ7d5vcFeN/W57w6CnDomFTXGdWhejnwJuqLtxDrFFbBSfXyE4icon8SijQ==
X-Received: by 2002:a05:600c:1d84:b0:3eb:2de8:b72a with SMTP id
 p4-20020a05600c1d8400b003eb2de8b72amr2220905wms.7.1678444284189; 
 Fri, 10 Mar 2023 02:31:24 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c378600b003e6dcd562a6sm1645702wmr.28.2023.03.10.02.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 85FC21FFB7;
 Fri, 10 Mar 2023 10:31:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 00/11] tweaks and fixes for 8.0-rc1 (tests, plugins, docs)
Date: Fri, 10 Mar 2023 10:31:12 +0000
Message-Id: <20230310103123.2118519-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

As usual for softfreeze I switch from my usual maintainer trees to
collecting up miscellaneous fixes and tweaks as we stabilise the
build. Currently these are still mostly testing focused although there
is a plugins fix I forgot to send a PR for earlier.

The following need review:

 - tests/avocado: don't use tags to define drive
 - include/exec: fix kerneldoc definition
 - tests/tcg: disable pauth for aarch64 gdb tests
 - tests/tcg: add some help output for running individual tests
 - include/qemu: add documentation for memory callbacks
 - gitlab: update centos-8-stream job
 - scripts/ci: update gitlab-runner playbook to handle CentOS
 - tests/docker: all add DOCKER_BUILDKIT to RUNC environment

Alex Bennée (9):
  tests/docker: all add DOCKER_BUILDKIT to RUNC environment
  scripts/ci: add libslirp-devel to build-environment
  scripts/ci: update gitlab-runner playbook to handle CentOS
  gitlab: update centos-8-stream job
  include/qemu: add documentation for memory callbacks
  tests/tcg: add some help output for running individual tests
  tests/tcg: disable pauth for aarch64 gdb tests
  include/exec: fix kerneldoc definition
  tests/avocado: don't use tags to define drive

Marcin Juszkiewicz (1):
  tests/avocado: update AArch64 tests to Alpine 3.17.2

Richard Henderson (1):
  tcg: Clear plugin_mem_cbs on TB exit

 include/exec/memory.h                         |  2 +-
 include/qemu/qemu-plugin.h                    | 47 +++++++++++++--
 accel/tcg/cpu-exec-common.c                   |  3 +
 accel/tcg/cpu-exec.c                          |  4 +-
 .../custom-runners/centos-stream-8-x86_64.yml | 18 ++----
 .../org.centos/stream/8/build-environment.yml |  1 +
 scripts/ci/setup/gitlab-runner.yml            | 20 ++++++-
 tests/avocado/machine_aarch64_virt.py         |  8 +--
 tests/avocado/tuxrun_baselines.py             | 60 ++++++++-----------
 tests/docker/Makefile.include                 |  2 +-
 tests/tcg/Makefile.target                     |  7 +++
 tests/tcg/aarch64/Makefile.target             |  2 +
 12 files changed, 112 insertions(+), 62 deletions(-)

-- 
2.39.2


