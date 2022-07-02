Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C132156408E
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:02:24 +0200 (CEST)
Received: from localhost ([::1]:35332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dhX-00063d-T5
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc4-0006cF-CB
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:44 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:38868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc2-0000ZY-9d
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:44 -0400
Received: by mail-io1-xd31.google.com with SMTP id k15so4728211iok.5
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pvizTUS+nVLsdlLd87OmaAsrzVbd98aIfnpuOMz1ReY=;
 b=3Wc32NO4r0Chl0NelD2EL8KYhagE1X98juY5ZBNp6QaV8SLodBxn0CmdcIHzLDew9D
 yjaWpJTBGgtLNPwLDbcJHZtIcAnvclniVWJ8sj8xzkT4ooCWhymlTjok4HBk2yYy8Qkf
 PsNIaKJvDeaWi1ijF6CWk4iBjbbsc3EyUhIEHjG9tc2H/xpB0hu/4FVedq2wyr6Z2J2p
 1K52QQ5Vga0eUWYRDcXTlf6YunhFe6UWIl7cgCVUVlZkth9nN9XX8/vDkWkY4VIGu/+A
 xmLPv9xyhkTg1TEjZwvqPcFapKDMyGsZ6mDgjZRBhddNayQiE4GzbRDq4RWFFoO8KATG
 BkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pvizTUS+nVLsdlLd87OmaAsrzVbd98aIfnpuOMz1ReY=;
 b=S4IM40KXyz3RP/BdGeSd3U46RoSYrr1Z05DzK/fwOPU2J94Cl+GtgSEkvYLe1ptE0K
 rW2KZD7pS1wZwZN36t1pyZJCkgcbrUjMZhxqqBZ8oAquUiaoK0EvHPLYwO7I0rnt39zg
 jsl45TlKILWda+BvnuQURR2SCoSNfi6sMt5tv9+VkdSaF8zYVikzKnohMy0unBdWlaNl
 6t6oaQAxvhD6YWyea6UEXX0ksffsbCgNlQL7CIEW9LzqwNNJAIGj5wV7BjwevJaevKVx
 VwdGr8cC0MFVTRt5O4t2eVoJj3aXScvzvJseLJ/UQwC5imcao8XiwA5O99Vfh+GIB6WW
 PPSw==
X-Gm-Message-State: AJIora8X0REE9TY5QesfqO/GkvvXl/614YV9UlITyhMHyvyLufhgT58X
 vUZ367agHIbKIOw5IexfyG+lJN4s5ShwzA==
X-Google-Smtp-Source: AGRyM1sVeKu58mp3u4ialGkdLPpauf1iFPGEKHMftYWWBKirBCvmSTk+PqezoD1DsZahV3fNEZjzTw==
X-Received: by 2002:a02:9442:0:b0:339:c34a:eb7e with SMTP id
 a60-20020a029442000000b00339c34aeb7emr12171622jai.249.1656770199931; 
 Sat, 02 Jul 2022 06:56:39 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:39 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>,
	Warner Losh <imp@bsdimp.com>
Subject: [PULL 00/11] Bsd user syscall 2022q2b patches
Date: Sat,  2 Jul 2022 07:56:55 -0600
Message-Id: <20220702135706.73622-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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

The following changes since commit d495e432c04a6394126c35cf96517749708b410f:

  Merge tag 'pull-aspeed-20220630' of https://github.com/legoater/qemu into staging (2022-06-30 22:04:12 +0530)

are available in the Git repository at:

  ssh://git@github.com/qemu-bsd-user/qemu-bsd-user.git tags/bsd-user-syscall-2022q2b-pull-request

for you to fetch changes up to 3f1b0235f68ff74ebfd98b17626e4254c4345fa8:

  bsd-user: Remove stray 'inline' from do_bsd_close (2022-07-02 07:52:48 -0600)

----------------------------------------------------------------
bsd-user: More file-related system calls

A second round of mostly BSD-independent filesystem calls: mount, unmount,
nmount, symlink, symlinkat, readlink, readlinkat, chmod, fchmod, lchmod,
fchmodat, freebsd11_mknod, freebsd11_monodat, mknodat, chown, fchown, lchown,
fchownat, chflags, lchflags, fchflags, chroot, flock, mkfifo, mkfifoat,
pathconf, lpathconf, fpathconf, undelete.

These are all non-reentrant system calls, so these wrappers are pretty simple
and no safe_* versions need to be created.

----------------------------------------------------------------

Warner Losh (11):
  bsd-user: Implement mount, umount and nmount
  bsd-user: Implement symlink, symlinkat, readlink and readlinkat
  bsd-user: implement chmod, fchmod, lchmod and fchmodat
  bsd-user: Implement freebsd11_mknod, freebsd11_mknodat and mknodat
  bsd-user: Implement chown, fchown, lchown and fchownat
  bsd-user: Implement chflags, lchflags and fchflags
  bsd-user: Implement chroot and flock
  bsd-user: Implement mkfifo and mkfifoat
  bsd-user: Implement pathconf, lpathconf and fpathconf
  bsd-user: Implement undelete
  bsd-user: Remove stray 'inline' from do_bsd_close

 bsd-user/bsd-file.h           | 392 +++++++++++++++++++++++++++++++++-
 bsd-user/freebsd/os-syscall.c | 118 ++++++++++
 2 files changed, 509 insertions(+), 1 deletion(-)

-- 
2.33.1


