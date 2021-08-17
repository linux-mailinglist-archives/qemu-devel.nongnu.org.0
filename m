Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EF03EE8B0
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 10:39:23 +0200 (CEST)
Received: from localhost ([::1]:48776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFud0-0002LQ-6p
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 04:39:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mFucE-0001fN-Dh
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mFucC-0005X6-5p
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 04:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629189510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eDWfLkSlN5DDr5opaCR8xv3o2o1Sobcn9RZQwO1xe0w=;
 b=CIpKWt5kmNqxNa4Dfdk9EVZbCKtf5jWn6joj6UxeIvmXcTlw6Co02xMvo5+41+wuj3pd3J
 xj9+ruWBmqOXKrKlkDxMRpqMyd4aUclhOJgk+AwfgwHjW8joEDHPUgbSPMn4spbW/PzaD+
 arGl8Q8Ejri24O18f184czTUStyuFNc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-J_MyzRzyOo6ECKbQzm0bPw-1; Tue, 17 Aug 2021 04:38:29 -0400
X-MC-Unique: J_MyzRzyOo6ECKbQzm0bPw-1
Received: by mail-wr1-f70.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so6294909wri.17
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 01:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eDWfLkSlN5DDr5opaCR8xv3o2o1Sobcn9RZQwO1xe0w=;
 b=jTC2qjxKJaooNsLMixQcgEJLnlf7wojrHKJm0PTGzxd6a0+9TwlMw/rhD6oHXd2mJf
 64AsffDXV6K3tC7eqPLF3AH6ob3hvMzUv2sS6z4OIgPZxXZHgzqPeKXN76XfO24ooPhE
 xU/oynr9/FG2G/iw0haujsQrvq60F9Ie6668ph2Sxve1y6wSmJGsJFhcK/+x3cgEvOVk
 oMaP0hjcgScDp+9etHmOhQWucm4XieZYz8fgP4+6se2g5npv+NWPmJSTo5npklK50Og2
 nPg48033t92UnTA2f15rOx1klGj2a82OX34PwZuqszax8ruADfAX0ml0z4je3fpQRsXR
 EIxA==
X-Gm-Message-State: AOAM532l9oyayIAeCaLWSYrCz1Qq6LYxCZHPlb40TRooMQvU8kZnioCF
 ctqfBuTMQ6HsIdXu8/NfzcnX3VWqP5sgq55qTQH/bSjcHURvljuAM3Xh3TIEYZJPjU2ayIhHrzG
 WAB8NIkomxI9w9VY=
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr2122165wmh.183.1629189508615; 
 Tue, 17 Aug 2021 01:38:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+YpRik/WyLFBLP4xcBgcpRcSDNfmkGkGXHwJ7qRlbex/gulPHUcjqsHpYHd2a0ODIBd3tbQ==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr2122136wmh.183.1629189508377; 
 Tue, 17 Aug 2021 01:38:28 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id p6sm1614133wrw.50.2021.08.17.01.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 01:38:26 -0700 (PDT)
Date: Tue, 17 Aug 2021 09:38:24 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Steve Rutherford <srutherford@google.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YRt1gHThNWvRzUF8@work-vm>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
 mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, frankeh@us.ibm.com,
 dovmurik@linux.vnet.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Steve Rutherford (srutherford@google.com) wrote:
> On Mon, Aug 16, 2021 at 6:37 AM Ashish Kalra <Ashish.Kalra@amd.com> wrote:
> >
> > From: Ashish Kalra <ashish.kalra@amd.com>
> >
> > This is an RFC series for Mirror VM support that are
> > essentially secondary VMs sharing the encryption context
> > (ASID) with a primary VM. The patch-set creates a new
> > VM and shares the primary VM's encryption context
> > with it using the KVM_CAP_VM_COPY_ENC_CONTEXT_FROM capability.
> > The mirror VM uses a separate pair of VM + vCPU file
> > descriptors and also uses a simplified KVM run loop,
> > for example, it does not support any interrupt vmexit's. etc.
> > Currently the mirror VM shares the address space of the
> > primary VM.
> Sharing an address space is incompatible with post-copy migration via
> UFFD on the target side. I'll be honest and say I'm not deeply
> familiar with QEMU's implementation of post-copy, but I imagine there
> must be a mapping of guest memory that doesn't fault: on the target
> side (or on both sides), the migration helper will need to have it's
> view of guest memory go through that mapping, or a similar mapping.

Ignoring SEV, our postcopy currently has a single mapping which is
guarded by UFFD. There is no 'no-fault' mapping.  We use the uffd ioctl
to 'place' a page into that space when we receive it.
But yes, I guess that can't work with SEV; as you say; if the helper
has to do the write, it'll have to do it into a shadow that it can write
to, even though the rest of th e guest must UF on access.

> Separately, I'm a little weary of leaving the migration helper mapped
> into the shared address space as writable. Since the migration threads
> will be executing guest-owned code, the guest could use these threads
> to do whatever it pleases (including getting free cycles)a

Agreed.

> . The
> migration helper's code needs to be trusted by both the host and the
> guest. 


> Making it non-writable, sourced by the host, and attested by
> the hardware would mitigate these concerns.

Some people worry about having the host supply the guest firmware,
because they worry they'll be railroaded into using something they
don't actually trust, and if there aim of using SEV etc is to avoid
trusting the cloud owner, that breaks that.

So for them, I think they want the migration helper to be trusted by the
guest and tolerated by the host.

> The host could also try to
> monitor for malicious use of migration threads, but that would be
> pretty finicky.  The host could competitively schedule the migration
> helper vCPUs with the guest vCPUs, but I'd imagine that wouldn't be
> the best for guest performance.

The CPU usage has to go somewhere.

Dave

> 
> --Steve
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


