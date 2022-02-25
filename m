Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E335F4C4884
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:16:47 +0100 (CET)
Received: from localhost ([::1]:42954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcKq-0006eL-03
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:16:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNbzl-0005be-Gp
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:54:58 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:51038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNbzj-00029r-4o
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:54:57 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6617E61607;
 Fri, 25 Feb 2022 14:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C72C340E7;
 Fri, 25 Feb 2022 14:54:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="KVOaVkaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645800888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qE/ZWcS5laWbFfe6kS3CgvY+YPQ7FFHc3k15fj0mrEI=;
 b=KVOaVkaOu3r+Qp1WdK0zyPpBT7r2AjT2IjT7Nm8mLR9n6CbR5EX/G0eCvR9zZrR/5zSaHt
 /CZ+FaIO3789sgokItbqLEaLPJzLMHdPLARsfw8JqihocjrbnYc3X9aXUtF6jGn8nERzXw
 g2JWnL04850ISzo0Unco/uXtXvPFQBY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3e8c7660
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 25 Feb 2022 14:54:47 +0000 (UTC)
Date: Fri, 25 Feb 2022 15:54:44 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Alexander Graf <graf@amazon.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing
 RNG on VM fork
Message-ID: <YhjttNadaaJzVa5X@zx2c4.com>
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, mst@redhat.com,
 raduweis@amazon.com, qemu-devel@nongnu.org, linux@dominikbrodowski.net,
 kys@microsoft.com, ardb@kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 ben@skyportsystems.com, decui@microsoft.com, ebiggers@kernel.org,
 lersek@redhat.com, ehabkost@redhat.com, adrian@parity.io, jannh@google.com,
 haiyangz@microsoft.com, tytso@mit.edu, colmmacc@amazon.com,
 berrange@redhat.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, imammedo@redhat.com, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alex,

Missed this remark before:

On Fri, Feb 25, 2022 at 02:57:38PM +0100, Alexander Graf wrote:
> Please expose the vmgenid via /sysfs so that user space even remotely 
> has a chance to check if it's been cloned.

No. Did you read the 0/2 cover letter? I'll quote it for you here:

> As a side note, this series intentionally does _not_ focus on
> notification of these events to userspace or to other kernel consumers.
> Since these VM fork detection events first need to hit the RNG, we can
> later talk about what sorts of notifications or mmap'd counters the RNG
> should be making accessible to elsewhere. But that's a different sort of
> project and ties into a lot of more complicated concerns beyond this
> more basic patchset. So hopefully we can keep the discussion rather
> focused here to this ACPI business.

What about that was unclear to you?

Anyway, it's a different thing that will have to be designed and
considered carefully, and that design doesn't have a whole lot to do
with this little driver here, except insofar as it could build on top of
it in one way or another. Yes, it's an important thing to do. No, I'm
not going to do it in this patch here. If you want to have a discussion
about that, start a different thread.

Thanks,
Jason

