Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376C76D00D6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:13:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpG6-0007Th-1C; Thu, 30 Mar 2023 06:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpFy-0007TI-92
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:46 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpFw-0000Gx-B4
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:45 -0400
Received: by mail-wm1-x335.google.com with SMTP id p34so10550092wms.3
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4nBa0lc9YUiE1EmJexP68C/nPorspiVRhAbp4S4CEhk=;
 b=WF6on0dUaV95Zd1xSgAYQInzXtBi/nllgK1lOxSaSFkJu2UyeKfn18tA2egisMjydb
 D6SDvrLqTOU4Yo/XfsnAOzYA97+iB3OLuQdLDab6EnCBipCN4LgiiqSPlLK1Tq+SL6x7
 zLvyJLcXLCm2CgLvYBu4xaTW7Xd2N8gP9eNRauA2WIUQfskUOSxTv8idK0MTJT+0VAxl
 8baZaJma7kl/o6N8H4ABf0H9XaBi5wwaM3pUR0lP8jYpTS3KgEYugURy/sgeiWHtnuJ+
 7cVBTIcYnqQC6WMS0Ns12ozGj+wybz5oAMXwKYHji3LWONvuONbarnt5Hw4q4aIJf6iT
 Gacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4nBa0lc9YUiE1EmJexP68C/nPorspiVRhAbp4S4CEhk=;
 b=QJEaqjPn5Qwpq+pzLq/KV5J9YPRltcmOQgrOOwmQeltm/7h3GKh6QD/rMCpZL8Foic
 350FPYs0vI8lJdYK7DSc/wBKWFAwMVMTD2qpd/gStctmxk9MCb0ypclYctJjnIhsBvaE
 QYu8klI7sEa5TDta6f9KLQm2DeOjv3+jIv1Fro7ShkEh/JUWZgYUUBeoOEwLwb1A1P0G
 Y9jmGaZFBjN1iagA7onOWoAEbTMzMAuM6/3yUsNpDO4xSkP8HzOzXH5ABvmcwDhpVEQC
 y+d1b7pE/GYPi3XNC2EJlI8fj7HehjbSq36nkhtpgT5JQgF6mhk4oJeu/bxE5B3lHSxf
 2QHA==
X-Gm-Message-State: AO0yUKUJyIod5JReEafmWWVQNTBVnu1LMzfNfW7wljuzquKv2WB9ZJOz
 Sanw56uc+abgKYwCyNYDylxD1w==
X-Google-Smtp-Source: AK7set9p9xDcArrGEdn2lfOII6wytTiOrQ/qAkFYHOn08W0/VcVlt+jU2uijBkj3yBlALXkvzEUnyw==
X-Received: by 2002:a1c:7908:0:b0:3ed:da74:ab0c with SMTP id
 l8-20020a1c7908000000b003edda74ab0cmr17678406wme.19.1680171102798; 
 Thu, 30 Mar 2023 03:11:42 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a05600c46cf00b003ede2c59a54sm5730596wmo.37.2023.03.30.03.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E7051FFB7;
 Thu, 30 Mar 2023 11:11:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH 00/11] more misc fixes for 8.0 (tests, gdbstub, meta, docs)
Date: Thu, 30 Mar 2023 11:11:30 +0100
Message-Id: <20230330101141.30199-1-alex.bennee@linaro.org>
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

Here are a few more random fixes across the tree. All should be good
for the current phase of freeze although I can drop stuff if it causes
problems.

I've included another run at using the kaniko build tool and will see
if it improves the caching of things as it runs through my CI loop.

Alex.

Alex Bennée (6):
  scripts/coverage: initial coverage comparison script
  MAINTAINERS: add a section for policy documents
  qemu-options: finesse the recommendations around -blockdev
  metadata: add .git-blame-ignore-revs
  gitlab: fix typo
  tests/gitlab: use kaniko to build images

Daniel P. Berrangé (2):
  tests/qemu-iotests: explicitly invoke 'check' via 'python'
  tests/vm: use the default system python for NetBSD

Kautuk Consul (1):
  tests/requirements.txt: bump up avocado-framework version to 101.0

Marco Liebel (1):
  Use hexagon toolchain version 16.0.0

Philippe Mathieu-Daudé (1):
  gdbstub: Only build libgdb_user.fa / libgdb_softmmu.fa if necessary

 MAINTAINERS                                   |  18 +++
 .git-blame-ignore-revs                        |  21 ++++
 .gitlab-ci.d/base.yml                         |   2 +-
 .gitlab-ci.d/container-template.yml           |  22 ++--
 gdbstub/meson.build                           |   6 +-
 qemu-options.hx                               |   8 +-
 scripts/coverage/compare_gcov_json.py         | 118 ++++++++++++++++++
 .../dockerfiles/debian-hexagon-cross.docker   |   2 +-
 tests/qemu-iotests/meson.build                |   7 +-
 tests/requirements.txt                        |   2 +-
 tests/vm/netbsd                               |   3 +-
 11 files changed, 185 insertions(+), 24 deletions(-)
 create mode 100644 .git-blame-ignore-revs
 create mode 100755 scripts/coverage/compare_gcov_json.py

-- 
2.39.2


