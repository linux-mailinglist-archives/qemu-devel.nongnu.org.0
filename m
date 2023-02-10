Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEC0692B11
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 00:23:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQcj8-0007BW-Mv; Fri, 10 Feb 2023 18:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj5-00079o-Cz
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:43 -0500
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pQcj1-000517-Sh
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 18:22:43 -0500
Received: by mail-il1-x12a.google.com with SMTP id h29so1085026ila.8
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 15:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0BA7Lth/FgA6Mw9UTktGVhv+X66TaZUxxdbFK8V7Gic=;
 b=qNCM7q2cvxB5sbqnsDXM2jztb4Dtbg0FhDLzEBOnk9wv+XGBZEOVNrZMzjJC074mBH
 u76vi5uexCvVf/+guIAX/HXI2TJDcwNBslZAY7g3jFfYT6ajvvXJR4bKAn1Av3KbLH4Y
 z+XU7rH8d75fx8colHmT04H3OlDpygHR2e4ewvyhtCRv/DYTvN2sdSbbNqma5fKVoI0p
 8if2l5lhkVkSlCeivP+GGL0hsV1vn3tnaG3rSe6SO2xTTsw6f+Fv7R4hXHJJnJE/8FVL
 qXSp439JbrI7PuwPoqc68fjbXDhrK1d57UWGuJ7qZvg4jpOx2g8gKfLdPagPTNAMMtZX
 elGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0BA7Lth/FgA6Mw9UTktGVhv+X66TaZUxxdbFK8V7Gic=;
 b=rf9C2cwkNCrgyTEkOePrytToXxC4BE1bJj3sGyReNhLpb/CxRzx4In2oCJgsWHszbG
 PCQVWBCCPXLb17KhGGV31T+4/Do4jFX66DEEDVcFs6Ujee/Vhv0c6SmtZIta+PKKPQ3W
 +PgC0UDBjpsPxo7fCB953kiC0m6NJQnQ1NsHEXaKbs3Qk+P+nhxNQOjieqlYQs3SZr+M
 IV6LcOkrcYoEU51OWFLal38vDGlxC6BcqbCH4/eURMVJWQS3dz5/qqeo89LmGKYwTFzT
 VxaccbEBqRO7vrOkbruL+K6+YLktgK+qswXkSb+20C70MvNtRpwgLlXe4DqGrW1W0vjE
 SbzA==
X-Gm-Message-State: AO0yUKWZG60ytGpgJjHyhCO6ysZHlntp4WZLXG2AHWnR99TDZAW3b2Kq
 1Xc/uirwetrV9tKR2DTOpoYUQ/W7fzG1RHOv
X-Google-Smtp-Source: AK7set9vtxTB7paspAcpXVP3svZC5jnJz6dMHtaF2v7TFbcymOpxKCycB+inikdzjaZA8qBiNW+LNw==
X-Received: by 2002:a92:7507:0:b0:311:13c1:abd4 with SMTP id
 q7-20020a927507000000b0031113c1abd4mr11773236ilc.24.1676071353964; 
 Fri, 10 Feb 2023 15:22:33 -0800 (PST)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 k18-20020a02c772000000b003a9418e89acsm1850995jao.23.2023.02.10.15.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 15:22:33 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/9] 2023 Q1 bsd-user upstreaming: bugfixes and sysctl
Date: Fri, 10 Feb 2023 16:18:20 -0700
Message-Id: <20230210231829.39476-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
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

Doug Rabson (1):
  bsd-user: Don't truncate the return value from freebsd_syscall

Juergen Lock (2):
  bsd-user: sysctl helper funtions: sysctl_name2oid and sysctl_oidfmt
  bsd-user: common routine do_freebsd_sysctl_oid for all sysctl variants

Kyle Evans (2):
  bsd-user: do_freebsd_sysctl helper for sysctl(2)
  bsd-user: implement sysctlbyname(2)

Stacey Son (2):
  bsd-user: Add sysarch syscall
  bsd-user: Two helper routines oidfmt and sysctl_oldcvt

Warner Losh (2):
  build: Don't specify -no-pie for --static user-mode programs
  bsd-user: Add -strict

 bsd-user/freebsd/os-sys.c     | 432 ++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  21 +-
 bsd-user/main.c               |   5 +-
 bsd-user/qemu.h               |   6 +
 configure                     |   2 +-
 5 files changed, 463 insertions(+), 3 deletions(-)

-- 
2.39.1


