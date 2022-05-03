Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BE0517BA4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 03:24:47 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlhHR-0005BD-Uc
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 21:24:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nlhFb-0004RQ-HZ
 for qemu-devel@nongnu.org; Mon, 02 May 2022 21:22:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nlhFX-0007kB-Jx
 for qemu-devel@nongnu.org; Mon, 02 May 2022 21:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651540965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/u4uz/fmOZhFxPfffIAYLBdEKhxpewg815ztdBeZ/zU=;
 b=CzPxk68MLEPl6/0P8jl+jWxIb0RyucdG17Tcz945jYJhQfM8mwtUYjaLB70rc7tDEO5Gzq
 JXRdNRepiu+PDbExq+sxC7GAzTHA9MlC8p290exFCWfiMgWAifqhPa7TozyI1KJL17/fZM
 SjL8/Ekrxa1etea2zDSAlueINPwMK60=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-aXgkF7_kM9GsjENWArrXdw-1; Mon, 02 May 2022 21:22:42 -0400
X-MC-Unique: aXgkF7_kM9GsjENWArrXdw-1
Received: by mail-io1-f69.google.com with SMTP id
 g16-20020a05660226d000b00638d8e1828bso11844943ioo.13
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 18:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/u4uz/fmOZhFxPfffIAYLBdEKhxpewg815ztdBeZ/zU=;
 b=GvCLWKmNVY6j740l3S6jcDetP/KRtEx/+B3X/Iu7JHIE3BbRJZ/xrkD0JwIuM/i8MQ
 4/Jxw4VzOVGRy4SbKZML1tW31W7tT9o2pTq4oki18ME0ihWKN/h02KMVpNqE8uOKFBIR
 qq+Kl+5FDuEHKiqNfvpTUh/5XUA+sORqp63IS1DwU1cIzCknRpPCrtBTGrVKFDKGaJN/
 NI6+ZroXPBvnFp2vbEJ+/x3YSnKGjT2qnfGEMKWOlEjCkh+VRn2xQq6gNR2bQOIu9s7c
 EA7s2todKqSzCTGe9AkUViYcT1SltXcAReLMfry5KdFyA0xTQcK9BzytVPA/r4nIL/yO
 Tjhg==
X-Gm-Message-State: AOAM533M0KB+5Dc9Z5QHClIFOsUH2g5aBV3nYYAFePVaOmRuVo8O+d12
 C7aLtKzBlREQrR/Gh+v61pSwKegOHUjrgUGkv8kg5gxAabqo1Eo1mN/F55+7U2u27H9vvKDIpEl
 4F/YLuzoz3mBU54w=
X-Received: by 2002:a05:6638:2501:b0:32b:6083:ca39 with SMTP id
 v1-20020a056638250100b0032b6083ca39mr3912391jat.281.1651540961335; 
 Mon, 02 May 2022 18:22:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmvPErjWEwVSNVYdoBUtZZGEnlTkz/S+NcdXfs4Dw/to/f6qswtBIuY+Zb5PqSDISwMgmTwQ==
X-Received: by 2002:a05:6638:2501:b0:32b:6083:ca39 with SMTP id
 v1-20020a056638250100b0032b6083ca39mr3912374jat.281.1651540960805; 
 Mon, 02 May 2022 18:22:40 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 5-20020a921805000000b002cde6e35306sm3004863ily.80.2022.05.02.18.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 18:22:40 -0700 (PDT)
Date: Mon, 2 May 2022 21:22:38 -0400
From: Peter Xu <peterx@redhat.com>
To: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Daniel Berrange <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PULL 06/11] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YnCD3np0E2hl5mOD@xz-m1.local>
References: <20220428144052.263382-1-dgilbert@redhat.com>
 <20220428144052.263382-7-dgilbert@redhat.com>
 <Ymq+5bPaYTyUHF6L@work-vm>
 <CAJ6HWG5Mm_O3NqkNkzBryj0nNhTRZWYxSTXKO_40=WbFUmzXAQ@mail.gmail.com>
 <YnBunLRaqmkZh3Re@xz-m1.local>
 <CAJ6HWG4r8p_K1WFCXgGrifKTVSHtm-vHES7NQ-A4U99bzv7_6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJ6HWG4r8p_K1WFCXgGrifKTVSHtm-vHES7NQ-A4U99bzv7_6w@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 02, 2022 at 09:12:53PM -0300, Leonardo Bras Soares Passos wrote:
> Hello Peter,
> 
> On Mon, May 2, 2022 at 8:52 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > Leo,
> >
> > On Fri, Apr 29, 2022 at 11:40:44PM -0300, Leonardo Bras Soares Passos wrote:
> > > Does anyone else have any further suggestions, or know how this kind of issue
> > > is generally solved in qemu?
> >
> > I've no solid idea why it can't see MSG_ZEROCOPY defined in the specific
> > environment, but when I was looking at bits/socket.h I saw this:
> >
> > #ifndef _SYS_SOCKET_H
> > # error "Never include <bits/socket.h> directly; use <sys/socket.h> instead."
> > #endif
> >
> > Maybe worth a shot to do a replacement in all cases?
> >
> 
> Sure, no problem with this, I will update for v11.
> (Or should I send a different patch since Dave has already merged in his tree?)
> 
> But it should not interfere in MSG_ZEROCOPY definition:
> 
> > > I tracked down how the test happened, downloaded the same docker image from the
> > > tests(opensuse-leap-15.2), and took a look at the filesystem for the
> > > MSG_ZEROCOPY define, which I could not find anywhere.
> 
> By this, I mean I did a 'grep MSG_ZEROCOPY -r /' and could not find anything, so
> it's probably not defined anywhere in the fs.

What you described gives me the feeling that the distro seems to have had
mismatched versions of asm-generic/socket.h (who should define
SO_ZEROCOPY), and bits/socket.h (who should define MSG_ZEROCOPY).

Let's first replace it with sys/socket.h, then one trick you could consider
play with (even if any env could have broken headers) that I thought of, is
you can put your code into:

#if defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY)
...
#endif

Blocks.  Just to avoid assuming CONFIG_LINUX will be the same.

-- 
Peter Xu


