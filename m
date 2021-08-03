Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7FB3DF131
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:14:40 +0200 (CEST)
Received: from localhost ([::1]:56932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAw7s-0001iA-16
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAw6g-0000zD-6W
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:13:26 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mAw6e-0001Co-L2
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:13:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so2341819wmd.3
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p3J7EaOPCVyzTeOGOv8gZk4/JtmApbvWo8neZi7VsrM=;
 b=dOGoXD+iuXlB+6d0vTgNEeZ4+sOSihW4ha80pdmDTwULRWIU2WYhPwJ2XtAQe7iPC3
 YFTaO4Nf0I7M69Nd0sVq3MXEvyua4hDaQV0X+0gvoXAxG9efffNRrx+Zd9132wOEPxYf
 dAqRtwqNnwVWRyEOS4MbDUgP/JEEmZPmkkcFQvMXYNf6+JVVJTgEc7rpEReEXUbVirBq
 ZZ7cDgog7KHb5SqnyphiNc1s8UNY+PTpefLLd/I2dm5zipEJLIb2IhfikbaJiFtQVoee
 NSgGoyo/+cwYkPCRMs85qY2RKUcsbI8Ua2t7EPD7TwsqKU4e91+Tr4HabDykA3yOj2mK
 kM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p3J7EaOPCVyzTeOGOv8gZk4/JtmApbvWo8neZi7VsrM=;
 b=qB6C1clwuU3nIW3jWLaIBeec+ObpP1RhrT1BMYmO02X8lN7i7/Nhzj9PkZaKwvrikO
 GIlzz50dGrq39147TlK5n1c3svcsaL+np2WLb2blRne+wxiyxDAIQu8VOLSUbtNZ53Op
 AgAxQSJ7yzB06rPwY+Nx4D6c7M636RImapSc4MS6bdEDpcOSzWeZ0uZ4PXN3qJC0m3Kx
 0+FIbb2nBojRopt2yBsPEdEMy9ewmgZOhW1zOEXAcChFHSomM/Qnn+niEsNNW1vYz1O5
 a8OGIvdPrCL2zWcbN2KnrRLCIESW2sz0liCBUQP2wiltFT5NSKt18hX8DkxZnZMFbJmm
 CRRw==
X-Gm-Message-State: AOAM532yXhYpo6no4icQBdqlUiD8JBvsW86pomOTgNRbQu6ZbqNbEZjJ
 4EJV5RKcEp+PfTRcYoV86qOQEnisjSs=
X-Google-Smtp-Source: ABdhPJx7doyy+qJ366FS28YCJ9sdC+fyfWu26ds5XmKZFsMXUW22Gn/UISjAl1lUweZ3OzKuw9hqZQ==
X-Received: by 2002:a05:600c:1546:: with SMTP id
 f6mr1518823wmg.125.1628003601712; 
 Tue, 03 Aug 2021 08:13:21 -0700 (PDT)
Received: from localhost.localdomain ([197.61.80.206])
 by smtp.gmail.com with ESMTPSA id u23sm2737468wmc.24.2021.08.03.08.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 08:13:20 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/2] plugins/cache: multicore cache modelling
Date: Tue,  3 Aug 2021 17:12:59 +0200
Message-Id: <20210803151301.123581-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This series introduce multicore cache modelling in contrib/plugins/cache.c

Multi-core cache modelling is handled such that for full-system
emulation, a private L1 cache is maintained to each core available to
the system. For multi-threaded userspace emulation, a static number of
cores is maintained for the overall system, and every memory access go
through one of these, even if the number of fired threads is more than
that number.

v4 -> v5:
    1. Reserved a mutex lock for each cache structure; now callbacks generated
    by accesses done by different vcpus don't block each other.
    2. Used atomic increment to access hashtable entries instead of locking.
    3. Renamed mtx to hashtable_lock to reflect its job more explicitly.
    4. Dropped the usage of CoreStats, embedded stats in the cache structure.
    4. append_stats_line now takes the stats explicitly.

Mahmoud Mandour (2):
  plugins/cache: supported multicore cache modelling
  docs/devel/tcg-plugins: added cores arg to cache plugin

 contrib/plugins/cache.c    | 176 +++++++++++++++++++++++++++----------
 docs/devel/tcg-plugins.rst |  13 +--
 2 files changed, 140 insertions(+), 49 deletions(-)

-- 
2.25.1


