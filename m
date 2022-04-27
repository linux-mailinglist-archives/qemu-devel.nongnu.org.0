Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BA15116EA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 14:43:42 +0200 (CEST)
Received: from localhost ([::1]:36248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njh1B-0002c9-9J
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 08:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njgsM-0004KK-Os
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:34:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1njgsL-0004RY-8i
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 08:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651062872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TfKISm6BdcAxaU8RQ9Gm5fFMhf2BY6vhXcz8QD0AJ2o=;
 b=HIFQ+8q0LVf6/FRvIAHIwvQTb1EkzF2bwrvrfCe86t7wGqc23UW2XOkKg/z6kRnGoixzz7
 nIedoG96gI7KqVguOo2P40i9pKjAMvXCdGGfhlM2UTqkkpqSNCE4RnJClPW4SdjwgtCnG0
 BS0bAUueY3+V3kSS3Kan1NR3arxiCSo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-4PtpB31EM1Kt5fMFubs3Nw-1; Wed, 27 Apr 2022 08:34:30 -0400
X-MC-Unique: 4PtpB31EM1Kt5fMFubs3Nw-1
Received: by mail-wr1-f72.google.com with SMTP id
 n17-20020adfc611000000b0020a7e397ccaso685638wrg.23
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 05:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TfKISm6BdcAxaU8RQ9Gm5fFMhf2BY6vhXcz8QD0AJ2o=;
 b=is5cb5+QRxQahUyW5m/mYcw8YEwRxe7WcSm/vmGF9XRQAVuWOJReI4asH1DosqR+Mi
 beDArqFnbCwUSbJVRQ181LEYjedEAadxiGisBE1iroJzqheJSIueW+MBMlU3TyqPHsxW
 k9/1qdCUnRaiwzXz0EDnbxNDMxU0R3M9GTAps6yGU4dmc143djSTDROIozWJxjYulxl/
 YiMLmT2UHt0h2V07obqh30THDqKqJBpHuWT1dM0QNNVCbfacTXhsgmWX1QUmN+Xzv4lQ
 lI9x6GwqhrbTnYo+eff8rGQDvjoGB0CW7CoERZ6uL4RFviEVwpQIqlcZi8ecl6GJ6IyX
 sR3w==
X-Gm-Message-State: AOAM533+vSPnEUbjfelKaozj4iZ6gyLvIU87odZ79FpC3cNyjMOTp5yc
 xqu6i5N7jG0Z0OzCwpYrzCrMwft9DHRLR79q6kom/MTfe2fa5XkDWh3+ERnc51LNb5RIqGtjJFS
 b9sQ+nlAIdsVZhb4=
X-Received: by 2002:a5d:6488:0:b0:203:b628:70d2 with SMTP id
 o8-20020a5d6488000000b00203b62870d2mr22290623wri.83.1651062869799; 
 Wed, 27 Apr 2022 05:34:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+0x6Ys3/eV2JPeWzpDiYMcH0z2Dm2PD5cyTJeS6Dge9SfCjYFFbMVOpCWYJV8GDd7qUO1jw==
X-Received: by 2002:a5d:6488:0:b0:203:b628:70d2 with SMTP id
 o8-20020a5d6488000000b00203b62870d2mr22290608wri.83.1651062869608; 
 Wed, 27 Apr 2022 05:34:29 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 f189-20020a1c38c6000000b0038ff83b9792sm1455879wma.43.2022.04.27.05.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 05:34:29 -0700 (PDT)
Date: Wed, 27 Apr 2022 13:34:27 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 7/8] qmp: add filtering of statistics by name
Message-ID: <Ymk4U4O4CN3e7+9A@work-vm>
References: <20220426141619.304611-1-pbonzini@redhat.com>
 <20220426141619.304611-8-pbonzini@redhat.com>
 <YmkwndPwSDxqqdZA@work-vm>
 <6655dcbe-860e-b107-e63e-ff397189d178@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6655dcbe-860e-b107-e63e-ff397189d178@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> On 4/27/22 14:01, Dr. David Alan Gilbert wrote:
> > >      "providers": [
> > >        { "provider": "kvm",
> > >          "names": [ "l1d_flush", "exits" ] } } }
> > That looks inconsistent to me; I realise that 'names' has to be a child
> > of providers (since the names are only relevant to a given provider) but
> > how about making the "target" work similarly:
> > 
> > { "execute": "query-stats",
> >    "arguments": {
> >      "target": {
> >        "vcpus": [ "/machine/unattached/device[2]",
> >                   "/machine/unattached/device[4]" ] },
> 
> This would allow queries for different types of targets in a single command,
> but it would be harder for the client to do filtering:
> 
> * with something like "target": { "vcpus": [ array ] }, there is no way for
> the client to say "I want this one statistic, but for all the vCPUs"
> 
> * if target is optional, a client might expect relatively small output from
> today's QEMU, yet suddenly get hundreds of KB from targets other than VMs
> and vCPUs (e.g. block devices including all backing files in the chain, NIC
> backends, etc.).

If I specify a 'vm' it's not obvious to me whether I'd get NICs and
block devices in the future?
Adding a syntax for 'all' into the vcpus list would fix that?

> >      "providers": [
> >         { "provider": "kvm",
> >           "names": [ "l1d_flush", "exits" ] } } }
> > 
> > It's not clear to me whether the "target" should also be specific
> > to a given provider.
> 
> No, the target is a QEMU concept, such as a CPU or a device backend.  It is
> identified by either a QOM path or a unique id.

But doesn't 'kvm' as a provider only make sense for vcpus and VMs; if
you're imagining block devices and other things as targets it would seem
wrong to have that set of providers separate.

Dave

> Paolo
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


