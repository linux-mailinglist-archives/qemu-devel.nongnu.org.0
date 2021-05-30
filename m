Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B7A394FDF
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 08:39:30 +0200 (CEST)
Received: from localhost ([::1]:33818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnF6f-00067S-2c
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 02:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lnF4i-00043u-KC
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:37:28 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:39509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lnF4g-0003Cg-8L
 for qemu-devel@nongnu.org; Sun, 30 May 2021 02:37:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso6883382wmh.4
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 23:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KnflLZhENKekJA208YWM8Xz84xerC9UGXUHIWDiUOdI=;
 b=UGpl0aDKJZNyixpi9GcaiJfRtV/MYk0UShDcfR0iq4sGagJ7qpYnWOgE8WTdCmY2kk
 JGvMrcEhP7QFyZoC0HtrhTWABeaIVrMc6BGzNb5mjaL8k2ECCqWRZM/7X/UQpky3UNbX
 rjfcA+XmP2vudhT9NQZWA35ipTZG2O2om09t9TnY2vBUxFhCph+htpxMa7ZOMacCMu70
 PecLPfy1ddfTwaXM0kC2Xh3dG19Kix1MGOv9BFoEFKIduG87Hbhg4t7i0+4YyxP/kOD9
 kCCJbO4KeFl7ama4hehgdfwhJJWarGA4P8qpt02mgrbApSo511J+q5A79p9TAUXd63sf
 cnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KnflLZhENKekJA208YWM8Xz84xerC9UGXUHIWDiUOdI=;
 b=rmZRiLKkUCpAkLSeIoRX3IpO60Zu0KMORZUWRWB7j+n8B5xpzQqnMU8pfFL952Uxz0
 kdB29Qnh9yWnHUeZdAauumlrpbH/i75Nmq3VSPzO5myflPkICHQdtSDAWUe2GrvfAzaB
 UYR7BzG0r5sP9wSWtysdPn+vOvMyvIwB5zCCWPEhyOHvC3uVr0lR6OkMwWQ7+Jtkv96D
 Dr9Pz/g1Bq/o1kxmdeQC2d8/dvaBV2VLvI3dePWzu+UBRFRTYaCntw41QGmF8GZmnUb1
 N807zykBLaAIPKnrNh4nVXa4T/gUc3IU6FXddLHarn1VtQMEM5y/Q6nimPj8zpMIzMWh
 DlKw==
X-Gm-Message-State: AOAM532GWstpLBFbTOEru2i/vVXLZ/W3wRWz4CMAKoljYCtsdi5qtopR
 ZjOhyI8BN5ZQJjB9GglnLfa1NkPcSPKIbg==
X-Google-Smtp-Source: ABdhPJxD+eb6u9ftTsxieluepl3ldi0BH7JekTliuUc7lVrpiGnmmos9HelsrVa8WvbTyqNeDm7qUw==
X-Received: by 2002:a1c:de57:: with SMTP id v84mr12595906wmg.147.1622356644220; 
 Sat, 29 May 2021 23:37:24 -0700 (PDT)
Received: from localhost.localdomain ([102.44.10.239])
 by smtp.gmail.com with ESMTPSA id 3sm2732431wmi.7.2021.05.29.23.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 23:37:23 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/3] Cache modelling TCG plugin
Date: Sun, 30 May 2021 08:37:09 +0200
Message-Id: <20210530063712.6832-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this RFC patch series, I propose an initial cache modelling TCG
plugin. As of now, it models separate L1 data cache and L1 instruction
cache. It supports three eviction policies: LRU, random, and FIFO. Once
a policy is chosen, it's used for both instruction and data caches.

v1 -> v2: Unlocked dmtx on early return in vcpu_mem_access & removed a
          (probably?) bad InsnData free.
          This is probably still problematic since it does not free the
          ``idata`` allocated for the vcpu_mem_access callback even
          once, but if it's placed, it would double-free it.
          How do I mitigate this? I need to free the InsnData passed to
          vcpu_mem_access only once if we find out that it's an IO
          access since we do not need it anymore and it will early
          return every time.

Mahmoud Mandour (3):
  plugins: Added a new cache modelling plugin
  plugins: cache: Enabled parameterization and added trace printing
  plugins: cache: Added FIFO and LRU eviction policies.

 contrib/plugins/Makefile |   1 +
 contrib/plugins/cache.c  | 595 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 596 insertions(+)
 create mode 100644 contrib/plugins/cache.c

-- 
2.25.1


