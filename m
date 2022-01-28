Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9B549FB1E
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 14:55:14 +0100 (CET)
Received: from localhost ([::1]:58372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDRia-0008EU-Ls
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 08:55:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDRQe-0002PJ-Nr
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 08:36:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1nDRQb-0003qO-BS
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 08:36:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643376995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=imwBCQTTWygKgyGygkBYw4W4kAwyYCunw0LAtmUkLCA=;
 b=L3gYAa3sIl+tzEES8NflxqO329PIfe3QRkolX9GbLmn7qZ0vzJ7Q/qa6tgBxn3KUwO4SoO
 fPjpzhHm36VVfLf50XZKOB4dDCa9UHvl1LKBh0JgId38hbgMPm1h85UzFIM+TIpqMxRxRu
 I2f/O5mJgjxTB0SNpzc69f86JBrSBmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-6huO0HBgPHmy0yZmI4Nu-w-1; Fri, 28 Jan 2022 08:36:33 -0500
X-MC-Unique: 6huO0HBgPHmy0yZmI4Nu-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E3F58189CC;
 Fri, 28 Jan 2022 13:36:32 +0000 (UTC)
Received: from localhost (unknown [10.39.194.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F21D51086480;
 Fri, 28 Jan 2022 13:36:31 +0000 (UTC)
Date: Fri, 28 Jan 2022 13:36:31 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: Block alignment of qcow2 compress driver
Message-ID: <20220128133631.GU1127@redhat.com>
References: <20220128110732.GA19514@redhat.com>
 <e07b998f-9a62-7587-0526-bf51eae54ed6@redhat.com>
 <20220128114815.GQ1127@redhat.com>
 <26486e0e-adb5-aa3b-e70d-82ab21a0d2be@redhat.com>
 <20220128121803.GS1127@redhat.com>
 <54f3a548-ebea-9ed5-6387-5dda2bf92c4e@redhat.com>
 <YfPtcGQGIZP4cYrJ@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YfPtcGQGIZP4cYrJ@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
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
Cc: andrey.shinkevich@virtuozzo.com, Hanna Reitz <hreitz@redhat.com>,
 eblake@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 28, 2022 at 02:19:44PM +0100, Kevin Wolf wrote:
> Am 28.01.2022 um 13:30 hat Hanna Reitz geschrieben:
> > > > I just changed that line of code [2], as shown in [4].  I suppose
> > > > the better thing to do would be to have an option for the NBD server
> > > > to force-change the announced request alignment, because it can
> > > > expect the qemu block layer code to auto-align requests through
> > > > RMW.  Doing it in the client is wrong, because the NBD server might
> > > > want to detect that the client sends unaligned requests and reject
> > > > them (though ours doesn’t, it just traces such events[5] – note that
> > > > it’s explicitly noted there that qemu will auto-align requests).
> > > I know I said I didn't care about performance (in this case), but is
> > > there in fact a penalty to sending unaligned requests to the qcow2
> > > layer?  Or perhaps it cannot compress them?
> > 
> > In qcow2, only the whole cluster can be compressed, so writing compressed
> > data means having to write the whole cluster.  qcow2 could implement the
> > padding by itself, but we decided to just leave the burden of only writing
> > full clusters (with the COMPRESSED write flag) on the callers.
> > 
> > Things like qemu-img convert and blockdev-backup just adhere to that by
> > design; and the compress driver makes sure to set its request alignment
> > accordingly so that requests to it will always be aligned to the cluster
> > size (either by its user, or by the qemu block layer which performs the
> > padding automatically).
> 
> I thought the more limiting factor would be that after auto-aligning the
> first request by padding with zeros, the second request to the same
> cluster would fail because compression doesn't allow using an already
> allocated cluster:
> 
>     /* Compression can't overwrite anything. Fail if the cluster was already
>      * allocated. */
>     cluster_offset = get_l2_entry(s, l2_slice, l2_index);
>     if (cluster_offset & L2E_OFFSET_MASK) {
>         qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
>         return -EIO;
>     }
> 
> Did you always just test a single request or why don't you run into
> this?

I didn't test that one specifically and yes it does fail:

$ qemu-img create -f qcow2 output.qcow2 1M
Formatting 'output.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=1048576 lazy_refcounts=off refcount_bits=16
$ qemu-nbd -t --image-opts driver=compress,file.driver=qcow2,file.file.driver=file,file.file.filename=output.qcow2 &
[1] 2069037

$ nbdsh -u nbd://localhost
nbd> h.set_strict_mode(h.get_strict_mode() & ~nbd.STRICT_ALIGN)
nbd> buf = b'1' * 1024
nbd> h.pwrite(buf, 0)
nbd> h.pwrite(buf, 1024)
Traceback (most recent call last):
  File "/usr/lib64/python3.10/code.py", line 90, in runcode
    exec(code, self.locals)
  File "<console>", line 1, in <module>
  File "/usr/lib64/python3.10/site-packages/nbd.py", line 1631, in pwrite
    return libnbdmod.pwrite(self._o, buf, offset, flags)
nbd.Error: nbd_pwrite: write: command failed: Input/output error (EIO)

So what I said in the previous email about about minimum vs preferred
is wrong :-(

What's more interesting is that nbdcopy still appeared to work.
Simulating what that was doing would be something like which
also fails when I do it directly:

nbd> h.pwrite(buf, 0)
nbd> h.zero(1024, 1024)
Traceback (most recent call last):
  File "/usr/lib64/python3.10/code.py", line 90, in runcode
    exec(code, self.locals)
  File "<console>", line 1, in <module>
  File "/usr/lib64/python3.10/site-packages/nbd.py", line 1782, in zero
    return libnbdmod.zero(self._o, count, offset, flags)
nbd.Error: nbd_zero: write-zeroes: command failed: Input/output error (EIO)

Anyway back to poking at nbdcopy to make it support block sizes ...

> I guess checking L2E_OFFSET_MASK is strictly speaking wrong because it's
> invalid for compressed clusters (qcow2_get_cluster_type() feels more
> appropriate), but in practice, you will always have non-zero data there,
> so it should error out here.
> 
> Kevin

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-df lists disk usage of guests without needing to install any
software inside the virtual machine.  Supports Linux and Windows.
http://people.redhat.com/~rjones/virt-df/


