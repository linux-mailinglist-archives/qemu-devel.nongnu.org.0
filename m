Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20752DE889
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 18:52:29 +0100 (CET)
Received: from localhost ([::1]:52772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqJvY-0008UL-Ce
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 12:52:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kqJts-0007CZ-E1; Fri, 18 Dec 2020 12:50:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:42684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1kqJtq-0005hr-Fz; Fri, 18 Dec 2020 12:50:44 -0500
Date: Sat, 19 Dec 2020 02:50:34 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608313840;
 bh=jpquabZR58cccOR7sLwR50JiVuDXWleltebbI5tnTk4=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=KVE4Ud0bcJcEczO2+sy/Zq4U/Y/uNNK1//msKytYR5TEiktNzj4juhGwuYHzLzADh
 3A5Weg74m/G353wnfZD/VZrG46JmOEO37ddplszIlyV72wIeV699YAV4JmR0wJ0W+C
 hrflLuVDzAc3Y9IVn5Gm8Zf8seHRzkjqRXA1tsFWSzePlQWuB85XSpTNVQr5t+HORl
 WPmsHicJlJDXLgHulOBjF4nzqlRKU+8MO6qN2db9/fLT6xmAZCrWkzJQTl9bfaDQTJ
 7k8wlPhifTKPB3ae7mNyVhpRCJ8XFDE6SnzG5t7mdYkWcb7bV4wb6jkc6bVhvmIC35
 jPoQn1prC8KWQ==
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC 0/3] hw/block/nvme: dif-based end-to-end data
 protection support
Message-ID: <20201218175034.GA8722@redsun51.ssa.fujisawa.hgst.com>
References: <20201217210222.779619-1-its@irrelevant.dk>
 <20201217211440.GA502315@dhcp-10-100-145-180.wdc.com>
 <X9x4tUI+QLDNTBtS@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9x4tUI+QLDNTBtS@apples.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 18, 2020 at 10:39:01AM +0100, Klaus Jensen wrote:
> On Dec 17 13:14, Keith Busch wrote:
> > On Thu, Dec 17, 2020 at 10:02:19PM +0100, Klaus Jensen wrote:
> > 
> > Are there any actual users of extended metadata that we care about? I'm
> > aware of only a few niche places that can even access an extended
> > metadata format. There's not kernel support in any major OS that I know
> > of.
> > 
> 
> Yes, there are definitely actual users in enterprise storage. But the
> main use case here is testing (using extended LBAs with SPDK for
> instance).

Fair enough.

And just to make sure we're coverging on the same nomenclature, spec
suggests "extended" metadata means the interleaved format that does not
use the MPTR field. Metadata with the MPTR field is referred to as
"separate". I'm only mentioning this because I've been in confused
conversations where "extended LBA" interchangably meant either method.
 
> Yes. I actually also like option 3. Technically option 2 does not break
> image interoperability between devices (ide, virtio), but you would
> leave out a bunch of metadata that your application might depend on, so
> I don't see any way to not break interoperability really.

Either is fine. If you're switching metadata modes through your qemu
parameters, you could think of this as a firmware change, which doesn't
guarantee the same LBA formats.

> And I would then be just fine with "emulating" extended LBAs at the cost
> of more I/O. Because I would like the device to support that mode of
> operation as well. We have not implemented this, but my gut feeling says
> that it can be done.

It can. My qemu tree from way back did this, but infradead.org lost it
all and never recovered. I didn't retain a local copy either, but
starting from scratch is probably the best course anyway.

> > In any case, calculating T10 CRCs is *really* slow unless you have
> > special hardware and software support for it.
> > 
> 
> Yeah. I know this is super slow. For for emulation and testing purposes
> I think it is a nice feature for the device to optionally offer.

Bonus if you want to implement this with PCLMULQDQ support in x86-64
hosts. For reference, here's the linux kernel's implementation:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/crypto/crct10dif-pcl-asm_64.S

I wouldn't necessarily tie metadata support to T10DIF, though, since
it has uses beyond protection info.

