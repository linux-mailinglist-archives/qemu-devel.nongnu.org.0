Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19D5522E1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:46:10 +0200 (CEST)
Received: from localhost ([::1]:49656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LTV-0007gH-3k
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPc-00055o-MF
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:08 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:40639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPa-00081U-MY
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:08 -0400
Received: by mail-il1-x12d.google.com with SMTP id c4so4337031ilj.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rej5q2fYmXWWgrf9YAewGGu0rV2K0OnPwTzFTSOmU2E=;
 b=vkBDdZAPUPz2cDQP38nNTU3S1PZ5BOJo8eejClITgKrp77KenrFKkGtbdx8hh1Gf2J
 HTyp8Mv3+cTN+ENfH0wpQq9QkZbTPDKu+E2wI0M6TCeykwh22cAwqFd+tWBWPYV9m13Z
 OOmBvbbZwb9f0HV2RQiP30VXFE4a0TQimYkyj/ZZ2UCl0NbvJ5Sb88gjwiQxKo5xMPJm
 vREFyLvZSzsso8P55o4Y01dn446+nn9obxNIrhkgWYpfvZHoJgqDRGhRNtKjTNiFBHLz
 ZhUy6I8uFtmkB78QXybfmxkJ5FCpm0/4KEUhjFz4X010vkHZTTq8AlGXWbeiu2y1ltKh
 2+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rej5q2fYmXWWgrf9YAewGGu0rV2K0OnPwTzFTSOmU2E=;
 b=msjKzZUxByVAd4h/VxaaCxYAbhMJfktglaN4cQDEbMiUfcxvDQHLr3M99vhgOm7e4Q
 t7SraJ/GOSw05G8afZAq6JL7yBl8iOAkymq7DsCRVUFOq1MWNj+AGHCBGbKg5yRcZIAa
 ue/QVo6oq4dT78r7SHFdOf+JEyqJoQfR4Ow2MrUIXc88A7kOsyTYKoVHVgrnkFTS96/2
 1SDR/RPzgaZJKFjY38hbKy3kb1LlVQQjAiytbj1MmW2XC9uzkPQ4xg2+JetO3N9m1ET8
 YKoN3FiCIOa/IEXGSkPz46Fds5tC5P0Pza8wb5BgER5fdsKCK9xvICsRD9mTNGdt63Cj
 FuQQ==
X-Gm-Message-State: AJIora/3xIW337hR6Tr5c9UzhvL73mF04JgtafvgYcQo5wcgXGJWGBBm
 3pjK/5BNyQmUZutfWFazFEUwFeu+ZxAXUQ==
X-Google-Smtp-Source: AGRyM1sk9R+MLEZpWPDhrpPf9yWCGjQPF8MTDCgRWmVyRVe625skliScgKahZvd5q7nm6mkdIdH+hw==
X-Received: by 2002:a92:cd87:0:b0:2d3:ce9a:f9a5 with SMTP id
 r7-20020a92cd87000000b002d3ce9af9a5mr13809852ilb.76.1655746924865; 
 Mon, 20 Jun 2022 10:42:04 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02c773000000b00331e4e4fac9sm6202953jao.47.2022.06.20.10.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:42:04 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
	Kyle Evans <kevans@freebsd.org>
Subject: [PATCH 00/10] bsd-user: More file-related system calls
Date: Mon, 20 Jun 2022 11:42:10 -0600
Message-Id: <20220620174220.22179-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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

A second round of mostly BSD-independent filesystem calls: mount, unmount,
nmount, symlink, symlinkat, readlink, readlinkat, chmod, fchmod, lchmod,
fchmodat, freebsd11_mknod, freebsd11_monodat, mknodat, chown, fchown, lchown,
fchownat, chflags, lchflags, fchflags, chroot, flock, mkfifo, mkfifoat,
pathconf, lpathconf, fpathconf, undelete.

These are all non-reentrant system calls, so these wrappers are pretty simple
and no safe_* versions need to be created.

Warner Losh (10):
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

 bsd-user/bsd-file.h           | 403 ++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 120 ++++++++++
 2 files changed, 523 insertions(+)

-- 
2.33.1


