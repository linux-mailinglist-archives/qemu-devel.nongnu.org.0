Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E124F4478A7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 03:47:40 +0100 (CET)
Received: from [::1] (port=48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjuhA-0005C9-23
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 21:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjudf-0001jT-Ly
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 21:44:05 -0500
Received: from [2607:f8b0:4864:20::831] (port=36424
 helo=mail-qt1-x831.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjudd-0005Yw-Oh
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 21:44:03 -0500
Received: by mail-qt1-x831.google.com with SMTP id h14so12528139qtb.3
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 18:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fKUPDtQgYNfUANAtJJc/N0Hfr0X53Edeg+FpqU77jbU=;
 b=k8GLhLQwcOF35m3PBFmbK/iEuNE5gxd6g3VSDF1+k1IwMB4Ou+exgkZl8uCg3dp5cx
 0lID7hK0igvOHOahKnokcTj5YcQfBe4R8qoLt9dVR0CAMFQM8IPI+IzmdUjrvtWUKUB6
 PX7FZPORxDfYHcCpFEO3bkthK9OFsT/xYrB83OjUortJP7A/FoPcnJ5SmGxaKBmrLOSr
 HwPGelIYm9a5XdY+Hcehkm0bZucrHDrArTVm/sJPK/I9kOvm7n750kKFImogxV9fVQb5
 gm3FA0G6XiGjEn04d0zNySo9xpECp+wO1wrT3JCV+k29OhrYaL6I+Jjkzfs4gnuiFKva
 odJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fKUPDtQgYNfUANAtJJc/N0Hfr0X53Edeg+FpqU77jbU=;
 b=1QdIkm82OoAoWe2b5MVkMCO3QUbg6BG4X15ZHSsCAc0y299JYxx2fKwpwMB0tABmSy
 SREB4zlUHaxc2reJWk+0M3IizQpOahDh0aihzxoej01Gq/RURKHXDsRH70dRq8TdOzkr
 srKU89/NfKvrJEMiNe/lXXdSZgkYAml7yu/2TB6d3n7dOe827qXveivX1zGv4r29BjRJ
 +zYNGTqkKUMUT4QIOvStXoQZdypQKBIpppKHbrBJ7FAjX3wSQIGraYQqtESNaPoZjvp3
 uwHqJflGm/6ufL+8/RK6D4rvJCf1KbgJrHvr11CsLe78MqtjFzq1s+87ilLgU6c4SYQ5
 l02g==
X-Gm-Message-State: AOAM532so28uls2RRtRB/yfGUtH08XNk+myaHKucDUeS+l0bfaKie0zb
 LNea2iIXCsje1sXr8AWPzPIVxzko8H+qbw==
X-Google-Smtp-Source: ABdhPJwfbEhiF/NaFziOBRVooDIRk1eehHPgwyPMyQ0jKqhaHMOzq8ovTe5CeklVAQvpMutiee+ZDA==
X-Received: by 2002:a05:6638:1134:: with SMTP id
 f20mr2508538jar.6.1636339090688; 
 Sun, 07 Nov 2021 18:38:10 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id m2sm9030284iow.6.2021.11.07.18.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 18:38:10 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/4] linux-user: simplify safe signal handling
Date: Sun,  7 Nov 2021 19:37:34 -0700
Message-Id: <20211108023738.42125-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::831
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::831;
 envelope-from=imp@bsdimp.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 Philippe Mathieu-Daude <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a quick RFC to see if something like this is worth doing.

I've created a new interface host_signal_set_pc. This allows us to move all the
nearly identical copies of rewind_if_in_safe_syscall into signal.c.  This
reduces the amount of code that needs to be rewritten for bsd-user's adaptation
of both the safe signal handling and the sigsegv/sigbus changes that have
happened. Since BSD's mcontext_t differs in some cases, we wouldn't be able to
share this between platforms, but it reduces the number of nearly identical
routines I'd have to write.

In addition, the assembler glue for the safe system calls is almost identical
between linux and bsd-user's fork. The only difference is inverting the system
call return to comply with the -ERRNO convention *-user uses in the rest of the
code which is native to Linux, but differs for the BSDs and other traditional
unix targets.

I know the patches may not be sliced and diced in the typical desired
fashion. This is a RFC, and the changes are short enough to be easily digested
though since it's quite repetitive.

These were extracted from the 'blitz' branch we have in the bsd-user fork and
then that was adapted to use the common code. I've pushed a branch to gitlab
(viewable at https://gitlab.com/bsdimp/qemu/-/tree/blitz if you prefer that to
fetching) that shows how these will be used. I'm working on upstreaming
bsd-user/signal.c next which will take a little bit of time to work into a place
where it can be reviewed here. I wanted to get feedback because this is
one chunk I can cleave off and make landing that easier.

Warner Losh (4):
  linux-user: Add host_signal_set_pc to set pc in mcontext
  linux-user/signal.c: Create a common rewind_if_in_safe_syscall
  linux-user/safe-syscall.inc.S: Move to common-user
  common-user: Allow return codes to be adjusted after sytsem call

 .../host/aarch64/safe-syscall.inc.S           |  1 +
 .../host/arm/safe-syscall.inc.S               |  1 +
 .../host/i386/safe-syscall.inc.S              |  1 +
 .../host/ppc64/safe-syscall.inc.S             |  1 +
 .../host/riscv/safe-syscall.inc.S             |  1 +
 .../host/s390x/safe-syscall.inc.S             |  1 +
 .../host/x86_64/safe-syscall.inc.S            |  1 +
 linux-user/host/aarch64/host-signal.h         |  5 +++++
 linux-user/host/aarch64/hostdep.h             | 20 -------------------
 linux-user/host/alpha/host-signal.h           |  5 +++++
 linux-user/host/arm/host-signal.h             |  5 +++++
 linux-user/host/arm/hostdep.h                 | 20 -------------------
 linux-user/host/i386/host-signal.h            |  5 +++++
 linux-user/host/i386/hostdep.h                | 20 -------------------
 linux-user/host/mips/host-signal.h            |  5 +++++
 linux-user/host/ppc/host-signal.h             |  5 +++++
 linux-user/host/ppc64/hostdep.h               | 20 -------------------
 linux-user/host/riscv/host-signal.h           |  5 +++++
 linux-user/host/riscv/hostdep.h               | 20 -------------------
 linux-user/host/s390/host-signal.h            |  5 +++++
 linux-user/host/s390x/hostdep.h               | 20 -------------------
 linux-user/host/sparc/host-signal.h           |  9 +++++++++
 linux-user/host/x86_64/host-signal.h          |  5 +++++
 linux-user/host/x86_64/hostdep.h              | 20 -------------------
 linux-user/safe-syscall.S                     |  1 +
 linux-user/signal.c                           | 18 ++++++++++++++++-
 meson.build                                   |  1 +
 27 files changed, 80 insertions(+), 141 deletions(-)
 rename {linux-user => common-user}/host/aarch64/safe-syscall.inc.S (99%)
 rename {linux-user => common-user}/host/arm/safe-syscall.inc.S (99%)
 rename {linux-user => common-user}/host/i386/safe-syscall.inc.S (99%)
 rename {linux-user => common-user}/host/ppc64/safe-syscall.inc.S (99%)
 rename {linux-user => common-user}/host/riscv/safe-syscall.inc.S (99%)
 rename {linux-user => common-user}/host/s390x/safe-syscall.inc.S (99%)
 rename {linux-user => common-user}/host/x86_64/safe-syscall.inc.S (99%)

-- 
2.33.0


