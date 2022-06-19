Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B476A550C70
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 20:08:20 +0200 (CEST)
Received: from localhost ([::1]:54806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2zLP-0003e5-4y
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 14:08:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIS-0000sK-R2
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:16 -0400
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:39849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIR-0001Kb-3W
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:16 -0400
Received: by mail-il1-x135.google.com with SMTP id m16so4569876ilf.6
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 11:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cd6TNxsj5evEBZuArkKRZqRDClGmYpNEhM3Ab7aoZ+s=;
 b=1hi5junMLBXGlzM/5lOIf2Xy0dPF1bD7mGwWPsToA/uq14nlvS+XekaeEzACTIu4bW
 jkmx7RocxgUqd4BiaHn6YSnlGoOvUaQ/A2ZhRjsPHD32/z+LnbjsO97jL7yzZaU/P6AP
 hx5RzWMwlcSMenO8e7hrwmCGLXaDLFMzpjE+DVQ0cP8MhHeoiOnVnKWKiRv+1Ib8MkAD
 mTbz12SDICAkm+yz6vR+YJXLIic0ouR4l9+hEryYTf3L0TvvRG+dlMGsUmOHnlrzBSgn
 fmEPQ1MX7HuOKxY/ovaafxEBcWlL0wQwnoEmmuzcFOugdnURCSnQQITGIVbvncPEVisi
 zZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cd6TNxsj5evEBZuArkKRZqRDClGmYpNEhM3Ab7aoZ+s=;
 b=b8w0uy2xQPVMLYGjUuk1hd3XjyTe5lVkISifBqPfWOkx9ZdMDv8F4RRtFrJzOrh1SY
 6dssqaYwXN3TwtPbN+IjK63jbvoVQez0FuVnMTKa8Ie8Jl5OfOiARqVYZ0hduS6OCOhM
 XGYwT8EfazmjSQ7R6SUWsrKNFtXxfSsVbnpkWIryKIH496f5rX9ymrhXuRHK+SJGzJA1
 kaqMNl4iMBeysepYEl++xZsBCs9QKLcgOsTRxOSqOaZSl3rw2gHNp465QiKWfXsGnXM5
 LWC4f2eq8DePUJelb4i9HDiZhKn+1IFi4CndxPCp74mLH104zWyCvGk1gc5PMBtlZnIs
 vGXw==
X-Gm-Message-State: AJIora+xDUYPLN5o9WvGgnpHFpRWaG8eMLEtV6rw7WoHUHdohJYCeSaJ
 jxyGH0nwDFI2sOBAkg5BZ5oxPVZA1RYmag==
X-Google-Smtp-Source: AGRyM1sqQPAQjg6LjhkthSHcXTxcGzi7Zbhx9TkesH/kA9WYNRJd20hOUSYm5Eke6vrVvZDlrQnLoQ==
X-Received: by 2002:a05:6e02:967:b0:2d3:9b99:e8af with SMTP id
 q7-20020a056e02096700b002d39b99e8afmr10823516ilt.202.1655661912858; 
 Sun, 19 Jun 2022 11:05:12 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 63-20020a6b1542000000b00669b8999911sm5556897iov.15.2022.06.19.11.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:05:12 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org
Subject: [PULL 00/11] Bsd user syscall 2022q2 patches
Date: Sun, 19 Jun 2022 12:05:20 -0600
Message-Id: <20220619180531.9161-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::135;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit dcb40541ebca7ec98a14d461593b3cd7282b4fac:

  Merge tag 'mips-20220611' of https://github.com/philmd/qemu into staging (2022-06-11 21:13:27 -0700)

are available in the Git repository at:

  ssh://git@github.com/qemu-bsd-user/qemu-bsd-user.git tags/bsd-user-syscall-2022q2-pull-request

for you to fetch changes up to d35020ed00b1cb649ccd73ba4f5e918a5cc5363a:

  bsd-user: Implement acct and sync (2022-06-14 08:17:44 -0600)

----------------------------------------------------------------
bsd-user: Next round of syscalls

Implement the next round of system calls. These are open, openat, close,
fdatasync, fsync, close_from, revoke, access, eacccess, facccessat, chdir,
fchdir, rename, renameat, mkdir, mkdirat, rmdir, _getcwd, dup, dup2, truncate,
ftruncate, acct and sync. In addition, the helper functions needed for these to
work are included. With the helper functions, all of these system calls are the
'obvious' wrapper...

----------------------------------------------------------------

Warner Losh (11):
  bsd-user: Implement open, openat and close
  bsd-user: Implement fdatasync, fsync and close_from
  bsd-user: Implement revoke, access, eaccess and faccessat
  bsd-user: Implement chdir and fchdir
  bsd-user: Implement rename and renameat
  bsd-user: Implement link, linkat, unlink and unlinkat
  bsd-user: Implement mkdir and mkdirat
  bsd-user: Implement rmdir and undocumented __getcwd
  bsd-user: Implement dup and dup2
  bsd-user: Implement trunctate and ftruncate
  bsd-user: Implement acct and sync

 bsd-user/bsd-file.h           | 359 ++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 116 +++++++++++
 bsd-user/syscall_defs.h       |   4 +
 3 files changed, 479 insertions(+)

-- 
2.33.1


