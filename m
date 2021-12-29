Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED8D4815F0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 18:55:20 +0100 (CET)
Received: from localhost ([::1]:33124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2dAU-0002c5-Pb
	for lists+qemu-devel@lfdr.de; Wed, 29 Dec 2021 12:55:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n2d8Q-0001KF-LL
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 12:53:10 -0500
Received: from [2a00:1450:4864:20::22f] (port=37624
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1n2d8N-0005iW-L8
 for qemu-devel@nongnu.org; Wed, 29 Dec 2021 12:53:09 -0500
Received: by mail-lj1-x22f.google.com with SMTP id k27so36865713ljc.4
 for <qemu-devel@nongnu.org>; Wed, 29 Dec 2021 09:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZbgafb5+a/TV+bmBLmbjqvajEviExSjjKC3lEr29fI=;
 b=dYKMAIkPJwMYIq6dPflCYxglO1R+eWucnFLB18Y99GoNcURqGWO+DJkEmQN7m7o2lI
 DZ5uxz0ID4jurnTwczmqZDdiUVLTedW+pD8U5Qw7i+grSDxeryd/IhyWk6mybQUkN6qv
 40g0mvzGpOk1WAzUJdeymr3uajI7iS8XLYSUoxD3LCAy2lK3Tb81Mi39zcqO44aYn3ou
 2FO1eWqZEVn+ObXJTTImEXHvWC2jpbiCUZ+YdlUO5EtvmjX9+Znws4gl7mqroWrtpeCN
 bQayuAuTJVVzBV1d+4r37Qe2fFNHYEag8k2OgEWDTrzDz659kwyWxkHKV4m+P/dmRv/w
 uLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eZbgafb5+a/TV+bmBLmbjqvajEviExSjjKC3lEr29fI=;
 b=oCmBy6RSUgrjq8OQ6fZPLyrEhUEUWXesW5zCkpcaUVU4nBual3hvC+lKSvEzX4LIc8
 b/Aqq0E660xVKY69JCWEZF/DWzq+4Aw1N2t1Jk0mOQWBjLnHYTfERqA83z8cHj1Mf5ei
 cJbG0Yrwu3XRLmxXFuQklT0YNAKsAptwA5vOt2jtTddRSMjHpalJrA4d7KBd7sl97a2Y
 QDNwEYPQZ4uER1QdDGKada/6Nit273eLhRxmDM3hPrMa/aX5fY5NXF0BS3VFFPVU4Sn5
 FPoAlNulqqjy8cRPN8p7lTcV4rA2s7z0XQSmZWhPmND3TioEGA53m3mb0Szroa4VPyLx
 p/Fg==
X-Gm-Message-State: AOAM533biOGQfb1iw4wgQuIUYioUgex0UikaaCRMyqUz+A2caTqwN42o
 wBjITduOw4hejgYzdjvsQrFb8A==
X-Google-Smtp-Source: ABdhPJwWHwX08K5Dj/hG1ybY5IJPEWpQTgNObuXmSuAiy/XFKy77Swq6AYHSB9n3cqFUNtHuaSxDyw==
X-Received: by 2002:a05:651c:1681:: with SMTP id
 bd1mr17419746ljb.33.1640800384750; 
 Wed, 29 Dec 2021 09:53:04 -0800 (PST)
Received: from vp-pc.. ([2a00:1370:8174:b458:9ba9:b90b:f25a:ca4d])
 by smtp.gmail.com with ESMTPSA id s19sm2265123lfi.263.2021.12.29.09.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 09:53:04 -0800 (PST)
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: marcandre.lureau@redhat.com, dgilbert@redhat.com,
 yuri.benditovich@daynix.com, yan@daynix.com, qemu-devel@nongnu.org
Subject: [PATCH 0/2] dump: add 32-bit guest Windows support
Date: Wed, 29 Dec 2021 20:52:53 +0300
Message-Id: <20211229175255.133073-1-viktor.prutyanov@phystech.edu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lj1-x22f.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 32-bit versions of Windows still exist, there is a need to take
live and crash dumps of such guests along with 64-bit guests. So, add
an ability for 'dump-guest-memory -w' to take dumps from 32-bit guest.
When running the command QEMU consumes 32-bit Complete Memory Dump
header passed by guest driver through vmcoreinfo device as it was
previously done for 64-bit headers. 32-bit vmcoreinfo guest driver in
upstream virtio-win can fill such a header.

Viktor Prutyanov (2):
  include/qemu: add 32-bit Windows dump structures and definitions
  dump/win_dump: add 32-bit guest Windows support for dump-guest-memory

 contrib/elf2dmp/main.c       |   6 +-
 dump/win_dump.c              | 293 ++++++++++++++++++++++-------------
 hmp-commands.hx              |   2 +-
 include/qemu/win_dump_defs.h | 115 +++++++++++++-
 4 files changed, 300 insertions(+), 116 deletions(-)

-- 
2.31.1


