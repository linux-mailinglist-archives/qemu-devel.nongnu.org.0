Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553FC38251B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 09:11:27 +0200 (CEST)
Received: from localhost ([::1]:40832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liXPS-0007hj-Ej
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 03:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1liXBN-0006QV-MY
 for qemu-devel@nongnu.org; Mon, 17 May 2021 02:56:54 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1liXBI-0007yY-6A
 for qemu-devel@nongnu.org; Mon, 17 May 2021 02:56:52 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fk8xt2S88zmWgS;
 Mon, 17 May 2021 14:54:26 +0800 (CST)
Received: from dggpeml500016.china.huawei.com (7.185.36.70) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 14:56:40 +0800
Received: from [10.174.148.223] (10.174.148.223) by
 dggpeml500016.china.huawei.com (7.185.36.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 14:56:40 +0800
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
To: <marcandre.lureau@redhat.com>, <pbonzini@redhat.com>, <armbru@redhat.com>
Subject: A bug of Monitor Chardev ?
Message-ID: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
Date: Mon, 17 May 2021 14:56:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500016.china.huawei.com (7.185.36.70)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=longpeng2@huawei.com;
 helo=szxga06-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: chenjiashang@huawei.com, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We find a race during QEMU starting, which would case the QEMU process coredump.

<main loop>                             |    <MON iothread>
                                        |
[1] create MON chardev                  |
qemu_create_early_backends              |
  chardev_init_func                     |
                                        |
[2] create MON iothread                 |
qemu_create_late_backends               |
  mon_init_func                         |
	aio_bh_schedule-----------------------> monitor_qmp_setup_handlers_bh
[3] enter main loog                     |    tcp_chr_update_read_handler
(* A client come in, e.g. Libvirt *)    |      update_ioc_handlers
tcp_chr_new_client                      |
  update_ioc_handlers                   |
                                        |
    [4] create new hup_source           |
        s->hup_source = *PTR1*          |
          g_source_attach(s->hup_source)|
                                        |        [5] remove_hup_source(*PTR1*)
                                        |            (create new hup_source)
                                        |             s->hup_source = *PTR2*
        [6] g_source_attach_unlocked    |
              *PTR1* is freed by [5]    |
			
Do you have any suggestion to fix this bug ? Thanks!

