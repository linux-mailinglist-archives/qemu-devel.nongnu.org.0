Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F6A5B2E5E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 07:59:08 +0200 (CEST)
Received: from localhost ([::1]:42582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWX2h-0003mP-Gi
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 01:59:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oWWve-0005s3-Nb
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 01:51:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oWWva-00085F-RA
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 01:51:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662702705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2D56kiwjTxsMbiId2ZRz9l3dEyBhF8jD87W2cREWCAY=;
 b=KRhzXkTPn4OhUTURzPZ+AFRGjnqQQPxK8nW2gQ7TC2Pa9B3mRCKiee4ls2oVm2B2SPx9l9
 g2PdSqq1cCQClpOPeIr0XNEsuECnop23HdaQ/I/gNyOIZcDhM/gayMMAI5HbNgCxhjPfub
 hBXDM8bCsWolEK0Ngb5lAU/SoOnm/fs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-fALHRrv5NkOSvTWp9AH_og-1; Fri, 09 Sep 2022 01:51:42 -0400
X-MC-Unique: fALHRrv5NkOSvTWp9AH_og-1
Received: by mail-wr1-f70.google.com with SMTP id
 e15-20020adf9bcf000000b002285faa9bd4so146782wrc.8
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 22:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=2D56kiwjTxsMbiId2ZRz9l3dEyBhF8jD87W2cREWCAY=;
 b=WS099UL0MFcMrz5w/YNAzU0OWNqfbGyOqcCKY0Z2YCcNnbs+jXjOH//lcpM83gM5mL
 kjdJGfBTAYBk3YzcmyfJTM43BVkPwDMvTJ0G7LHy1mDOJ84Mw/xCg5BRxpVK3M3xBYW/
 0pcUkKDojahXjopyHEjeeDXULfQxyix5ICygZYuoGTc+u9zUsyVVxFBia4fZl4t5F3Fy
 6i1fae7NJOny4B/RMSkYZKdcSnPHy/YdIyNZ0x4Or9qSwp+La6fok0x7VQOuCd3CMk0s
 EreoRLeG2itHPGB8sxlRjWk9zFUpRJxDUXWMaMwo8KUMbMGz8BAX3dValh8IsebOFeIM
 xh5g==
X-Gm-Message-State: ACgBeo1mLxIXn3HNJKlDOxEScuXgmdayKsdA3fOYZ8+372/fxIwVaoNE
 OAEIIVOBnsLSKdpNawbKalCPBxyHb2mOzRTT72pn0adUZlsQ3/RsXPLS64H1eb0OmXU68hRYSYL
 kJ0IYc2abIjx+rEM=
X-Received: by 2002:adf:ef06:0:b0:228:d60c:cf74 with SMTP id
 e6-20020adfef06000000b00228d60ccf74mr6938822wro.302.1662702701528; 
 Thu, 08 Sep 2022 22:51:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR74gOiwBGd3y82UHmOjC5S0D1ADceFESNa05Lk739UbQWKtxDuHMEJkfmmGM8FUwfmiuRdgOA==
X-Received: by 2002:adf:ef06:0:b0:228:d60c:cf74 with SMTP id
 e6-20020adfef06000000b00228d60ccf74mr6938809wro.302.1662702701281; 
 Thu, 08 Sep 2022 22:51:41 -0700 (PDT)
Received: from redhat.com ([176.12.154.16]) by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c4f1500b003a607e395ebsm6221721wmq.9.2022.09.08.22.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 22:51:40 -0700 (PDT)
Date: Fri, 9 Sep 2022 01:51:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Sergio Lopez <slp@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 2/2] [RfC] expose host-phys-bits to guest
Message-ID: <20220909014106-mutt-send-email-mst@kernel.org>
References: <20220908113109.470792-1-kraxel@redhat.com>
 <20220908113109.470792-3-kraxel@redhat.com>
 <20220908101757-mutt-send-email-mst@kernel.org>
 <20220909051817.vlai3l6cjl5sfgmv@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909051817.vlai3l6cjl5sfgmv@sirius.home.kraxel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 09, 2022 at 07:18:17AM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > > @@ -424,7 +426,10 @@ static void microvm_device_pre_plug_cb(HotplugHandler *hotplug_dev,
> > >  {
> > >      X86CPU *cpu = X86_CPU(dev);
> > >  
> > > -    cpu->host_phys_bits = true; /* need reliable phys-bits */
> > > +    /* need reliable phys-bits */
> > > +    cpu->env.features[FEAT_KVM_HINTS] |=
> > > +        (1 << KVM_HINTS_PHYS_ADDRESS_SIZE_DATA_VALID);
> > > +
> > 
> > Do we need compat machinery for this?
> 
> Don't think so, microvm has no versioned machine types anyway.
> 
> > > --- a/target/i386/cpu.c
> > > +++ b/target/i386/cpu.c
> 
> > >      [FEAT_KVM_HINTS] = {
> > >          .type = CPUID_FEATURE_WORD,
> > >          .feat_names = {
> > > -            "kvm-hint-dedicated", NULL, NULL, NULL,
> > > +            "kvm-hint-dedicated", "host-phys-bits", NULL, NULL,
> 
> > > -    DEFINE_PROP_BOOL("host-phys-bits", X86CPU, host_phys_bits, false),
> 
> > > -    if (cpu->host_phys_bits) {
> > > +    if (cpu->env.features[FEAT_KVM_HINTS] &
> > > +        (1 << KVM_HINTS_PHYS_ADDRESS_SIZE_DATA_VALID)) {
> > >          /* The user asked for us to use the host physical bits */
> > >          phys_bits = host_phys_bits;
> > >          if (cpu->host_phys_bits_limit &&
> > 
> > I think we still want to key this one off host_phys_bits
> > so it works for e.g. hyperv emulation too.
> 
> I think that should be the case.  The chunks above change the
> host-phys-bits option from setting cpu->host_phys_bits to setting
> the FEAT_KVM_HINTS bit.  That should also happen with hyperv emulation
> enabled, and the bit should also be visible to the guest then, just at
> another location (base 0x40000100 instead of 0x40000000).
> 
> take care,
>   Gerd


You are right, I forgot. Hmm, ok. What about !cpu->expose_kvm ?

We have

    if (!kvm_enabled() || !cpu->expose_kvm) {
        env->features[FEAT_KVM] = 0;
    }   
        
This is quick grep, I didn't check whether this is called
after the point where you currently use it, but
it frankly seems fragile to pass a generic user specified flag
inside a cpuid where everyone pokes at it.


-- 
MST


