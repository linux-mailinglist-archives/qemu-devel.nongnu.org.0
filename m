Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4566A3F0845
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 17:45:25 +0200 (CEST)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGNkp-0000Zo-Qg
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 11:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGNjA-0008IE-IR
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 11:43:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGNj7-0001Oh-B5
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 11:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629301416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L9XsdG57Mi9fqdOK1OUJnUMTmL7H16XFYw0UC4znLZo=;
 b=iGzVDxMQweAQdUv8GoNRUN47jwB1jGuBw5ls3vbKKDSQ3cp6nmviDSQsYnLD38zTB2ez2P
 OYof/aSLROIaxFmgdz32N9fvGsIbFE9jVBzsytztbq5GuEsqxl17h3xaG11JSNo7E2+i5T
 9d3yVQhwaWGqyTR7GpT30fh7oPQAWgg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-XMssy75-OkKugQF7HdSqpQ-1; Wed, 18 Aug 2021 11:43:33 -0400
X-MC-Unique: XMssy75-OkKugQF7HdSqpQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso716817wrw.22
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 08:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=L9XsdG57Mi9fqdOK1OUJnUMTmL7H16XFYw0UC4znLZo=;
 b=UfLWSpPuIsyt0znHx1OnPcKHb+Bol29ep2VRr6IY5DAikkOKbTJY3IAZ5FkpNUf2ay
 XqSkJBq/9G/WKXIYaGlT1Yk4Z9/Gci8F+KGZqzwqTC4Fs0PEwu8N3ZSF79EhpAl9eBKY
 H/TQk+uRqkNmjf2wjlUOiO+yNNe/c9hoyBU6xLJ6jzVN2E8+tE95ZQGmzUg4azKuyWTK
 gDuD/VMjZWS3pAuv2OXW/SOQze5trTwVY+x1IzbstTyOeMFr6JkZiUsOYIa6Hhxi8nq3
 Q3lRgmVEvkD90UV8nc0xFeW8g2d9lGuzU6WT4sQaTKdImkjViGMcoWoKxO8HaAUFLRFk
 cCEg==
X-Gm-Message-State: AOAM531KGDcOOacIU0PIHCvF0Q95aNRc/ApOJneFTK7lM/uGPDUlTwdS
 anJv8MJK0rK+MfG1J0vZRuRwHZjQhVwbASsOT+hPqPTAy1lsaKcyaCpD4pCzLrWZfRyc7PnOQ3z
 LHRPoVruYvLf21Mw=
X-Received: by 2002:a5d:674b:: with SMTP id l11mr11356182wrw.357.1629301412215; 
 Wed, 18 Aug 2021 08:43:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0QLznTozFHj6dO5NFZppXGV148A/UjiKNLlJKdwsUvNNAdEIUrsiMCURfRCpVi7cNzBvvMw==
X-Received: by 2002:a5d:674b:: with SMTP id l11mr11356149wrw.357.1629301411981; 
 Wed, 18 Aug 2021 08:43:31 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id b10sm228285wrn.9.2021.08.18.08.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 08:43:31 -0700 (PDT)
Date: Wed, 18 Aug 2021 16:43:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YR0qoV6tDuVxddL5@work-vm>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
 <20210816144413.GA29881@ashkalra_ubuntu_server>
 <b25a1cf9-5675-99da-7dd6-302b04cc7bbc@redhat.com>
 <20210816151349.GA29903@ashkalra_ubuntu_server>
 <f7cf142b-02e4-5c87-3102-f3acd8b07288@redhat.com>
 <20210818103147.GB31834@ashkalra_ubuntu_server>
 <f0b5b725fc879d72c702f88a6ed90e956ec32865.camel@linux.ibm.com>
 <YR0nwVPKymrAeIzV@work-vm>
 <8ae11fca26e8d7f96ffc7ec6353c87353cadc63a.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <8ae11fca26e8d7f96ffc7ec6353c87353cadc63a.camel@linux.ibm.com>
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
Cc: thomas.lendacky@amd.com, Ashish Kalra <ashish.kalra@amd.com>,
 brijesh.singh@amd.com, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, tobin@ibm.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, frankeh@us.ibm.com, dovmurik@linux.vnet.ibm.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* James Bottomley (jejb@linux.ibm.com) wrote:
> On Wed, 2021-08-18 at 16:31 +0100, Dr. David Alan Gilbert wrote:
> > * James Bottomley (jejb@linux.ibm.com) wrote:
> > > On Wed, 2021-08-18 at 10:31 +0000, Ashish Kalra wrote:
> > > > Hello Paolo,
> > > > 
> > > > On Mon, Aug 16, 2021 at 05:38:55PM +0200, Paolo Bonzini wrote:
> > > > > On 16/08/21 17:13, Ashish Kalra wrote:
> > > > > > > > I think that once the mirror VM starts booting and
> > > > > > > > running the UEFI code, it might be only during the PEI or
> > > > > > > > DXE phase where it will start actually running the MH
> > > > > > > > code, so mirror VM probably still need to handles
> > > > > > > > KVM_EXIT_IO when SEC phase does I/O, I can see PIC
> > > > > > > > accesses and Debug Agent initialization stuff in SEC
> > > > > > > > startup code.
> > > > > > > That may be a design of the migration helper code that you
> > > > > > > were working with, but it's not necessary.
> > > > > > > 
> > > > > > Actually my comments are about a more generic MH code.
> > > > > 
> > > > > I don't think that would be a good idea; designing QEMU's
> > > > > migration helper interface to be as constrained as possible is
> > > > > a good thing.  The migration helper is extremely security
> > > > > sensitive code, so it should not expose itself to the attack
> > > > > surface of the whole of QEMU.
> > > 
> > > The attack surface of the MH in the guest is simply the API.  The
> > > API needs to do two things:
> > > 
> > >    1. validate a correct endpoint and negotiate a wrapping key
> > >    2. When requested by QEMU, wrap a section of guest encrypted
> > > memory
> > >       with the wrapping key and return it.
> > > 
> > > The big security risk is in 1. if the MH can be tricked into
> > > communicating with the wrong endpoint it will leak the entire
> > > guest.  If we can lock that down, I don't see any particular
> > > security problem with 2. So, provided we get the security
> > > properties of the API correct, I think we won't have to worry over
> > > much about exposure of the API.
> > 
> > Well, we'd have to make sure it only does stuff on behalf of qemu; if
> > the guest can ever write to MH's memory it could do something that
> > the guest shouldn't be able to.
> 
> Given the lack of SMI, we can't guarantee that with plain SEV and -ES. 
> Once we move to -SNP, we can use VMPLs to achieve this.

Doesn't the MH have access to different slots and running on separate
vCPUs; so it's still got some separation?

> But realistically, given the above API, even if the guest is malicious,
> what can it do?  I think it's simply return bogus pages that cause a
> crash on start after migration, which doesn't look like a huge risk to
> the cloud to me (it's more a self destructive act on behalf of the
> guest).

I'm a bit worried about the data structures that are shared between the
migration code in qemu and the MH; the code in qemu is going to have to
be paranoid about not trusting anything coming from the MH.

Dave

> James
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


