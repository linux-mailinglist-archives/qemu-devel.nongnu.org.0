Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B0F356B04
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 13:21:29 +0200 (CEST)
Received: from localhost ([::1]:40732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU6FS-0001bQ-SS
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 07:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lU6E8-000174-UK
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 07:20:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lU6E5-0003Rx-Rz
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 07:20:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617794399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ait92hAQ0Tgso11n3AQOoiWiGblPlXCdXb7qb18nuY=;
 b=Pd7nW3XP5bmkGrYayLCenr5bJJChiF88Qi7/94mKSbHBaYJL+reLP7khO0wZaw4Zv1e5sI
 ms2rYW+4JtPAR0LPFQG3+9lJGDGSHO6VWzVZ0C7oZs32xCWphVFeW9A73+a4ylxsORg5YW
 RNjEvFEzmWYY/j3voxyKaVuHip8aX3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-p1LC3bSwMUaUZJKD6sbxxQ-1; Wed, 07 Apr 2021 07:19:57 -0400
X-MC-Unique: p1LC3bSwMUaUZJKD6sbxxQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B309F107ACCD;
 Wed,  7 Apr 2021 11:19:55 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-253.ams2.redhat.com
 [10.36.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C89AB100239A;
 Wed,  7 Apr 2021 11:19:53 +0000 (UTC)
Subject: Re: [PATCH v4 09/23] job: call job_enter from job_pause
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
 <20210116214705.822267-10-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <7dea84af-188f-1145-0e4f-afefd9652256@redhat.com>
Date: Wed, 7 Apr 2021 13:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210116214705.822267-10-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.01.21 22:46, Vladimir Sementsov-Ogievskiy wrote:
> If main job coroutine called job_yield (while some background process
> is in progress), we should give it a chance to call job_pause_point().
> It will be used in backup, when moved on async block-copy.
> 
> Note, that job_user_pause is not enough: we want to handle
> child_job_drained_begin() as well, which call job_pause().
> 
> Still, if job is already in job_do_yield() in job_pause_point() we
> should not enter it.
> 
> iotest 109 output is modified: on stop we do bdrv_drain_all() which now
> triggers job pause immediately (and pause after ready is standby).
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   job.c                      |  3 +++
>   tests/qemu-iotests/109.out | 24 ++++++++++++++++++++++++
>   2 files changed, 27 insertions(+)

While looking into

https://lists.gnu.org/archive/html/qemu-block/2021-04/msg00035.html

I noticed this:

$ ./qemu-img create -f raw src.img 1G
$ ./qemu-img create -f raw dst.img 1G

$ (echo '
     {"execute":"qmp_capabilities"}
     {"execute":"blockdev-mirror",
      "arguments":{"job-id":"mirror",
                   "device":"source",
                   "target":"target",
                   "sync":"full",
                   "filter-node-name":"mirror-top"}}
'; sleep 3; echo '
     {"execute":"human-monitor-command",
      "arguments":{"command-line":
                   "qemu-io mirror-top \"write 0 1G\""}}') \
| x86_64-softmmu/qemu-system-x86_64 \
     -qmp stdio \
     -blockdev file,node-name=source,filename=src.img \
     -blockdev file,node-name=target,filename=dst.img \
     -object iothread,id=iothr0 \
     -device virtio-blk,drive=source,iothread=iothr0

Before this commit, qemu-io returned an error that there is a permission 
conflict with virtio-blk.  After this commit, there is an abort (“qemu: 
qemu_mutex_unlock_impl: Operation not permitted”):

#0  0x00007f8445a4eef5 in raise () at /usr/lib/libc.so.6
#1  0x00007f8445a38862 in abort () at /usr/lib/libc.so.6
#2  0x000055fbb14a36bf in error_exit
     (err=<optimized out>, msg=msg@entry=0x55fbb1634790 <__func__.27> 
"qemu_mutex_unlock_impl")
     at ../util/qemu-thread-posix.c:37
#3  0x000055fbb14a3bc3 in qemu_mutex_unlock_impl
     (mutex=mutex@entry=0x55fbb25ab6e0, file=file@entry=0x55fbb1636957 
"../util/async.c", line=line@entry=650)
     at ../util/qemu-thread-posix.c:109
#4  0x000055fbb14b2e75 in aio_context_release 
(ctx=ctx@entry=0x55fbb25ab680) at ../util/async.c:650
#5  0x000055fbb13d2029 in bdrv_do_drained_begin
     (bs=bs@entry=0x55fbb3a87000, recursive=recursive@entry=false, 
parent=parent@entry=0x0, 
ignore_bds_parents=ignore_bds_parents@entry=false, poll=poll@entry=true) 
at ../block/io.c:441
#6  0x000055fbb13d2192 in bdrv_do_drained_begin
     (poll=true, ignore_bds_parents=false, parent=0x0, recursive=false, 
bs=0x55fbb3a87000) at ../block/io.c:448
#7  0x000055fbb13c71a7 in blk_drain (blk=0x55fbb26c5a00) at 
../block/block-backend.c:1718
#8  0x000055fbb13c8bbd in blk_unref (blk=0x55fbb26c5a00) at 
../block/block-backend.c:498
#9  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:491
#10 0x000055fbb1024863 in hmp_qemu_io (mon=0x7fffaf3fc7d0, 
qdict=<optimized out>)
     at ../block/monitor/block-hmp-cmds.c:628

Can you make anything out of this?

Max


