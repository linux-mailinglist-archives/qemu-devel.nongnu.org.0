Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FF2148559
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jan 2020 13:45:34 +0100 (CET)
Received: from localhost ([::1]:41490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuyL7-0002Zn-Ky
	for lists+qemu-devel@lfdr.de; Fri, 24 Jan 2020 07:45:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51737)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <amit@kernel.org>) id 1iuyK7-000208-O7
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 07:44:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <amit@kernel.org>) id 1iuyK6-0007Xi-JH
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 07:44:31 -0500
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1]:59200)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <amit@kernel.org>) id 1iuyK6-0007RK-0Z
 for qemu-devel@nongnu.org; Fri, 24 Jan 2020 07:44:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Mime-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bigv7gDxRMGerpS/mOmzmgFOs/Yd2U9wIc0wniXLVks=; b=XWBcqYGAX/DACBXXyo5UmZGJOf
 q9hfYYLHdHnsGBWc+DpSvM90Tj/IWi64urvyAtXzVA+sASP//QXrsCsEH+sFAhz4pbdS+IQlxVNrQ
 wnMUjUjerWDd8BnXhg4tO6kf3Jyu9KFjGA3aXcPZlGFQ0Oh9+V6gXze7IJBFimA6jb7AdqJsf0UQJ
 1emFqj0rsnNmzkRHHF9ms2dtCnbaS6jTsW+Ym7Z1aDRZ4eTV9NIHbfCooXzrGTfPZEpRQfcS6YKMg
 wi3c7qF3+BfDgJBNchUu1ip2tpB5phT33+OhWfTQWmbwBHvoPUZ18CyOgX0dGPhB+4da67eh1oNle
 vOoKTnIA==;
Received: from [54.239.6.185] (helo=u0c626add9cce5a.ant.amazon.com)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuyJz-0006Sj-4Q; Fri, 24 Jan 2020 12:44:23 +0000
Message-ID: <4aea60db5e20d3d8948046c6ffbde27edf64e194.camel@kernel.org>
Subject: Re: [RFC 0/2] virtio-rng: add a control queue
From: Amit Shah <amit@kernel.org>
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Date: Fri, 24 Jan 2020 13:43:49 +0100
In-Reply-To: <20200123151700.1367857-1-lvivier@redhat.com>
References: <20200123151700.1367857-1-lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:8b0:10b:1231::1
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-01-23 at 16:16 +0100, Laurent Vivier wrote:
> The kernel needs sometime to be able to cancel an ongoing command.
> 
> For instance, if the virtio-rng device uses the egd backend
> and this backend doesn't provide data, the buffer provided by the
> kernel is kept as long as it is needed.
> 
> On the kernel side, a read blocks until the buffer returns from QEMU.
> 
> As the read is done with a mutex held, all the hw_random interface
> hangs and we cannot switch to another hw_random backend.
> 
> So this series adds a control queue to the virtio-rng device to allow
> to flush the virtio-rng input queue to release the kernel mutex and
> to allow to switch to another device.
> 
> The kernel side series can be found at:
> 
> https://github.com/vivier/linux/commits/virtio-rng-ctrl

Did you submit the kernel series too?  Can you please CC me to it?

This will need spec changes as well, can you please point me to them
too?

I also recall a previous discussion about this, but my search-fu is
failing to find it...

		Amit


