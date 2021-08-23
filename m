Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 980153F4AAC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 14:31:26 +0200 (CEST)
Received: from localhost ([::1]:32774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI96r-0007NC-Je
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 08:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mI92G-0003Db-2M
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 08:26:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mI92B-0003ra-M9
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 08:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629721592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RJ0AqHRn6/2wVuM6tXEF47SarvthZwWj7KBw4eo8LnU=;
 b=KPOK/ZLHQq6ed4w4BT7cTdLfU/vl+Dz8/nRp97rsC9hxnIuBobGrE1Ala0pX0OEwRKoQ5p
 YgFeB+gEAiDXwvhKPL3dOjAfq61PEPKQE/x7+HDqytJg4sdTtJmCE57EAqrCiwKJwgKK6j
 5XBuukIx1x1PVZAY/qCXbIZ1vrpg3HI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-R3fHa-9YNFOCTbkUeyvhNg-1; Mon, 23 Aug 2021 08:26:31 -0400
X-MC-Unique: R3fHa-9YNFOCTbkUeyvhNg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so8400528wml.5
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 05:26:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RJ0AqHRn6/2wVuM6tXEF47SarvthZwWj7KBw4eo8LnU=;
 b=i5QcEipGDZGzmWFCe8IkVIaJ3U2sGX5kA1y9fBTiDMZwhI+ZaLtxMwE8ow5wJZ1peD
 TSdy+lQlXSflm0iBGyNPvr/m4VjgH2WhrkYHpcy9MzPsaVxYw/ISr1Wy5KnaYAJeRf18
 SWaXGegGOuVrz0pw6ya78CRNN1NUo+v3fzPP1qEuOfWWc7l/j84Nk+LfgTjOFSTkeE/0
 DTlwMy/PF3gSAgYidyJD7fGlz5ipewB904WuVIpZZVm3cLTL0NQCIOzFgmO8aBFTIltK
 IsjKV6msWQdSG4Y4DvSqhZ1fCW2/nKman7I9yotvwWwKFxxdOy8EXThxCQoHk1sXnCGm
 3mLQ==
X-Gm-Message-State: AOAM532zfNZi0vEooKkEJAyChZ7FdRgr0CEv+RIxUtTbqbo1VJ0+68km
 0Gpqll8le1OUGo6UgyaqaNxE4Ttft1skJQmdpbRoJ0gaEwAX9ztbpcq1nXmumZMLhG5z07FUOhB
 6VxDYTdoNoC7Ls4Y=
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr10147552wmk.51.1629721590054; 
 Mon, 23 Aug 2021 05:26:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWLrdzq7RAAw59P7YJ7wuwSOMa04Vxu2eLXc27mIUEoBjuTzPG0WAOjZHpS1Vxxbr90mRAOw==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr10147527wmk.51.1629721589816; 
 Mon, 23 Aug 2021 05:26:29 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id l12sm12703907wms.24.2021.08.23.05.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 05:26:29 -0700 (PDT)
Date: Mon, 23 Aug 2021 13:26:27 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YSOT87eg4UjCG+jG@work-vm>
References: <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <37796fd1-bbc2-f22c-b786-eb44f4d473b9@linux.ibm.com>
 <CABayD+evf56U4yT2V1TmEzaJjvV8gutUG5t8Ob2ifamruw5Qrg@mail.gmail.com>
 <458ba932-5150-8706-3958-caa4cc67c8e3@linux.ibm.com>
 <YR1ZvArdq4sKVyTJ@work-vm>
 <c1d8dbca-c6a9-58da-6f95-b33b74e0485a@linux.ibm.com>
 <YR4U11ssVUztsPyx@work-vm>
 <538733190532643cc19b6e30f0eda4dd1bc2a767.camel@linux.ibm.com>
 <YR5qka5aoJqlouhO@work-vm>
 <d6eb8f7ff2d78296b5ba3a20d1dc9640f4bb8fa5.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <d6eb8f7ff2d78296b5ba3a20d1dc9640f4bb8fa5.camel@linux.ibm.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
> On Thu, 2021-08-19 at 15:28 +0100, Dr. David Alan Gilbert wrote:
> > * James Bottomley (jejb@linux.ibm.com) wrote:
> > > On Thu, 2021-08-19 at 09:22 +0100, Dr. David Alan Gilbert wrote:
> [...]
> > > > I think it really does have to cope with migration to a new
> > > > version of host.
> > > 
> > > Well, you're thinking of OVMF as belonging to the host because of
> > > the way it is supplied, but think about the way it works in
> > > practice now, forgetting about confidential computing: OVMF is RAM
> > > resident in ordinary guests, so when you migrate them, the whole of
> > > OVMF (or at least what's left at runtime) goes with the migration,
> > > thus it's not possible to change the guest OVMF by migration.  The
> > > above is really just an extension of that principle, the only
> > > difference for confidential computing being you have to have an
> > > image of the current OVMF ROM in the target to seed migration.
> > > 
> > > Technically, the problem is we can't overwrite running code and
> > > once the guest is re-sited to the target, the OVMF there has to
> > > match exactly what was on the source for the RT to still
> > > function.   Once the migration has run, the OVMF on the target must
> > > be identical to what was on the source (including internally
> > > allocated OVMF memory), and if we can't copy the MH code, we have
> > > to rely on the target image providing this identical code and we
> > > copy the rest.
> > 
> > I'm OK with the OVMF now being part of the guest image, and having to
> > exist on both; it's a bit delicate though unless we have a way to
> > check it (is there an attest of the destination happening here?)
> 
> There will be in the final version.  The attestations of the source and
> target, being the hash of the OVMF (with the registers in the -ES
> case), should be the same (modulo any firmware updates to the PSP,
> whose firmware version is also hashed) to guarantee the OVMF is the
> same on both sides.  We'll definitely take an action to get QEMU to
> verify this ... made a lot easier now we have signed attestations ...

Hmm; I'm not sure you're allowed to have QEMU verify that - we don't
trust it; you need to have either the firmware say it's OK to migrate
to the destination (using the existing PSP mechanism) or get the source
MH to verify a quote from the destination.

[Somewhere along the line, if you're not using the PSP, I think you also
need to check the guest policy to check it is allowed to migrate].

Dave

> James
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


