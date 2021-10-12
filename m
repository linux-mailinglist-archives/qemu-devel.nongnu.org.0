Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9875842A2EE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 13:16:25 +0200 (CEST)
Received: from localhost ([::1]:57562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maFlg-0004bf-Li
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 07:16:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFSQ-00036s-4F
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:30 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:41625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yaroshchuk2000@gmail.com>)
 id 1maFSO-0003wQ-C9
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 06:56:29 -0400
Received: by mail-lf1-x131.google.com with SMTP id j5so86196269lfg.8
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 03:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S2A/XixTNZnkCarSr2DpxSYLI5DQAWL40GjWfQu/xXg=;
 b=K7pdRv6jmE8eRLCbO62KyEkceixRnhKrD2cn9UYqiQKAd+apYCRUR0za/RL0j87HnA
 s+6iObKJQjaamp2Na4ZN/3q1QeNsG+CcG/Oz66Z4lh1kBZdwfVSJ856v0AWvoBpUq/AC
 L/YUjyCaLYH2CYxoHEKRpJqH9bTXmnbU5VPgjPf7E4D4pq6t2ZkClWWjWfg44naUq6AM
 d8nAKqRbCFxpWqT9bAmUsHkHeESox7bR9U/JI+soGR+uLhCtAIGGIr8Wg8PckH8rR1Kz
 7q4ysGyRmHA/MPmDVINeWllKgGDVc02FW3/xGvEEuv3ZJX/sgvh2LjSSYPMmQqXfSxeE
 zIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S2A/XixTNZnkCarSr2DpxSYLI5DQAWL40GjWfQu/xXg=;
 b=s6X1k4ZaTFGIIokv/RQZVFpwHyF7k8hS+5pzX6rThjVyfTRO48zd5sDGRDndUQ1KQq
 Pz1dfv2CFW21ajwzFBhwOZZUmgtqPcCEJ80A19Zmt97Jy+CX3o6WA9oj43yDWrO/E2Uk
 hxIxvAJ4QBjMvFPNHq5Ceg3AU+5aUeM+BsSZ2vnCVHlxloom9izrqgUbiPuNfGcb0+PQ
 XY/6aRAF4/2pvJsMVHa4KPU7Deyi3h0obdWEXfc1PDwyjRh7NqJ0zPU+pC4u8fUCZrc7
 Fcicgba8THHjqI8D9LGNReBhw8Ju69lYLebVy7jb7F2kOsnCs0uBcIgu/Jb/jIGPahuM
 0sJQ==
X-Gm-Message-State: AOAM5314qa8jIJCjIqQsJlRIkMxziBKVjY22Ebyylj2GSx7YyL0pbMTZ
 Uk5ZPOWmdRrhvT/gVijBZ7Ch0MObSIXYsVfc
X-Google-Smtp-Source: ABdhPJxmei8GasqWo4b2elWEstNncE+xxVU13VHL4GYgs5F3k6ElR17+jtVflKF+T66AcDGaoAz7JQ==
X-Received: by 2002:a05:6512:202a:: with SMTP id
 s10mr7715610lfs.560.1634036185140; 
 Tue, 12 Oct 2021 03:56:25 -0700 (PDT)
Received: from localhost.localdomain ([77.234.205.3])
 by smtp.gmail.com with ESMTPSA id p16sm995361lfe.166.2021.10.12.03.56.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Oct 2021 03:56:24 -0700 (PDT)
From: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] Add vmnet.framework based network backend
Date: Tue, 12 Oct 2021 13:55:52 +0300
Message-Id: <20211012105558.21530-1-yaroshchuk2000@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=yaroshchuk2000@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: jasowang@redhat.com, eblake@redhat.com, r.bolshakov@yadro.com,
 Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

macOS provides networking API for VMs called vmnet.framework.
I tried to add it as a network backend. All three modes are supported:

-shared:
  allows the guest to communicate with other guests in shared mode and
  also with external network (Internet) via NAT

-host:
  allows the guest to communicate with other guests in host mode

-bridged:
  bridges the guest with a physical network interface

Separate netdev for each vmnet mode was created because they use quite
different settings, especially since macOS 11.0 when vmnet.framework
gets a lot of updates.

Not sure that I use qemu_mutex_lock_iothread() and
qemu_mutex_unlock_iothread() in correct way while sending packet
from vmnet interface to QEMU. I'll be happy to receive
recommendations how to make this thing better if I done sth wrong.

Also vmnet.framework requires com.apple.vm.networking entitlement to
run without root privileges. Ad-hoc signing does not fit there,
so I didn't touch anything related to signing. As a result we should
run qemu-system by a privileged user:
`$ sudo qemu-system-x86_64 -nic vmnet-shared`
otherwise vmnet fails with 'general failure'.

But in any way it seems working now,
I tested it within qemu-system-x86-64 on macOS 10.15.7 host, with nic
models:
- e1000-82545em
- virtio-net-pci

and having such guests:
- macOS 10.15.7
- Ubuntu Bionic (server cloudimg)

v1 -> v2:
 Since v1 minor typos were fixed, patches rebased onto latest master, redundant
 changes removed (small commits squashed)

v2 -> v3:
 - QAPI style fixes
 - Typos fixes in comments
 - `#include`'s updated to be in sync with recent master

Vladislav Yaroshchuk (6):
  net/vmnet: dependencies setup, initial preparations
  net/vmnet: create common netdev state structure
  net/vmnet: implement shared mode (vmnet-shared)
  net/vmnet: implement host mode (vmnet-host)
  net/vmnet: implement bridged mode (vmnet-bridged)
  net/vmnet: update qemu-options.hx

 configure           |  31 +++++
 meson.build         |   5 +
 net/clients.h       |  11 ++
 net/meson.build     |   7 ++
 net/net.c           |  10 ++
 net/vmnet-bridged.m | 123 ++++++++++++++++++
 net/vmnet-common.m  | 295 ++++++++++++++++++++++++++++++++++++++++++++
 net/vmnet-host.c    |  93 ++++++++++++++
 net/vmnet-shared.c  |  94 ++++++++++++++
 net/vmnet_int.h     |  48 +++++++
 qapi/net.json       |  99 ++++++++++++++-
 qemu-options.hx     |  17 +++
 12 files changed, 831 insertions(+), 2 deletions(-)
 create mode 100644 net/vmnet-bridged.m
 create mode 100644 net/vmnet-common.m
 create mode 100644 net/vmnet-host.c
 create mode 100644 net/vmnet-shared.c
 create mode 100644 net/vmnet_int.h

-- 
2.23.0


