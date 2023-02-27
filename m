Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7486A48C0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 18:57:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWhiv-0003J5-1y; Mon, 27 Feb 2023 12:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhio-0003BJ-FF
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pWhim-0004LX-AH
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 12:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677520531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dw/4FJSjCwoufbsHaAJt3XKEipPWieLFIqdrWRXbsYQ=;
 b=bZnUfz2jv7X99CkADmhdzlzLxdNCtoerBDAFzUxQ4XTq0gs+XJ4koylifgYZyaupI08BHc
 UO/iti5BbTK9FGodAVkZylApgIR1H5cQcoNi3G5N4Hd9EC+VyAfPvAexmrN7pOvalgakGQ
 ocs4SqOZG6NQYdJq/GGhi0JI4d/rPbs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-5-6eVR9IMb26wJenFXkOaA-1; Mon, 27 Feb 2023 12:55:29 -0500
X-MC-Unique: 5-6eVR9IMb26wJenFXkOaA-1
Received: by mail-ed1-f72.google.com with SMTP id
 fi8-20020a056402550800b004a26cc7f6cbso9738790edb.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 09:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dw/4FJSjCwoufbsHaAJt3XKEipPWieLFIqdrWRXbsYQ=;
 b=jUIurkOpzAmNSsH7TAF24NHHUyJqwhobz520d8A21mnjpH0NUmQeNZj03UubZBj3IW
 IKbBWj0dMc8YczkoYeXB6Zf6etOsBf9uk92lhmIOMqSucmJq0A0R0s9teX0VrYT5GuxU
 +fqGMkHESnFnw20LNSR3zOwmdj6BvOHw+qrQeEwZasTyfBC9pzg1JvBNA8WdakrSuEoQ
 jV4Ve23ITDfVSeb7I3+JO0NizV+lpn9sr/Tb62MpSoCCMq92fjn6K5OpbPYELcXvEOFC
 DlebGzoJ7f8sFTukrjumygqy+5HLimxe4KU3gI1oB+YMARW7eXgCXmNTpu5li052gD/T
 OhUQ==
X-Gm-Message-State: AO0yUKVm1Fh5056L+8NtnmKJFMQsmFU5imYw9887Ucd7Y48e0Bjhb9We
 Bmxx5DkHDp8NnPCxKQdHgMDv5+Vb0OiL7/euGXlrEI+t0sY0WglT25vnufLk50a7qzPBMDoDStN
 zy4rEOgYTFwZonnmJdC/QalK8H7i9aXMHSAtWbDr0a4EE60xQGbWUJxT0cG2cxzZtMSy8ZWuT
X-Received: by 2002:a17:906:7e1a:b0:8af:3fef:52c9 with SMTP id
 e26-20020a1709067e1a00b008af3fef52c9mr35709413ejr.22.1677520527931; 
 Mon, 27 Feb 2023 09:55:27 -0800 (PST)
X-Google-Smtp-Source: AK7set8UMZge+0L23my2U5nEkbLuLYlc26rA2Ndvsf9He1WaWITpmNgyVXlB+001W3EofgHvcoaYGA==
X-Received: by 2002:a17:906:7e1a:b0:8af:3fef:52c9 with SMTP id
 e26-20020a1709067e1a00b008af3fef52c9mr35709390ejr.22.1677520527456; 
 Mon, 27 Feb 2023 09:55:27 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 gg16-20020a170906e29000b008d044ede804sm3411031ejb.163.2023.02.27.09.55.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 09:55:27 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] build, Python, target/i386 changes for 2023-02-27
Date: Mon, 27 Feb 2023 18:55:11 +0100
Message-Id: <20230227175524.710880-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit 1270a3f57c9221080f3205a15964814ff8359ca9:

  Merge tag 'for-upstream' of https://repo.or.cz/qemu/kevin into staging (2023-02-24 15:09:39 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream-8.0

for you to fetch changes up to 7eb061b06e97af9a8da7f31b839d78997ae737fc:

  i386: Add new CPU model SapphireRapids (2023-02-27 18:53:00 +0100)

----------------------------------------------------------------
* New Sapphire Rapids model support
* x86 bugfixes
* Prepare to drop support for Python 3.6

----------------------------------------------------------------
John Snow (2):
      meson: stop looking for 'sphinx-build-3'
      configure: Look for auxiliary Python installations

Markus Armbruster (1):
      meson: Avoid duplicates in generated config-poison.h again

Paolo Bonzini (7):
      configure: protect against escaping venv when running Meson
      lcitool: update submodule
      docs/devel: update and clarify lcitool instructions
      ci, docker: update CentOS and OpenSUSE Python to non-EOL versions
      target/i386: add FSRM to TCG
      target/i386: add FZRM, FSRS, FSRC
      target/i386: KVM: allow fast string operations if host supports them

Philippe Mathieu-Daudé (1):
      MAINTAINERS: Cover RCU documentation

Richard Henderson (1):
      target/i386: Fix BZHI instruction

Wang, Lei (1):
      i386: Add new CPU model SapphireRapids

 MAINTAINERS                                        |   2 +
 configure                                          |  82 +++++++++---
 docs/devel/testing.rst                             |  76 ++++++-----
 docs/meson.build                                   |   9 +-
 meson_options.txt                                  |   2 +-
 scripts/make-config-poison.sh                      |   2 +-
 scripts/meson-buildoptions.sh                      |   1 +
 target/i386/cpu.c                                  | 142 ++++++++++++++++++++-
 target/i386/cpu.h                                  |  11 ++
 target/i386/kvm/kvm.c                              |  17 ++-
 target/i386/tcg/emit.c.inc                         |  14 +-
 tests/docker/dockerfiles/alpine.docker             |   2 +-
 tests/docker/dockerfiles/centos8.docker            |  22 ++--
 tests/docker/dockerfiles/fedora-win32-cross.docker |   1 +
 tests/docker/dockerfiles/fedora-win64-cross.docker |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker      |  22 ++--
 tests/docker/dockerfiles/ubuntu2004.docker         |   2 +-
 tests/lcitool/libvirt-ci                           |   2 +-
 tests/lcitool/mappings.yml                         |  77 +++++++++++
 tests/lcitool/targets/centos-stream-8.yml          |   3 +
 tests/lcitool/targets/opensuse-leap-153.yml        |   3 +
 tests/tcg/i386/test-i386-bmi2.c                    |   3 +
 22 files changed, 398 insertions(+), 98 deletions(-)
 create mode 100644 tests/lcitool/mappings.yml
 create mode 100644 tests/lcitool/targets/centos-stream-8.yml
 create mode 100644 tests/lcitool/targets/opensuse-leap-153.yml
-- 
2.39.1


