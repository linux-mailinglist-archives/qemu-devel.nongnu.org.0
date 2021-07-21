Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756393D0B8D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:44:55 +0200 (CEST)
Received: from localhost ([::1]:34554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68mc-0007GM-HT
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m68kD-00057K-Qb
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:42:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m68kB-0003Ax-RV
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626860542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bDPnudXXvICIiALeUlBCGlsUfGr6WfSmt+GRgEdkoPM=;
 b=BLLE9fvdDkv6GzGUFECh9Qm4kG7nQ+MloDhOPJYBs5mcnkl0yRrAmONwIWoaRCkVVtBUb8
 EoGwhD+8a6L7CNHX2Z4MqIfB/ZO/OyGT8Drl4RbrFLPue6y1Sh5F+HqNzIh9jLNiaYolYg
 P4Il2Acfj/iJnnmmYzBDK/xpa9aa1+o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-2WXCHoeHOZiKSPWNz3UGlQ-1; Wed, 21 Jul 2021 05:42:20 -0400
X-MC-Unique: 2WXCHoeHOZiKSPWNz3UGlQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18E57100B3A4;
 Wed, 21 Jul 2021 09:42:19 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-80.ams2.redhat.com
 [10.36.113.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CBBC61093;
 Wed, 21 Jul 2021 09:42:12 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 0/3] linux-aio: limit the batch size to reduce
 queue latency
Date: Wed, 21 Jul 2021 11:42:08 +0200
Message-Id: <20210721094211.69853-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since it's a performance regression, if possible we could include it in 6.1-rc1.
There shouldn't be any particular criticism.

v1: https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg01526.html
v2:
  - s/bacth/batch/ [stefanha]
  - limit the batch with the number of available events [stefanha]
  - rebased on master
  - re-run benchmarks

Commit 2558cb8dd4 ("linux-aio: increasing MAX_EVENTS to a larger hardcoded
value") changed MAX_EVENTS from 128 to 1024, to increase the number of
in-flight requests. But this change also increased the potential maximum batch
to 1024 elements.

The problem is noticeable when we have a lot of requests in flight and multiple
queues attached to the same AIO context.
In this case we potentially create very large batches. Instead, when we have
a single queue, the batch is limited because when the queue is unplugged,
there is a call to io_submit(2).
In practice, io_submit(2) was called only when there are no more queues plugged
in or when we fill the AIO queue (MAX_EVENTS = 1024).

This series limit the batch size (number of request submitted to the kernel
through a single io_submit(2) call) in the Linux AIO backend, and add a new
`aio-max-batch` parameter to IOThread to allow tuning it.
If `aio-max-batch` is equal to 0 (default value), the AIO engine will use its
default maximum batch size value.

I run some benchmarks to choose 32 as default batch value for Linux AIO.
Below the kIOPS measured with fio running in the guest (average over 3 runs):

                   |   master  |           with this series applied            |
                   |143c2e04328| maxbatch=8|maxbatch=16|maxbatch=32|maxbatch=64|
          # queues | 1q  | 4qs | 1q  | 4qs | 1q  | 4qs | 1q  | 4qs | 1q  | 4qs |
-- randread tests -|-----------------------------------------------------------|
bs=4k iodepth=1    | 200 | 195 | 181 | 208 | 200 | 203 | 206 | 212 | 200 | 204 |
bs=4k iodepth=8    | 269 | 231 | 256 | 244 | 255 | 260 | 266 | 268 | 270 | 250 |
bs=4k iodepth=64   | 230 | 198 | 262 | 265 | 261 | 253 | 260 | 273 | 253 | 263 |
bs=4k iodepth=128  | 217 | 181 | 261 | 253 | 249 | 276 | 250 | 278 | 255 | 278 |
bs=16k iodepth=1   | 130 | 130 | 130 | 130 | 130 | 130 | 137 | 130 | 130 | 130 |
bs=16k iodepth=8   | 130 | 131 | 130 | 131 | 130 | 130 | 137 | 131 | 131 | 130 |
bs=16k iodepth=64  | 130 | 102 | 131 | 128 | 131 | 128 | 137 | 140 | 130 | 128 |
bs=16k iodepth=128 | 131 | 100 | 130 | 128 | 131 | 129 | 137 | 141 | 130 | 129 |

1q  = virtio-blk device with a single queue
4qs = virito-blk device with multi queues (one queue per vCPU - 4)

I reported only the most significant tests, but I also did other tests to
make sure there were no regressions, here the full report:
https://docs.google.com/spreadsheets/d/11X3_5FJu7pnMTlf4ZatRDvsnU9K3EPj6Mn3aJIsE4tI

Test environment:
- Disk: Intel Corporation NVMe Datacenter SSD [Optane]
- CPU: Intel(R) Xeon(R) Silver 4214 CPU @ 2.20GHz
- QEMU: qemu-system-x86_64 -machine q35,accel=kvm -smp 4 -m 4096 \
          ... \
          -object iothread,id=iothread0,aio-max-batch=${MAX_BATCH} \
          -device virtio-blk-pci,iothread=iothread0,num-queues=${NUM_QUEUES}

- benchmark: fio --ioengine=libaio --thread --group_reporting \
                 --number_ios=200000 --direct=1 --filename=/dev/vdb \
                 --rw=${TEST} --bs=${BS} --iodepth=${IODEPTH} --numjobs=16

Next steps:
 - benchmark io_uring and use `aio-max-batch` also there
 - make MAX_EVENTS parametric adding a new `aio-max-events` parameter

Thanks,
Stefano

Stefano Garzarella (3):
  iothread: generalize iothread_set_param/iothread_get_param
  iothread: add aio-max-batch parameter
  linux-aio: limit the batch size using `aio-max-batch` parameter

 qapi/misc.json            |  6 ++-
 qapi/qom.json             |  7 +++-
 include/block/aio.h       | 12 ++++++
 include/sysemu/iothread.h |  3 ++
 block/linux-aio.c         |  9 ++++-
 iothread.c                | 82 ++++++++++++++++++++++++++++++++++-----
 monitor/hmp-cmds.c        |  2 +
 util/aio-posix.c          | 12 ++++++
 util/aio-win32.c          |  5 +++
 util/async.c              |  2 +
 qemu-options.hx           |  8 +++-
 11 files changed, 134 insertions(+), 14 deletions(-)

-- 
2.31.1


