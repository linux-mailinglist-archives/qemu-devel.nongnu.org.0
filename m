Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B1349FA5D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 14:10:13 +0100 (CET)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDR12-0007U6-86
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 08:10:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDQCk-0007VG-9p
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:18:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDQCg-00088I-Rb
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 07:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643372289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KxcsT4HkClZ8/A+dVr9VHcpsdEH+Ao+8nVMCdjOet3g=;
 b=bV/UeI0pH6uAj1ZjtfKF0Cx91d3KhKtiEpK+In3r2AADtsYtQtl0QT8DZGsO9qrNktZkPh
 tTIZNXHK8AiGFvTWThIeFZBIVB3F8x1CphGtbR+OgqD9hkGuJVrR2FyJh6RaCp+V0moA/O
 BXrSvVHXJ/N6xmgxbPvIHfaE5S22QzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-OPUGHBjpPfuVD4eGCWlbyw-1; Fri, 28 Jan 2022 07:18:06 -0500
X-MC-Unique: OPUGHBjpPfuVD4eGCWlbyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 131E584B9AC;
 Fri, 28 Jan 2022 12:18:05 +0000 (UTC)
Received: from localhost (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89FC66D03B;
 Fri, 28 Jan 2022 12:18:04 +0000 (UTC)
Date: Fri, 28 Jan 2022 12:18:03 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: Block alignment of qcow2 compress driver
Message-ID: <20220128121803.GS1127@redhat.com>
References: <20220128110732.GA19514@redhat.com>
 <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
 <20220128114815.GQ1127@redhat.com>
 <26486e0e-adb5-aa3b-e70d-82ab21a0d2be@redhat.com>
MIME-Version: 1.0
In-Reply-To: <26486e0e-adb5-aa3b-e70d-82ab21a0d2be@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Jan 28, 2022 at 12:57:47PM +0100, Hanna Reitz wrote:
> On 28.01.22 12:48, Richard W.M. Jones wrote:
> >On Fri, Jan 28, 2022 at 12:39:11PM +0100, Hanna Reitz wrote:
> >>So I actually don’t know why it works for you.  OTOH, I don’t
> >>understand why the block size affects you over NBD, because I would
> >>have expected qemu to internally auto-align requests when they are
> >>not aligned (in bdrv_co_pwritev_part()).
> >I checked it again and my hack definitely fixes nbdcopy.  But maybe
> >that's expected if qemu-nbd is auto-aligning requests?  (I'm only
> >accessing the block layer through qemu-nbd, not with qemu-io)
> 
> It’s not just qemu-io, with your diff[3] I get the same EINVAL over
> NBD, too:
> 
> $ ./qemu-img create -f qcow2 test.qcow2 64M
> Formatting 'test.qcow2', fmt=qcow2 cluster_size=65536
> extended_l2=off compression_type=zlib size=67108864
> lazy_refcounts=off refcount_bits=16
> 
> $ ./qemu-nbd --fork --image-opts \
> driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=test.qcow2
> 
> $ ./qemu-io -c 'write 0 32k' -f raw nbd://localhost
> write failed: Invalid argument

Strange - is that error being generated by qemu's nbd client code?

Here's my test not involving qemu's client code:

$ qemu-nbd --version
qemu-nbd 6.2.0 (qemu-6.2.0-2.fc36)

$ qemu-img create -f qcow2 output.qcow2 1M
Formatting 'output.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 lazy_refcounts=off refcount_bits=16

$ qemu-nbd --fork --image-opts driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=output.qcow2

$ nbdsh -u nbd://localhost
nbd> h.get_strict_mode()
31
nbd> h.set_strict_mode(31 & ~nbd.STRICT_ALIGN)
nbd> h.get_strict_mode()
15
nbd> h.pwrite(b'1'*1024, 0)
nbd> exit

So an unaligned 1K write works (after disabling libnbd's client-side
alignment checks).

> I just changed that line of code [2], as shown in [4].  I suppose
> the better thing to do would be to have an option for the NBD server
> to force-change the announced request alignment, because it can
> expect the qemu block layer code to auto-align requests through
> RMW.  Doing it in the client is wrong, because the NBD server might
> want to detect that the client sends unaligned requests and reject
> them (though ours doesn’t, it just traces such events[5] – note that
> it’s explicitly noted there that qemu will auto-align requests).

I know I said I didn't care about performance (in this case), but is
there in fact a penalty to sending unaligned requests to the qcow2
layer?  Or perhaps it cannot compress them?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top


