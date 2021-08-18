Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A503F0816
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 17:33:17 +0200 (CEST)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGNZ6-0001LK-0A
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 11:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGNXJ-0000CH-Rj
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 11:31:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mGNXD-0003Ok-HU
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 11:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629300678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Vcuo60gzD2ThQioHKoJVOsvstJGVPwB2LeKWFl+fkE=;
 b=WYtEwkl7ykbw/3FzeIWr+GhQ94mqSHOqX86PZHDJopfk9g89QvLE2Ia5nUqb83W8jdymEg
 GfkG4Rx+Gjk7OINSazcbzRIuLBX3BW90Sh9IjbzicochQWhHvMv9d/w/FQDSHSFxj/3lvc
 M2WVTCvRWadzHx9u3YULD43i9qhw+z8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-CLV8d0NtNLOCmJs2m-l1ng-1; Wed, 18 Aug 2021 11:31:17 -0400
X-MC-Unique: CLV8d0NtNLOCmJs2m-l1ng-1
Received: by mail-wr1-f70.google.com with SMTP id
 m5-20020a5d6a050000b0290154e83dce73so702478wru.19
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 08:31:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2Vcuo60gzD2ThQioHKoJVOsvstJGVPwB2LeKWFl+fkE=;
 b=int/nDg6SMQehH2wkyvKqNaIt0MdZqIzWInLrIp47o9r832SOZcLpaHbF01rVT4a4m
 +BFGO0/OCs3Isu4Z3lSXoEyVmmYGyu9Vwl8lRJE5DnSgnrd3aEhBl03lLmQbHa060B/H
 E3+hOShXfP7WVFX3HG32zwBwjJR7O0Ys4fxEZ1ETTGcilyGLTONOYtJeDILS1x3im1FG
 QiZ0BzlhZ0WX1aFQ2KnsbV04MbHTnl6GZyul9rEegWsf+b7VCl9mHfYJG1eZBBSZm8JA
 Z2MjDurrcpBKnbTbAH0R3ClE+L6sC6Jms2bm5IfzJ0oeG6xBzfxssgIokRKp3dWVQqZZ
 H1tA==
X-Gm-Message-State: AOAM5304t7Rae4mjLgEPuKSWx0foqJsGz3NtlgO2w5iELMm8NZyebTxF
 27cPpChX/coNizx+iYIhexkyLF2VuaskwpHPm/zO+q8lzbD1CLTWydwyLhRc2p5l4CTYpQBOc9+
 9fMM6T7yRfOTZWac=
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr11109160wrf.319.1629300676463; 
 Wed, 18 Aug 2021 08:31:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx61kJvQVKTPNPAFU8BGU6rsKDqn+ts/ihZnRItKrHELkW/ZhebZlm/GEpxu7mNDjAvqg/Zrw==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr11109100wrf.319.1629300676202; 
 Wed, 18 Aug 2021 08:31:16 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id y66sm144608wmy.39.2021.08.18.08.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 08:31:15 -0700 (PDT)
Date: Wed, 18 Aug 2021 16:31:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
Message-ID: <YR0nwVPKymrAeIzV@work-vm>
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
 <20210816144413.GA29881@ashkalra_ubuntu_server>
 <b25a1cf9-5675-99da-7dd6-302b04cc7bbc@redhat.com>
 <20210816151349.GA29903@ashkalra_ubuntu_server>
 <f7cf142b-02e4-5c87-3102-f3acd8b07288@redhat.com>
 <20210818103147.GB31834@ashkalra_ubuntu_server>
 <f0b5b725fc879d72c702f88a6ed90e956ec32865.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <f0b5b725fc879d72c702f88a6ed90e956ec32865.camel@linux.ibm.com>
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
> On Wed, 2021-08-18 at 10:31 +0000, Ashish Kalra wrote:
> > Hello Paolo,
> > 
> > On Mon, Aug 16, 2021 at 05:38:55PM +0200, Paolo Bonzini wrote:
> > > On 16/08/21 17:13, Ashish Kalra wrote:
> > > > > > I think that once the mirror VM starts booting and running
> > > > > > the UEFI code, it might be only during the PEI or DXE phase
> > > > > > where it will start actually running the MH code, so mirror
> > > > > > VM probably still need to handles KVM_EXIT_IO when SEC phase
> > > > > > does I/O, I can see PIC accesses and Debug Agent
> > > > > > initialization stuff in SEC startup code.
> > > > > That may be a design of the migration helper code that you were
> > > > > working with, but it's not necessary.
> > > > > 
> > > > Actually my comments are about a more generic MH code.
> > > 
> > > I don't think that would be a good idea; designing QEMU's migration
> > > helper interface to be as constrained as possible is a good
> > > thing.  The migration helper is extremely security sensitive code,
> > > so it should not expose itself to the attack surface of the whole
> > > of QEMU.
> 
> The attack surface of the MH in the guest is simply the API.  The API
> needs to do two things:
> 
>    1. validate a correct endpoint and negotiate a wrapping key
>    2. When requested by QEMU, wrap a section of guest encrypted memory
>       with the wrapping key and return it.
> 
> The big security risk is in 1. if the MH can be tricked into
> communicating with the wrong endpoint it will leak the entire guest. 
> If we can lock that down, I don't see any particular security problem
> with 2. So, provided we get the security properties of the API correct,
> I think we won't have to worry over much about exposure of the API.

Well, we'd have to make sure it only does stuff on behalf of qemu; if
the guest can ever write to MH's memory it could do something that the
guest shouldn't be able to.

Dave

> > > One question i have here, is that where exactly will the MH code
> > exist in QEMU ?
> 
> I assume it will be only x86 platform specific code, we probably will
> never support it on other platforms ?
> 
> So it will probably exist in hw/i386, something similar to "microvm"
> support and using the same TYPE_X86_MACHINE ?
> 
> I don't think it should be x86 only.  The migration handler receiver
> should be completely CPU agnostic.  It's possible other CPUs will grow
> an encrypted memory confidential computing capability (Power already
> has one and ARM is "thinking" about it, but even if it doesn't, there's
> a similar problem if you want to use trustzone isolation in VMs).  I
> would envisage migration working substantially similarly on all of them
> (need to ask an agent in the guest to wrap an encrypted page for
> transport) so I think we should add this capability to the generic QEMU
> migration code and let other architectures take advantage of it as they
> grow the facility.
> 
> > Also if we are not going to use the existing KVM support code and
> > adding some duplicate KVM interface code, do we need to interface
> > with this added KVM code via the QEMU accelerator framework, or
> > simply invoke this KVM code statically ?
> 
> I think we need to design the interface as cleanly as possible, so it
> just depends what's easiest.  We certainly need some KVM support for
> the mirror CPUs, I think but it's not clear to me yet what the simplest
> way to do the interface is.
> 
> James
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


