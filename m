Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55724582960
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 17:13:47 +0200 (CEST)
Received: from localhost ([::1]:38794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGijK-0005py-Di
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 11:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oGifj-0003Q2-R6
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:10:04 -0400
Received: from smtp84.cstnet.cn ([159.226.251.84]:47430 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oGiff-0002KU-Ge
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:10:03 -0400
Received: from smtpclient.apple (unknown [221.220.143.85])
 by APP-05 (Coremail) with SMTP id zQCowADnlew7VeFiIqZQEw--.62699S2;
 Wed, 27 Jul 2022 23:09:49 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
In-Reply-To: <YuD1k54rwj1whnE6@apples>
Date: Wed, 27 Jul 2022 23:09:40 +0800
Cc: qemu-devel <qemu-devel@nongnu.org>, kbusch@kernel.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B2CD2E1C-BBEE-42D2-9A94-3D3657012E99@ict.ac.cn>
References: <D12147BE-7F7A-4F41-9317-765F7EB2E971@ict.ac.cn>
 <Yt+avxgBxcwrxYgi@apples> <869047CA-DD0A-45D1-9DBA-2BA1A3E00ADF@ict.ac.cn>
 <Yt+xpMzwRWvn3QqR@apples> <Yt+9Spzi17LRRexQ@apples> <Yt/O8+n1pf3SRR7e@apples>
 <Yt/Qs5PelXjX8E1v@apples> <Yt/ZKVHjSTTt08MV@apples> <YuDkBkrqXaosJbRM@apples>
 <42878984-948E-4D65-8CA0-293564640F35@ict.ac.cn> <YuD1k54rwj1whnE6@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CM-TRANSID: zQCowADnlew7VeFiIqZQEw--.62699S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1ktFy7ZF1rWryxJF1rXrb_yoWkGrbE9w
 48Jr93Kws7ZrsIkrZIkw47XrW2grW8Gw1DKw4UWry3JF4rtFsruF40gFnYyrWUZ3y5J345
 KrnxXr1aqw1UZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb28YjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
 6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
 8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
 cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_XrWl42xK82IY
 c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
 vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07brJPiUUUUU=
X-Originating-IP: [221.220.143.85]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.84;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After digging through the source code, I found event_notifier_cleanup() =
only
closes the eventfd, but does not de-register the event from QEMU=E2=80=99s=
 event
loop. event_notifier_set_handler() actually interacts with the event =
loop.
It is a wrapper around aio_set_event_notifier(), which is again a =
wrapper of
aio_set_fd_handler(). Passing in a handler of NULL means removing the fd
handler from the event loop.

Therefore, originally in nvme_free_sq/cq(), we closed the eventfd but =
did
not delete its handler. I guess maybe sometime later the fd is reused =
and
that corresponding file is somehow written (A POLLIN event), this will
trigger the event loop to call the stale handler, which causes this bug.

So the correct order is:

Init:
1. event_notifier_init: Open the eventfd
2. event_notifier_set_handler: Register on the event loop
3. memory_region_add_eventfd: Associate with IO region

Cleanup:
1. memory_region_del_eventfd: De-associate with IO region
2. event_notifier_set_handler(NULL): Remove from the event loop
3. event_notifier_cleanup: Close the eventfd


