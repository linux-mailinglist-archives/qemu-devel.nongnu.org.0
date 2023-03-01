Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71CE6A735C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 19:25:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXR7d-0005MI-T6; Wed, 01 Mar 2023 13:24:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7b-0005E4-5D
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:11 -0500
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pXR7Y-0006nR-B6
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 13:24:10 -0500
Received: by mail-io1-xd31.google.com with SMTP id g6so5726133iov.13
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 10:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1677695046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=guaqGqmOenFWDTxWc5LwiGQo0UXRDUKQSPASSjxm0d8=;
 b=qkaAjzxB7aMjeak90upJaSYfAT38afbOGOGxAKkHRAJcQAdbstQtAL5k5Wb/H1ctlg
 ftX5ifZWKuxDwc2l/qxQDfS9L0UB40eYRBM8ITiyou6hytWY8DSZ4bRlvCDNwxuf8YX1
 DQWaQOvVV/JAibOya+qcHaBrXCmtyYBEcTIvx8YmXbbTR0dBJwVI/fELuFg+C0GpT47W
 fRYS5xfX0asBsFDMbJ2M+b1ryXkYM+CFfPL4659JXGPztGUIVUAvcW1YRlnYELnOD+mT
 DoegC0yRt6oqgMFYiWO6qxzoJTPOqbs9CY9ZRGGpy6eLHFPrHX8D9oVursOnMGj0MD4A
 xUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677695046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=guaqGqmOenFWDTxWc5LwiGQo0UXRDUKQSPASSjxm0d8=;
 b=EwWlYorC4F2qtl18T9i90G314SwLSTPek7J2uAAbuHWbCyaFzNJ0jw6UGxGSRr5UTC
 cGUcV15z4RbjyM+q7STKnSCjIzG0Y/RBTAWqRexzLWtRyl3KPxt+labZH1gtL36rD7/H
 XLqoPEDNfElX4Xi/Riyg1bgFPj45I+ly1eXQoc5Tf4eiMaB6X9qyqoZKbIHCYdKn4aCh
 J9dzMD4xmuHwVjgEqozlmCjrB3e4u1tRkHvXfu/t48Lyel3Mde43nsZCNSqAo1fnAmkc
 2yhHJLee7SYYkYdlW1PEUEgRA6LmdNpkRIkM9+6q1C/jiWk92Ti1Ldi277vx9UtCIwkA
 tyxg==
X-Gm-Message-State: AO0yUKUZ2p95LnhyuG/awQNymWDmM9igV9yV4nfBdnFXvDSGdmrNfhhP
 VBEyLkEQjW+1pIQkQywXOs9AQhQwiUJqf/No
X-Google-Smtp-Source: AK7set+P9gI+KEnKahXjAJ2RC6AipP8zsko3FKskG/ZNccZBdTdVkC7weeO9bTJFr8I/aLJwHSJs5g==
X-Received: by 2002:a5d:8411:0:b0:74c:d66a:25ef with SMTP id
 i17-20020a5d8411000000b0074cd66a25efmr5138312ion.2.1677695045924; 
 Wed, 01 Mar 2023 10:24:05 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 l5-20020a6b7b05000000b0073f8a470bacsm4169316iop.16.2023.03.01.10.24.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 10:24:05 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL 00/10] Bsd user 2023q1 patches
Date: Wed,  1 Mar 2023 11:23:43 -0700
Message-Id: <20230301182353.21559-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:

  Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)

are available in the Git repository at:

  git@gitlab.com:bsdimp/qemu.git tags/bsd-user-2023q1-pull-request

for you to fetch changes up to 6da777e2121b1eed4d20cc3e892b3c3d303bc252:

  bsd-user: implement sysctlbyname(2) (2023-03-01 11:09:19 -0700)

----------------------------------------------------------------
2023 Q1 bsd-user upstreaming: bugfixes and sysctl

[ letter edited -- need reviews for these hunks
     bsd-user: Helper routines h2g_old_sysctl
     bsd-user: various helper routines for sysctl
]

This group of patches gets the basic framework for sysctl upstreamed. There's a
lot more to translate far too many binary blobs the kernel publishes via
sysctls, but I'm leaving those out in the name of simplicity.

There's also a bug fix from Doug Rabson that fixes a long int confusion leading
to a trunctation of addresses (oops)

There's a fix for the -static option, since clang hates -no-pie and needs only
-fno-pie.

Finally, I'm changing how I'm upstreaming a little. I'm doing a little deeper
dives into our rather chaotic repo to find a couple of authors I might have
missed. From here on out, I'll be using the original author's name as the git
author. I'll also tag the co-authors better as well when there's multiple people
that did something (other than reformat and/or move code around). I've
discovered more code moved about than I'd previously known. This seems more in
line with standard practice.

v3->pull:
o minor	tweaks in the conditional reviews around formatting
o fix all errors for check patch and am	OK with	remaining warnings for
  line length that's only slightly too long
o edited letter for changes in review process

v3:
o Removed -strict, it's not ready and needs a complete rethink.
o Add g_assert_not_reached()
o target -> guest in most places
o Use MIN() to simplify things
o Better types in many places (abi_int instead of int32_t)
o Use ARRAY_COUNT
o fix tabs copied from FreeBSD sources to spaces

v2:
o Created various helper functions to make the code a little better
o split a few patches that I thought would be approved together but
  that generated commentary. It's easier to manage 1 per patch for
  those.
o Add/delete G_GNU_UNUSED to ensure all patches compile w/o warnings
o Fix 64-bit running 32-bit binary to get a LONG or ULONG. Add a
  bounce buffer for these so we don't overflow anything on the target
  and return all the elements of arrays.
o Fixed a number of nits noticed in the review.
o Add or improve comments to explain things there were questions on
  during the review.
o fix noted typos
o fix host != target page size differences
o Add pointers to FreeBSD source code, as appropriate
o fix locking (mostly unlocking) on error paths
o Note: -strict feedback not yet applied due to large numbers of changes
  from the rest. Next round.

----------------------------------------------------------------

Doug Rabson (1):
  bsd-user: Don't truncate the return value from freebsd_syscall

Juergen Lock (3):
  bsd-user: sysctl helper funtions: sysctl_name2oid and sysctl_oidfmt
  bsd-user: common routine do_freebsd_sysctl_oid for all sysctl variants
  bsd-user: Start translation of arch-specific sysctls

Kyle Evans (2):
  bsd-user: do_freebsd_sysctl helper for sysctl(2)
  bsd-user: implement sysctlbyname(2)

Stacey Son (2):
  bsd-user: Add sysarch syscall
  bsd-user: Helper routines oidfmt

Warner Losh (2):
  build: Don't specify -no-pie for --static user-mode programs
  bsd-user: various helper routines for sysctl

 bsd-user/freebsd/os-sys.c     | 571 ++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  17 +-
 bsd-user/qemu.h               |   5 +
 configure                     |   2 +-
 4 files changed, 593 insertions(+), 2 deletions(-)

-- 
2.39.1


