Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BA91CB9D5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 23:32:17 +0200 (CEST)
Received: from localhost ([::1]:51106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jXAbL-0004nV-9y
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 17:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jXAZ8-0003vd-H7
 for qemu-devel@nongnu.org; Fri, 08 May 2020 17:29:54 -0400
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41]:45749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jXAZ7-0008AX-CP
 for qemu-devel@nongnu.org; Fri, 08 May 2020 17:29:54 -0400
Received: by mail-qv1-xf41.google.com with SMTP id p13so1542040qvt.12
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 14:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=vxofOa6SkCodTLc1swG4ipN5CZU0JprATw9nd/eJ96M=;
 b=hf7VaXvD98G/AlFsFDX0dAyBU8+0U/o86YUpY3MaCaelOc1gkeJZUuVEZIHpjtXkYh
 3ZVbnwDF+RRyRefg9QJVzckJr+uSKMnzwYBeXsGMOTJ4VOdj06kUpCX5F2aYRgjKayrE
 G/FlPVEq3ThScicVQNowptdVQ6FwE07icl/7cp7eOQMB7ew1oddcua+pe8SbFIB5ZKMk
 +lccPZyBNf0DOiOJDH2qs/UBz76hsTWd+C6LcSrp9S2YuJcXflSpcyxD22A+bF84k8bk
 KbW2B24lec0BiYFmHukTx4c25lRN6lVlLBDvl2UZJ1Shv8RRmR3NdpIhMFuGzjXRsH1A
 Xwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=vxofOa6SkCodTLc1swG4ipN5CZU0JprATw9nd/eJ96M=;
 b=T4qDEEv0quGU6uz5BpgSflRga6pPNm7r8TKuqde2fG29NzFw1+s/FwjSmnLi+gmpxt
 PLnJkh7tgIIY1qUNzKbL51A33CoCRshX1lX+q2qGqFI0s0B5Hg810m0M/iktCuupx8fx
 2Y+1U9moJRR/tpzDxLTpaOqIdXSpJcXBv+6gSQVAC/5CVOy1uIzHPnecnNemrtCBTHOy
 QrJQqfKptz4tgjbjud1jJ+FeNAsNgkOb8vPgbgml7au6zFesACVWZ9Fr+U0DqvjfVhXD
 CxuLPvZZJp6X7uO+3/u4tS94DEKSGjtGoqHVSQXAfKsslBVtRdNjnETAcEhPxzyfG3LM
 dDcg==
X-Gm-Message-State: AGi0PuYEQuE5TPHgU7PQHDFwA9ETFGud9p+kHk7aizuSKRo9zWp+K31X
 WISJg342zS0sNIVakhsGuuk=
X-Google-Smtp-Source: APiQypIK2rc5g4iySPpWnmuCse+1VaB1yQBkbYrzJQzIWxnqW4DfJnSTjUZTxaJ2wLtCYXdgsCZYYQ==
X-Received: by 2002:a05:6214:a14:: with SMTP id
 dw20mr4768951qvb.179.1588973391818; 
 Fri, 08 May 2020 14:29:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id l9sm2395909qth.60.2020.05.08.14.29.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 14:29:51 -0700 (PDT)
Subject: [PATCH v24 QEMU 0/3] virtio-balloon: add support for page poison
 reporting and free page reporting
From: Alexander Duyck <alexander.duyck@gmail.com>
To: david@redhat.com, mst@redhat.com
Date: Fri, 08 May 2020 14:29:49 -0700
Message-ID: <20200508212719.26071.94248.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f41;
 envelope-from=alexander.duyck@gmail.com; helo=mail-qv1-xf41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series provides an asynchronous means of reporting free guest pages
to QEMU through virtio-balloon so that the memory associated with those
pages can be dropped and reused by other processes and/or guests on the
host. Using this it is possible to avoid unnecessary I/O to disk and
greatly improve performance in the case of memory overcommit on the host.

I originally submitted this patch series back on February 11th 2020[1],
but at that time I was focused primarily on the kernel portion of this
patch set. However as of April 7th those patches are now included in
Linus's kernel tree[2] and so I am submitting the QEMU pieces for
inclusion.

[1]: https://lore.kernel.org/lkml/20200211224416.29318.44077.stgit@localhost.localdomain/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b0c504f154718904ae49349147e3b7e6ae91ffdc

Changes from v17:
Fixed typo in patch 1 title
Addressed white-space issues reported via checkpatch
Added braces {} for two if statements to match expected coding style

Changes from v18:
Updated patches 2 and 3 based on input from dhildenb
Added comment to patch 2 describing what keeps us from reporting a bad page
Added patch to address issue with ROM devices being directly writable

Changes from v19:
Added std-headers change to match changes pushed for linux kernel headers
Added patch to remove "report" from page hinting code paths
Updated comment to better explain why we disable hints w/ page poisoning
Removed code that was modifying config size for poison vs hinting
Dropped x-page-poison property
Added code to bounds check the reported region vs the RAM block
Dropped patch for ROM devices as that was already pulled in by Paolo

Changes from v20:
Rearranged patches to push Linux header sync patches to front
Removed association between free page hinting and VIRTIO_BALLOON_F_PAGE_POISON
Added code to enable VIRTIO_BALLOON_F_PAGE_POISON if page reporting is enabled
Fixed possible resource leak if poison or qemu_balloon_is_inhibited return true

Changes from v21:
Added ack for patch 3
Rewrote patch description for page poison reporting feature
Made page-poison independent property and set to enabled by default
Added logic to migrate poison_val
Added several comments in code to better explain features
Switched free-page-reporting property to disabled by default

Changes from v22:
Added ack for patches 4 & 5
Added additional comment fixes in patch 3 to remove "reporting" reference
Renamed rvq in patch 5 to reporting_vq to better match linux kernel
Moved call adding reporting_vq to after free_page_vq

Changes from v23:
Rebased on latest QEMU
Dropped patches 1 & 2 as Linux kernel headers were synced
Added compat machine bits for page-poison feature

---

Alexander Duyck (3):
      virtio-balloon: Replace free page hinting references to 'report' with 'hint'
      virtio-balloon: Implement support for page poison reporting feature
      virtio-balloon: Provide an interface for free page reporting


 hw/core/machine.c                  |    4 +
 hw/virtio/virtio-balloon.c         |  176 ++++++++++++++++++++++++++++--------
 include/hw/virtio/virtio-balloon.h |   23 ++---
 3 files changed, 152 insertions(+), 51 deletions(-)

--

