Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B6F2E354D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 10:07:26 +0100 (CET)
Received: from localhost ([::1]:59104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktoUu-0003la-Kh
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 04:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1ktoT2-0002ai-Ne; Mon, 28 Dec 2020 04:05:28 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaojinhao@huawei.com>)
 id 1ktoSz-0002Xo-SX; Mon, 28 Dec 2020 04:05:28 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4D4BSl6196zhyR6;
 Mon, 28 Dec 2020 17:04:39 +0800 (CST)
Received: from DESKTOP-EDHIELA.china.huawei.com (10.174.187.50) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Mon, 28 Dec 2020 17:05:07 +0800
From: g00517791 <gaojinhao@huawei.com>
To: <qemu-ppc@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH v2 0/3] Fix memory leak of some device state in migration
Date: Mon, 28 Dec 2020 17:00:50 +0800
Message-ID: <20201228090053.346-1-gaojinhao@huawei.com>
X-Mailer: git-send-email 2.29.2.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.50]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=gaojinhao@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Stefan
 Berger <stefanb@linux.vnet.ibm.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, wanghaibin.wang@huawei.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 zhukeqian1@huawei.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jinhao Gao <gaojinhao@huawei.com>

For some device state having some fields of VMS_ALLOC flag, they
don't free memory allocated for the fields in vmstate_save_state
and vmstate_load_state. We add funcs or sentences of free memory
before and after VM saves or loads device state to avoid memory leak.

v2
 - Drop patch1-3,6-8 of v1
 - Address Michael's comment (free memory before load vmsd centrally)
 - Add David's Acked-by and Michael's Signed-off-by

Jinhao Gao (3):
  spapr_pci: Fix memory leak of vmstate_spapr_pci
  savevm: Fix memory leak of vmstate_configuration
  vmstate: Fix memory leak in vmstate_handle_alloc()

 hw/ppc/spapr_pci.c  | 11 +++++++++++
 migration/savevm.c  | 31 +++++++++++++++++++++++++++----
 migration/vmstate.c |  1 +
 3 files changed, 39 insertions(+), 4 deletions(-)

-- 
2.23.0


