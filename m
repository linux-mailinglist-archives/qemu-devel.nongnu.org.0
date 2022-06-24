Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879515595A3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:48:10 +0200 (CEST)
Received: from localhost ([::1]:44112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ez3-0005qf-L6
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:48:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efE-0005kT-L5
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efA-0005PG-FW
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9zuLzxb27Hexp30bOKDN361bTLs6dYdnocSwc3Bu4Og=;
 b=RwQo8r105tv55Nyi3KqD18nGVNUP2sKQu4lhbnzAvnrteaGpaqS6UaP2mbGfOl3SVYeBpn
 Fpw1IF0SSmVU01XSdCs3Vi73+F/7dGO+yfc6Wgbf3emZIac7s1vUb0DTw83cHueRU9/Irn
 Yza/V4zE6qU8+WNFt9ixcTapKKF/9G8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-G8yXnlHrNKKHcStFfp7GvQ-1; Fri, 24 Jun 2022 04:27:34 -0400
X-MC-Unique: G8yXnlHrNKKHcStFfp7GvQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 w14-20020a056402268e00b0043556edda4dso1408954edd.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9zuLzxb27Hexp30bOKDN361bTLs6dYdnocSwc3Bu4Og=;
 b=CK+ae/bygjD1nfwNVCxiUZKWy7jMoDbYQ9/aETMqV3omP2ye/Ti7BYg3VAcumHSVwI
 fVmlB3Nvmmux/NbQJD0PBfF9aOgQrgJFwbEJ/9VK8royhxoFQbkUuuG14lXKuupMdfVV
 t9NOlMm96sBdyPs4ydse7fbXrZIHYQCvCYy1rwxMCXNloTmUDE4ymc4AbyYIf7qCyEfl
 JOWTXpPF51H8kAdAnjvF0cO4i7S4ey8sx82DgD82xmr6TBiQJQdF1gBLo+dcc8RN6+Xm
 EU4UeU6UGa5e04Fl2rm5cT5ZLjbt2QJihISrzdv8n/RXTV+QXmt+fRntR8iNFAcws6vh
 AnTA==
X-Gm-Message-State: AJIora9ZeoOrsZxD9wFN2SWa08D2lmvYNdzqcQSlc9VnXo9zbpspw2rz
 iEhF+ZT9wA5q2FR93YfSWAfpf8B46nizdlIU5UluivFOvIvqX4NWWVSH6+M+B6bvTvvxrChhwmA
 UHUGY15VYixs0faa5zDdx8NQvAc7/75IM/eXNanrH+2tc16UjIwko2TT2YgQT9Fl90yU=
X-Received: by 2002:a05:6402:3594:b0:431:4cb8:c7b6 with SMTP id
 y20-20020a056402359400b004314cb8c7b6mr16059595edc.334.1656059252740; 
 Fri, 24 Jun 2022 01:27:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sYz/78uHEjkc03rI4Xw2+iom0viddeVICkDsWjIHgMyAQlEIvvQwIU2Id/w1ZokfFYCkQkxg==
X-Received: by 2002:a05:6402:3594:b0:431:4cb8:c7b6 with SMTP id
 y20-20020a056402359400b004314cb8c7b6mr16059567edc.334.1656059252414; 
 Fri, 24 Jun 2022 01:27:32 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 s22-20020a170906a19600b0071cef8bafc3sm733336ejy.1.2022.06.24.01.27.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] (Mostly) build system changes for 2022-06-24
Date: Fri, 24 Jun 2022 10:27:16 +0200
Message-Id: <20220624082730.246924-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit 2b049d2c8dc01de750410f8f1a4eac498c04c723:

  Merge tag 'pull-aspeed-20220622' of https://github.com/legoater/qemu into staging (2022-06-22 07:27:06 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 72da35fec9a9ba91a5b2cb9ee00843a94fa9413d:

  accel: kvm: Fix memory leak in find_stats_descriptors (2022-06-24 10:19:17 +0200)

----------------------------------------------------------------
* fuzzing fixes
* fix cross compilation CFLAGS and compiler choice
* do not specify -bios option for tests/vm
* miscellaneous fixes

----------------------------------------------------------------
Alexander Bulekov (2):
      build: improve -fsanitize-coverage-allowlist check
      fuzz: only use generic-fuzz targets on oss-fuzz

Marc-André Lureau (1):
      audio/dbus: fix building

Miaoqian Lin (1):
      accel: kvm: Fix memory leak in find_stats_descriptors

Paolo Bonzini (9):
      tests/vm: do not specify -bios option
      pc-bios/optionrom: use -m16 unconditionally
      configure, pc-bios/optionrom: pass cross CFLAGS correctly
      configure, pc-bios/s390-ccw: pass cross CFLAGS correctly
      configure, pc-bios/vof: pass cross CFLAGS correctly
      configure: allow more host/target combos to use the host compiler
      configure: write EXTRA_CFLAGS for all sub-Makefiles
      tests/tcg: compile system emulation tests as freestanding
      build: try both native and cross compilers for linux-user tests

Thomas Huth (1):
      meson.build: Require a recent version of libpng

 accel/kvm/kvm-all.c                    |   1 +
 audio/meson.build                      |   2 +-
 configure                              | 188 ++++++++++++++++++++-------------
 meson.build                            |   7 +-
 pc-bios/optionrom/Makefile             |  15 +--
 pc-bios/optionrom/code16gcc.h          |   3 -
 pc-bios/s390-ccw/Makefile              |  20 ++--
 pc-bios/s390-ccw/netboot.mak           |   6 +-
 pc-bios/vof/Makefile                   |   8 +-
 scripts/oss-fuzz/build.sh              |   4 +-
 tests/tcg/Makefile.target              |   1 +
 tests/tcg/aarch64/system/pauth-3.c     |   2 +-
 tests/tcg/aarch64/system/semiconsole.c |   2 +-
 tests/tcg/aarch64/system/semiheap.c    |   2 +-
 tests/tcg/multiarch/system/memory.c    |   2 +-
 tests/vm/fedora                        |   1 -
 tests/vm/freebsd                       |   1 -
 tests/vm/netbsd                        |   1 -
 tests/vm/openbsd                       |   1 -
 19 files changed, 143 insertions(+), 124 deletions(-)
 delete mode 100644 pc-bios/optionrom/code16gcc.h
-- 
2.36.1


