Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5733E4DAE7C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:49:19 +0100 (CET)
Received: from localhost ([::1]:39364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nURDS-0007xA-8A
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:49:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nURCC-0006zv-JF
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 06:48:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nURCA-0007e3-D0
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 06:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647427677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m59J7MgkhleMflQJKSz3faA86CMLj//PPhoxuvxryfM=;
 b=L7qDbrzpsLPMuqv+Sy5+eq4ddKOrnhkoehmS9WzvVmKAeNoKQO4XQxyj2AA9J/Rnsd4BXR
 /NNIC4ybCQ/FZdW5vMZPMgZzhrrsGUPRWAbX7zzV8WavUG3/BSlUdKf1kD8xdB/KQBOos/
 psGrA8i7o0GI9c5nlE2VUHIGcRaF6SQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-pH7IoYLWNouGFP3VcxeLcA-1; Wed, 16 Mar 2022 06:47:55 -0400
X-MC-Unique: pH7IoYLWNouGFP3VcxeLcA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v184-20020a1cacc1000000b0038a12dbc23bso2591177wme.5
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 03:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m59J7MgkhleMflQJKSz3faA86CMLj//PPhoxuvxryfM=;
 b=O3kOXhMhjLJScuz+9fzBZuA+Nrp86/MpBFUoXhO20HUBBBXb9GXQrI0zEZ/JHrHpZy
 Ia1o8WX9+Vvwojytx0/ghADuCzuu44Sx4TI4WNjvmW+Cr2iMOx/FOX7LOjUx9NHLmTfi
 ukBd82HYIjL+3Vz0MDMLJ5Dw4EqRhoFDsm2AC4mobRqgX/GBsy6l06dCieacvqYNSYp6
 aa9mLOvfMhH2NpM7NoWRLLZ9fneJw8uDKqgkW2AB16CHfJOi24Gjav5DecKBOSnDCP/8
 8TdzONlWBKT5d/FIIoBn5QtlaQ31o5n76S/m9hSb98xaYNgCZDZqTQyQPs92om8hrTU2
 EsUg==
X-Gm-Message-State: AOAM532Bi1Ku3v5yd9Orpm9IwnkOFrRy5UZjHUNy+ppPRAl8tWK06lSK
 PjDBOlZl3qo0Uuc6o67nwWxDvWYcl324PML3MvYqTmZLVHT6Wnk0qIbEG1Ri4hjIvaTwXLDLLa2
 824xpIMVn2/Xqq/g=
X-Received: by 2002:a7b:c7d8:0:b0:389:c3ca:9ede with SMTP id
 z24-20020a7bc7d8000000b00389c3ca9edemr6788353wmk.150.1647427674425; 
 Wed, 16 Mar 2022 03:47:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC6vn1CJxqhoPZm0/tWmoU5sy/ZcVyL6zqJSEZxDHf82DoHidC7KckFf1AcdwPz4NgLeFAXg==
X-Received: by 2002:a7b:c7d8:0:b0:389:c3ca:9ede with SMTP id
 z24-20020a7bc7d8000000b00389c3ca9edemr6788329wmk.150.1647427674119; 
 Wed, 16 Mar 2022 03:47:54 -0700 (PDT)
Received: from redhat.com ([2.53.2.35]) by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b00389cc36a3bfsm4795053wmp.6.2022.03.16.03.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 03:47:53 -0700 (PDT)
Date: Wed, 16 Mar 2022 06:47:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/4] target/i386: Fix sanity check on max APIC ID /
 X2APIC enablement
Message-ID: <20220316064631-mutt-send-email-mst@kernel.org>
References: <20220314142544.150555-1-dwmw2@infradead.org>
 <20220316100425.2758afc3@redhat.com>
 <d374107ebd48432b6c2b13c13c407a48fdb2d755.camel@infradead.org>
 <20220316055333-mutt-send-email-mst@kernel.org>
 <c359ac8572d0193dd65bb384f68873d24d0c72d3.camel@infradead.org>
MIME-Version: 1.0
In-Reply-To: <c359ac8572d0193dd65bb384f68873d24d0c72d3.camel@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 10:37:49AM +0000, David Woodhouse wrote:
> On Wed, 2022-03-16 at 05:56 -0400, Michael S. Tsirkin wrote:
> > On Wed, Mar 16, 2022 at 09:37:07AM +0000, David Woodhouse wrote:
> > > Yep, that's the guest operating system's choice. Not a qemu problem.
> > > 
> > > Even if you have the split IRQ chip, if you boot a guest without kvm-
> > > msi-ext-dest-id support, it'll refuse to use higher CPUs.
> > > 
> > > Or if you boot a guest without X2APIC support, it'll refuse to use
> > > higher CPUs. 
> > > 
> > > That doesn't mean a user should be *forbidden* from launching qemu in
> > > that configuration.
> > 
> > Well the issue with all these configs which kind of work but not
> > the way they were specified is that down the road someone
> > creates a VM with this config and then expects us to maintain it
> > indefinitely.
> > 
> > So yes, if we are not sure we can support something properly it is
> > better to validate and exit than create a VM guests don't know how
> > to treat.
> 
> Not entirely sure how to reconcile that with what Daniel said in
> https://lore.kernel.org/qemu-devel/Yi9BTkZIM3iZsvdK@redhat.com/ which
> was:
> 
> > We've generally said QEMU should not reject / block startup of valid
> > hardware configurations, based on existance of bugs in certain guest
> > OS, if the config would be valid for other guest.

For sure, but is this a valid hardware configuration? That's
really the question.

> That said, I cannot point at a *specific* example of a guest which can
> use the higher CPUs even when it can't direct external interrupts at
> them. I worked on making Linux capable of it, as I said, but didn't
> pursue that in the end.
> 
> I *suspect* Windows might be able to do it, based on the way the
> hyperv-iommu works (by cheating and returning -EINVAL when external
> interrupts are directed at higher CPUs).
> 
> 

-- 
MST


