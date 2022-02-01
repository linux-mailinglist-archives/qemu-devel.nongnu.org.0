Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3024A5B8B
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 12:48:56 +0100 (CET)
Received: from localhost ([::1]:57956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEreZ-0000tg-IS
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 06:48:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7q-00055F-Cf
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:06 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=39714
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7k-0003Wl-6X
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:05 -0500
Received: by mail-io1-xd2a.google.com with SMTP id c188so20692598iof.6
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B9w6wx8NG62rAfHCj0klZFbS9eHjIHQIXTL3hmS8I1I=;
 b=aswagdrb/RRzKUFIGzPd4owlqLtzKYawpZmrOpAUSpSlP//aHylqpPtSN/sOmPvi5O
 hRdI3Qsw78vK43BFqfm81sCsQk8vvKBRryZjn3cNFArKPhqXwvs0FlYwDAdz+bTHh+4u
 atufn8IPOinHB0BQfYvVQOgxBeIAeMGzbGsEoAeI2Do1S2c2rcmMHCIqj021hGzZ67fv
 IytxfFJ5ICF5Y40HN+T0tX+4JM/rl9gRj15XhKaO8agNdBmduoulRkjTDgnQq5sJ+3bl
 66fQ9VaRYR7ITgvJUaBdiYnB/D7h2HKorTO+lc1KVsPdxLHaKYwppEZZAcTOvP5aUg3F
 XseQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B9w6wx8NG62rAfHCj0klZFbS9eHjIHQIXTL3hmS8I1I=;
 b=v5E59Z7lu/PHI9XufZWQrGJVjTLmiFXO1CCTcuwFOClgwQFtDfVppgdaCDWswOeabt
 MXLcwv5w25BDt6ah1x7Z8oFHw28rypNHiWEfrSg3+wE31eGzFUSAyunXbe7UIxTAFEG0
 wxwI4JzWgix7d29DFFmNwIlPvhRCVaa6xwwgTot1kq9qipwrx+J3/2QxBdtJSqPbWOMS
 HzH6Ql05rhqmvHsLWrLEeS1hWOKvECr+c1Pax9LlyeiqmwQGT7kzmr6C8rF0Uo0HQWbe
 l2qaEUwdyi7xTjUemr6WvjsrpzftJfyhV4r2cFTofFfvfjDvEGSHEclM93YMHM5fF77n
 nyug==
X-Gm-Message-State: AOAM530z2ifxF8YO4JQzBcFhK5oyShlT6C1n+KgfD2o+fzevz46Vi54v
 G3CVkWod94nYNWyeGHn5MHZv5R+j5SxkJQ==
X-Google-Smtp-Source: ABdhPJwDDWif4Av0/Quh8OPh94m/TNLXkjQdJh/GfDCStoNwigg/Kmp/DkF8w9//b74nTFSgHqptEg==
X-Received: by 2002:a05:6638:2217:: with SMTP id
 l23mr5066892jas.171.1643714087300; 
 Tue, 01 Feb 2022 03:14:47 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:14:46 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/22] bsd-user: Start upstreaming the system calls.
Date: Tue,  1 Feb 2022 04:14:33 -0700
Message-Id: <20220201111455.52511-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches does two things. First, it starts to give up on the idea
that you can run FooBSD binaries on BarBSD. They are too different to make that
happen any time soon, though I've kept the support for Net/OpenBSD, even though
they haven't built. We'll need a lot of work to make that happen, though, and
I need to simplify to get things upstream.

Second, this upstreams the first 9 system calls. It deletes the old
implementation and starts fresh with a new one that pulls some things from the
old, updates some old things, etc. It's easier to understand this way.

Finally, it starts to move some of the ifdef trees into target.h.

Warner Losh (22):
  bsd-user/main.c: Drop syscall flavor arg -bsd
  bsd-user/x86_64/target_arch_cpu.h: int $80 never was a BSD system call
    on amd64
  bsd-user/x86_64/target_arch_cpu.h: Remove openbsd syscall
  bsd-user/i386/target_arch_cpu.h: Remove openbsd syscall
  bsd-user/arm/target_arch_cpu.h: Only support FreeBSD sys calls
  bsd-user/arm/target_arch_thread.h: Assume a FreeBSD target
  bsd-user/x86_64/target_arch_thread.h: Assume a FreeBSD target
  bsd-user: Remove bsd_type
  bsd-user/freebsd/os-syscall.c: Move syscall processing here
  bsd-user: Move system call building to os-syscall.c
  bsd-user/sycall.c: Now obsolete, remove
  bsd-user/freebsd/os-syscall.c: Add get_errno and host_to_target_errno
  bsd-user/bsd-file.h: Implementation details for the filesystem calls
  bsd-user/freebsd/os-syscall.c: lock_iovec
  bsd-user/freebsd/os-syscall.c: unlock_iovec
  bsd-user/freebsd/os-syscall.c: Tracing and error boilerplate
  bsd-user: introduce target.h
  bsd-user: Define target_arg64
  bsd-user: Add safe system call macros
  bsd-user/bsd-file.h: Add implementations for read, pread, readv and
    preadv
  bsd-user/bsd-file.h: Meat of the write system calls
  bsd-user/freebsd/os-syscall.c: Implement exit

 bsd-user/arm/target.h                |  21 ++
 bsd-user/arm/target_arch_cpu.h       | 139 ++++----
 bsd-user/arm/target_arch_thread.h    |   4 +-
 bsd-user/bsd-file.h                  | 203 +++++++++++
 bsd-user/bsd-proc.h                  |  43 +++
 bsd-user/freebsd/meson.build         |   1 +
 bsd-user/freebsd/os-syscall.c        | 287 +++++++++++++++
 bsd-user/i386/target.h               |  21 ++
 bsd-user/i386/target_arch_cpu.h      |  84 ++---
 bsd-user/main.c                      |  14 -
 bsd-user/meson.build                 |   1 -
 bsd-user/qemu.h                      |  24 +-
 bsd-user/syscall.c                   | 516 ---------------------------
 bsd-user/syscall_defs.h              |  47 +++
 bsd-user/x86_64/target.h             |  21 ++
 bsd-user/x86_64/target_arch_cpu.h    |  85 +----
 bsd-user/x86_64/target_arch_thread.h |   4 +-
 17 files changed, 773 insertions(+), 742 deletions(-)
 create mode 100644 bsd-user/arm/target.h
 create mode 100644 bsd-user/bsd-file.h
 create mode 100644 bsd-user/bsd-proc.h
 create mode 100644 bsd-user/freebsd/os-syscall.c
 create mode 100644 bsd-user/i386/target.h
 delete mode 100644 bsd-user/syscall.c
 create mode 100644 bsd-user/x86_64/target.h

-- 
2.33.1


