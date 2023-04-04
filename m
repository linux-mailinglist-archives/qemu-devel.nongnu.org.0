Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70596D66A4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:01:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji93-0004xY-LY; Tue, 04 Apr 2023 11:00:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8E-0004D9-N9
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:35 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji87-0005AQ-OS
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:30 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 v6-20020a05600c470600b003f034269c96so10040337wmo.4
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3fGriBZZeeXyXJe41DQMwpQll9GUNnvlrpqYwaMoPKk=;
 b=Gpje5l3qpCJKr5hagVOBA6LUpinxc9VcuRQ/a8cn8zgnmdcMstI5szv+xrQSGF8EDv
 Djn+H78ecY5+wrgUBHyFhmC54ws3hgxF+G6kCfsRVFtYdoFeSjMk2OXeicBWf7V7CNn8
 BRlk5m9C6+OLRtdTn/EVkr/f+dmVYKepHamCAAnSjqZ4M4ZKFZhRooc6DL08PSuCvHjZ
 QSaIXFvOV+2srxgJfmRb4z9GoPPVyC9+aSt7fGf7ZgK83hoUTUFqTOQxl4iQCEKd/xNo
 2z9j18Fyl+W5uxcHtObWuPuMKeqBHzQZM8Mw5aEc4FiOI6w+VgKucdfo7L5QXo3WNW4Y
 pWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620366;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3fGriBZZeeXyXJe41DQMwpQll9GUNnvlrpqYwaMoPKk=;
 b=oeVVphciSFIccxg+Fc85qG8isNpLSvR7SbN4k6FyaSSPCU60riicpEGuj7QJ4gLARA
 zEem8WMwnKX45S9wSzgSj+zo4TlZ1hydidUbbbpGC7Vt5WKBKVArMWa7ISElQeiDYqm3
 1LaPgSMVHYY3Auoy5CBwpQlS3ouKjXHXkxq1oiAUYk1jNwp7Bn7GZa5MIp0QCA6/nWSR
 nGDwDE6BNqBabznPs3ixXFyUfMDWhK1otjgAlkyT7e8lSdl+4SryoQsdlbAwZp++yWZD
 6f8MH2EVhQ3NPmVDZ0eGMq6Fy1JGp4bMBa9VCy/zaXJBBiG2hHbF9FDBrhTrp3v0zg6E
 TeZw==
X-Gm-Message-State: AAQBX9dEJdPsM3VquI14eG54gApMOVrPTjk+C3N9ZvAr3JYRcMvuzyXj
 p8mtaHX7WB50QuBeVis6fx2GDy17IuQTZgJr7ng=
X-Google-Smtp-Source: AKy350a3UQOR85w6bXiT90oCSFhD3Iu2KeE2OGzftOCyW8QcCMkmeBe3Vs8kdqZq0yuUyRibxgXLCA==
X-Received: by 2002:a1c:7406:0:b0:3ee:18e:a1ef with SMTP id
 p6-20020a1c7406000000b003ee018ea1efmr2235899wmc.1.1680620366036; 
 Tue, 04 Apr 2023 07:59:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k20-20020a7bc414000000b003ee10fb56ebsm15513272wmi.9.2023.04.04.07.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:59:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 241721FFB7;
 Tue,  4 Apr 2023 15:59:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL for 8.0 00/10] misc fixes (tests, gdbstub, metadata)
Date: Tue,  4 Apr 2023 15:59:15 +0100
Message-Id: <20230404145925.2638152-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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

The following changes since commit 51a6dc9d394098e8f4141fad869a1ee9585f54f8:

  Merge tag 'pull-target-arm-20230403' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-04-03 17:01:47 +0100)

are available in the Git repository at:

  https://gitlab.com/stsquad/qemu.git tags/pull-for-8.0-040423-2

for you to fetch changes up to c8cb603293fd329f2a62ade76ec9de3f462fc5c3:

  tests/avocado: Test Xen guest support under KVM (2023-04-04 15:56:44 +0100)

----------------------------------------------------------------
Final test and misc fixes:

  - add basic coverage analysis script
  - gdbstub only build one of libgdb_user/softmmu
  - don't break BSD gdb by advertising AUXV feature
  - add MAINTAINERS section for policy docs
  - update hexagon toolchain
  - explicitly invoke iotests with python for BSDs benefit
  - use system python on NetBSD
  - add some tests for the new KVM Xen guest support

----------------------------------------------------------------
Alex Bennée (5):
      scripts/coverage: initial coverage comparison script
      gdbstub: don't report auxv feature unless on Linux
      MAINTAINERS: add a section for policy documents
      metadata: add .git-blame-ignore-revs
      gitlab: fix typo

Daniel P. Berrangé (2):
      tests/qemu-iotests: explicitly invoke 'check' via 'python'
      tests/vm: use the default system python for NetBSD

David Woodhouse (1):
      tests/avocado: Test Xen guest support under KVM

Marco Liebel (1):
      Use hexagon toolchain version 16.0.0

Philippe Mathieu-Daudé (1):
      gdbstub: Only build libgdb_user.fa / libgdb_softmmu.fa if necessary

 MAINTAINERS                                        |  19 +++
 gdbstub/gdbstub.c                                  |   2 +-
 .git-blame-ignore-revs                             |  21 +++
 .gitlab-ci.d/base.yml                              |   2 +-
 gdbstub/meson.build                                |   6 +-
 scripts/coverage/compare_gcov_json.py              | 119 ++++++++++++++
 tests/avocado/kvm_xen_guest.py                     | 171 +++++++++++++++++++++
 .../docker/dockerfiles/debian-hexagon-cross.docker |   2 +-
 tests/qemu-iotests/meson.build                     |   7 +-
 tests/vm/netbsd                                    |   3 +-
 10 files changed, 342 insertions(+), 10 deletions(-)
 create mode 100644 .git-blame-ignore-revs
 create mode 100755 scripts/coverage/compare_gcov_json.py
 create mode 100644 tests/avocado/kvm_xen_guest.py

-- 
2.39.2


