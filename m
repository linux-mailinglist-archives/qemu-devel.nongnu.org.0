Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FE5613B14
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 17:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opXVl-0006el-59; Mon, 31 Oct 2022 12:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1opXVV-0006Wo-06
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:19:25 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.223] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1opXVR-0001MG-Tm
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 12:19:24 -0400
HMM_SOURCE_IP: 172.18.0.218:50162.1127588867
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-182.138.180.88 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 30CD82800DA;
 Tue,  1 Nov 2022 00:19:04 +0800 (CST)
X-189-SAVE-TO-SEND: +huangy81@chinatelecom.cn
Received: from  ([182.138.180.88])
 by app0025 with ESMTP id 837b3ce4cb48422289379c83c4009a68 for
 qemu-devel@nongnu.org; Tue, 01 Nov 2022 00:19:13 CST
X-Transaction-ID: 837b3ce4cb48422289379c83c4009a68
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 182.138.180.88
X-MEDUSA-Status: 0
From: huangy81@chinatelecom.cn
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?UTF-8?q?Hyman=20Huang=28=E9=BB=84=E5=8B=87=29?= <huangy81@chinatelecom.cn>
Subject: [PATCH RFC 0/4] Export netdev capabilities and information 
Date: Tue,  1 Nov 2022 00:18:58 +0800
Message-Id: <cover.1667232396.git.huangy81@chinatelecom.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.223;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

This series is enlightened by Michael when we fixed a virtio features
negotiation flaw, see the details here:
https://lore.kernel.org/qemu-devel/cover.1667136717.git.huangy81@chinatelecom.cn/

And a test is suggested to be added to test behavior of virtio-net features
negotiation(if i understand correctly), see the details here:
https://lore.kernel.org/qemu-devel/20221026105516-mutt-send-email-mst@kernel.org/

Indeed, Qemu does not export interface capabilities such as ufo, vnet-hdr or
negotiated features to developers. OVS-DPDK will show the interface status such
as features, mode, ring_size and so on if we execute "ovs-vsctl list interface"
by comparison. It could be more friendly if we export above capabilities and
information for developers, especially for those who devote to offload virtio-net
dataplane to DPU and make efforts to migrate vm lively from software-based source
to DPU-offload destination smoothly, virtio-net feature compatibility is an
serious issue, exporting the key capability and acked_features of netdev could
help to debug greatly.

This series export out the key capabilities of netdev, which may affect the final
negotiated virtio-net features, meanwhile, backed-up acked_features also exported,
which is used to initialize or restore features negotiated between qemu and vhost
slave when starting vhost_dev device.

Another thing the patchset did is adding a virtio-net features check test, which
use the fresh new qmp interface "query-netdev" to check if features are
negotiated correctly via vhost user protocol.

This patchset depends on the previous patchset which is in the process of code
reviewing. So this post aims to request for comments as the subject say, any
suggestions and comments are welcome and i would appreciate a lot.

Please review, thanks,

Hyman Huang (4):
  net: Introduce qmp cmd "query-netdev"
  hmp: Add "info netdev" cmd
  hmp: Add netdev information into output of hmp cmd "info network"
  vhost-user-test: Add negotiated features check

 hmp-commands-info.hx          | 14 +++++++
 include/monitor/hmp.h         |  1 +
 net/net.c                     | 90 +++++++++++++++++++++++++++++++++++++++++++
 qapi/net.json                 | 66 +++++++++++++++++++++++++++++++
 tests/qtest/vhost-user-test.c | 67 ++++++++++++++++++++++++++++++++
 5 files changed, 238 insertions(+)

-- 
1.8.3.1


