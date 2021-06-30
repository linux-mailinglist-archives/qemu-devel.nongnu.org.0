Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585D3B7F62
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 10:50:53 +0200 (CEST)
Received: from localhost ([::1]:39552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyVvl-0000Qm-EC
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 04:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qkrwngud825@gmail.com>)
 id 1lyVsX-0005z5-KY
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 04:47:31 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:40888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qkrwngud825@gmail.com>)
 id 1lyVsP-0000Jz-IZ
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 04:47:28 -0400
Received: by mail-ej1-x62e.google.com with SMTP id o5so2922313ejy.7
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 01:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=GqpO+K3m6JQW3IWFjAEC6Rw1Dw45MStJqLAuboNmGY8=;
 b=q9Ntn7EXoxPUmRd6faFIK9hQ1F0BbEKS1h/a+nlOu+pzQB5Ed1Q9N/R2R5HP6pSfdZ
 L+KYPObu5iyycWNW+HUh44yHxnXQVa36jOkpMN5mJCwUqd3jX/okBhZnS2MtQPTWPE+/
 rzllKFgHpp9jNcmqr4+KOM6l8bPs72iSZq0aS5ZHppG81U7F1QuSWH+LaCF78Pcfp68I
 PyHsRNngw+lLq8IgC/lAAq/AXqGI6O1+7LLkgp2LXL5s58xwcf6Yd5bK4RHzP/Xese5O
 lNEgBrqdWTb0S+GU88uuB9lL2DqVmqbCrJWOMj+RNhOScwk03DmZXAOomEsGhT56je3p
 5YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=GqpO+K3m6JQW3IWFjAEC6Rw1Dw45MStJqLAuboNmGY8=;
 b=tG1wx1xuX8pdjGW+qajJBaTivLv/Em3oxqNd1FUHRB14JnDhx760YaW/BVpgaMTQSK
 +k4dXRe+tbg9jSDB73lTF1zenCvrcLxsW7DWhEPSsUac+5cWIQucl78f8rXMWOdzXi5c
 07Zme787nZtzceIsHbGC1MgEynnKfJH2HjgNWjR0MKFE0zJFi20dI3emtB8fpQ1nKydg
 QMyMuEdZSBKHF4GRZqk1OcJp2KHA/FwR+IoctQ1gq+obYvZaiWzfISm9I6ySPUrUOEgh
 UGJeRb/KcJ5ckuuLkGcuRaGEgHM/z411OqXwXCQazZKYiM8xJMKpq8yWYiUysymAQJDY
 zGrQ==
X-Gm-Message-State: AOAM5338FZvcMcitkb3K8OQPNM59/iZfdbOoKRTK/DYpXAriyQ75fxuZ
 /b9I8zpYfW/7CNot6INg+xFwng+wSA4oA7N76+8=
X-Google-Smtp-Source: ABdhPJySG0/J7u1X8vOwGGnPWfJLdjG/E3OjLUnKyAP12upVjnJAd4sUN/o1cgzsqOwhG7ao0ZPsZvxQ+I0EC5WSgL4=
X-Received: by 2002:a17:906:3407:: with SMTP id
 c7mr9973560ejb.212.1625042837149; 
 Wed, 30 Jun 2021 01:47:17 -0700 (PDT)
MIME-Version: 1.0
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Wed, 30 Jun 2021 17:47:06 +0900
Message-ID: <CAD14+f2Nmu_XNjE8SM+jzfaNZfzyFowN3Cf8Lgw36FT+gqqPAg@mail.gmail.com>
Subject: Possible io_uring regression with QEMU on Ubuntu's kernel
To: Kamal Mostafa <kamal@canonical.com>,
 Stefan Bader <stefan.bader@canonical.com>, 
 io-uring <io-uring@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=qkrwngud825@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Jens Axboe <axboe@kernel.dk>, qemu-devel@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi everyone.

With the latest Ubuntu 20.04's HWE kernel 5.8.0-59, I'm noticing some
weirdness when using QEMU/libvirt with the following storage
configuration:

<disk type="block" device="disk">
  <driver name="qemu" type="raw" cache="none" io="io_uring"
discard="unmap" detect_zeroes="unmap"/>
  <source dev="/dev/disk/by-id/md-uuid-df271a1e:9dfb7edb:8dc4fbb8:c43e652f-part1"
index="1"/>
  <backingStore/>
  <target dev="vda" bus="virtio"/>
  <alias name="virtio-disk0"/>
  <address type="pci" domain="0x0000" bus="0x07" slot="0x00" function="0x0"/>
</disk>

QEMU version is 5.2+dfsg-9ubuntu3 and libvirt version is 7.0.0-2ubuntu2.

The guest VM is unable to handle I/O properly with io_uring, and
nuking io="io_uring" fixes the issue.
On one machine (EPYC 7742), the partition table cannot be read and on
another (Ryzen 9 3950X), ext4 detects weirdness with journaling and
ultimately remounts the guest disk to R/O:

[    2.712321] virtio_blk virtio5: [vda] 3906519775 512-byte logical
blocks (2.00 TB/1.82 TiB)
[    2.714054] vda: detected capacity change from 0 to 2000138124800
[    2.963671] blk_update_request: I/O error, dev vda, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    2.964909] Buffer I/O error on dev vda, logical block 0, async page read
[    2.966021] blk_update_request: I/O error, dev vda, sector 1 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    2.967177] Buffer I/O error on dev vda, logical block 1, async page read
[    2.968330] blk_update_request: I/O error, dev vda, sector 2 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    2.969504] Buffer I/O error on dev vda, logical block 2, async page read
[    2.970767] blk_update_request: I/O error, dev vda, sector 3 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    2.971624] Buffer I/O error on dev vda, logical block 3, async page read
[    2.972170] blk_update_request: I/O error, dev vda, sector 4 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    2.972728] Buffer I/O error on dev vda, logical block 4, async page read
[    2.973308] blk_update_request: I/O error, dev vda, sector 5 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    2.973920] Buffer I/O error on dev vda, logical block 5, async page read
[    2.974496] blk_update_request: I/O error, dev vda, sector 6 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    2.975093] Buffer I/O error on dev vda, logical block 6, async page read
[    2.975685] blk_update_request: I/O error, dev vda, sector 7 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    2.976295] Buffer I/O error on dev vda, logical block 7, async page read
[    2.980074] blk_update_request: I/O error, dev vda, sector 0 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    2.981104] Buffer I/O error on dev vda, logical block 0, async page read
[    2.981786] blk_update_request: I/O error, dev vda, sector 1 op
0x0:(READ) flags 0x0 phys_seg 1 prio class 0
[    2.982083] ixgbe 0000:06:00.0: Multiqueue Enabled: Rx Queue count
= 63, Tx Queue count = 63 XDP Queue count = 0
[    2.982442] Buffer I/O error on dev vda, logical block 1, async page read
[    2.983642] ldm_validate_partition_table(): Disk read failed.

Kernel 5.8.0-55 is fine, and the only io_uring-related change between
5.8.0-55 and 5.8.0-59 is the commit 4b982bd0f383 ("io_uring: don't
mark S_ISBLK async work as unbounded").

The weird thing is that this commit was first introduced with v5.12,
but neither the mainline v5.12.0 or v5.13.0 is affected by this issue.

I guess one of these commits following the backported commit from
v5.12 fixes the issue, but that's just a guess. It might be another
earlier commit:
c7d95613c7d6 io_uring: fix early sqd_list removal sqpoll hangs
9728463737db io_uring: fix rw req completion
6ad7f2332e84 io_uring: clear F_REISSUE right after getting it
e82ad4853948 io_uring: fix !CONFIG_BLOCK compilation failure
230d50d448ac io_uring: move reissue into regular IO path
07204f21577a io_uring: fix EIOCBQUEUED iter revert
696ee88a7c50 io_uring/io-wq: protect against sprintf overflow

It would be much appreciated if Jens could give pointers to Canonical
developers on how to fix the issue, and hopefully a suggestion to
prevent this from happening again.

Thanks,
Regards

