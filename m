Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B1449FBA7
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 15:29:14 +0100 (CET)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDSFV-0005Tx-Os
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 09:29:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDRLR-0005gq-H1
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 08:31:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDRLO-0002vn-Gn
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 08:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643376670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAWIagF3Lmvs1wlWUeQlrVet324wVnPppLNTa7irkaE=;
 b=YbHrjMJ+WYM9NgRLeRqXRQGt5fWtStFr11udEEpOvbWfv5VG8evDTCZ3z2tKj/YGnVLyPx
 CfH4CepvGTgWtUG3m+aaHnZ4/utjIc3O+mD0Qh7w8+GfwtEdAQKK1pUta9/r67933lk5we
 siBZuMh/vNXSOUn6ExKQ901iXDxRmxw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-YrrOcu6NMr-nEUp5nDt1MA-1; Fri, 28 Jan 2022 08:31:01 -0500
X-MC-Unique: YrrOcu6NMr-nEUp5nDt1MA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A59418C89C4;
 Fri, 28 Jan 2022 13:31:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A944B84630;
 Fri, 28 Jan 2022 13:30:54 +0000 (UTC)
Date: Fri, 28 Jan 2022 13:30:53 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: Block alignment of qcow2 compress driver
Message-ID: <20220128133053.GT1127@redhat.com>
References: <20220128110732.GA19514@redhat.com>
 <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
 <20220128114815.GQ1127@redhat.com>
 <26486e0e-adb5-aa3b-e70d-82ab21a0d2be@redhat.com>
 <20220128121803.GS1127@redhat.com>
 <54f3a548-ebea-9ed5-6387-5dda2bf92c4e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <54f3a548-ebea-9ed5-6387-5dda2bf92c4e@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, andrey.shinkevich@virtuozzo.com, eblake@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On Fri, Jan 28, 2022 at 01:30:43PM +0100, Hanna Reitz wrote:
> On 28.01.22 13:18, Richard W.M. Jones wrote:
> >On Fri, Jan 28, 2022 at 12:57:47PM +0100, Hanna Reitz wrote:
> >>On 28.01.22 12:48, Richard W.M. Jones wrote:
> >>>On Fri, Jan 28, 2022 at 12:39:11PM +0100, Hanna Reitz wrote:
> >>>>So I actually don’t know why it works for you.  OTOH, I don’t
> >>>>understand why the block size affects you over NBD, because I would
> >>>>have expected qemu to internally auto-align requests when they are
> >>>>not aligned (in bdrv_co_pwritev_part()).
> >>>I checked it again and my hack definitely fixes nbdcopy.  But maybe
> >>>that's expected if qemu-nbd is auto-aligning requests?  (I'm only
> >>>accessing the block layer through qemu-nbd, not with qemu-io)
> >>It’s not just qemu-io, with your diff[3] I get the same EINVAL over
> >>NBD, too:
> >>
> >>$ ./qemu-img create -f qcow2 test.qcow2 64M
> >>Formatting 'test.qcow2', fmt=qcow2 cluster_size=65536
> >>extended_l2=off compression_type=zlib size=67108864
> >>lazy_refcounts=off refcount_bits=16
> >>
> >>$ ./qemu-nbd --fork --image-opts \
> >>driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=test.qcow2
> >>
> >>$ ./qemu-io -c 'write 0 32k' -f raw nbd://localhost
> >>write failed: Invalid argument
> >Strange - is that error being generated by qemu's nbd client code?
> 
> It’s generated by qcow2, namely the exact place I pointed out (as
> [1]).  I can see that when I put an fprintf there.

I can't reproduce this behaviour (with qemu @ cfe63e46be0a, the head
of git at time of writing).  I wonder if I'm doing something wrong?

  ++ /home/rjones/d/qemu/build/qemu-img create -f qcow2 output.qcow2 64k
  Formatting 'output.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=65536 lazy_refcounts=off refcount_bits=16
  ++ sleep 1
  ++ /home/rjones/d/qemu/build/qemu-nbd -t --image-opts driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=output.qcow2
  ++ /home/rjones/d/qemu/build/qemu-io -c 'write 0 32k' -f raw nbd://localhost
  wrote 32768/32768 bytes at offset 0
  32 KiB, 1 ops; 00.02 sec (1.547 MiB/sec and 49.5067 ops/sec)

> >I know I said I didn't care about performance (in this case), but is
> >there in fact a penalty to sending unaligned requests to the qcow2
> >layer?  Or perhaps it cannot compress them?
> 
> In qcow2, only the whole cluster can be compressed, so writing
> compressed data means having to write the whole cluster.  qcow2
> could implement the padding by itself, but we decided to just leave
> the burden of only writing full clusters (with the COMPRESSED write
> flag) on the callers.

I feel like this may be a bug in what qemu-nbd advertises.  Currently
it is:

$ qemu-nbd -t --image-opts driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=output.qcow2 &
[2] 2068900
$ nbdinfo nbd://localhost
protocol: newstyle-fixed without TLS
export="":
	export-size: 65536 (64K)
	uri: nbd://localhost:10809/
	contexts:
		base:allocation
		is_rotational: false
		is_read_only: false
		can_cache: true
		can_df: true
		can_fast_zero: true
		can_flush: true
		can_fua: true
		can_multi_conn: false
		can_trim: true
		can_zero: true
		block_size_minimum: 65536    <---
		block_size_preferred: 65536
		block_size_maximum: 33554432

block_size_preferred is (rightly) set to 64K, as that's what the
compress + qcow2 combination prefers.

But block_size_minimum sounds as if it should be 512 or 1, if qemu-nbd
is able to reassemble smaller than preferred requests, even if they
are suboptimal.

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


