Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DD13F1B9D
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 16:30:47 +0200 (CEST)
Received: from localhost ([::1]:54578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGj4A-0007ch-NV
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 10:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGj29-0005SX-9M
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:28:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGj27-0004Of-9u
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 10:28:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629383318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T5Fh0vjXWScKycfJq4B6wgoJybSBRWcWCsIYN/VXpLo=;
 b=bD/wQyS9Plcgn4XW5GV5H5jf89cF3vUFe7CWs5y2vF6/LJ4IrZ+kU0RDENaOs1KSry4+qi
 t1EdprF7aRr0jgWEhsvhK6PDTh46zUywUxMkwrvJxlTR3x911kQgloWV6E9ctYe3NgWDGn
 9d5eEMUwwEBbBjg3QEiz4MdCjrxUOu8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-JPO2wuHzMxSPBPcTM1QItA-1; Thu, 19 Aug 2021 10:28:37 -0400
X-MC-Unique: JPO2wuHzMxSPBPcTM1QItA-1
Received: by mail-wm1-f72.google.com with SMTP id
 b196-20020a1c80cd0000b02902e677003785so3554745wmd.7
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 07:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=T5Fh0vjXWScKycfJq4B6wgoJybSBRWcWCsIYN/VXpLo=;
 b=ZCUqDXAhfHJpIpHr1p14vHEYPix0BJNvFTkno3NI+qpDYlky+4x95RAqUHkqtlhE2X
 2WI29IdV8+vj89NH+gGBbM8NoyczbNDkmaH4v4lOMoif7KPENi73MsOefmb9DhVN0+7Y
 dGdwPsng8+5PHSyVGj09KJ6+ZVKr8petS7i9R9BkeDmSaU1JcaKTt6e1pcWCxhOtPUgu
 V9PKNC7Uj+6j/mXk/+6NwKfQDr17D1/5zt43gWNRL45C0Vw883fIiWWRGdtkrUqveBHl
 RM0QCD53OjJ4Zt/IC4uPGXr6VAgVI1dF3gyQg5KfehIy6WoM9r2Ntp1FZg/B0S/MY81J
 o4Xw==
X-Gm-Message-State: AOAM533UvlBjRGJqoilnbOiF0Gpz8kNLSf+VpGENGLQry8zUk6xytnJe
 +r93V2QZPzXLgH0fTXRfwn0D/PtGBpZaxMBTkvQE7wGibHj6YnYxCZDtURA40YX93HJ+Rc4CD+G
 1JG73AMTpuVL19AE=
X-Received: by 2002:adf:9063:: with SMTP id h90mr4359377wrh.121.1629383316084; 
 Thu, 19 Aug 2021 07:28:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5BdZPD0p50QwmyWtpFISXnLDJIPMjDj5lkkZWFYj9AeSh/rs/TEqEYF/99+Jc01HnzN8azA==
X-Received: by 2002:adf:9063:: with SMTP id h90mr4359351wrh.121.1629383315881; 
 Thu, 19 Aug 2021 07:28:35 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id s13sm7874559wmc.47.2021.08.19.07.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 07:28:35 -0700 (PDT)
Date: Thu, 19 Aug 2021 15:28:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YR5qka5aoJqlouhO@work-vm>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
 <CABayD+evf56U4yT2V1TmEzaJjvV8gutUG5t8Ob2ifamruw5Qrg@mail.gmail.com>
 <458ba932-5150-8706-3958-caa4cc67c8e3@linux.ibm.com>
 <YR1ZvArdq4sKVyTJ@work-vm>
 <c1d8dbca-c6a9-58da-6f95-b33b74e0485a@linux.ibm.com>
 <YR4U11ssVUztsPyx@work-vm>
 <538733190532643cc19b6e30f0eda4dd1bc2a767.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <538733190532643cc19b6e30f0eda4dd1bc2a767.camel@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <Ashish.Kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, Steve Rutherford <srutherford@google.com>,
 richard.henderson@linaro.org, tobin@ibm.com, qemu-devel@nongnu.org,
 frankeh@us.ibm.com, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* James Bottomley (jejb@linux.ibm.com) wrote:
> On Thu, 2021-08-19 at 09:22 +0100, Dr. David Alan Gilbert wrote:
> > * Tobin Feldman-Fitzthum (tobin@linux.ibm.com) wrote:
> > > On 8/18/21 3:04 PM, Dr. David Alan Gilbert wrote:
> > > > * Tobin Feldman-Fitzthum (tobin@linux.ibm.com) wrote:
> > > > > On 8/17/21 6:04 PM, Steve Rutherford wrote:
> > > > > > Ahh, It sounds like you are looking into sidestepping the
> > > > > > existing AMD-SP flows for migration. I assume the idea is to
> > > > > > spin up a VM on the target side, and have the two VMs attest
> > > > > > to each other. How do the two sides know if the other is
> > > > > > legitimate? I take it that the source is directing the LAUNCH
> > > > > > flows?
> > > > >  
> > > > > Yeah we don't use PSP migration flows at all. We don't need to
> > > > > send the MH code from the source to the target because the MH
> > > > > lives in firmware, which is common between the two.
> > > >  
> > > > Are you relying on the target firmware to be *identical* or
> > > > purely for it to be *compatible* ?  It's normal for a migration
> > > > to be the result of wanting to do an upgrade; and that means the
> > > > destination build of OVMF might be newer (or older, or ...).
> > > > 
> > > > Dave
> > > 
> > > This is a good point. The migration handler on the source and
> > > target must have the same memory footprint or bad things will
> > > happen. Using the same firmware on the source and target is an easy
> > > way to guarantee this. Since the MH in OVMF is not a contiguous
> > > region of memory, but a group of functions scattered around OVMF,
> > > it is a bit difficult to guarantee that the memory footprint is the
> > > same if the build is different.
> > 
> > Can you explain what the 'memory footprint' consists of? Can't it
> > just be the whole of the OVMF rom space if you have no way of nudging
> > the MH into it's own chunk?
> 
> It might be possible depending on how we link it. At the moment it's
> using the core OVMF libraries, but it is possible to retool the OVMF
> build to copy those libraries into the MH DXE.
> 
> > I think it really does have to cope with migration to a new version
> > of host.
> 
> Well, you're thinking of OVMF as belonging to the host because of the
> way it is supplied, but think about the way it works in practice now,
> forgetting about confidential computing: OVMF is RAM resident in
> ordinary guests, so when you migrate them, the whole of OVMF (or at
> least what's left at runtime) goes with the migration, thus it's not
> possible to change the guest OVMF by migration.  The above is really
> just an extension of that principle, the only difference for
> confidential computing being you have to have an image of the current
> OVMF ROM in the target to seed migration.
> 
> Technically, the problem is we can't overwrite running code and once
> the guest is re-sited to the target, the OVMF there has to match
> exactly what was on the source for the RT to still function.   Once the
> migration has run, the OVMF on the target must be identical to what was
> on the source (including internally allocated OVMF memory), and if we
> can't copy the MH code, we have to rely on the target image providing
> this identical code and we copy the rest.

I'm OK with the OVMF now being part of the guest image, and having to
exist on both; it's a bit delicate though unless we have a way to check
it (is there an attest of the destination happening here?)

Dave

> James
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


