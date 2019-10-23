Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A017E13AD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Oct 2019 10:10:05 +0200 (CEST)
Received: from localhost ([::1]:56884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNBiW-0001Ge-Dm
	for lists+qemu-devel@lfdr.de; Wed, 23 Oct 2019 04:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1iNBew-0007wx-7V
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:06:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1iNBep-0000wv-Vs
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:06:20 -0400
Received: from [2001:470:70c5:1111::170] (port=57428 helo=smtp.duncanthrax.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1iNBeo-0000uW-Fg
 for qemu-devel@nongnu.org; Wed, 23 Oct 2019 04:06:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date;
 bh=yvUWCn0OatQpyJTrQJOu1drZsZCj2Z91HHoJda77AN4=; b=iTJ8Iq0wsy+yiVjDO3caYKjCth
 kPij6IQ2sbAeTiwcPzf0UbWZpUcCrRXOTHjn2j8Pka33KBG7pD7dClYAUK75q9wiqi7vMundIzy1U
 DvtGvrgrM05v+28PKKxKj/cmMjzNpbox94RLhZ48mOgCj5jHK47F31snxdBnM7I4R4oU=;
Received: from [2a01:4f8:121:41fa::170] (helo=stackframe.org)
 by smtp.eurescom.eu with esmtpa (Exim 4.86_2)
 (envelope-from <svens@stackframe.org>)
 id 1iNBej-0002Ea-6w; Wed, 23 Oct 2019 10:06:09 +0200
Date: Wed, 23 Oct 2019 10:06:09 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] net: add tulip (dec21143) driver
Message-ID: <20191023080608.GB19036@stackframe.org>
References: <20191022155413.4619-1-svens@stackframe.org>
 <CAFEAcA8DWwWLnMZqqsn4RpJbtPbxoPnrB2Z7UXvK3FhHRgk78A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8DWwWLnMZqqsn4RpJbtPbxoPnrB2Z7UXvK3FhHRgk78A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2001:470:70c5:1111::170
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
Cc: Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 22, 2019 at 05:00:16PM +0100, Peter Maydell wrote:
> 
> There are a couple of minor wrong-indent nits:
> 
> > +static void tulip_update_ts(TULIPState *s, int state)
> > +{
> > +        s->csr[5] &= ~(CSR5_TS_MASK << CSR5_TS_SHIFT);
> > +        s->csr[5] |= (state & CSR5_TS_MASK) << CSR5_TS_SHIFT;
> > +        trace_tulip_tx_state(tulip_tx_state_name(state));
> > +}
> 
> > +struct tulip_descriptor {
> > +        uint32_t status;
> > +        uint32_t control;
> > +        uint32_t buf_addr1;
> > +        uint32_t buf_addr2;
> > +};
> 
> but maybe Jason can fix those up when he takes the patch ?

I'll send an updated version soon - there are some other small things
that i need to address.

Thanks
Sven

