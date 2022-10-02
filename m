Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4325F222F
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 11:04:31 +0200 (CEST)
Received: from localhost ([::1]:41026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeuti-000717-18
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 05:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1oeupG-0004a8-Rb
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 04:59:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1oeupC-0007vp-Hi
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 04:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664701188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uUV7VJSlnQzJ38mxDgh5xaYxjeTtv351HITh3SQqr0M=;
 b=V0B8otWlz2OvZ9sX5t8m8/esm0Io5PPEMCJPsdBY0avsFUzVZufN4fMrzElFLXuF3qa3qs
 9yLbIsftF4Ace4s8Co8lZaRpCe4prkcnhbz2X+IvDrXDQE1SZZDQSAG3cKad38bTpimB1F
 tFdBbq1vgUfukD+J2fLQV93AUbApPTU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-A5meftXDO-6l48yy-yhurA-1; Sun, 02 Oct 2022 04:59:47 -0400
X-MC-Unique: A5meftXDO-6l48yy-yhurA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26727380670A;
 Sun,  2 Oct 2022 08:59:47 +0000 (UTC)
Received: from starship (unknown [10.40.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD77B40C206B;
 Sun,  2 Oct 2022 08:59:44 +0000 (UTC)
Message-ID: <28ce86c01271c1b9b8f96a7783b55a8d458325d2.camel@redhat.com>
Subject: Re: Commit 'iomap: add support for dma aligned direct-io' causes
 qemu/KVM boot failures
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Christoph Hellwig <hch@lst.de>, 
 Keith Busch <kbusch@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, Kevin Wolf <kwolf@redhat.com>, 
 Michael Roth <mdroth@linux.vnet.ibm.com>
Date: Sun, 02 Oct 2022 11:59:42 +0300
In-Reply-To: <32db4f89-a83f-aac4-5d27-0801bdca60bf@redhat.com>
References: <fb869c88bd48ea9018e1cc349918aa7cdd524931.camel@redhat.com>
 <YzW+Mz12JT1BXoZA@kbusch-mbp.dhcp.thefacebook.com>
 <a2825beac032fd6a76838164d4e2753d30305897.camel@redhat.com>
 <YzXJwmP8pa3WABEG@kbusch-mbp.dhcp.thefacebook.com>
 <20220929163931.GA10232@lst.de>
 <32db4f89-a83f-aac4-5d27-0801bdca60bf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 2022-09-29 at 19:35 +0200, Paolo Bonzini wrote:
> On 9/29/22 18:39, Christoph Hellwig wrote:
> > On Thu, Sep 29, 2022 at 10:37:22AM -0600, Keith Busch wrote:
> > > > I am aware, and I've submitted the fix to qemu here:
> > > > 
> > > >   https://lists.nongnu.org/archive/html/qemu-block/2022-09/msg00398.html
> > > 
> > > I don't think so. Memory alignment and length granularity are two completely
> > > different concepts. If anything, the kernel's ABI had been that the length
> > > requirement was also required for the memory alignment, not the other way
> > > around. That usage will continue working with this kernel patch.

Yes, this is how I also understand it - for example for O_DIRECT on a file which
resides on 4K block device, you have to use page aligned buffers.

But here after the patch, 512 aligned buffer starts working as well - If I
understand you correctly the ABI didn't guarantee that such usage would fail,
but rather that it might fail.

> > 
> > Well, Linus does treat anything that breaks significant userspace
> > as a regression.  Qemu certainly is significant, but that might depend
> > on bit how common configurations hitting this issue are.
> 
> Seeing the QEMU patch, I agree that it's a QEMU bug though.  I'm 
> surprised it has ever worked.
> 
> It requires 4K sectors in the host but not in the guest, and can be 
> worked around (if not migrating) by disabling O_DIRECT.  I think it's 
> not that awful, but we probably should do some extra releases of QEMU 
> stable branches.
> 
> Paolo
> 

I must admit I am out of the loop on the exact requirements of the O_DIRECT.


If I understand that correctly, after the patch in question, 
qemu is able to use just 512 bytes aligned buffer to read a single 4K block from the disk,
which supposed to fail but wasn't guarnteed to fail.



Later qemu it submits iovec which also reads a 4K block but in two parts,
and if I understand that correctly, each part (iov) is considered
to be a separate IO operation,  and thus each has to be in my case 4K in size, 
and its memory buffer *should* also be 4K aligned.

(but it can work with smaller alignement as well).


Assuming that I understand all of this correctly, I agree with Paolo that this is qemu
bug, but I do fear that it can cause quite some problems for users,
especially for users that use outdated qemu version.

It might be too much to ask, but maybe add a Kconfig option to keep legacy behavier
for those that need it?

Best regards,
	Maxim Levitsky


