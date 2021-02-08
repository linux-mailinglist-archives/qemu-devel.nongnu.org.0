Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F81D31298D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:52:46 +0100 (CET)
Received: from localhost ([::1]:42406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xbR-0007ow-Fq
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6E-0007dW-Gv
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:30 -0500
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:35407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haibo.xu@linaro.org>)
 id 1l8x6C-0001iQ-Gn
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 22:20:30 -0500
Received: by mail-il1-x135.google.com with SMTP id o7so6946167ils.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 19:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvfAQQXnsiwqJK5LFbqAh21CyVvT8aHohHzKppo64d4=;
 b=ddbnMrArKkjV64mlk9BjDzgOuuUlQhlYF3iWtrzK4YtaBRnKL0Nf5LFqce2MgrvEtx
 wm8Lt7IF38t5YxyQdVjqEAeqppCIQWD80tPdnyTQgh+3nDHNdmRcmzHUYtGMxrw8Zie1
 5M+xzhclU7cH3eOfkuuiwIJh65nNpkAZ75aXhChTjcEYHOK/eX+mRZQhq3oi46r39Whq
 lTFZUd4454PGScAKT8Z/TfF2jNPuGvBdb0l6Bomxb2pRcR1p3uOtEUpmg1cNMjSAXJE1
 J7InRtYOh6yo01IW1b4gI9sS8faH2i7ElX/SBLWC1bvkjg3XUOCJ85Z6cT6gDdNiDDsI
 xmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fvfAQQXnsiwqJK5LFbqAh21CyVvT8aHohHzKppo64d4=;
 b=LPAWeVghJy22WWxOT3Zed1TAIcuqHRe6dzuD95RtgaY2XJIhFH4M795/C9y5+3iNDB
 Fum6h78VZM+6Inv8aGy0+d/wmvk1H5OebFd2Kpnsa+pG3rnMMwTJrVILksjYGzVfpZYt
 fugpn2fyzXV2reIvUho3zUIaAAzWXQAt5MGTEeaX5dpsG7ft/T3IRdns0Q/Tmvr+ZvAa
 Pj7knsRcL4EpuK8rsRjxZREg88Xy8ejfjeaXL8JSn9oaYVy34iKHdiHRrQ61lw+d9/o1
 LX2F6ag+BSbj9BveajXKO423jiHvFMIx7QosK8l5OE9gocRGQBxtr6l/Q8djRYDaHeGD
 Xo3g==
X-Gm-Message-State: AOAM53054U8UJ2HHjCgydsJCbU11o0lzP5TZrkoAUPV91oXQu4q76e0R
 TaqYlp799raAkLjNwYx+Eejp
X-Google-Smtp-Source: ABdhPJzauD6wImBSqIrJMFs527AyCsjdwGK5XrFaIIL7eHBYwaZft9pYHf+fuETMNil/BEOWJlOZLQ==
X-Received: by 2002:a92:b514:: with SMTP id f20mr14013571ile.253.1612754426158; 
 Sun, 07 Feb 2021 19:20:26 -0800 (PST)
Received: from localhost.localdomain ([147.75.106.138])
 by smtp.gmail.com with ESMTPSA id o8sm8022965ilu.55.2021.02.07.19.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 19:20:25 -0800 (PST)
From: Haibo Xu <haibo.xu@linaro.org>
To: drjones@redhat.com,
	richard.henderson@linaro.org
Subject: [RFC PATCH 0/5] target/arm: Add MTE support to KVM guest
Date: Mon,  8 Feb 2021 03:20:01 +0000
Message-Id: <cover.1612747873.git.haibo.xu@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=haibo.xu@linaro.org; helo=mail-il1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
 qemu-devel@nongnu.org, Haibo Xu <haibo.xu@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series add support for MTE(Memory Tagging Extension)[1]
in KVM guest. It's based on Steven Price's kernel KVM patches
V7[2], and has been tested to ensure that test case[3] can be
passed in a KVM guest. Basic pre-copy migration test also passed
between two MTE enabled kvm guest. 

This is a RFC patch series becuase:
(1) Need to add some arm MTE specific codes to the ram migration
    loop. There may be better way to do that in a more abstract way.
(2) Only pre-copy migration is supported and tested currently,
    post-copy as well as compress/zero page migration are still WIP.
    
All kinds of feedbacks are very welcomed, especially for the migration
support. 

Note:
(1) To support MTE migration, tags for one page are appended to  
    the page data during ram save iteration which make it easier
    to sync the page data and tags.

[1] https://community.arm.com/developer/ip-products/processors/b/
    processors-ip-blog/posts/enhancing-memory-safety
[2] https://lwn.net/Articles/842827/
[3] https://elixir.bootlin.com/linux/latest/source/Documentation/
    arm64/memory-tagging-extension.rst

Haibo Xu (5):
  Update Linux headers with new MTE support
  Add basic MTE support to KVM guest
  Add APIs to get/set MTE tags
  Add migration support for KVM guest with MTE
  Enable the MTE support for KVM guest

 hw/arm/virt.c             | 44 +++++++++++++-------
 include/hw/arm/virt.h     |  2 +
 include/migration/misc.h  |  1 +
 linux-headers/linux/kvm.h | 15 +++++++
 migration/ram.c           | 86 ++++++++++++++++++++++++++++++++++++++-
 target/arm/cpu.c          |  2 +-
 target/arm/kvm.c          |  9 ++++
 target/arm/kvm64.c        | 31 ++++++++++++++
 target/arm/kvm_arm.h      |  2 +
 9 files changed, 176 insertions(+), 16 deletions(-)

-- 
2.17.1


