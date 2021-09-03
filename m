Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262833FFF9A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 14:13:59 +0200 (CEST)
Received: from localhost ([::1]:47066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM850-00030c-78
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 08:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mM7t2-0000lF-38
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 08:01:36 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1mM7sw-0004Dn-3I
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 08:01:35 -0400
Received: by mail-wr1-x42a.google.com with SMTP id b10so7939665wru.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 05:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KLPYg3nOSYyFmv3AvUVzr80sNKqlmQnOURTungtyFI4=;
 b=0KQusaN8rq5KbChWENXwufOWGe65jmAugDns3VCXiplnbor9yfLfAzeamvKPsfN3q2
 0NHtS4peweTyJ6bAkWcgGESVvKYWN5LxR+K6PbFVSW2RHNTCxldO+5ElO8ReeZT0HWxz
 kX9QqlweeJhCTlG6i6iXFjMdZn+lCVkUC4oVfE/AByFiahj4th96xawwE1wNBOA+r+/u
 TZPHMqq5gS2psYzSByxHQjc4e1KgQ9XVajSEJctLV8sobtmClLt0JOZLADTinrMqHQ8Z
 vwCOl3grgpzf7+FgOXRX8a89tDWu4d4LKQYvq8W5QC6pRNTVOvR55Um4KwzdoJkcqcru
 2JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KLPYg3nOSYyFmv3AvUVzr80sNKqlmQnOURTungtyFI4=;
 b=ZG+tTn6sUtsCKlIWtSU5mFNaUABEzwgaATTou6GuKeSLVKEHxONRotddKS2Rnlx4dB
 6moEsOFarkbwSDvyrb97jt3vq8ubqX4PtaOkAO+9+5CMhKPicZYJWg0lOf4yEGgnSyrN
 pjD4/zSSHjpcSM+bAiZSWHkx81FtR8AnOi2Ot5WxktawkdsZaxbkK6QWI+Rer2AyntpH
 hEyMsgdkcwXUEzUPbCt94emO7kje8x9RHAnOxy0XYXHyUo6RGlDceSj+SsYbEDmEr5/g
 BEgifHyFk8HmcfVGYlEdJs7x1FJS4o51mPhNZtM4KExH7kY3URzIvaWOWxpX9vVsB+zr
 wWWw==
X-Gm-Message-State: AOAM532pm4LqdJOGqReb4fyYzGrb74Nf6P9rn2890w4q59g6Jw4kdQZg
 RuG86mUhjf52aIuRS0cNyOdTWw==
X-Google-Smtp-Source: ABdhPJw4n4OJy7i84agE7wQtp1wz87emt4excJLosG9/W0f2OLMMGOw//9a858BnVlJXbWgbS5u4CA==
X-Received: by 2002:adf:9d4c:: with SMTP id o12mr3650960wre.187.1630670488143; 
 Fri, 03 Sep 2021 05:01:28 -0700 (PDT)
Received: from leviathan (cpc92314-cmbg19-2-0-cust559.5-4.cable.virginm.net.
 [82.11.186.48])
 by smtp.gmail.com with ESMTPSA id d9sm5566022wrb.36.2021.09.03.05.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:01:27 -0700 (PDT)
Date: Fri, 3 Sep 2021 13:01:25 +0100
From: Leif Lindholm <leif@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v8 07/10] hw/arm/sbsa-ref: add ITS support in SBSA GIC
Message-ID: <20210903120125.meyyevqxphhumubp@leviathan>
References: <20210812165341.40784-1-shashi.mallela@linaro.org>
 <20210812165341.40784-8-shashi.mallela@linaro.org>
 <CAFEAcA9WVu+kjfCWwfGQV00yKgmdFDCSUpxNOu1BEBM3AZCWXg@mail.gmail.com>
 <20210902124258.mqjhx7lqqvkczf6a@leviathan>
 <CAFEAcA-HC1=arh_4ysPv2L1JyT6sA9n_1aqJv__1Z7+09kYxiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-HC1=arh_4ysPv2L1JyT6sA9n_1aqJv__1Z7+09kYxiA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 narmstrong@baylibre.com, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 13:51:26 +0100, Peter Maydell wrote:
> On Thu, 2 Sept 2021 at 13:43, Leif Lindholm <leif@nuviainc.com> wrote:
> > On Thu, Aug 19, 2021 at 14:27:19 +0100, Peter Maydell wrote:
> > > If you want a command line switch to let the user say whether the
> > > ITS should be present or not, you should use the same thing the
> > > virt board does, which is a bool property "its".
> > >
> > > If you want the sbsa-ref board to become a proper "versioned machine
> > > type" such that users can say "-M sbsa-ref-6.1" and get the SBSA
> > > board exactly as QEMU 6.1 supplied it, that looks completely different
> > > (and is a heavy back-compatibility burden, so needs discussion about
> > > whether now is the right time to do it), and probably is better not
> > > tangled up with this patchseries.
> >
> > Hmm. I mean, you're absolutely right about the complexity and need for
> > discussion. My concern is that we cannot insert the ITS block in the
> > memory map where it would be in an ARM GIC implementation without
> > changing the memory map (pushing the redistributor further down).
> >
> > It is also true that simply versioning sbsa-ref does not mean we end
> > up with a properly aligned with ARM IP register frame layout. Some
> > additional logic is required for that.
> >
> > If we assume that we don't want to further complicate this set by
> > adding the additional logic *now*, I see three options:
> > - Implement memory map versioning for sbsa-ref for this set, placing
> >   the ITS (if enabled) directly after the DIST for sbsa-ref-6.2.
> > - In this set, place the ITS frames in a different location relative
> >   to the REDIST frames than it will end up once the further logic is
> >   implemented.
> > - Drop the sbsa-ref ITS support from this set, and bring it in with
> >   the set implementing the additional logic.
> 
> I don't think implementing versioned machine types helps you much
> anyway, because your users are all going to be currently using
> -M sbsa-ref, so they will by default see the change in device layout.
> 
> I do think that we should get the "with an ITS" device layout right
> from the start, so that we're only dealing with 2 possibilities
> (what we have today, and the final intended layout), not 3 (today,
> final layout, some intermediate thing).
> 
> How does guest software on this board figure out the memory
> layout ? Is there a mechanism for telling it "this is version 2
> of this board" ?

Not currently. Aiming to look like most SBSA platforms, it is
hard-wired, and firmware passes that information to the os.

This is the kind of thing I eventually want to do using a PV-model
SCP. As a stop-gap, we could push it through the DT, like we do for
cpus and memory?

/
    Leif

