Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D985EE4A9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 20:55:42 +0200 (CEST)
Received: from localhost ([::1]:50136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odcDd-0003du-59
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 14:55:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1odcC2-0000pF-KM
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 14:54:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1odcBy-0007Am-Md
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 14:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664391234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Il+przMnNEgL9JWxY/fTP8A+BKQsFcCth8kZcq+Cafo=;
 b=F4vGDQn7Q/JIdob1LHgwbR+BPsnZFEBMcRML3TVkfxkvQe798fAsh5TUvlH2ICFTozTnFB
 PF5zgXWP7ITcH0AhSSIQxtdvXpq68Y5yJ4DJfEPN4q+SwWVM/AEtFg1Cef71U9mhLPWZJO
 ZdfFpUrHWzvnfW79cytrZshKX5R0kzg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-613-8pvx5WM-NIKHVBBwv1PVMQ-1; Wed, 28 Sep 2022 14:53:52 -0400
X-MC-Unique: 8pvx5WM-NIKHVBBwv1PVMQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 t1-20020adfba41000000b0022cc6bcd8dbso886833wrg.4
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 11:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Il+przMnNEgL9JWxY/fTP8A+BKQsFcCth8kZcq+Cafo=;
 b=bTHzDvry8kR4+erOuwf7Ib32WAZ7hS2fMym4OZBVf1tI63uDBGY7rN13A3o+CDLUST
 4+YAP5tiElHKUV127r+OZ6JUdlSQeQYjD0wlsuZDsWJ82PNK3/OkhucTj9fRkoFzpH0Z
 W+sZxl/Qa878uv4wWv3p3l/ODLKiemjl8n+IOk1oF1fxTWOqiOVc0SpRF/LY0siKnmAH
 oyUhAfR6XclUipoYjcjU2Mz/Z50LUpYRVeI3ez51CG8KJbigWnHNT9MmydRCQ/v5YUOm
 ZiLwa4kCgzDVf8lLM6yrsBSGZ9SOqoXnidJ63uv7+6Wr3YvMwa68JdDkkdvz/+D9Dddm
 p0Pg==
X-Gm-Message-State: ACrzQf2CBu2iY4dJuuAY+o5YV0HUCTJEOVZ8aZniceA511CxMPlKUqJt
 Vds+0t7TgjUQ7PbWqvv4TAlM1SwHycUBIxCPzYZ0LENqDkgjsHybzx2KSTbeGSVTVLT5kXBN3IJ
 nELJKn0mXRk0HMpI=
X-Received: by 2002:a05:6000:2cd:b0:22a:4831:dfd with SMTP id
 o13-20020a05600002cd00b0022a48310dfdmr21401226wry.706.1664391231061; 
 Wed, 28 Sep 2022 11:53:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Ww/xx2kVxkuk0Rv7QAWuPCq9bmuGY5LhwlAQs5VqEAPq+1avRNdwM742g7/0t9hcLp9hWEA==
X-Received: by 2002:a05:6000:2cd:b0:22a:4831:dfd with SMTP id
 o13-20020a05600002cd00b0022a48310dfdmr21401207wry.706.1664391230823; 
 Wed, 28 Sep 2022 11:53:50 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 e6-20020a05600c4b8600b003b482fbd93bsm2283116wmp.24.2022.09.28.11.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 11:53:50 -0700 (PDT)
Date: Wed, 28 Sep 2022 19:53:48 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, jsnow@redhat.com,
 vsementsov@yandex-team.ru, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, quintela@redhat.com,
 Thomas Lamprecht <t.lamprecht@proxmox.com>,
 Fabian =?iso-8859-1?Q?Gr=FCnbichler?= <f.gruenbichler@proxmox.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>
Subject: Re: Question regarding live-migration with drive-mirror
Message-ID: <YzSYPDR0L98Nks4P@work-vm>
References: <1db7f571-cb7f-c293-04cc-cd856e060c3f@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1db7f571-cb7f-c293-04cc-cd856e060c3f@proxmox.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Fiona Ebner (f.ebner@proxmox.com) wrote:
> Hi,
> recently one of our users provided a backtrace[0] for the following
> assertion failure during a live migration that uses drive-mirror to sync
> a local disk:
> > bdrv_co_write_req_prepare: Assertion `!(bs->open_flags & BDRV_O_INACTIVE)' failed
> 
> The way we do migration with a local disk is essentially:
> 1. start target instance with a suitable NBD export
> 2. start drive-mirror on the source side and wait for it to become ready
> once
> 3. issue 'migrate' QMP command
> 4. cancel drive-mirror blockjob after the migration has finished
> 
> I reproduced the issue with the following fio script running in the
> guest (to dirty lots of clusters):
> > fio --name=make-mirror-work --size=100M --direct=1 --rw=randwrite \
> >     --bs=4k --ioengine=psync --numjobs=5 --runtime=60 --time_based
> 
> AFAIU, the issue is that nothing guarantees that the drive mirror is
> ready when the migration inactivates the block drives.

I don't know the block code well enough; I don't think I'd realised
that a drive-mirror could become unready.

> Is using copy-mode=write-blocking for drive-mirror to only way to avoid
> this issue? There, the downside is that the network (used by the mirror)
> would become a bottleneck for IO in the guest, while the behavior would
> really only be needed during the final phase.

It sounds like you need a way to switch to the blocking mode.

> I guess the assert should be avoided in any case. Here's a few ideas
> that came to mind:
> 1. migration should fail gracefully
> 2. migration should wait for the mirror-jobs to become ready before
> inactivating the block drives - that would increase the downtime in
> these situations of course
> 2A. additionally, drive-mirror could be taken into account when
> converging the migration somehow?

Does the migration capaibility 'pause-before-switchover' help you here?
If enabled, it causes the VM to pause just before the
bdrv_inactivate_all (and then use migrate-continue to tell it to carry
on)

Dave

> I noticed the following comment in the mirror implementation
> >         /* Note that even when no rate limit is applied we need to yield
> >          * periodically with no pending I/O so that bdrv_drain_all() returns.
> >          * We do so every BLKOCK_JOB_SLICE_TIME nanoseconds, or when there is
> >          * an error, or when the source is clean, whichever comes first. */
> 
> 3. change draining behavior after the job was ready once, so that
> bdrv_drain_all() will only return when the job is ready again? Hope I'm
> not completely misunderstanding this.
> 
> Best Regards,
> Fiona
> 
> [0]:
> > Thread 1 (Thread 0x7f3389d4a000 (LWP 2297576) "kvm"):
> > #0  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> > #1  0x00007f339488d537 in __GI_abort () at abort.c:79
> > #2  0x00007f339488d40f in __assert_fail_base (fmt=0x7f3394a056a8 "%s%s%s:%u: %s%sAssertion `%s' failed.\n%n", assertion=0x5595f85bfd70 "!(bs->open_flags & BDRV_O_INACTIVE)", file=0x5595f85cb576 "../block/io.c", line=2026, function=<optimized out>) at assert.c:92
> > #3  0x00007f339489c662 in __GI___assert_fail (assertion=assertion@entry=0x5595f85bfd70 "!(bs->open_flags & BDRV_O_INACTIVE)", file=file@entry=0x5595f85cb576 "../block/io.c", line=line@entry=2026, function=function@entry=0x5595f85cc510 <__PRETTY_FUNCTION__.8> "bdrv_co_write_req_prepare") at assert.c:101
> > #4  0x00005595f83218f2 in bdrv_co_write_req_prepare (child=0x5595f91cab90, offset=60867018752, bytes=196608, req=0x7f324a2e9d70, flags=0) at ../block/io.c:2026
> > #5  0x00005595f8323384 in bdrv_aligned_pwritev (child=child@entry=0x5595f91cab90, req=req@entry=0x7f324a2e9d70, offset=60867018752, bytes=196608, align=align@entry=1, qiov=0x5595f9030d58, qiov_offset=0, flags=0) at ../block/io.c:2140
> > #6  0x00005595f832485a in bdrv_co_pwritev_part (child=0x5595f91cab90, offset=<optimized out>, offset@entry=60867018752, bytes=<optimized out>, bytes@entry=196608, qiov=<optimized out>, qiov@entry=0x5595f9030d58, qiov_offset=<optimized out>, qiov_offset@entry=0, flags=flags@entry=0) at ../block/io.c:2353
> > #7  0x00005595f8315a09 in blk_co_do_pwritev_part (blk=blk@entry=0x5595f91db8c0, offset=60867018752, bytes=196608, qiov=qiov@entry=0x5595f9030d58, qiov_offset=qiov_offset@entry=0, flags=flags@entry=0) at ../block/block-backend.c:1365
> > #8  0x00005595f8315bdd in blk_co_pwritev_part (flags=0, qiov_offset=0, qiov=qiov@entry=0x5595f9030d58, bytes=<optimized out>, offset=<optimized out>, blk=0x5595f91db8c0) at ../block/block-backend.c:1380
> > #9  blk_co_pwritev (blk=0x5595f91db8c0, offset=<optimized out>, bytes=<optimized out>, qiov=qiov@entry=0x5595f9030d58, flags=flags@entry=0) at ../block/block-backend.c:1391
> > #10 0x00005595f8328a59 in mirror_read_complete (ret=0, op=0x5595f9030d50) at ../block/mirror.c:260
> > #11 mirror_co_read (opaque=0x5595f9030d50) at ../block/mirror.c:400
> > #12 0x00005595f843a39b in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at ../util/coroutine-ucontext.c:177
> > #13 0x00007f33948b8d40 in ?? () from /lib/x86_64-linux-gnu/libc.so.6
> > #14 0x00007f324a3ea6e0 in ?? ()
> > #15 0x0000000000000000 in ?? ()
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


