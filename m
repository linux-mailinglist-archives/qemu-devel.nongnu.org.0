Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B038E082
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:56:50 +0200 (CEST)
Received: from localhost ([::1]:52100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2e0-0004ge-PH
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cS-0002iM-3r
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:12 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:43582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cP-0003YA-4b
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:11 -0400
Received: by mail-pg1-x52b.google.com with SMTP id e22so3472750pgv.10
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 21:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ggcSBjM8B863IRCW7w9HFTOBojw96EaZyuQ49pMmGw=;
 b=F5deTNDY+gmmNuFo9s2I/DG+/xTIlsokTVVAh+KSBDvcyTSew+oV4xxS8bDvgMSXV5
 qzPKGOj29LFO7EcCHlEptKCPPZVb0j2hrXjj8wxsP06ueuRE/NoCp21iZlBhDpLUcl3y
 NZy2a9DEUiqlXZyUZnxqVwWYDaCzFAYgVqDBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5ggcSBjM8B863IRCW7w9HFTOBojw96EaZyuQ49pMmGw=;
 b=OSzC4X3V9X3IFUScgICQhuL7z1AY784nS5QNtC3AqM7F5jd0/NA8iGAyTyayXspRTa
 5pvRkGusDeyLDX1jLDryx6Bk6ByHcZ8IlD03D5OePbQIS3PLAVtqgYdGgF8wk1uxHoWT
 Q7yN+psjlqpJAPWEJ0BWd56b24ogjtkdixlKy0V4nZcH5XcixMzyOlW0DkDfOahYGTIz
 R88EwAv6jkYGUaj8BXoxinNamYDP93fhWALn1iODEo316wwzGRixpHn0PvIpbfw8TNIr
 JUd31UahzzD0RzCDu0KEnEYVAiGDOz3dsMQkicQGp2utD/D38OlMEjatPz4iX280X3Tm
 zWqg==
X-Gm-Message-State: AOAM533z62figF/OXHKxeYLtCVKvblauRIS9M3gEV2yGiTV1ZnhdYGv3
 2qanswtv2y/PCvRcnmh71z5XdxSJT+alJQ==
X-Google-Smtp-Source: ABdhPJzdWhEF1qx0inMeVXfaPZRl/wvEsT8X19RyRxVbnF7iNTGoxpo4i2iv1/MSykaS1vHrXC1+dA==
X-Received: by 2002:a63:fd17:: with SMTP id d23mr11830121pgh.68.1621832106885; 
 Sun, 23 May 2021 21:55:06 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id 24sm10040142pgz.77.2021.05.23.21.55.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 May 2021 21:55:06 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>
Subject: [PATCH 0/5] linux-user changes to run docker
Date: Mon, 24 May 2021 13:54:06 +0900
Message-Id: <20210524045412.15152-1-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=yamamoto@midokura.com; helo=mail-pg1-x52b.google.com
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

These patches, along with a few more hacks [1] I didn't include
in this patchset, allowed me to run arm64 and armv7 version of
dind image on amd64.

[1] https://github.com/yamt/qemu/tree/linux-user-for-docker

You can find my test setup here:
https://github.com/yamt/garbage/tree/master/binfmt-aarch64-install

YAMAMOTO Takashi (5):
  linux-user: handle /proc/self/exe for execve
  linux-uesr: make exec_path realpath
  linux-user: Fix the execfd case of /proc/self/exe open
  linux-user: dup the execfd on start up
  linux-user: Implement pivot_root

 linux-user/main.c    | 14 +++++++++++++-
 linux-user/qemu.h    |  2 ++
 linux-user/syscall.c | 43 ++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 55 insertions(+), 4 deletions(-)

-- 
2.21.1 (Apple Git-122.3)


