Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99DC36F7B1
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:20:42 +0200 (CEST)
Received: from localhost ([::1]:60488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcPKD-0002ly-LL
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcPHY-00014z-9V
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:17:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lcPHV-0006or-M2
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:17:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619774273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kiuyagqVF3N42yWmfMisnftrxhvYwAeWaUd6/0/JqgM=;
 b=Iib3sqlWPEPZnac2rx59iuWnq3/ZkwbzES1SAEJ3E3BjgBVfT+1xY/sgBYEDZpXXXhKBqD
 7ZuQ9mToGuK1i8eo0Bodd1frTZbXB5Fp2wS16ZUE4FMDkKHkS5Qt8QqcwCLPVYNMxnXLUn
 jDaVdTgpCMLei+t8cAuza5Wk9oX91dI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-mR7-GFRlMH6w3R9Hbur-DA-1; Fri, 30 Apr 2021 05:17:45 -0400
X-MC-Unique: mR7-GFRlMH6w3R9Hbur-DA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7046180362D;
 Fri, 30 Apr 2021 09:17:44 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-68.ams2.redhat.com
 [10.36.114.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47DFC421F;
 Fri, 30 Apr 2021 09:17:43 +0000 (UTC)
Subject: Re: [PATCH v2] monitor: hmp_qemu_io: acquire aio contex, fix crash
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210423134233.51495-1-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <0c734b3f-385f-d44e-62c8-4e7de07b5552@redhat.com>
Date: Fri, 30 Apr 2021 11:17:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423134233.51495-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.04.21 15:42, Vladimir Sementsov-Ogievskiy wrote:
> Max reported the following bug:
> 
> $ ./qemu-img create -f raw src.img 1G
> $ ./qemu-img create -f raw dst.img 1G
> 
> $ (echo '
>     {"execute":"qmp_capabilities"}
>     {"execute":"blockdev-mirror",
>      "arguments":{"job-id":"mirror",
>                   "device":"source",
>                   "target":"target",
>                   "sync":"full",
>                   "filter-node-name":"mirror-top"}}
> '; sleep 3; echo'
>     {"execute":"human-monitor-command",
>      "arguments":{"command-line":
>                   "qemu-io mirror-top \"write 0 1G\""}}') \
> | x86_64-softmmu/qemu-system-x86_64 \
>     -qmp stdio \
>     -blockdev file,node-name=source,filename=src.img \
>     -blockdev file,node-name=target,filename=dst.img \
>     -object iothread,id=iothr0 \
>     -device virtio-blk,drive=source,iothread=iothr0
> 
> crashes:
> 
> 0  raise () at /usr/lib/libc.so.6
> 1  abort () at /usr/lib/libc.so.6
> 2  error_exit
>     (err=<optimized out>,
>     msg=msg@entry=0x55fbb1634790 <__func__.27> "qemu_mutex_unlock_impl")
>     at ../util/qemu-thread-posix.c:37
> 3  qemu_mutex_unlock_impl
>     (mutex=mutex@entry=0x55fbb25ab6e0,
>     file=file@entry=0x55fbb1636957 "../util/async.c",
>     line=line@entry=650)
>     at ../util/qemu-thread-posix.c:109
> 4  aio_context_release (ctx=ctx@entry=0x55fbb25ab680) at ../util/async.c:650
> 5  bdrv_do_drained_begin
>     (bs=bs@entry=0x55fbb3a87000, recursive=recursive@entry=false,
>     parent=parent@entry=0x0,
>     ignore_bds_parents=ignore_bds_parents@entry=false,
>     poll=poll@entry=true) at ../block/io.c:441
> 6  bdrv_do_drained_begin
>     (poll=true, ignore_bds_parents=false, parent=0x0, recursive=false,
>     bs=0x55fbb3a87000) at ../block/io.c:448
> 7  blk_drain (blk=0x55fbb26c5a00) at ../block/block-backend.c:1718
> 8  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:498
> 9  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:491
> 10 hmp_qemu_io (mon=0x7fffaf3fc7d0, qdict=<optimized out>)
>     at ../block/monitor/block-hmp-cmds.c:628
> 
> man pthread_mutex_unlock
> ...
>      EPERM  The  mutex type is PTHREAD_MUTEX_ERRORCHECK or
>      PTHREAD_MUTEX_RECURSIVE, or the mutex is a robust mutex, and the
>      current thread does not own the mutex.
> 
> So, thread doesn't own the mutex. And we have iothread here.
> 
> Next, note that AIO_WAIT_WHILE() documents that ctx must be acquired
> exactly once by caller. But where is it acquired in the call stack?
> Seems nowhere.
> 
> qemuio_command do acquire aio context.. But we need context acquired
> around blk_unref() as well and actually around blk_insert_bs() too.
> 
> Let's refactor qemuio_command so that it doesn't acquire aio context
> but callers do that instead. This way we can cleanly acquire aio
> context in hmp_qemu_io() around all three calls.
> 
> Reported-by: Max Reitz <mreitz@redhat.com>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 
> v2: rewrite, to cleanly acquire aio-context around all needed things in
>      hmp_qemu_io
> 
>   block/monitor/block-hmp-cmds.c | 31 +++++++++++++++++++++----------
>   qemu-io-cmds.c                 |  8 ++++----
>   qemu-io.c                      | 17 +++++++++++++++--
>   3 files changed, 40 insertions(+), 16 deletions(-)

Thanks, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

(With the change below:)

> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 97611969cb..19149e014d 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -2457,9 +2457,12 @@ static const cmdinfo_t help_cmd = {
>       .oneline    = "help for one or all commands",
>   };
>   
> +/*
> + * Called with aio context of blk acquired. Or with qemu_get_aio_context()
> + * context acquired if no blk is NULL.

-no

> + */
>   int qemuio_command(BlockBackend *blk, const char *cmd)
>   {
> -    AioContext *ctx;
>       char *input;
>       const cmdinfo_t *ct;
>       char **v;


