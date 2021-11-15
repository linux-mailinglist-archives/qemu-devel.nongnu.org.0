Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA54507FB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 16:13:26 +0100 (CET)
Received: from localhost ([::1]:47140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdfh-0007xb-Bc
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 10:13:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mmdZp-00054p-8p; Mon, 15 Nov 2021 10:07:21 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:35385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mmdZm-000176-9r; Mon, 15 Nov 2021 10:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=16/XoIFmr/MgraRZj73wXjG85PzJ/daDCNk8G4JJppg=; b=dDK9k1bYDZITkss7Wc66gRitmy
 6wvARgxL69+tIE1J3WzTeGJedvt1C1n4zJG0T2iabS/Ygcl5frjci1MwQz6gkTctvZG68pJ3Y09Vo
 ZMTgnvhJ2CmpmuD4dxulTPoIIW5TTNU+sjIjq1EvXFHQyH3mV9CDG7kux55cIuuHuR17StWsqIKbJ
 6foQUU51bTQnkwyevuy/lBPON7sadhM0tL7BVekTq4Z9TzDokBtdX/pmNp9KPXXZ1jyeG5dc+QA+X
 wHrBfs7LOcOQ1lYiS2EmjkhXMVnMJYcr+HoEn3t1k3rpfzvpvoyNSIEpw13vjoQcO4ISWGnwnAqvv
 0QE68ub65/Zzn6MdgJNB/AXbFQtbaXyrEX1dSKTAMVKk/pNendJiWQW5hl1HCGPOiv1+b45hgUln1
 Xnl0hk7HyhxfAqBvYOYdGd4vLp5HiixfE1U//vu1akQ0rXBC+U+XJPmlzIZMgybGSotnwVKPVzWgK
 hAliLX3T5xETCm3IpIu6/MVrs/jnzb1tX/moiACUGDcaReVWElTOP3bcY5TxSTXIUYR1QNCtX+Us8
 um0O81kVfppkuoClaT64sTbyUzBGhm6MTaDOIyFAcDAYBcX2tAWy6NjKk82e+AuRBMpVwSpIG6KjZ
 xc7onXddHexgcmuy335U02BUiCaf/pd1JecdSxtj8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Amit Shah <amit@kernel.org>, David Hildenbrand <david@redhat.com>,
 Greg Kurz <groug@kaod.org>, virtio-fs@redhat.com,
 Eric Auger <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2 0/3] virtio: increase VIRTQUEUE_MAX_SIZE to 32k
Date: Mon, 15 Nov 2021 15:32:46 +0100
Message-ID: <2888852.ZcFpDoVWxJ@silver>
In-Reply-To: <YZJKeNOxcm3ZxHj6@stefanha-x1.localdomain>
References: <cover.1633376313.git.qemu_oss@crudebyte.com>
 <2186445.RDNOEBgitd@silver> <YZJKeNOxcm3ZxHj6@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Montag, 15. November 2021 12:54:32 CET Stefan Hajnoczi wrote:
> On Thu, Nov 11, 2021 at 06:54:03PM +0100, Christian Schoenebeck wrote:
> > On Donnerstag, 11. November 2021 17:31:52 CET Stefan Hajnoczi wrote:
> > > On Wed, Nov 10, 2021 at 04:53:33PM +0100, Christian Schoenebeck wrote:
> > > > On Mittwoch, 10. November 2021 16:14:19 CET Stefan Hajnoczi wrote:
> > > > > On Wed, Nov 10, 2021 at 02:14:43PM +0100, Christian Schoenebeck 
wrote:
> > > > > > On Mittwoch, 10. November 2021 11:05:50 CET Stefan Hajnoczi wrote:
> > > > > > As you are apparently reluctant for changing the virtio specs,
> > > > > > what
> > > > > > about
> > > > > > introducing those discussed virtio capabalities either as
> > > > > > experimental
> > > > > > ones
> > > > > > without specs changes, or even just as 9p specific device
> > > > > > capabilities
> > > > > > for
> > > > > > now. I mean those could be revoked on both sides at any time
> > > > > > anyway.
> > > > > 
> > > > > I would like to understand the root cause before making changes.
> > > > > 
> > > > > "It's faster when I do X" is useful information but it doesn't
> > > > > necessarily mean doing X is the solution. The "it's faster when I do
> > > > > X
> > > > > because Y" part is missing in my mind. Once there is evidence that
> > > > > shows
> > > > > Y then it will be clearer if X is a good solution, if there's a more
> > > > > general solution, or if it was just a side-effect.
> > > > 
> > > > I think I made it clear that the root cause of the observed
> > > > performance
> > > > gain with rising transmission size is latency (and also that
> > > > performance
> > > > is not the only reason for addressing this queue size issue).
> > > > 
> > > > Each request roundtrip has a certain minimum latency, the virtio ring
> > > > alone
> > > > has its latency, plus latency of the controller portion of the file
> > > > server
> > > > (e.g. permissions, sandbox checks, file IDs) that is executed with
> > > > *every*
> > > > request, plus latency of dispatching the request handling between
> > > > threads
> > > > several times back and forth (also for each request).
> > > > 
> > > > Therefore when you split large payloads (e.g. reading a large file)
> > > > into
> > > > smaller n amount of chunks, then that individual latency per request
> > > > accumulates to n times the individual latency, eventually leading to
> > > > degraded transmission speed as those requests are serialized.
> > > 
> > > It's easy to increase the blocksize in benchmarks, but real applications
> > > offer less control over the I/O pattern. If latency in the device
> > > implementation (QEMU) is the root cause then reduce the latency to speed
> > > up all applications, even those that cannot send huge requests.
> > 
> > Which I did, still do, and also mentioned before, e.g.:
> > 
> > 8d6cb100731c4d28535adbf2a3c2d1f29be3fef4 9pfs: reduce latency of Twalk
> > 0c4356ba7dafc8ecb5877a42fc0d68d45ccf5951 9pfs: T_readdir latency
> > optimization
> > 
> > Reducing overall latency is a process that is ongoing and will still take
> > a
> > very long development time. Not because of me, but because of lack of
> > reviewers. And even then, it does not make the effort to support higher
> > transmission sizes obsolete.
> > 
> > > One idea is request merging on the QEMU side. If the application sends
> > > 10 sequential read or write requests, coalesce them together before the
> > > main part of request processing begins in the device. Process a single
> > > large request to spread the cost of the file server over the 10
> > > requests. (virtio-blk has request merging to help with the cost of lots
> > > of small qcow2 I/O requests.) The cool thing about this is that the
> > > guest does not need to change its I/O pattern to benefit from the
> > > optimization.
> > > 
> > > Stefan
> > 
> > Ok, don't get me wrong: I appreciate that you are suggesting approaches
> > that could improve things. But I could already hand you over a huge list
> > of mine. The limiting factor here is not the lack of ideas of what could
> > be improved, but rather the lack of people helping out actively on 9p
> > side:
> > https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg06452.html
> > 
> > The situation on kernel side is the same. I already have a huge list of
> > what could & should be improved. But there is basically no reviewer for
> > 9p patches on Linux kernel side either.
> > 
> > The much I appreciate suggestions of what could be improved, I would
> > appreciate much more if there was *anybody* actively assisting as well. In
> > the time being I have to work the list down in small patch chunks,
> > priority based.
> I see request merging as an alternative to this patch series, not as an
> additional idea.

It is not an alternative. Like I said before, even if it would solve the 
sequential I/O performance issue (by not simply moving the problem somewhere 
else), which I doubt, your suggestion would still not solve the semantical 
conflict of virtio's "maximum queue size" terminology: i.e. max. active/
pending messages vs. max. transmissions size. Denying that simply means 
attempting to postpone addressing this virtio issue appropriately.

The legitimate concerns you came up with can easily be addressed by two virtio 
capabilities to make things clean and officially supported by both ends, which 
could also be revoked at any time without breaking things if there were any 
real-life issues actually coming up on virtio level in future. The rest is 
already prepared.

> My thoughts behind this is that request merging is less work than this
> patch series and more broadly applicable.

It is definitely not less work. All I still have to do is adding two virtio 
capabilities as suggested by you, either as official virtio ones, or as 9p 
device specific ones. The other outstanding tasks on my side are independent 
of this overall issue.

> It would be easy to merge (no
> idea how easy it is to implement though) in QEMU's virtio-9p device
> implementation, does not require changes across the stack, and benefits
> applications that can't change their I/O pattern to take advantage of
> huge requests.

And waiting on every single request whether there might be more sequential 
requests coming in somewhere in future, i.e. even increasing latency and 
worsening the situation on random I/O side, increasing the probability of a 
full queue and client having to wait too often, piling up more complex code, 
and what not.

Your idea of merging sequential requests on QEMU side already fails at the 
intial point: sequential read is typically initiated by sequential calls to 
read() by a guest application thread. However that read() function call must 
return some data before guest app thread would be able to call read() again 
for subsequent chunks.

> There is a risk that request merging won't pan out, it could have worse
> performance than submitting huge requests.

That's not a risk, it is not even feasible. Plus my plan is to improve 
performance for various use case patterns, especially for both sequential and 
random I/O patterns, not just only one of them.

A more appropriate solution from what you suggested, is e.g. to extend the 
already existing Linux 9p client's optional fs-cache feature by an optional 
read-ahead feature. Again, one of many things on my TODO list, but also still 
a bunch of things to do on fs-cache alone before being able to start that.

We have discussed this issue for almost 2 months now. I think it is time to 
move on. If you are still convinced about your ideas, please send your patches 
and benchmark results.

I would appreciate if you'd let me know whether I should suggest the discussed 
two virtio capabilities as official virtio ones, or whether I should directly 
go for 9p device specific ones instead.

Thanks!

Best regards,
Christian Schoenebeck



