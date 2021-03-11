Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0202F336ED1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:27:13 +0100 (CET)
Received: from localhost ([::1]:33402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKHb5-0008AJ-W4
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBno-0001L4-92
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:56 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:38233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lKBnk-0000ex-1k
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 22:15:55 -0500
Received: by mail-wr1-x42c.google.com with SMTP id d15so173273wrv.5
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 19:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUo0FR8vtGi0iwyBoF7Q4y0LYMeI/8wHZE7f4amzgQI=;
 b=seFtkp2rWtzouiIMmjAqjkSvhAGs5xgQYq3aE6TqQwwzF4+ZnHcbeA5ab3+/JkVTDQ
 rnp8OtO9UhHrAHpjoIWFwH0n1dcdZSi0DR+hQaQ6SmDxpeP6sSLm3DMwo9scJr4TNSpD
 E9eaINgEM1jH8eI5m+bSfeARdD59iSqXm46bdiY+FCzWszGk/qnBku5kFfYEbGerQgjk
 dZtHEYH/zDkgeyPRIykIV7PFIy8tDoPoZySHkKeq+u11OjTQUZLugRCwRIKFfxSo9+L/
 UlOelhc0mZJa28TUuIdZxQS3VgGzuyuZ7+T0FcObOou53sch3PLfJjMoFa5hi30AQ1ah
 fc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUo0FR8vtGi0iwyBoF7Q4y0LYMeI/8wHZE7f4amzgQI=;
 b=ZKHG/UlmTW0ARva487/kGEyfDtK00vdBczLKdKqGIlRL9qUtrlSup0SCvULTK8O2tn
 PLPpPljwlAzS3vqEwr+WaOC8Nat+HrfiirNKWMXM6YOFFqal4t+nlixc82lqiQHvEbso
 frM/A8WrSuT2OV5m8Z8RyGPpF5s13GyZJ/IXBkqxM6QNr7EOMx/17CeteBvdmC/4wL7Q
 Z9/v0tZuAkjQdkAztZimhOgPYooZOSSx+Dl8vVRKRqZ/AuVcBcH1C/DaEyyeI2rifmXm
 mEPi9wYZjzWHqdEjXHlk95a1yfb04AK7ogwwfkenTdvsSnmxTlqpRnRHXwwZIO3ijib5
 fIEw==
X-Gm-Message-State: AOAM532lzQKAxemcRmJs07u/VRZTQb1vOMBK/LQHAELKcy737JPE/0Wl
 dddhcsPokmq4eZCYCHQ+TTw8GLPWv0w=
X-Google-Smtp-Source: ABdhPJxBR/KKC1zOz8Khh1/zGt81YsMwC2ZmQFmecdFb3o1cXPqPIQY02subcFHSLoaef9GJvAo0jA==
X-Received: by 2002:adf:ed46:: with SMTP id u6mr6305989wro.350.1615432549519; 
 Wed, 10 Mar 2021 19:15:49 -0800 (PST)
Received: from localhost.localdomain ([197.61.47.225])
 by smtp.googlemail.com with ESMTPSA id o188sm1450416wme.7.2021.03.10.19.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 19:15:49 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] Changing qemu_mutex_locks to lock guard macros
Date: Thu, 11 Mar 2021 05:15:29 +0200
Message-Id: <20210311031538.5325-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Mar 2021 04:24:48 -0500
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello, 

This is my first contribution to the qemu project, in which
I attempt to replace some usages of qemu_mutex_lock calls and 
the respective qemu_mutex_unlock calls with QEMU_LOCK_GUARD macros. 

As it is a matter of subjectivity on which we should base whether we would 
change qemu_mutex_lock/unlock with a lock guard, I tried as much as I could
to only change it where beneficial to readibility and simplicity. 

I tried to only change it where it would eliminate goto paths 
or if the span of locking/unlocking is so spacious that it's 
not immediately obvious that the particular calls to 
qemu_mutex_lock/unlock are a matching pair.

Mahmoud Mandour (9):
  tpm: Changed a qemu_mutex_lock to QEMU_LOCK_GUARD
  block: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD
  char: Replaced a qemu_mutex_lock with QEMU_LOCK_GUARD
  util: Replaced qemu_mutex_lock with QEMU_LOCK_GUARDs
  monitor: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD
  migration: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD
  virtio-iommu: Replaced qemu_mutex_lock calls with QEMU_LOCK_GUARD
  hw/9pfs/9p-synth: Replaced qemu_mutex_lock with QEMU_LOCK_GUARD
  hw/hyperv/vmbus: replaced qemu_mutex_lock with QEMU_LOCK_GUARD

 backends/tpm/tpm_emulator.c |   8 +-
 block/curl.c                |  13 +--
 block/nbd.c                 | 188 +++++++++++++++++-------------------
 chardev/char.c              |   3 +-
 hw/9pfs/9p-synth.c          |  12 +--
 hw/hyperv/vmbus.c           |  13 +--
 hw/virtio/virtio-iommu.c    |  78 +++++++--------
 migration/migration.c       |   6 +-
 migration/ram.c             |   6 +-
 monitor/monitor.c           |   8 +-
 monitor/qmp.c               |  51 +++++-----
 util/filemonitor-inotify.c  |  24 ++---
 util/vfio-helpers.c         |  23 ++---
 13 files changed, 192 insertions(+), 241 deletions(-)

-- 
2.25.1


