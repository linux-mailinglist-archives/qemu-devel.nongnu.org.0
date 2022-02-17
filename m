Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5744B9CB1
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 11:05:53 +0100 (CET)
Received: from localhost ([::1]:59828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdfb-0007m4-SR
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 05:05:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKd9Q-00071J-BG
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:32:36 -0500
Received: from [2a00:1450:4864:20::535] (port=42515
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nKd9O-0003Lo-1W
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:32:35 -0500
Received: by mail-ed1-x535.google.com with SMTP id i11so6867758eda.9
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 01:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ThE1YExpYAFWr7CY879iaC70d809dXBEDkplE0HnioU=;
 b=BsA/YdBNjB8XcMQkyV8EXOLcAQnn5EfGuzrc5v0nVQ1lUtFgDjYZq0WV9/C9Sw9i1b
 5gzvndw8BMWdvcuHh7DWKPBTyttEMo+NmMF9PDQ9SLtb5OfMvaaTeO3FtT8HsueGjjEX
 7+aYswMOMefgO96VHA+tqS1SMSQz1g6odBKYSWdtmPrHGt8y/TOwlIKQ+glBe7HDh2r7
 BNsv+tA58pe+RsxBX6EuHlsaaYY2LsmZRrFJUMZsp0+xdNh5WOP9l82L+2xL6MbUOthJ
 ImtjrhA/YjnuP02vuSXFaDNO917zS/XN3w3pSrw+heEUMWkEYO18tAWJNCQ2/5a5u2mI
 4qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ThE1YExpYAFWr7CY879iaC70d809dXBEDkplE0HnioU=;
 b=CNJnJF6R8VPercZEZfEO8ZT16uu1gD/u9upgHmHO5utl9tTWG5ATufazlzIudsK6Uo
 f0cc0IBmAfAsxvUpPOBz0pQ18zFnY5vceBCu1s7mAtkVOSEuNH/ytgS7Z63C2tTMvbiz
 4jzAnIl2j2ayCdgkvXtEmM4smiRWXUWkdjT+Ef5scimcZBM5d2rG7IyW0poRDpAimfL9
 XbnzSY2cWKDoXjPM+QJYOkngrTDRr7ZSOHydkRezKYAVj62e774Rtt2vFIobmr+3zIq1
 2WmSb5du/U7cJdsNs0OK9wfPVRGa5S05qR1MVmL6B8nLjUf40Gnx1lOT/YH7d/p3D8ZM
 x2bA==
X-Gm-Message-State: AOAM5314iadjf75/ugas+V/SveI/Z1G6kE8aj+q+T19VoRfZjhF5Um/T
 drhGjW84njUFtEDEruUTpw+hsVC2Gio=
X-Google-Smtp-Source: ABdhPJxxo5TXOg3GIHiyu6FAOBdRubzq18t18TAK0WhLrp4H2hA5fAq3+dY+ks8IuN43A2gRFIZ/0g==
X-Received: by 2002:a05:6402:10d5:b0:408:f881:f0f3 with SMTP id
 p21-20020a05640210d500b00408f881f0f3mr1703266edu.112.1645090352444; 
 Thu, 17 Feb 2022 01:32:32 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id fx2sm845709ejb.59.2022.02.17.01.32.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 01:32:32 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/29] Misc mostly build system patches for 2022-02-15
Date: Thu, 17 Feb 2022 10:32:27 +0100
Message-Id: <20220217093227.302898-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, PDS_HP_HELO_NORDNS=0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit ad38520bdeb2b1e0b487db317f29119e94c1c88d:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2022-02-15 19:30:33 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to a971e77aa4a5f31173cd456f9c1d5f819751b997:

  configure, meson: move CONFIG_IASL to a Meson option (2022-02-16 15:01:46 +0100)

----------------------------------------------------------------
* More Meson conversions (0.59.x now required rather than suggested)
* UMIP support for TCG x86
* Fix migration crash
* Restore error output for check-block

----------------------------------------------------------------
v1->v2: removed OpenGL change

Gareth Webb (1):
      target/i386: add TCG support for UMIP

Marc-André Lureau (9):
      qga/vss-win32: fix midl arguments
      meson: drop --with-win-sdk
      qga/vss-win32: use widl if available
      qga/vss: use standard windows headers location
      configure, meson: replace VSS SDK checks and options with --enable-vss-sdk
      meson: do not make qga/vss-win32/meson.build conditional on C++ presence
      qga/vss-win32: require widl/midl, remove pre-built TLB file
      meson: require dynamic linking for VSS support
      meson, configure: move ntddscsi API check to meson

Paolo Bonzini (17):
      meson: use .allowed() method for features
      meson: use .require() and .disable_auto_if() method for features
      configure, meson: move AVX tests to meson
      configure, meson: move membarrier test to meson
      configure, meson: move AF_ALG test to meson
      configure, meson: move libnuma detection to meson
      configure, meson: move TPM check to meson
      configure, meson: cleanup qemu-ga libraries
      configure, meson: move image format options to meson_options.txt
      configure, meson: move block layer options to meson_options.txt
      meson: define qemu_cflags/qemu_ldflags
      configure, meson: move some default-disabled options to meson_options.txt
      configure, meson: move coroutine options to meson_options.txt
      configure, meson: move smbd options to meson_options.txt
      configure, meson: move guest-agent, tools to meson
      meson: refine check for whether to look for virglrenderer
      configure, meson: move CONFIG_IASL to a Meson option

Peter Xu (1):
      memory: Fix qemu crash on starting dirty log twice with stopped VM

Thomas Huth (1):
      tests/qemu-iotests/testrunner: Print diff to stderr in TAP mode

 backends/tpm/meson.build           |  14 +-
 block/meson.build                  |  51 +++-
 configure                          | 598 +------------------------------------
 contrib/vhost-user-gpu/meson.build |   3 +-
 crypto/meson.build                 |   6 +-
 docs/devel/kconfig.rst             |   2 +-
 docs/meson.build                   |   2 -
 hw/acpi/meson.build                |   4 +-
 meson.build                        | 429 +++++++++++++++++---------
 meson_options.txt                  |  64 ++++
 migration/meson.build              |   4 +-
 net/slirp.c                        |  16 +-
 qga/commands-win32.c               |   6 +-
 qga/meson.build                    |  55 +++-
 qga/vss-win32/install.cpp          |   2 +-
 qga/vss-win32/meson.build          |  52 ++--
 qga/vss-win32/provider.cpp         |   4 +-
 qga/vss-win32/qga-vss.tlb          | Bin 1528 -> 0 bytes
 qga/vss-win32/requester.cpp        |   4 +-
 qga/vss-win32/vss-common.h         |   6 +-
 scripts/meson-buildoptions.py      |   2 +
 scripts/meson-buildoptions.sh      |  89 ++++++
 softmmu/memory.c                   |  65 ++--
 softmmu/meson.build                |   5 +-
 target/i386/cpu.c                  |   2 +-
 target/i386/cpu.h                  |   4 +-
 target/i386/helper.c               |   8 +-
 target/i386/tcg/translate.c        |  15 +
 tests/Makefile.include             |   2 +-
 tests/check-block.sh               |   4 -
 tests/meson.build                  |   2 +-
 tests/qemu-iotests/meson.build     |   2 +-
 tests/qemu-iotests/testrunner.py   |   5 +-
 tests/unit/meson.build             |   6 +-
 tools/meson.build                  |  31 +-
 util/meson.build                   |   4 +-
 36 files changed, 690 insertions(+), 878 deletions(-)
 delete mode 100644 qga/vss-win32/qga-vss.tlb
-- 
2.34.1

