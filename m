Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E8C3C5EAD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:59:05 +0200 (CEST)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xOi-0003du-6S
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1m2xMj-0000Ps-Hs
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:57:01 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <seanjc@google.com>) id 1m2xMg-0002Wo-5W
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:57:01 -0400
Received: by mail-pg1-x535.google.com with SMTP id 37so18538230pgq.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=da9YFZ8w4iQ7cuBpy6e9jMfk2ppUfoMBxT36y+4Eyto=;
 b=PKeqwZbrE/w8FnjCInlH/sNZoVF97TNvSrvd4nbBaK8I+tYOkM1WjD0lr/uHcSFPJ2
 p4tgC9BrH0cFBtwQuoSEmwKg3epdyJIq2jumXzZhwChtqefkgPrhmzSgiCKhbX4IzWWz
 OAEo+LgCkvSbPFMCeSpMKkCzvddK6R/Y4A6HdOsWEWUUy3AIE2MbVhkzeMYjrWx5PM82
 0bcarO6FapHPhS4sQChMX1hLUtu1iPeSajmhkr3uHputOS08+Dnt85MUSKXpPKQvSIBU
 izLq6u/33iUX/UDYY+BM2u7IS/vbzJ3K8+fz/JUmYk/FhPNPSV5/jStRG5SR41UJyFnB
 MJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=da9YFZ8w4iQ7cuBpy6e9jMfk2ppUfoMBxT36y+4Eyto=;
 b=k6H44VLTWR5GlYeeJ12H+gzSTXs9ENHp3X673EFTt43FrutAiigUdJL6C9ktr3mmEn
 aoc03OMCynq3oW0UYOWpxKiOlfrNfN3K7jhr/autj6Ukx20jVPUhinMoZHwg9GxbEp1L
 UDzSk0R8IGfI73GGgFIZYhVElSENhelkHwQ1KbSDHG7Hutk1o4+uh5CELWf0bk4Qx6wN
 TLFHwwb475uvOZAp+yC3wZhpM+1fhf9R5+SV49unuGF4Jxv8jHXnEHV/xzBBvO0cRGGG
 cCIGAMULThhYksdNB5BUWDUi9e8/J+xjtCwysPoDQ9ZDMQZgCx5iS0JDtFcBTdCLHNH0
 z3bg==
X-Gm-Message-State: AOAM533Jg11Qnbl/zmqINa22nBaLG+VL4tI9io57WSYYBNGG9B/sO5CW
 5IeWOSEMwLmWx7Lsw9w8+eTrJw==
X-Google-Smtp-Source: ABdhPJzjutMX49/wfvR1agCTShyAh3oavFQQjgaaPpBxtcRrEHwNk+KJvyUXehMTP7oJehqrXiBUig==
X-Received: by 2002:a63:655:: with SMTP id 82mr22247880pgg.133.1626101815721; 
 Mon, 12 Jul 2021 07:56:55 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id v69sm12937506pfc.118.2021.07.12.07.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:56:54 -0700 (PDT)
Date: Mon, 12 Jul 2021 14:56:51 +0000
From: Sean Christopherson <seanjc@google.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: harry harry <hiharryharryharry@gmail.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, stefanha@redhat.com,
 mathieu.tarral@protonmail.com
Subject: Re: About two-dimensional page translation (e.g., Intel EPT) and
 shadow page table in Linux QEMU/KVM
Message-ID: <YOxYM+8qCIyV+rTJ@google.com>
References: <CA+-xGqNUX4dpzFV7coJSoJnPz6cE5gdPy1kzRKsQtGD371hyEg@mail.gmail.com>
 <d79db3d7c443f392f5a8b3cf631e5607b72b6208.camel@redhat.com>
 <CA+-xGqOdu1rjhkG0FhxfzF1N1Uiq+z0b3MBJ=sjuVStHP5TBKg@mail.gmail.com>
 <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d95d40428ec07ee07e7c583a383d5f324f89686a.camel@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=seanjc@google.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -146
X-Spam_score: -14.7
X-Spam_bar: --------------
X-Spam_report: (-14.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=2.896, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021, Maxim Levitsky wrote:
> On Mon, 2021-07-12 at 08:02 -0500, harry harry wrote:
> > Dear Maxim,
> > 
> > Thanks for your reply. I knew, in our current design/implementation,
> > EPT/NPT is enabled by a module param. I think it is possible to modify
> > the QEMU/KVM code to let it support EPT/NPT and show page table (SPT)
> > simultaneously (e.g., for an 80-core server, 40 cores use EPT/NPT and
> > the other 40 cores use SPT). What do you think? Thanks!
> > 
> > Best regards,
> > Harry
> > 
> > On Mon, Jul 12, 2021 at 4:49 AM Maxim Levitsky <mlevitsk@redhat.com> wrote:
> > > On Sun, 2021-07-11 at 15:13 -0500, harry harry wrote:
> > > > Hi all,
> > > > 
> > > > I hope you are very well! May I know whether it is possible to enable
> > > > two-dimensional page translation (e.g., Intel EPT) mechanisms and
> > > > shadow page table mechanisms in Linux QEMU/KVM at the same time on a
> > > > physical server? For example, if the physical server has 80 cores, is
> > > > it possible to let 40 cores use Intel EPT mechanisms for page
> > > > translation and the other 40 cores use shadow page table mechanisms?
> > > > Thanks!
> > > 
> > > Nope sadly. EPT/NPT is enabled by a module param.
> > >
> For same VM, I don't think it is feasable.

Heh, because the MMUs are all per-vCPU, it actually wouldn't be that much effort
beyond supporting !TDP and TDP for different VMs...

> For multiple VMs make some use NPT/EPT and some don't,
> this should be possible to implement.

...but supporting !TDP and TDP in a single KVM instance isn't going to happen.
It's certainly possible, but comes with a very high complexity cost, and likely
even performance costs.

The more sane way to support !TDP and TDP on a single host would be to support
multiple instances of KVM, e.g. /dev/kvm0, /dev/kvm1, etc...  Being able to use
!TDP and TDP isn't strong justification for the work required, but supporting
multiple KVM instances would allow upgrading KVM without having to migrate VMs
off the host, which is very desirable.  If multiple KVM instances are supported,
running !TDP and TDP KVM instances should Just Work.

