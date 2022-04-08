Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A24F95D3
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 14:32:19 +0200 (CEST)
Received: from localhost ([::1]:43026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncnmj-00040o-Vh
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 08:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1ncnj1-0001mc-W9
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42255)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1ncniy-0008Uo-CF
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 08:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649420902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OJgvlVqMVX85Adhq8nr/P1lLguRFA4DP8uZwdKintnk=;
 b=apwypO68SA+ojote9wqclI7J/eVYp2HSWZsHaf1J624Ygf5iHwxBZlMWtn0gEPzh3pQnxg
 j9zaEgZHaFqx3WP6taAmCXWe6Fj7i4BqPfmWrpnDh6cfTFFj+Gn6umNcLyzCOl+Lfyu5uX
 xWBipGNn0LQTwccxUJKlndgfwEggTzQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-bzVdKNX0NNSaVvEoMFJ8xQ-1; Fri, 08 Apr 2022 08:28:17 -0400
X-MC-Unique: bzVdKNX0NNSaVvEoMFJ8xQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2442F80B71C;
 Fri,  8 Apr 2022 12:28:17 +0000 (UTC)
Received: from max-t490s.redhat.com (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 045631402427;
 Fri,  8 Apr 2022 12:28:14 +0000 (UTC)
From: Maxime Coquelin <maxime.coquelin@redhat.com>
To: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 andrew@daynix.com, yuri.benditovich@daynix.com, dgilbert@redhat.com,
 quintela@redhat.com
Subject: [PATCH 0/5] Vhost-user: add Virtio RSS support
Date: Fri,  8 Apr 2022 14:28:08 +0200
Message-Id: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=maxime.coquelin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=maxime.coquelin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: chenbo.xia@intel.com, Maxime Coquelin <maxime.coquelin@redhat.com>,
 dmarchan@redhat.com, ktraynor@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The goal of this series is to add support for Virtio RSS
feature to the Vhost-user backend.

First patches are preliminary reworks to support variable
RSS key and indirection table length. eBPF change only adds
checks on whether the key length is 40B, it does not add
support for longer keys.

Vhost-user implementation supports up to 52B RSS key, in
order to match with the maximum supported by physical
NICs (Intel E810). Idea is that it could be used for
application like Virtio-forwarder, by programming the
Virtio device RSS key into the physical NIC and let the
physical NIC do the packets distribution.

DPDK Vhost-user backend PoC implementing the new requests
can be found here [0], it only implements the messages
handling, it does not perform any RSS for now.

[0]: https://gitlab.com/mcoquelin/dpdk-next-virtio/-/commits/vhost_user_rss_poc/

Maxime Coquelin (5):
  ebpf: pass and check RSS key length to the loader
  virtio-net: prepare for variable RSS key and indir table lengths
  virtio-net: add RSS support for Vhost backends
  docs: introduce RSS support in Vhost-user specification
  vhost-user: add RSS support

 docs/interop/vhost-user.rst       |  57 ++++++++++++
 ebpf/ebpf_rss-stub.c              |   3 +-
 ebpf/ebpf_rss.c                   |  17 ++--
 ebpf/ebpf_rss.h                   |   3 +-
 hw/net/vhost_net-stub.c           |  10 ++
 hw/net/vhost_net.c                |  22 +++++
 hw/net/virtio-net.c               |  87 +++++++++++++-----
 hw/virtio/vhost-user.c            | 146 +++++++++++++++++++++++++++++-
 include/hw/virtio/vhost-backend.h |   7 ++
 include/hw/virtio/virtio-net.h    |  16 +++-
 include/migration/vmstate.h       |  10 ++
 include/net/vhost_net.h           |   4 +
 12 files changed, 344 insertions(+), 38 deletions(-)

-- 
2.35.1


