Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EFF69A26C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 00:35:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSnlL-0008U7-Bw; Thu, 16 Feb 2023 18:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlG-0008SP-HZ
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:33:58 -0500
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pSnlE-0008Pc-J4
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 18:33:58 -0500
Received: by mail-il1-x12c.google.com with SMTP id m18so838257ilf.10
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 15:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0GSfRyJA5TQ5IPd4A3FFvv3BctyZX3i9qu9A/U2BVJA=;
 b=qKETRIJgWB2RShA7GGWERxCjL99w7aEz3EV8045pnXc0x2sTf0Ul27S3Brna7TnMVr
 aeAskNhdfPjFBjjzxS+8KcQl31q6+7JlKgGuRN5z/EdN3OKegkDL1UScz/2imYa35pY6
 GNqnQnnQ1H/i5YC/zqH8FJD447YiEJp3z1B6bmiSUdpHTB4l5jS6dGShM9itGmU8CRM2
 /I7G+as24neAzgGgdsfoE9Slwju+RPevjGlgoCKKE5Ad5OZ2xvTIoujqPTX2guLQR2T4
 L6O7Q8AKiHogS9YbcJS8MYDYIK2E2kRaBVGTGRj38Vah/rK8Tqr2s9oo4zuBlUSoONhB
 HKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0GSfRyJA5TQ5IPd4A3FFvv3BctyZX3i9qu9A/U2BVJA=;
 b=PnYOgTvdHM7xGyttlDQ3Zm0IfSkNw07bJiO1gnVC1IeGW4FDoWdd9PPxwuFiK31nQu
 l3NSxagQaDti8QeoK885Ntq3BLqPzjiep2LZ12FiYPXlX3/IH+15eXB7gIx/mLOVBStx
 Ykm8eRQcK6U7LvNFHGeBgbdhBkginuEOvzohSvN07kjVtCE+XCW9OzMnwix7qd0grdO+
 9BmJ8Je2Xzy2ajw0DnrNJkCPdR9ug4JG4pDEZiYhpm/ojBmsEUklnbwEifnY5Rq2DdVy
 WV7jXGFrMyyxHMAL81i09mU+Qv148sJwxJB0QrzkETI47PubMX0jKGl/gZTM8tJsAKA8
 7/xA==
X-Gm-Message-State: AO0yUKW0AB0xWpQVBbzc+4lFmIBwSTJy+Ld7fGs/c/8QMYc8fWx0RgJR
 bvW3dHNK7OxerDxhcl0HmTJhJSA6N2YnHVM3
X-Google-Smtp-Source: AK7set9WLk6lSgk6Zl8JdU8EjdV4eoJpMAj/idaqAQIbujzmkdPsFv5zcNrCmZ7wU7TVG/e3r+3UBQ==
X-Received: by 2002:a05:6e02:1a22:b0:310:ac4e:cb7a with SMTP id
 g2-20020a056e021a2200b00310ac4ecb7amr6882136ile.6.1676590433947; 
 Thu, 16 Feb 2023 15:33:53 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 y7-20020a02a387000000b00346a98b0a76sm934816jak.77.2023.02.16.15.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:33:53 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 00/11] 2023 Q1 bsd-user upstreaming: bugfixes and sysctl
Date: Thu, 16 Feb 2023 16:33:42 -0700
Message-Id: <20230216233353.13944-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
line with standard practice. Also, I've reviewed all these changes, but I don't
know if I need to add Reviewed-by: or not, so I've done it for one or two and
will make it consistent before the pull request. git log suggests maintainers
are inconsistent about this (or I've not discovered the rules they follow).

check-patch gives some line lenght warnings, but should otherwise be OK. There's
several static functions that aren't used until the end of the patch
series... Not sure the best way to suppress the build warnings there (but since
they are just warnings...).

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

Warner Losh (3):
  build: Don't specify -no-pie for --static user-mode programs
  bsd-user: various helper routines for sysctl
  bsd-user: Helper routines h2g_old_sysctl

 bsd-user/freebsd/os-sys.c     | 572 ++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  17 +-
 bsd-user/qemu.h               |   5 +
 configure                     |   2 +-
 4 files changed, 594 insertions(+), 2 deletions(-)

-- 
2.39.1


