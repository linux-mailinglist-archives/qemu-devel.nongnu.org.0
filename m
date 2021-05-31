Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444F5395527
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:55:34 +0200 (CEST)
Received: from localhost ([::1]:52570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnath-0004f0-BU
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapU-0004t2-LU
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:12 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:35726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapO-0003jj-VB
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:12 -0400
Received: by mail-pf1-x431.google.com with SMTP id g18so8210617pfr.2
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nHZ9oqcJ8jYH1Ntxukst7A81ycKIhUMh16vye0jYyi8=;
 b=SFB3eXeplQKcZU8uG6QF6UsxgQDnKiUxuyan8SKFvreE0ZehgRnBV81bxWiEAdZ+cS
 0vHPuS5mfWJexbzF1Knfka8+thA7sqv2g0l8CiYUyqoEkjWWk3Y/uaHJgMx8k9xMVrp4
 ps7Db+mDMe8zD8QFeD2D4RrjghQ5k+j9ryZlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nHZ9oqcJ8jYH1Ntxukst7A81ycKIhUMh16vye0jYyi8=;
 b=J4vMRDy9a+/hZyKvlVDIG0hjQdbn/kakCnFtsi8UZ54OX8rY2UjQX2Ooiu4YxCsaAR
 EO5tcFATjnVkbtmV2Izjk26BLahEpQ4P9/wbqhmr3ZYTpeYLpLXFydYYd+bMJKNbypYe
 8QdN3dLReqnmlM88vUHr8Rd6SSftE4WH+K0ZVsQEN8CUHfX7PiqQSCdU1TEMdyD+9f5T
 qKJdgMsV3X9yXcyRGFfep3VkUrMdA5JVIbh9mbJhdriVcl3uYDa3ytyH8U1wndJOCrod
 axkixQ47IYWqkizbj6no8fZlqV+zVP0dWRDnOKzfTh2Euy5GdCboqcK0u+uUigfj/gW2
 ncig==
X-Gm-Message-State: AOAM531ihLqV9WEGqG/oW0/r187jCZQ0Rl2obXMUQG/6Tkt1nCDGhS6L
 YmiE03j4+gnz9DTIIqtBAYQYA3NcluAMZA==
X-Google-Smtp-Source: ABdhPJz+bZYi9Wie/lWg5mZCYyVKmsYkKUATJ6bA9lgpu2jExXEPMMKGNSwTtln/0Z4EknLNJbKpCg==
X-Received: by 2002:a62:3542:0:b029:2d8:eb3a:f082 with SMTP id
 c63-20020a6235420000b02902d8eb3af082mr15493965pfa.66.1622440265162; 
 Sun, 30 May 2021 22:51:05 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:04 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>
Subject: [PATCH v2 00/11] linux-user changes to run docker
Date: Mon, 31 May 2021 14:50:07 +0900
Message-Id: <20210531055019.10149-1-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=yamamoto@midokura.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

These patches allowed me to run arm64 and armv7 version of
dind image on amd64.

This patchset includes a few patches marked [!MERGE],
which are not for the upsteam merge. They are included here just to
show the context to reviewers.

You can find my test setup here:
https://github.com/yamt/garbage/tree/master/binfmt-aarch64-install

YAMAMOTO Takashi (11):
  linux-user: handle /proc/self/exe for execve
  linux-user: Fix the execfd case of /proc/self/exe open
  linux-user: dup the execfd on start up
  linux-user: make exec_path realpath
  linux-user: Implement pivot_root
  linux-user: add get_exe_path
  linux-user: simplify is_proc_myself
  linux-user: Implement exec of /proc/$pid/exe of qemu process
  linux-user: Make the qemu detection for /proc/$pid/exe a bit
    conservative
  linux-user: a crude hack for libcontainer (CLONE_PARENT) [!MERGE]
  linux-user: always assume preserve_argv0 for now [!MERGE]

 linux-user/main.c    |  57 ++++++++++++++-
 linux-user/qemu.h    |   2 +
 linux-user/syscall.c | 171 ++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 219 insertions(+), 11 deletions(-)

-- 
2.21.1 (Apple Git-122.3)


