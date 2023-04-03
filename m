Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 060A86D42A0
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 12:54:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjHoi-0007W6-Eu; Mon, 03 Apr 2023 06:53:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450a44d59=bchalios@amazon.es>)
 id 1pjHoc-0007Vp-L8
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:53:34 -0400
Received: from smtp-fw-80007.amazon.com ([99.78.197.218])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=450a44d59=bchalios@amazon.es>)
 id 1pjHoY-0001Yo-SR
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 06:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.es; i=@amazon.es; q=dns/txt; s=amazon201209;
 t=1680519212; x=1712055212;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=02wtyNhp8ZOc0ICZ+WNhZm1oBX1QyFAfArktEOyqVFA=;
 b=meHLd0zZcfcYGWd+qUKMDk3+ZwV5CnuHPde+gCsDtRT1/27/GTD9/Ex4
 0/N7UYM031UuB4LYlEjiCNLo0lHwTFPFsTVkAmFybM72X3ge8wBBspeFe
 jWYmHjgaKTZokv2RY4yZLadJfdaG2SD5GqAZDTSLqRKAmZbm3NzjkQhbz Y=;
X-IronPort-AV: E=Sophos;i="5.98,314,1673913600"; d="scan'208";a="200314806"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-25ac6bd5.us-east-1.amazon.com)
 ([10.25.36.214]) by smtp-border-fw-80007.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 10:53:26 +0000
Received: from EX19D003EUA001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1d-m6i4x-25ac6bd5.us-east-1.amazon.com (Postfix)
 with ESMTPS id 8EC654541B; Mon,  3 Apr 2023 10:53:23 +0000 (UTC)
Received: from EX19D037EUB003.ant.amazon.com (10.252.61.119) by
 EX19D003EUA001.ant.amazon.com (10.252.50.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 3 Apr 2023 10:53:22 +0000
Received: from f4d4887fdcfb.ant.amazon.com (10.1.213.24) by
 EX19D037EUB003.ant.amazon.com (10.252.61.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 3 Apr 2023 10:53:18 +0000
From: Babis Chalios <bchalios@amazon.es>
To: "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, <qemu-devel@nongnu.org>
CC: <bchalios@amazon.es>, <sgarzare@redhat.com>, <graf@amazon.de>,
 <Jason@zx2c4.com>, <xmarcalx@amazon.co.uk>
Subject: [RFC PATCH 0/1] Implement entropy leak reporting for virtio-rng
Date: Mon, 3 Apr 2023 12:52:44 +0200
Message-ID: <20230403105245.29499-1-bchalios@amazon.es>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.1.213.24]
X-ClientProxiedBy: EX19D044UWB003.ant.amazon.com (10.13.139.168) To
 EX19D037EUB003.ant.amazon.com (10.252.61.119)
Precedence: Bulk
Received-SPF: pass client-ip=99.78.197.218;
 envelope-from=prvs=450a44d59=bchalios@amazon.es; helo=smtp-fw-80007.amazon.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patchset implements the entropy leak reporting feature proposal [1]
for virtio-rng devices.

Entropy leaking (as defined in the specification proposal) typically
happens when we take a snapshot of a VM or while we resume a VM from a
snapshot. In these cases, we want to let the guest know so that it can
reset state that needs to be uniqueue, for example.

This feature is offering functionality similar to what VMGENID does.
However, it allows to build mechanisms on the guest side to notify
user-space applications, like VMGENID for userspace and additionally for
kernel.

The new specification describes two request types that the guest might
place in the queues for the device to perform, a fill-on-leak request
where the device needs to fill with random bytes a buffer and a
copy-on-leak request where the device needs to perform a copy between
two guest-provided buffers. We currently trigger the handling of guest
requests when saving the VM state and when loading a VM from a snapshot
file.

This is an RFC, since the corresponding specification changes have not
yet been merged. It also aims to allow testing a respective patch-set
implementing the feature in the Linux front-end driver[2].

However, I would like to ask the community's opinion regarding the
handling of the fill-on-leak requests. Essentially, these requests are
very similar to the normal virtio-rng entropy requests, with the catch
that we should complete these requests before resuming the VM, so that
we avoid race-conditions in notifying the guest about entropy leak
events. This means that we cannot rely on the RngBackend's API, which is
asynchronous. At the moment, I have handled that using getrandom(), but
I would like a solution which doesn't work only with (relatively new)
Linux hosts. I am inclined to solve that by extending the RngBackend API
with a synchronous call to request for random bytes and I'd like to hear
opinion's on this approach.

[1] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg09016.html
[2] https://lore.kernel.org/lkml/20230131145543.86369-1-bchalios@amazon.es/

Babis Chalios (1):
  virtio-rng: implement entropy leak feature

 hw/virtio/virtio-rng.c                      | 170 +++++++++++++++++++-
 include/hw/virtio/virtio-rng.h              |   9 +-
 include/standard-headers/linux/virtio_rng.h |   3 +
 3 files changed, 179 insertions(+), 3 deletions(-)

-- 
2.39.2


