Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C493695557
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 01:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRjB1-0007Mc-9R; Mon, 13 Feb 2023 19:28:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjAz-0007MG-EF
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:05 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pRjAx-0005yP-4D
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 19:28:04 -0500
Received: by mail-il1-x134.google.com with SMTP id w13so5842708ilv.3
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 16:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8LPCZr3jj81H8sht3I3EycAuKXKySl553MX/fL3sCK8=;
 b=aTpRJhY1hHRlZlbzqH2WUcNMj0Rdk5JcFeNDpSms4370hQ7jEpIeVmvIR/DLL0KEAo
 fXz3hvBOsCxydDaGz0YcImIkOh3V3249Lf92mqQTHnLfoF7nMgA7WiAgJwf/dm1wHkLc
 oWNBpck1cyc/RoDAFFXIpZzBGmn4zLJLxDfR0J4z3HA/41pCo1Bc48A8ai/rF0pKbjAE
 FjPocKBHr25mdrwVYaHawAP+GgKdOmks4wnuRbIW0MpUXPxCQMA9XbhJ652Ysk5WTBqN
 CwdiU8m/ho1QQAdfxAvMWms5z22kc51SN2yChcYf9T3xE8GlLiZ/d/gIaQuZQqOqCkcJ
 QQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8LPCZr3jj81H8sht3I3EycAuKXKySl553MX/fL3sCK8=;
 b=BOg2DqPK9qMdURnNthdyy0+OAoDjCmS0oIuKlZSi+Lq2Y5iMYKaypNDD+1nQYtMRMW
 r22osHUsFotKNPS9UfMKnVz1NdJfNdlyjpVPEeleMdom6m9sEM0KdyF/sAE253WRPGTG
 ugRBA96S4+pg3EumNpa2BtmP1VY/WQ6+G3C2OICI3qcyjft5z7haPSlXHk39DWaBbGF+
 ww0PIpEuG2WDr3FGrMoZemvZW0MBnL/0DdEmx5eUquP9lznHUgnSdkfaSKImkAd8HiDY
 9UIPB5RTIWVj3zv8tS4mgq/iBDD857FDEBKkZp9ijkyCoQpBc1+SgOJqt+tFYvnegYnY
 a1kw==
X-Gm-Message-State: AO0yUKXul/gnvcyasGH7abW/BV9yeDGLZxuN+oh7hrm43zmXHS+XXAIY
 9lzW65cpl4ljQd0AOUe09ch1HcsVIJ359m9x
X-Google-Smtp-Source: AK7set8dHT0TR6mc74msLfDpIytF/3KFY0/wIjcqGOE6nCrYBOVlQWIQr+efMK34lBg0s8V4PjouFg==
X-Received: by 2002:a05:6e02:1d0b:b0:314:e56:5514 with SMTP id
 i11-20020a056e021d0b00b003140e565514mr616384ila.1.1676334480519; 
 Mon, 13 Feb 2023 16:28:00 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 r17-20020a028811000000b003af4300d670sm4500923jai.27.2023.02.13.16.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 16:27:59 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, richard.henderson@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 00/12] 2023 Q1 bsd-user upstreaming: bugfixes and sysctl
Date: Mon, 13 Feb 2023 17:27:45 -0700
Message-Id: <20230214002757.99240-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::134;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x134.google.com
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

This group of patches gets the basic framework for sysctl upstreamed. There's a
lot more to translate far too many binary blobs the kernel publishes via
sysctls, but I'm leaving those out in the name of simplicity.

There's also a bug fix from Doug Rabson that fixes a long int confusion leading
to a trunctation of addresses (oops)

I've added a new command line arg -strict for debugging when you want to stop
dead in the tracks when there's something unimplemented (like system calls)
rather than trying one's best to cope. It will also let whoever is working on
upstreaming to get something working to run it this way and find the missing
bits more easily. sysctl happens to be the first unimplemented system call for a
dynamically linked hello world.

There's a fix for the -static option, since clang hates -no-pie and needs only
-fno-pie.

Finally, I'm changing how I'm upstreaming a little. I'm doing a little deeper
dives into our rather chaotic repo to find a couple of authors I might have
missed. From here on out, I'll be using the original author's name as the git
author. I'll also tag the co-authors better as well when there's multiple people
that did something (other than reformat and/or move code around). I've
discovered more code moved about than I'd previously known. This seems more in
line with standard practice. Also, I've reviewed all these changes, but I don't
know if I need to add Reviewed-by: or not, so I've done it for one or two and
will make it consistent before the pull request. git log suggests maintainers
are inconsistent about this (or I've not discovered the rules they follow).

check-patch gives some line lenght warnings, but should otherwise be OK. There's
several static functions that aren't used until the end of the patch
series... Not sure the best way to suppress the build warnings there (but since
they are just warnings...).

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

Warner Losh (4):
  build: Don't specify -no-pie for --static user-mode programs
  bsd-user: various helper routines for sysctl
  bsd-user: Helper routines h2t_old_sysctl
  bsd-user: Add -strict

 bsd-user/freebsd/os-sys.c     | 582 ++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  21 +-
 bsd-user/main.c               |   5 +-
 bsd-user/qemu.h               |   6 +
 configure                     |   2 +-
 5 files changed, 613 insertions(+), 3 deletions(-)

-- 
2.39.1


