Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC683285E8F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 13:58:54 +0200 (CEST)
Received: from localhost ([::1]:45480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ85u-00038W-07
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 07:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ84B-0001O6-64
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 07:57:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ849-0001g9-Ds
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 07:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602071824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FPTkqf6WJkhrShPR5axybp+wjVEJuJhv7BBbf18NsUw=;
 b=g3CRXfn69Ooq+IdSna9qP81VhlFn7+WqwNJ9h9rDzzU+9vZtZn/mwtgLyd2PP1FYpZw5gM
 dsZBYM8zMOuliUwzf8ax0M6pbYsj88lAeZpn5fZuYx73Fb1v/trx5kYEtASAjYvrcLbQbi
 gpSZM+vKKSJK0fh575ClOO2IkhgfJLk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-mQ9btBxmPXyyffNxCe-pDw-1; Wed, 07 Oct 2020 07:57:02 -0400
X-MC-Unique: mQ9btBxmPXyyffNxCe-pDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D40318A076E;
 Wed,  7 Oct 2020 11:57:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F47D55795;
 Wed,  7 Oct 2020 11:57:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/17] Fix scsi devices plug/unplug races w.r.t virtio-scsi
 iothread
Date: Wed,  7 Oct 2020 07:56:43 -0400
Message-Id: <20201007115700.707938-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:54:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hopefully the final version of the patches, fixing the remaining
testsuite issues.  Kevin or Max, please take a look at patches 6 and 7
as they affect qemu-iotests.

Paolo

Maxim Levitsky (11):
  qtest: rename qtest_qmp_receive to qtest_qmp_receive_dict
  qtest: Reintroduce qtest_qmp_receive
  qtest: remove qtest_qmp_receive_success
  qtest: switch users back to qtest_qmp_receive
  scsi/scsi_bus: switch search direction in scsi_device_find
  device_core: use drain_call_rcu in in qmp_device_add
  device-core: use RCU for list of children of a bus
  device-core: use atomic_set on .realized property
  scsi/scsi_bus: Add scsi_device_get
  virtio-scsi: use scsi_device_get
  scsi/scsi_bus: fix races in REPORT LUNS

Paolo Bonzini (6):
  device-plug-test: use qtest_qmp to send the device_del command
  qtest: check that drives are really appearing and disappearing
  qemu-iotests, qtest: rewrite test 067 as a qtest
  qdev: add "check if address free" callback for buses
  scsi: switch to bus->check_address
  scsi/scsi-bus: scsi_device_find: don't return unrealized devices

 .gitlab-ci.yml                  |   2 +-
 hw/core/bus.c                   |  28 ++-
 hw/core/qdev.c                  |  73 ++++--
 hw/net/virtio-net.c             |   2 +-
 hw/scsi/scsi-bus.c              | 262 ++++++++++++--------
 hw/scsi/virtio-scsi.c           |  27 ++-
 hw/sd/core.c                    |   3 +-
 include/hw/qdev-core.h          |  24 +-
 include/hw/scsi/scsi.h          |   1 +
 softmmu/qdev-monitor.c          |  12 +
 tests/qemu-iotests/067          | 157 ------------
 tests/qemu-iotests/067.out      | 414 --------------------------------
 tests/qemu-iotests/group        |   1 -
 tests/qtest/device-plug-test.c  |  32 +--
 tests/qtest/drive_del-test.c    | 244 ++++++++++++++++---
 tests/qtest/libqos/libqtest.h   |  34 +--
 tests/qtest/libqtest.c          | 110 +++++----
 tests/qtest/meson.build         |   4 +-
 tests/qtest/migration-helpers.c |  25 +-
 tests/qtest/pvpanic-test.c      |   4 +-
 tests/qtest/qmp-test.c          |  18 +-
 tests/qtest/tpm-util.c          |   8 +-
 22 files changed, 637 insertions(+), 848 deletions(-)
 delete mode 100755 tests/qemu-iotests/067
 delete mode 100644 tests/qemu-iotests/067.out

-- 
2.26.2


