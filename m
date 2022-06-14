Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763454A825
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:28:35 +0200 (CEST)
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yAM-0005w8-Dk
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y24-0003Pr-Tm
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:00 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:36621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y23-0001dC-4e
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:00 -0400
Received: by mail-io1-xd29.google.com with SMTP id e80so8236943iof.3
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=or1yWzmSnaWykAhbHtWHulEnGmvMe5d7cteORHysDag=;
 b=GirD2noL9oFXN8T/mYwgu/hQF/Nom31b0xFqsSYJ2zh7sqMkg7HP2V9CIVhilElfXz
 vM72Q9w2N2fAJPJuG09704f+FLtJxRZKmKPADZ1ZD6HY/66XtAcgk4BetbLagFsip50K
 uZuInU59v9hSOQBg9BEMRLr83o6uRHKrcEmHJo+yE/NWhYsBMdGlkdLc8v9xn4DWYE9n
 i/+O/Vin0XUv0XfkgPzb/QaizRUmHEsHywx2QyZ5sVk3NNg9bP6bU5j4asgUieTyRfiZ
 Fs8FpPSz54VUjHgVcymVFkLwJ0H9UxpemWUPqnu8gpnuiKrsnDVQUKtliijneITa53Ts
 12lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=or1yWzmSnaWykAhbHtWHulEnGmvMe5d7cteORHysDag=;
 b=vh2B8z6wOwzCZJ826ZC7qXv3UgiFR80KOvhByb9bqV99bYDbJB6A1ZejCxzazlWMTc
 Himr/gUAdz+IpMsJJ8nCq7BkrqotVhXeDO8dloagN920JUmFBojal0gBPr/Icj9I+S00
 z+EL13QeKHI/2tro5leMNh4GhCAYFOkPbWbWT02AUQKMlaCkT1ta1J2dVeIvIjc9PNJT
 idOyFvl1LuXISTgeZq0lUn106YarAcHLR5FvR0P+sOvgA8sFEoQa4X5POemK16f/6wtv
 WQITxtSLpSvs7lQGCHR3CZzuCc9XlXSDpYhAt0ZXF333zfJ2W27qKzPsVESDYH2737TP
 4BTQ==
X-Gm-Message-State: AOAM532T/JVmEl5CjrlLZCdk2/4gNfcStrmMo7LBO8wrTMNCGpsJSxFl
 1dAKl1F80kFSF9PcxKZfStYxPulNBmxpyA==
X-Google-Smtp-Source: ABdhPJyQtvP31XEAsl2gvjoK3g1XeNGQaR8cmHJnBP1aVxj1yMERA4+PZI2QMgqAViC7dvYhUrV4Sg==
X-Received: by 2002:a05:6638:1a0e:b0:331:9a26:57c3 with SMTP id
 cd14-20020a0566381a0e00b003319a2657c3mr1758903jab.310.1655180396753; 
 Mon, 13 Jun 2022 21:19:56 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b0066579afd3cbsm4803742iok.50.2022.06.13.21.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 21:19:55 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, def@FreeBSD.org
Subject: [PATCH v2 00/11] bsd-user: Next round of syscalls
Date: Mon, 13 Jun 2022 22:19:59 -0600
Message-Id: <20220614042010.40327-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d29;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd29.google.com
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

Implement the next round of system calls. These are open, openat, close,
fdatasync, fsync, close_from, revoke, access, eacccess, facccessat, chdir,
fchdir, rename, renameat, mkdir, mkdirat, rmdir, _getcwd, dup, dup2, truncate,
ftruncate, acct and sync. In addition, the helper functions needed for these to
work are included. With the helper functions, all of these system calls are the
'obvious' wrapper...

V2: Delete extra blank lines
    Use safe_syscall(SYS___getcwd,...) instead of __getcwd.

Only part 8 (bsd-user: Implement rmdir and undocumented __getcwd) needs to be
reviewed.

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


