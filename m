Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE822E2E4E
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Dec 2020 15:08:18 +0100 (CET)
Received: from localhost ([::1]:56862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktAEz-00034p-AU
	for lists+qemu-devel@lfdr.de; Sat, 26 Dec 2020 09:08:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6u1-0002Dj-E7; Sat, 26 Dec 2020 05:34:25 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1kt6tz-0004nL-9A; Sat, 26 Dec 2020 05:34:25 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D30X248TszhyPg;
 Sat, 26 Dec 2020 18:33:22 +0800 (CST)
Received: from DESKTOP-EDHIELA.china.huawei.com (10.174.187.50) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 18:34:00 +0800
From: g00517791 <gaojinhao@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
Subject: [PATCH 0/8] Fix memory leak of some device state in migration
Date: Sat, 26 Dec 2020 18:33:39 +0800
Message-ID: <20201226103347.868-1-gaojinhao@huawei.com>
X-Mailer: git-send-email 2.29.2.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.50]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=gaojinhao@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 26 Dec 2020 09:05:44 -0500
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, wanghaibin.wang@huawei.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jinhao Gao <gaojinhao@huawei.com>

For some device state having some fields of VMS_ALLOC flag, they don't
free memory allocated for the fields in vmstate_save_state and vmstate
_load_state. We add funcs or sentences of free memory before allocation
of memory or after load of memory to avoid memory leak.




Jinhao Gao (8):
  vmbus: Fix memory leak of vmstate_gpadl
  virtio-net: Fix memory leak of vmstate_virtio_net_rss
  spapr: Fix memory leak of vmstate_spapr_event_entry
  spapr_pci: Fix memory leak of vmstate_spapr_pci
  savevm: Fix memory leak of vmstate_configuration
  vmbus: Fix memory leak of vmstate_vmbus_chan_req
  tpm_emulator: Fix memory leak of vmstate_tpm_emulator
  dbus-vmstate: Fix memory leak of dbus_vmstate

 backends/dbus-vmstate.c     | 11 +++++++++++
 backends/tpm/tpm_emulator.c | 13 +++++++++++++
 hw/hyperv/vmbus.c           | 22 ++++++++++++++++++++++
 hw/net/virtio-net.c         | 11 +++++++++++
 hw/ppc/spapr.c              | 12 ++++++++++++
 hw/ppc/spapr_pci.c          | 11 +++++++++++
 migration/savevm.c          | 31 +++++++++++++++++++++++++++----
 7 files changed, 107 insertions(+), 4 deletions(-)

-- 
2.23.0


