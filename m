Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3595758DA33
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 16:20:37 +0200 (CEST)
Received: from localhost ([::1]:58788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLQ5z-0003yF-Oy
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 10:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oLQ11-0000Rp-8D
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 10:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oLQ0y-0008Jz-JV
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 10:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660054519;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tzxSG46xr/1yC0XFlekLEirrJTQieehGRONJqoPxc84=;
 b=d3bZXh+6YnIsuKolxpoeGim9smUMkdUZc1c+u6CmJcITdhwNBFlUwRm/WIze6TehsjeMtL
 EEvw9ncm5vtAHk6qRLJVlQbaNpqNtbzTtusbB/ejsedds40ASIJhL10AhnxwR1O0Q4SFn5
 2lMy2bsrJYnOe9UYVzMFfaYS5D6ILWU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-nsUCTb0oNZaA60aAA8YSPA-1; Tue, 09 Aug 2022 10:15:16 -0400
X-MC-Unique: nsUCTb0oNZaA60aAA8YSPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 458B9858EFF;
 Tue,  9 Aug 2022 14:15:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.229])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CDF84047D22;
 Tue,  9 Aug 2022 14:15:11 +0000 (UTC)
Date: Tue, 9 Aug 2022 15:15:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
 Laszlo Ersek <lersek@redhat.com>, linux-efi@vger.kernel.org
Subject: Re: [PATCH v3] hw/i386: place setup_data at fixed place in memory
Message-ID: <YvJr6452fv6J5WaL@redhat.com>
References: <YuxOgtykRQb1HU3e@zx2c4.com>
 <20220804230411.17720-1-Jason@zx2c4.com>
 <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
 <Yu0RX2b+e9BpGsJ6@zx2c4.com> <YvJQU0vS3sKDNPWn@zx2c4.com>
 <20220809100724-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220809100724-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 09, 2022 at 10:07:44AM -0400, Michael S. Tsirkin wrote:
> On Tue, Aug 09, 2022 at 02:17:23PM +0200, Jason A. Donenfeld wrote:
> > Hey Paolo,
> > 
> > On Fri, Aug 05, 2022 at 02:47:27PM +0200, Jason A. Donenfeld wrote:
> > > Hi Paolo,
> > > 
> > > On Fri, Aug 05, 2022 at 10:10:02AM +0200, Paolo Bonzini wrote:
> > > > On 8/5/22 01:04, Jason A. Donenfeld wrote:
> > > > > +    /* Nothing else uses this part of the hardware mapped region */
> > > > > +    setup_data_base = 0xfffff - 0x1000;
> > > > 
> > > > Isn't this where the BIOS lives?  I don't think this works.
> > > 
> > > That's the segment dedicated to ROM and hardware mapped addresses. So
> > > that's a place to put ROM material. No actual software will use it.
> > > 
> > > Jason
> > 
> > Unless I've misread the thread, I don't think there are any remaining
> > objections, right? Can we try merging this and seeing if it fixes the
> > issue for good?
> > 
> > Jason
> 
> Laszlo commented here:
> https://lore.kernel.org/r/fa0601e4-acf5-0ce8-9277-4d90d046b53e%40redhat.com

It is 7.1.0 rc2 date today, which leaves ideally only one rc remaining
before GA release.

The discussion still taking place in this thread does not fill me with
confidence that we're going to have a *well tested* solution before GA.
Even if we agree on a patch, are we really going to have confidence
in it being reliable if we've only got a week of testing ?

IMHO we're at the point where we should just disable the RNG feature
for 7.1.0, and gives ourselves time to come up with a solution in 7.2.0
that can be properly tested without the time pressure of release deadlines.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


