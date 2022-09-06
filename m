Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692CB5AE170
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 09:44:32 +0200 (CEST)
Received: from localhost ([::1]:52060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVTG2-0007wA-Dy
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 03:44:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oVT3X-0003IJ-R0; Tue, 06 Sep 2022 03:31:36 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:43708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oVT3S-0002xO-AJ; Tue, 06 Sep 2022 03:31:33 -0400
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 6A8702E0EB6;
 Tue,  6 Sep 2022 10:31:16 +0300 (MSK)
Received: from d-tatianin-nix.yandex.net (unknown
 [2a02:6b8:0:419:d8d0:8d85:2aad:ab5b])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 WefwVQnsrp-VFXi1CcQ; Tue, 06 Sep 2022 10:31:15 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662449475; bh=w1kLlAKKrtNGX077gp8yNWt49DKNqvPDNy05skkGV1k=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=XcurUW0LFetzTQhr1JlnYGmhITnQdpRYhYBKr12eorP2TD2O8Rn0YYuG4IdmFLZuc
 1cNbXroRklcBEgMF2B8IWjMLPtpvr2NlK2eZ1RePIeCKwlPYZmXyB+Hnb/eAL5PGTx
 NE2bgncWmY5B9snqcJDUNbLrLxD2X+zHuJJJzT7o=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, mst@redhat.com, stefanha@redhat.com,
 raphael.norwitz@nutanix.com, kwolf@redhat.com, qemu-block@nongnu.org,
 jasowang@redhat.com, d-tatianin@yandex-team.ru
Subject: [PATCH v3 0/5] vhost-user-blk: dynamically resize config space based
 on features
Date: Tue,  6 Sep 2022 10:31:06 +0300
Message-Id: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch set attempts to align vhost-user-blk with virtio-blk in
terms of backward compatibility and flexibility. It also improves
the virtio core by introducing new common code that can be used by
a virtio device to calculate its config space size.

In particular it adds the following things:
- Common virtio code for deducing the required device config size based
  on provided host features.
- Ability to disable modern virtio-blk features like
  discard/write-zeroes for vhost-user-blk.
- Dynamic configuration space resizing based on enabled features,
  by reusing the common code introduced in the earlier commits.
- Cleans up the VHostUserBlk structure by reusing parent fields.

Changes since v1 (mostly addresses Stefan's feedback):
- Introduce VirtIOConfigSizeParams & virtio_get_config_size
- Remove virtio_blk_set_config_size altogether, make virtio-blk-common.c
  only hold the virtio-blk config size parameters.
- Reuse parent fields in vhost-user-blk instead of introducing new ones.

Changes since v2:
- Squash the first four commits into one
- Set .min_size for virtio-net as well
- Move maintainer/meson user-blk bits to the last commit

Daniil Tatianin (5):
  virtio: introduce VirtIOConfigSizeParams & virtio_get_config_size
  virtio-blk: move config size params to virtio-blk-common
  vhost-user-blk: make it possible to disable write-zeroes/discard
  vhost-user-blk: make 'config_wce' part of 'host_features'
  vhost-user-blk: dynamically resize config space based on features

 MAINTAINERS                           |  4 +++
 hw/block/meson.build                  |  4 +--
 hw/block/vhost-user-blk.c             | 29 +++++++++++---------
 hw/block/virtio-blk-common.c          | 39 +++++++++++++++++++++++++++
 hw/block/virtio-blk.c                 | 28 +++----------------
 hw/net/virtio-net.c                   |  9 +++++--
 hw/virtio/virtio.c                    | 10 ++++---
 include/hw/virtio/vhost-user-blk.h    |  1 -
 include/hw/virtio/virtio-blk-common.h | 20 ++++++++++++++
 include/hw/virtio/virtio.h            | 10 +++++--
 10 files changed, 105 insertions(+), 49 deletions(-)
 create mode 100644 hw/block/virtio-blk-common.c
 create mode 100644 include/hw/virtio/virtio-blk-common.h

-- 
2.25.1


