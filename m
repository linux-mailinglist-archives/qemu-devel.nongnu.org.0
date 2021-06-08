Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E59F39ED62
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 06:09:41 +0200 (CEST)
Received: from localhost ([::1]:37416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqT3X-0006BT-6T
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 00:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lqT25-0003mm-1t
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 00:08:05 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lqT23-0008Gd-BZ
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 00:08:04 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a20so19955668wrc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 21:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wq4fRBjwleyC1qIypGYYDpi+YewDcwgyZHwtM8Zqck=;
 b=JEw/K7A6elLZeH52lYkUAW0tPZ1tXoAo1Ma0mKczwxFNEqTFSm281fIEKAQo3yS1kT
 phQOgQP5/K1FdwYrQmV43DFQAcYbIt62WmDWP6XtKFsqhax3fr0s+wu/Nj7cNNE8CPld
 msVdGyd3c2gtOkPL1XNVak+zv0zuak+hs1eahvXk9HJ4xK/bwO8z2y33Q9l3x4WAn34j
 mO8vPdi1l67FAgM8P+4sI9oaE8M5faabxSJ68MV3xfWVYskSeWU0TAWnWMWICQ4VZR2h
 GvBonPhMkDQ0F6C/3dzBR4K8MOxVw3pWj2cedDj+ff1+boH1Le3ufSowq8gTC0pFSqWg
 IGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1wq4fRBjwleyC1qIypGYYDpi+YewDcwgyZHwtM8Zqck=;
 b=g6Hh7z1CCZZdFqzLvJQ9Oc3KUz2HzXxpVIfxbfx78EIIJ8+vnbfUJZRMLneTZX9Zo4
 qZQYzLTV4TOAac6O17lYAUROyvgRb01kt+yNwCGfeTyxPpHQTuz/84IXTCBd+znambI+
 itrMTZNro1vNRmrRkO1OeuJMvd/hV840BiBeZOkW++dHZAdV0GdANOni7PRrYnydvKe4
 dqZKkVDY2+fwyYAZcxUH6tUhxnHxlzA4mTsDKkwi9REdxOnoQvaEDGEHnAbzKRztzbU7
 Xchm/w891wOtW0OyL9tl1Jt4j4wN2JDpa5ivIun4447+XMY2lsdYz/unWV7MZzg9FEu+
 XLjQ==
X-Gm-Message-State: AOAM532M+nbhiGWD2FgwoXsD07o+aIw2YEuCRopueDN/JTVIM4f5u9zb
 biSJVrOdcn00j5EeyDSIuyE+iIU4sr+nrg==
X-Google-Smtp-Source: ABdhPJxW+0hl0Wfe/jDmprmUtY9YWESJkn0TsFiP1lpTubcaSGS4eoUqXdbyLR19pbVhwf5SlrlOpA==
X-Received: by 2002:a5d:698e:: with SMTP id g14mr20207082wru.212.1623125280316; 
 Mon, 07 Jun 2021 21:08:00 -0700 (PDT)
Received: from localhost.localdomain ([197.61.123.212])
 by smtp.gmail.com with ESMTPSA id y189sm16862008wmy.25.2021.06.07.21.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 21:07:59 -0700 (PDT)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 0/4] Cache TCG plugin & symbol-resolution API
Date: Tue,  8 Jun 2021 06:05:28 +0200
Message-Id: <20210608040532.56449-1-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wr1-x42a.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>, cota@braap.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This RFC series introduces a new cache TCG plugin that models separate
L1 data cache and L1 instruction cache and uses one shared cache for
all the cores.

It also includes a commit by Alex that adds an API call that resolves
the symbol of an insn.

The original RFC patch posted by Alex Bennée included incorporating
symbol resolution into the cache plugin that caused conflicts, so I
dropped the plugin additions from that and introduced them afterwards.

v2 -> v3:
    Precomputed the value of block size shift once and stored in the
    cache.

    Removed tag shifting since it's okay to leave the tag in the
    high-order bits and mask out set index and block offset.

    Used one hashtable to store InsnData structs and made the structs
    have separate counters for data misses and instruction misses.

    Used a boolean to indicate whether an access resulted in a hit or a
    miss.

    Inserted an InsnData struct into the hashtable on translation-time
    and made sure we do so once so that we don't rewrite the struct if
    an instruction is translated multiple times.

    Made the output format for most-missing instructions more
    machine-readable.

    Removed trace-generation.

    Freed tokenized strings after argument parsing.

    Returned null from cache_init() if argument cache config is bad.

    Used one enum to indicate the chosen eviction policy.

    Added function pointers for cache update and metadata initialization
    and destroying. Those pointers are assigned to policy-specific
    functions.

    Remade LRU. Assigned a generation number that is incremented on each
    set access to the currently-accessed block's priority. On miss, 
    evicted the block with the least generation number.

    Allowed to give multiple "evict" arguments and sticked to the last
    one.

Alex Bennée (1):
  plugins/api: expose symbol lookup to plugins

Mahmoud Mandour (3):
  plugins: Added a new cache modelling plugin.
  plugins/cache: Enabled cache parameterization
  plugins/cache: Added FIFO and LRU eviction policies.

 contrib/plugins/Makefile   |   1 +
 contrib/plugins/cache.c    | 642 +++++++++++++++++++++++++++++++++++++
 include/qemu/qemu-plugin.h |   9 +
 plugins/api.c              |   6 +
 4 files changed, 658 insertions(+)
 create mode 100644 contrib/plugins/cache.c

-- 
2.25.1


