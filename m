Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31C94C9081
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 17:37:06 +0100 (CET)
Received: from localhost ([::1]:60982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP5Uo-0006rR-2m
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 11:37:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nP5TR-0005sN-6w
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:35:41 -0500
Received: from [2604:1380:4601:e00::1] (port=38572 helo=ams.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org>)
 id 1nP5TP-0004t0-5k
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:35:40 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8BE68B819EB;
 Tue,  1 Mar 2022 16:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B2D8C340EE;
 Tue,  1 Mar 2022 16:35:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="POdsqroe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1646152531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1nOiauBbKjq2GBtfhMLzeD+6fw81ge7D0lpL4B2vR4M=;
 b=POdsqroeNiU2Fam7MP0fPCEPjinxMcgSl7jitNKrqAecVHoDyy1kYm1TiHzZXEPsUs5Cph
 mWVOl7LIgk0IKZAtatreikQb+OGH0M1JQK9Ms7mSYH4GpAU1+mLQmh+BNRKOvuRObCUGRr
 qvoLzNedtT0xoLOy9KSmqi6ARfFcgzg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1e38f283
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 1 Mar 2022 16:35:31 +0000 (UTC)
Date: Tue, 1 Mar 2022 17:35:25 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: propagating vmgenid outward and upward
Message-ID: <Yh5LTd1k1uB1eGFF@zx2c4.com>
References: <Yh4+9+UpanJWAIyZ@zx2c4.com>
 <20220301111459-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220301111459-mutt-send-email-mst@kernel.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4601:e00::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=SRS0=HlCd=TM=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: len.brown@intel.com, linux-hyperv@vger.kernel.org, colmmacc@amazon.com,
 berrange@redhat.com, adrian@parity.io, kvm@vger.kernel.org, jannh@google.com,
 gregkh@linuxfoundation.org, linux-pm@vger.kernel.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org, linux@dominikbrodowski.net,
 qemu-devel@nongnu.org, graf@amazon.com, linux-crypto@vger.kernel.org,
 pavel@ucw.cz, tytso@mit.edu, mikelley@microsoft.com, lersek@redhat.com,
 arnd@arndb.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On Tue, Mar 01, 2022 at 11:21:38AM -0500, Michael S. Tsirkin wrote:
> > If we had a "pull" model, rather than just expose a 16-byte unique
> > identifier, the vmgenid virtual hardware would _also_ expose a
> > word-sized generation counter, which would be incremented every time the
> > unique ID changed. Then, every time we would touch the RNG, we'd simply
> > do an inexpensive check of this memremap()'d integer, and reinitialize
> > with the unique ID if the integer changed. In this way, the race would
> > be entirely eliminated. We would then be able to propagate this outwards
> > to other drivers, by just exporting an extern symbol, in the manner of
> > `jiffies`, and propagate it upwards to userspace, by putting it in the
> > vDSO, in the manner of gettimeofday. And like that, there'd be no
> > terrible async thing and things would work pretty easily.
> 
> I am not sure what the difference is though. So we have a 16 byte unique
> value and you would prefer a dword counter. How is the former not a
> superset of the later?  

Laszlo just asked the same question, which I answered here:
<https://lore.kernel.org/lkml/Yh5JwK6toc%2FzBNL7@zx2c4.com/>. You have
to read the full 16 bytes. You can't safely just read the first 4 or 8
or something, because it's a "unique ID" rather than a counter. That
seems like a needlessly expensive thing to do on each-and-every packet.

> I'm not sure how safe it is to expose it to
> userspace specifically, but rest of text talks about exposing it to a
> kernel driver so maybe not an issue? So what makes interrupt driven
> required, and why not just remap and read existing vmgenid in the pull
> manner?  What did I miss?

I don't really understand your question, but guessing your meaning: I'm
not talking about exposing the actual 16-byte value to any other
drivers, but just notifying them that their sessions should be dropped.
If it's easier to think about this in code, grep for wg_pm_notification(),
and consider that it'd be changing this code:

        if (action != PM_HIBERNATION_PREPARE && action != PM_SUSPEND_PREPARE)
                return 0;

into:

        if (action != PM_HIBERNATION_PREPARE && action != PM_SUSPEND_PREPARE &&
	    action != PM_VMFORK_POST)
                return 0;

But perhaps I misunderstood this part of your question?

Jason

