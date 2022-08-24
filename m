Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040A059F6B5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:47:08 +0200 (CEST)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQmyY-0008S3-PJ
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQmcL-0004Qc-66; Wed, 24 Aug 2022 05:24:12 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:38366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1oQmcH-0007Hi-RZ; Wed, 24 Aug 2022 05:24:07 -0400
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 594982E1411;
 Wed, 24 Aug 2022 12:18:45 +0300 (MSK)
Received: from d-tatianin-nix.yandex-team.ru (unknown
 [2a02:6b8:b081:b4bd::1:34])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 YDoXMhagzp-IhOaOOxY; Wed, 24 Aug 2022 12:18:44 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1661332724; bh=uJtGtqdpUe2MC2nZDn6J1KNWtwCbSxewN86AiCBAksM=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=K199SHbjCggyqkoLr+jhdD4cFACdVwHE6fTHH15mm5ftet3scQp+aQdK7I5kNNlF7
 5UIQEhvNflODziJVO0E7kSUycLMuYkw9Gm3S7v/A7uKgPxSpxr/SNGsTMxZWskAVML
 6wKnWS043p+kU7309EoQFF5kA6KgXc1vdIldkt3E=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, stefanha@redhat.com, raphael.norwitz@nutanix.com,
 kwolf@redhat.com, hreitz@redhat.com, qemu-block@nongnu.org,
 yc-core@yandex-team.ru, d-tatianin@yandex-team.ru
Subject: [PATCH v1 0/5] vhost-user-blk: dynamically resize config space based
 on features
Date: Wed, 24 Aug 2022 12:18:32 +0300
Message-Id: <20220824091837.301708-1-d-tatianin@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
terms of backward compatibility and flexibility.

In particular it adds the following things:
- Ability to disable modern features like discard/write-zeroes.
- Dynamic configuration space resizing based on enabled features,
  by reusing the code, which was already present in virtio-blk.
- Makes the VHostUserBlk structure a bit less clunky by using the
  'host_features' field to represent enabled features, as opposed to
  using a separate field per feature. This was already done for
  virtio-blk a long time ago.

Daniil Tatianin (5):
  virtio-blk: decouple config size determination code from VirtIOBlock
  virtio-blk: move config space sizing code to virtio-blk-common
  vhost-user-blk: make it possible to disable write-zeroes/discard
  vhost-user-blk: make 'config_wce' part of 'host_features'
  vhost-user-blk: dynamically resize config space based on features

 MAINTAINERS                           |  4 +++
 hw/block/meson.build                  |  4 +--
 hw/block/vhost-user-blk.c             | 29 +++++++++---------
 hw/block/virtio-blk-common.c          | 42 +++++++++++++++++++++++++++
 hw/block/virtio-blk.c                 | 25 ++--------------
 include/hw/virtio/vhost-user-blk.h    |  4 ++-
 include/hw/virtio/virtio-blk-common.h | 21 ++++++++++++++
 7 files changed, 90 insertions(+), 39 deletions(-)
 create mode 100644 hw/block/virtio-blk-common.c
 create mode 100644 include/hw/virtio/virtio-blk-common.h

-- 
2.25.1


