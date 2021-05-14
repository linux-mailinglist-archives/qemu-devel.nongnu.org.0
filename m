Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 751CB3801B4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 04:04:49 +0200 (CEST)
Received: from localhost ([::1]:41352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhNC4-0006Uw-48
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 22:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oohall@gmail.com>)
 id 1lhNAk-0005fS-Q9; Thu, 13 May 2021 22:03:26 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:39731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <oohall@gmail.com>)
 id 1lhNAh-00035g-Rg; Thu, 13 May 2021 22:03:26 -0400
Received: by mail-qt1-x832.google.com with SMTP id f8so17125870qth.6;
 Thu, 13 May 2021 19:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sb005f6h40hAINTAij9I/IdfLbUnP3jIAjuFRxXjDyc=;
 b=pLqIOUYFHwXdXcpZKVXimdEVXoj5SbjHFGSAn3duClSgyrEWl5oKScGhWpLXHt2+SS
 VaG2o94/oF5gIIo9V6WIhzB5b4Av34zx5UdRrnqU2FPP9OitEVX/NZ6JlO1WXDla7c8a
 kcNYssxta6LgTJ4VkD8kw9YiLnNiQxs/Rhy0BHSANgrVhsxYKdHqHCfy/DWvkSSywDQd
 1JgpEm5Cwb2fK6mFI/6VGqehr80muxqRW23M2W/BLmn3Fa7z1uqcgf9gn8yZLMoR4BEs
 3CbUiMiCd5r2swGRI2h35Dyf6JYnu0CANq6tecPoyZwVtDdVGIHsBg9BRoJb9JtSHChp
 mceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sb005f6h40hAINTAij9I/IdfLbUnP3jIAjuFRxXjDyc=;
 b=OzBfQ6JBRG+TlWnyXhZxxGKCpmWs2nTRYW6A4Qx9zpvfzMDnIUdtIME2M3GFaEHaUq
 ld9JvB5oZB7ZECJ1fVg9LY4LQmhY0/E9IKpBhoxLZKyZDIkNZJIgaU6pJwCMn7WTjwXI
 mmoH59eEdexiVNqJ1QHr2poaIdSsHaBvvqxCUUHm/kQm/LmwJhGNqB2b6sX9A4rePt3g
 UWYxu3P6LFWn3KYMKYoeYNmju8gwGOYCNPFiLpdH+k7oHSOYsN4MtiOnNYjCFg/ndAXW
 mlfoyNOiJyE5jiS8hSNzwviXHbDRqwU+G/oedM2hJX/cdUj5sxZUxgZV+GRklD+RvRY/
 Zvew==
X-Gm-Message-State: AOAM533hl7mcNi9ZsuoNaU92aX8jnxBtXYweOeDkT6NSNRD1JpyGLX3n
 rI1EZmuMoTyGBtfrg9hZMBqLFJrhh2GPhSIWnMs=
X-Google-Smtp-Source: ABdhPJxEQcRe2FVAN4uKZYPcTuE3sduAC6JbO7xMVxwBqiq/s+kevAhGBc+f2387Iq/cjXACOXiGGJ8QIdy8MXJ3Kgk=
X-Received: by 2002:a05:622a:10a:: with SMTP id
 u10mr40896160qtw.240.1620957801730; 
 Thu, 13 May 2021 19:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <162022601665.118720.1424074431457537864.stgit@jupiter>
 <YJyYI8HDTy5eYrnq@yekko>
In-Reply-To: <YJyYI8HDTy5eYrnq@yekko>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 14 May 2021 12:03:10 +1000
Message-ID: <CAOSf1CFNkfAz7=fiMUm+w9TGWmF8uQBsVJsP7yjjmdQ_Hzqidg@mail.gmail.com>
Subject: Re: [PATCH updated v2] spapr: Fix EEH capability issue on KVM guest
 for PCI passthru
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=oohall@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Qemu-ppc <qemu-ppc@nongnu.org>, Qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 13, 2021 at 2:22 PM David Gibson
<david@gibson.dropbear.id.au> wrote:
>
> On Wed, May 05, 2021 at 08:18:27PM +0530, Mahesh Salgaonkar wrote:
> > With upstream kernel, especially after commit 98ba956f6a389
> > ("powerpc/pseries/eeh: Rework device EEH PE determination") we see that KVM
> > guest isn't able to enable EEH option for PCI pass-through devices anymore.
> >
> > [root@atest-guest ~]# dmesg | grep EEH
> > [    0.032337] EEH: pSeries platform initialized
> > [    0.298207] EEH: No capable adapters found: recovery disabled.
> > [root@atest-guest ~]#
> >
> > So far the linux kernel was assuming pe_config_addr equal to device's
> > config_addr and using it to enable EEH on the PE through ibm,set-eeh-option
> > RTAS call. Which wasn't the correct way as per PAPR. The linux kernel
> > commit 98ba956f6a389 fixed this flow. With that fixed, linux now uses PE
> > config address returned by ibm,get-config-addr-info2 RTAS call to enable
> > EEH option per-PE basis instead of per-device basis. However this has
> > uncovered a bug in qemu where ibm,set-eeh-option is treating PE config
> > address as per-device config address.
>
> Huh.  To be fair, the stuff about this in PAPR is nearly
> incomprehensible, so we probably used what the kernel was doing as a
> guide instead.

I found the PAPR documentation made some sense after I learned how EEH
was handled on PCI(-X) systems. What's in Linux never made sense,
unfortunately.

> Hmm.. shouldn't we at least check that the supplied config_addr
> matches the one it should be for this PHB, rather than just ignoring
> it?

I think that'd cause issues with older kernels. Prior to the rework
mentioned by Mahesh (linux commit 98ba956f6a389 ("powerpc/pseries/eeh:
Rework device EEH PE determination")) the kernel would call
eeh-set-option for each device in the PE using the device's
config_address as the argument rather than the PE address. If we
return an error from eeh-set-option when the argument isn't a valid PE
address then older kernels will interpret that as EEH not being
supported. That really needs to be called out in a comment though.
Preferably with kernel version numbers, etc.

> ..and, looking back at rtas_ibm_get_config_addr_info2(), I think
> that looks wrong in the case of PCI bridges.  AFAICT it gives an
> address that depends on the bus, but in other places we assume that
> the entire PHB is a single PE on the guest side, so it really
> shouldn't.

Yep, get_config_addr_info2 should map every device inside that PE to
the same PE address, even when they're on child busses. That said, I'm
not sure how well EEH works when there's a mix of real (vfio) and
emulated (qemu bridges) devices in the same PHB. Can VFIO pass through
a bridge?

