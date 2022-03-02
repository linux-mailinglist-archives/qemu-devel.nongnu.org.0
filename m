Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FDE4CA63C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:45:23 +0100 (CET)
Received: from localhost ([::1]:37916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPIA-0008MK-FV
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:45:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO45-0000xd-A3
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:26:45 -0500
Received: from [2607:f8b0:4864:20::62b] (port=39570
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPO43-0000ds-L9
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 07:26:44 -0500
Received: by mail-pl1-x62b.google.com with SMTP id 9so1424645pll.6
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 04:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k5gf7APy7B0cGA9qS4/UCENmASYKJgbTrgkDlZwei54=;
 b=iGDUksSjBmOeD05c3AmoLkDzgETwprpHyfDajlv3laJRqspdmYBl6GA6kfBe9kqtN7
 HncNDQnz6rZngAwlHdms08lWcMHjxgAo8ZKXMt1YLu4uuK3hnOjU5IJzUYwIU+bkjYc2
 kiqz/9AxW2eANqiqhmKSmhjCXOHng6vf5Ac26j2QPIw5c9cBLkIf+Kz6Mgzl44OlQJyr
 0sZOckTc6+6SPvHNJa9i+aIqTlxJXZp+6xEebufoJb2Wkl9x9VjN2F2FXLaL3d77H6xe
 QH+6zN7RJi/lMbkVydHaNvTWSxvYBLdOZf2THz28D24+HzAJuCqX18jwSin7mxmHDNeV
 p1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k5gf7APy7B0cGA9qS4/UCENmASYKJgbTrgkDlZwei54=;
 b=ToFSDdpEJDaVXCiVNq3/VIL2W9SNq2pnp3HBCcryoUenhgE0Z1zwHpR7YS6OhYICye
 4z3awHTxj12hezeusMMRVbbkSkK7+ejZBD60IN0kThc0Fz3SgKLEh00vz5fH580lLanJ
 36i9kolWGzXkR+3MPidzzcMEz1EyqXGq5wlIt/eQ67thudxCVHhYTuxTpljKm4hY8Jdq
 F+6SqbDxmIi/U6NurHlwPG+6TeRF73biNBX4fLmxN6tL5ApkD1oDv/YqjTMyIkltM7Uw
 ySn5ac7enk6jlIpeq2LBEW55SEc7RgbgOFlXM+7tXSU1YMh9mcNeJOxD429F7ZIZDsmq
 mdtQ==
X-Gm-Message-State: AOAM531VU3NsASm4Svm/TgK3yF/cGi4zd3EQ4L6haCv6B5YOX3jf/5ZS
 6+5whQGQTcXsAX6ECpoJ7yHGqsXlYjux1A==
X-Google-Smtp-Source: ABdhPJxlt6ATQyWALAXL4/w/BBCD5hx64QfZdZyJSdOm//X/FaT5Y+VBDtJj2WrG0TgBHoTiO0JEfw==
X-Received: by 2002:a17:903:18d:b0:150:b6d:64cd with SMTP id
 z13-20020a170903018d00b001500b6d64cdmr30758732plg.123.1646224000922; 
 Wed, 02 Mar 2022 04:26:40 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 mu1-20020a17090b388100b001bedddf2000sm4912971pjb.14.2022.03.02.04.26.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 04:26:40 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] Many improvements to HVF memory-related codes
Date: Wed,  2 Mar 2022 20:26:02 +0800
Message-Id: <20220302122611.15237-1-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=ubzeme@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Yan-Jie Wang <ubzeme@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

changes in v2:
* Rebase to the current master.
* Correct a mistake in "hvf: simplify data structures and codes of
  memory related functions" patch
* add two patches for HVF memory listener. The changes are
 - only consider directly writeable memory regions for dirty-tracking
 - in `hvf_log_clear`, use provided `section` (MemoryRegionSection)
   from the caller to determine the pages that need to write-protected
   instead of calling hvf_set_dirty_tracking to write-protect the memory
   slots that contains the pages whose dirty-bits are cleared.

----------

I recently bought a Mac with M1 Pro chip, and use QEMU to setup a Linux
virtual machine.  QEMU crashed when I started a VM with HVF accelerator
enabled and with the device, bochs-display, added.

After digging into the source code, I found that dirty-tracking in HVF
did not work properly, which made QEMU crashed. Therefore I made this
series of patches to fix the problem.

Followings are the summary of the changes that these patches make:
 1. Move HVF memory-related functions and codes into a new file
    hvf-mem.c
 2. Simplify the logics of adding and removing memory regions in HVF
    memory listener
 3. Fix HVF dirty-tracking logics for both Intel and Apple Silicon Macs
 4. Use GTree and dynamically-allocated structures to store HVF memory
    slots instead of fixed-size arrays. This makes memory slots more
    scalable. It is inspired by the recent changes in Linux kernel
    (v5.17) that use red-black trees instead of arrays to store
    in-kernel KVM memory slots.
 5. Add a lock to protect the data structures of HVF memory slots

Patches have been tested on Apple Silicon Macs and Intel Macs.

Yan-Jie Wang (9):
  hvf: move memory related functions from hvf-accel-ops.c to hvf-mem.c
  hvf: simplify data structures and codes of memory related functions
  hvf: use correct data types for addresses in memory related functions
  hvf: rename struct hvf_slot to HVFSlot
  hvf: fix memory dirty-tracking
  hvf: add a lock for memory related functions
  hvf: use GTree to store memory slots instead of fixed-size array
  hvf: only consider directly writeable memory regions for
    dirty-tracking
  hvf: remove the need to lookup memory slots when clearing dirty-bits

 accel/hvf/hvf-accel-ops.c | 221 +------------------------
 accel/hvf/hvf-mem.c       | 336 ++++++++++++++++++++++++++++++++++++++
 accel/hvf/meson.build     |   1 +
 include/sysemu/hvf_int.h  |  18 +-
 target/arm/hvf/hvf.c      |   5 +
 target/i386/hvf/hvf.c     |  25 +--
 6 files changed, 352 insertions(+), 254 deletions(-)
 create mode 100644 accel/hvf/hvf-mem.c

-- 
2.32.0 (Apple Git-132)


