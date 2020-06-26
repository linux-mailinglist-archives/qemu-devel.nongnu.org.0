Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3550220B34A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 16:11:46 +0200 (CEST)
Received: from localhost ([::1]:55496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jop4z-00007E-5u
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 10:11:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1jop2X-0005Qr-Ph
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 10:09:13 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:45407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin@koconnor.net>)
 id 1jop2V-00078l-QC
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 10:09:13 -0400
Received: by mail-qt1-x841.google.com with SMTP id u12so7500193qth.12
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 07:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koconnor.net; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=B/7Uu+4/yJyuUAcz29Vhd8R+pCsS4bAsgfA81etMnpk=;
 b=Odh/s5vBtab75Vfd40gOkTda4jA1X4Xc4pxcOK4LA/v2SubbCmbTtKStEsl0/t422+
 /PiRKqqklc/0+fY1dvShl56UZ4/4FjuvgJ3SMBle4BcOfJCSyUVHubkFlEHV5cc8boF+
 HF2IpRg+aVN91WycYWLnPPx3lgdo4UYKok7Q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=B/7Uu+4/yJyuUAcz29Vhd8R+pCsS4bAsgfA81etMnpk=;
 b=rBd/V4Trg6ZdgGqioW4oBE21mhJfZQJiWngSHM2rB16d+yuSNWcNVfJt8JD87W1RiB
 Ep2bUonDsX7IJSz7lvRhyBqjHF5oHaSbHHek9JhlOLVCaM8yXrO8acSrjGl86iGapzYy
 BiO2e5Yp8oQ/3Im50YFCbSmaYKodMnQuGb76R38cTS/R0gM9q3fJFWLsB10/wNxHV5/y
 +1EwiBrFdyD3orUWsIzGXtbHm7fU5ilTE/IgUk5eyTLteNNulfFLNXFL4mJztqChMsRO
 5mEP+qTRdD+1nYAnNwim+sIhL9DaUccC+UoeUgjVcQzOlk0CZWO+aBvEeZmctpnNopkF
 FVQA==
X-Gm-Message-State: AOAM530hZ+h0RMCwNjJrzft7JiUj/GYnY2J3y8Dj0yicPzVhO91wAdVK
 RYc/yrtxiRnTXZNThQJM+Sn/5Q==
X-Google-Smtp-Source: ABdhPJwnA4BeH+HubbRIPJnbbcdvSRqjMCnfMYGqo2BGCnSZFFCyvPtDWU31g8sKAH86yefZSl7DSA==
X-Received: by 2002:ac8:5212:: with SMTP id r18mr2858714qtn.389.1593180550150; 
 Fri, 26 Jun 2020 07:09:10 -0700 (PDT)
Received: from localhost ([64.9.245.160])
 by smtp.gmail.com with ESMTPSA id f15sm7270588qka.120.2020.06.26.07.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 07:09:09 -0700 (PDT)
Date: Fri, 26 Jun 2020 10:09:08 -0400
From: Kevin O'Connor <kevin@koconnor.net>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH] timer: Handle decrements of PIT counter
Message-ID: <20200626140908.GA1060566@morn.lan>
References: <20200613111911.65497-1-r.bolshakov@yadro.com>
 <20200624030024.GA885327@morn.lan>
 <20200626130957.GJ25104@SPB-NB-133.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626130957.GJ25104@SPB-NB-133.local>
Received-SPF: pass client-ip=2607:f8b0:4864:20::841;
 envelope-from=kevin@koconnor.net; helo=mail-qt1-x841.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: seabios@seabios.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 26, 2020 at 04:09:57PM +0300, Roman Bolshakov wrote:
> On Tue, Jun 23, 2020 at 11:00:24PM -0400, Kevin O'Connor wrote:
> > Good catch.  Could we fix it using the patch below instead though?
> > 
> > -Kevin
> > 
> > 
> > --- a/src/hw/timer.c
> > +++ b/src/hw/timer.c
> > @@ -180,7 +180,7 @@ timer_read(void)
> >      // Read from PIT.
> >      outb(PM_SEL_READBACK | PM_READ_VALUE | PM_READ_COUNTER0, PORT_PIT_MODE);
> >      u16 v = inb(PORT_PIT_COUNTER0) | (inb(PORT_PIT_COUNTER0) << 8);
> > -    return timer_adjust_bits(v, 0xffff);
> > +    return timer_adjust_bits(-v, 0xffff);
> >  }
> >  
> >  // Return the TSC value that is 'msecs' time in the future.
> 
> Hi Kevin,
> 
> I like the approach much more. Initial count value is 0, PIT rearms the
> timer when 1 is hit, unary negation on unsigned u16 fits perfectly, then
> timer_adjust_bits recieves 0, 1, 2, ... and timer is rearmed at 0xffff.
> 
> Do you want me to send v2 or you plan to apply the fix on your own?

I'm fine with either.

Thanks,
-Kevin

