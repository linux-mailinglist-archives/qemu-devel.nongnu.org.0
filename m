Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEB030C602
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:37:11 +0100 (CET)
Received: from localhost ([::1]:53066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yfu-0003Cw-Sv
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:37:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yXx-0004x9-Ff
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:28:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6yXv-00005O-O0
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 11:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612283335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7ESXVlxIqiS6RT3KPYlIOaPgSi3O75p7uUG+sG7i4fA=;
 b=SoI1Lac6z4DNl81UjzPCNAwRpnGajhqt7VJ2c1NUh0b4hd0zPmyS/sY3uGfSE2Yjn6kD7o
 u80vvl1opMmGOTEu3HS/ehwVbYjVq1XAyR0RhsH3uGKUWvvWcuK0G86TPVDupSeFjvNLY7
 bmIkjDQb5HW3rP4JtEBoTpP13CYN+/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-Yc-_ViowPSqLYMXv_yeCSA-1; Tue, 02 Feb 2021 11:28:51 -0500
X-MC-Unique: Yc-_ViowPSqLYMXv_yeCSA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23E0B107ACE4;
 Tue,  2 Feb 2021 16:28:50 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E394D5D763;
 Tue,  2 Feb 2021 16:28:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 00/10] Block layer patches
Date: Tue,  2 Feb 2021 17:28:24 +0100
Message-Id: <20210202162834.269789-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cf7ca7d5b9faca13f1f8e3ea92cfb2f741eb0c0e:

  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/tracing-pull-request' into staging (2021-02-01 16:28:00 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 26513a01741f51650f5dd716681995359794ba6f:

  block: Fix VM size column width in bdrv_snapshot_dump() (2021-02-02 17:23:55 +0100)

----------------------------------------------------------------
Block layer patches:

- Fix double processing of nodes in bdrv_set_aio_context()
- Fix potential hang in block export shutdown
- block/nvme: Minor tracing improvements
- iotests: Some more fixups for the 'check' rewrite
- MAINTAINERS: Add Vladimir as co-maintainer for Block Jobs

----------------------------------------------------------------
Kevin Wolf (3):
      iotests: Revert emulator selection to old behaviour
      iotests: Fix -makecheck output
      block: Fix VM size column width in bdrv_snapshot_dump()

Philippe Mathieu-Daudé (2):
      block/nvme: Properly display doorbell stride length in trace event
      block/nvme: Trace NVMe spec version supported by the controller

Sergio Lopez (2):
      block: Avoid processing BDS twice in bdrv_set_aio_context_ignore()
      block: move blk_exp_close_all() to qemu_cleanup()

Vladimir Sementsov-Ogievskiy (3):
      MAINTAINERS: Add Vladimir as co-maintainer for Block Jobs
      iotests/297: pylint: ignore too many statements
      iotests: check: return 1 on failure

 block.c                              | 35 +++++++++++++++++++++++++++--------
 block/nvme.c                         |  8 +++++++-
 block/qapi.c                         |  4 ++--
 qemu-nbd.c                           |  1 +
 softmmu/runstate.c                   |  9 +++++++++
 storage-daemon/qemu-storage-daemon.c |  1 +
 tests/qemu-iotests/testenv.py        |  2 +-
 tests/qemu-iotests/testrunner.py     | 10 +++++++---
 MAINTAINERS                          | 10 ++++++++++
 block/trace-events                   |  1 +
 tests/qemu-iotests/check             |  5 ++++-
 tests/qemu-iotests/pylintrc          |  2 ++
 12 files changed, 72 insertions(+), 16 deletions(-)


