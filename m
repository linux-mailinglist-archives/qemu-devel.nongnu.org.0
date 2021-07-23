Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0E3D3E31
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:08:39 +0200 (CEST)
Received: from localhost ([::1]:47192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yf8-000071-FT
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:08:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yb5-0000Bu-Nj
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:30 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yb2-0005TZ-Ry
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id j2so3056284wrx.9
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4gcbr/YCwz2K8G5uZyX70n/KlnxCHfoTozSOD316tYc=;
 b=P+fYd9/S1o+PBRP09fErnN5uGTfFCWygXrAP4pOv5h5QQvHxWlPsV7qhxuaccVKjZJ
 /57umL4Khg7fY30We+7oaX9jd+XYQwg2Ay7xBz6ktcCQtOMlvnlT1xR1YeJ5OPuhpDJ0
 c5lQvfl5twZE3IeAooqqAvSWb5FlB8T+LDYgLbChGKer3cOkRORRy4Bn9p32y1QMFCxh
 qmPqAAth/yFeHpMd0gi1TQJBhElSgxIK0ESsStbPC1eRA+TovtDqLCkUNx+DpKHoZIjq
 OxNqTBl9yBVwMnKIUmxb+H2quEk7jQcFjzQi+c0WRVU1+cyVmSgTH0CuLQeBkTKanwt4
 GIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4gcbr/YCwz2K8G5uZyX70n/KlnxCHfoTozSOD316tYc=;
 b=YCWjnLtZH1gVZh5KHHj0umZ9vvoG+wwh7ofwmF3S1V5J8t8dnk4gVQpWMcvrbFk8V8
 ntqlx0OBeBBOjUDRVB8r1zmkB5otPq8DRg660w0IYPsg0ov4pQR5ST0k8U3oCQ3tC7ph
 LZejBaCGSTj9fbBDc/yNs7ZI/NszaxvmUaObtuUC0BxLgwbSiZMeUi7XpdMIgFsD78lX
 5M3Yla5e0gBXTM8Vpf5sH1u/QkxqkE3JVuGwal/JHx+T0dh7akUSPa3EYNMMQV8Q2NUL
 lRNzh525Fkte9CVVR5IKjc3gnS9Wo2NCN5Ka/FmrXR+3gGXloP/rcXcD+iyiCqmeQD+Q
 JBfQ==
X-Gm-Message-State: AOAM5330aLIdLrq08xri1BsV8Dw379nOPdeiEh7XlHPi8a9mWddsF0De
 NLxxZIqcTuDMvpYOxVy4hFXK/Q==
X-Google-Smtp-Source: ABdhPJzX7GVxya8zc7BqfciD3YZ1J1Q/zgGtMMgi9XbaPH6neJL1DfU2x0iIWtTtVSxtcIcLth2ekw==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr6478293wri.149.1627059861757; 
 Fri, 23 Jul 2021 10:04:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v30sm36217592wrv.85.2021.07.23.10.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4C4C41FF7E;
 Fri, 23 Jul 2021 18:03:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL for 6.1-rc1 00/28] doc, metadata, plugin and testing updates
Date: Fri, 23 Jul 2021 18:03:26 +0100
Message-Id: <20210723170354.18975-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I realised I'm on holiday next week so I thought I'd better send this now.

The following changes since commit a146af86c8247f41b641783428b95ee71eb0e43f:

  Merge remote-tracking branch 'remotes/kraxel/tags/vga-20210723-pull-request' into staging (2021-07-23 12:16:12 +0100)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-for-6.1-rc1-230721-1

for you to fetch changes up to 0a9487d80af9ed6fa14d2696bc34a920b32e53e5:

  gitlab-ci: Extract OpenSBI job rules to reusable section (2021-07-23 17:22:16 +0100)

----------------------------------------------------------------
Doc, metadata, plugin and testing updates for 6.1-rc1:

  - git ignore some file editor detritus
  - add overview on device emulation terminology
  - remove needless if leg in configure custom devices logic
  - numerous gitdm/mailmap updates
  - fix plugin_exit race for linux-user
  - fix a few bugs in cache modelling plugin
  - fix plugin calculation of physical address
  - handle pure assembler/linker tcg tests outside of docker
  - add tricore build to gitlab
  - remove superfluous MacOSX task
  - generalise the OpenBSI gitlab rules

----------------------------------------------------------------
Aaron Lindsay (1):
      plugins: Fix physical address calculation for IO regions

Alex Bennée (21):
      docs: collect the disparate device emulation docs into one section
      docs: add a section on the generalities of vhost-user
      configure: remove needless if leg
      contrib/gitdm: add some new aliases to fix up commits
      .mailmap: fix up some broken commit authors
      contrib/gitdm: add domain-map for MontaVista
      contrib/gitdm: add a group mapping for robot scanners
      gitdm.config: sort the corporate GroupMap entries
      contrib/gitdm: add domain-map/group-map mappings for Samsung
      contrib/gitdm: add domain-map for Eldorado
      contrib/gitdm: add domain-map/group-map for Wind River
      contrib/gitdm: un-ironically add a mapping for LWN
      contrib/gitdm: add domain-map for Crudebyte
      contrib/gitdm: add domain-map for NVIDIA
      contrib/gitdm: add group-map for Netflix
      contrib/gitdm: add an explicit academic entry for BU
      contrib/gitdm: add a new interns group-map for GSoC/Outreachy work
      contrib/gitdm: add more individual contributor entries.
      tcg/plugins: implement a qemu_plugin_user_exit helper
      tests/tcg/configure.sh: add handling for assembler only builds
      gitlab: enable a very minimal build with the tricore container

Mahmoud Mandour (3):
      plugins/cache: Fixed a bug with destroying FIFO metadata
      plugins/cache: limited the scope of a mutex lock
      plugins/cache: Fixed "function decl. is not a prototype" warnings

Philippe Mathieu-Daudé (1):
      gitlab-ci: Extract OpenSBI job rules to reusable section

Thomas Huth (1):
      gitlab-ci: Remove the second superfluous macos task

Viresh Kumar (1):
      gitignore: Update with some filetypes

 docs/interop/vhost-user.rst                        |  2 +
 docs/system/device-emulation.rst                   | 90 ++++++++++++++++++++++
 docs/system/{ => devices}/ivshmem.rst              |  0
 docs/system/{ => devices}/net.rst                  |  0
 docs/system/{ => devices}/nvme.rst                 |  0
 docs/system/{ => devices}/usb.rst                  |  0
 docs/system/devices/vhost-user.rst                 | 59 ++++++++++++++
 docs/system/{ => devices}/virtio-pmem.rst          |  0
 docs/system/index.rst                              |  6 +-
 configure                                          | 10 +--
 include/qemu/plugin.h                              | 12 +++
 include/qemu/qemu-plugin.h                         | 13 ++++
 bsd-user/syscall.c                                 |  6 +-
 contrib/plugins/cache.c                            | 11 ++-
 linux-user/exit.c                                  |  2 +-
 plugins/api.c                                      |  2 +-
 plugins/core.c                                     | 39 ++++++++++
 .gitignore                                         |  2 +
 .gitlab-ci.d/buildtest.yml                         | 11 +++
 .gitlab-ci.d/cirrus.yml                            | 15 ----
 .gitlab-ci.d/opensbi.yml                           | 28 ++++---
 .mailmap                                           |  4 +
 contrib/gitdm/aliases                              |  6 ++
 contrib/gitdm/domain-map                           |  7 ++
 contrib/gitdm/group-map-academics                  |  3 +
 contrib/gitdm/group-map-individuals                |  5 ++
 contrib/gitdm/group-map-interns                    | 13 ++++
 contrib/gitdm/group-map-netflix                    |  5 ++
 contrib/gitdm/group-map-robots                     |  7 ++
 gitdm.config                                       | 13 +++-
 .../docker/dockerfiles/debian-tricore-cross.docker | 34 ++++++--
 tests/tcg/configure.sh                             | 18 +++++
 32 files changed, 366 insertions(+), 57 deletions(-)
 create mode 100644 docs/system/device-emulation.rst
 rename docs/system/{ => devices}/ivshmem.rst (100%)
 rename docs/system/{ => devices}/net.rst (100%)
 rename docs/system/{ => devices}/nvme.rst (100%)
 rename docs/system/{ => devices}/usb.rst (100%)
 create mode 100644 docs/system/devices/vhost-user.rst
 rename docs/system/{ => devices}/virtio-pmem.rst (100%)
 create mode 100644 contrib/gitdm/group-map-interns
 create mode 100644 contrib/gitdm/group-map-netflix
 create mode 100644 contrib/gitdm/group-map-robots

-- 
2.20.1


