Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63543645AD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:10:07 +0200 (CEST)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYUbG-0002Ez-1E
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjie88@huawei.com>)
 id 1lYUaC-0001og-Tf
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:09:00 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangjie88@huawei.com>)
 id 1lYUa8-000407-1s
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:09:00 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FP7rM06jkzPp24;
 Mon, 19 Apr 2021 22:05:39 +0800 (CST)
Received: from [10.174.148.103] (10.174.148.103) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Mon, 19 Apr 2021 22:08:32 +0800
To: <pbonzini@redhat.com>
From: "wangjie (P)" <wangjie88@huawei.com>
Subject: [Question] a qemu core occurs when the storage is disconnected.
Message-ID: <6fb46c78-1a48-12da-ce9a-eb0836076c44@huawei.com>
Date: Mon, 19 Apr 2021 22:08:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.103]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=wangjie88@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: weidong.huang@huawei.com, qemu-devel@nongnu.org, wangjie88@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

Recently, I did some convergence tests of VM lifecycles and storage anomalies. Here is a question about the qemu core.
The VM configure disk of IP SAN storage device.

Call trace：
#0  0x00007fbe9151877b in raise () from /usr/lib64/libc.so.6
#1  0x00007fbe91519aa1 in abort () from /usr/lib64/libc.so.6
#2  0x00007fbe9151103a in ?? () from /usr/lib64/libc.so.6
#3  0x00007fbe915110b2 in __assert_fail () from /usr/lib64/libc.so.6
#4  0x00007fbe9029baf8 in scsi_parse_sense_buf (in_buf=in_buf@entry=0x7fbe18002870 "p", in_len=<optimized out>) at /usr/src/debug/qemu-4.1.0-102.x86_64/scsi/utils.c:100
#5  0x00007fbe902a3980 in scsi_read_complete (opaque=0x7fbe18002800, ret=<optimized out>) at /usr/src/debug/qemu-4.1.0-102.x86_64/hw/scsi/scsi-generic.c:260
#6  0x00007fbe903227c7 in blk_aio_complete (acb=0x7fbe18003350) at /usr/src/debug/qemu-4.1.0-102.x86_64/block/block-backend.c:1319
#7  0x00007fbe912a79b4 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at /usr/src/debug/qemu-4.1.0-102.x86_64/util/coroutine-ucontext.c:115
#8  0x00007fbe9152ce80 in ?? () from /usr/lib64/libc.so.6
#9  0x00007fbe29ffa4a0 in ?? ()
#10 0x0000000000000000 in ?? ()
Backtrace stopped: Cannot access memory at address 0x7fbdf1e00000

The scsi cmd requested in the core is inqury, the cmd is to call " handle_aiocb_ioctl(void *opaque) ".
When the network is abnormal, the senses may not be obtained. This will cause " r->io_header.sb_len_wr " is 0, qemu core occurs.

We can fix this bug by deleting " assert(in_len > 0); ".
Any better suggestion?

Thanks


