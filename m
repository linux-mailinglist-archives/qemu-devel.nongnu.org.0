Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2CD18F0B5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 09:18:30 +0100 (CET)
Received: from localhost ([::1]:58268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGII1-0005ho-Ck
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 04:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45144)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangke27@huawei.com>) id 1jGIH7-0005FR-Gd
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 04:17:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yangke27@huawei.com>) id 1jGIH6-0000Gz-8j
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 04:17:33 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2459 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yangke27@huawei.com>) id 1jGIH5-0000De-Sz
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 04:17:32 -0400
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 5341EA554B5A6182AD23;
 Mon, 23 Mar 2020 16:17:20 +0800 (CST)
Received: from DGGEMM532-MBS.china.huawei.com ([169.254.8.60]) by
 DGGEMM401-HUB.china.huawei.com ([10.3.20.209]) with mapi id 14.03.0487.000;
 Mon, 23 Mar 2020 16:17:14 +0800
From: "yangke (J)" <yangke27@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [question]vhost-user: atuo fix network link broken during migration
Thread-Topic: [question]vhost-user: atuo fix network link broken during
 migration
Thread-Index: AdYA62Eje0lIFlEcTKSTWbnCiLhZ0A==
Date: Mon, 23 Mar 2020 08:17:13 +0000
Message-ID: <0CC1E03725E48D478F815032182740230A42A312@DGGEMM532-MBS.china.huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.133.210.146]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.187
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
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "wangxin \(U\)" <wangxinxin.wang@huawei.com>,
 "quintela@redhat.com" <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We find an issue when host mce trigger openvswitch(dpdk) restart in source =
host during guest migration,=20
VM is still link down in frontend after migration, it cause the network in =
VM never be up again.

virtio_net_load_device:
    /* nc.link_down can't be migrated, so infer link_down according
     * to link status bit in n->status */
    link_down =3D (n->status & VIRTIO_NET_S_LINK_UP) =3D=3D 0;
    for (i =3D 0; i < n->max_queues; i++) {
        qemu_get_subqueue(n->nic, i)->link_down =3D link_down;
    }

guset:                    migrate begin -------> vCPU pause --------> vmsat=
e load ------->migrate finish
                                            ^                  ^           =
          ^
                                            |                  |           =
          |
openvswitch in source host:          begin to restart       restarting     =
        started
                                            ^                  ^           =
          ^
                                            |                  |           =
          |
nc in frontend in source:               link down           link down      =
       link down
                                            ^                  ^           =
          ^
                                            |                  |           =
          |
nc in frontend in destination:          link up             link up        =
       link down
                                            ^                  ^           =
          ^
                                            |                  |           =
          |
guset network:                            broken             broken        =
        broken
                                            ^                  ^           =
          ^
                                            |                  |           =
          |
nc in backend in source:                link down          link down       =
       link up
                                            ^                  ^           =
          ^
                                            |                  |           =
          |
nc in backend in destination:           link up             link up        =
       link up

The link_down of frontend was loaded from n->status, n->status is link down=
 in source, so the link_down of=20
frontend is true. The backend in destination host is link up, but the front=
end in destination host is=20
link down, it cause the network in gust never be up again until an guest co=
ld reboot.

Is there a way to auto fix the link status? or just abort the migration in =
virtio net device load?

