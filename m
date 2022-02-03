Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE44A8B6B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:19:56 +0100 (CET)
Received: from localhost ([::1]:49218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFgi3-0001rE-Ua
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:19:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nFg2T-00082d-4o
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:36:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1nFg2L-0000QT-Uq
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:36:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643909805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NaY1+Rcp4nI8Y7hTHNgTcgSz7crViekEdo/VLEb7EN0=;
 b=cpTbkS/EZZ0e5p2eptzEc91ky4OUh5G8q9ACZ1BTdYUBzxSu8RUkGKbvIucEUqErHaxnX8
 pNOt8ZSjgmxLs4Igx2oaB0eOYEt/G+p7DefY/AFOTfKyzQHkWCPRsa2DGhO277yuvtLRka
 hRLzqmkRQRP6HKzEh213jnERPGTTgfQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-Iew3fnTDOoiAvvAs2NCZaA-1; Thu, 03 Feb 2022 12:36:44 -0500
X-MC-Unique: Iew3fnTDOoiAvvAs2NCZaA-1
Received: by mail-ed1-f71.google.com with SMTP id
 k5-20020a508ac5000000b00408dec8390aso1811511edk.13
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:36:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NaY1+Rcp4nI8Y7hTHNgTcgSz7crViekEdo/VLEb7EN0=;
 b=xELnytsGFu3UA655StXyLwkGcCnN59t4pEUTXKKDCgJFU2ZGDAsrwbAuCsEta5dYJs
 kMLqf6yNgyW39MelIMTAzDIuF6ZPE6hVsC3WBjrRLONZsML9rZ1cycg0VyBOnRAH47o7
 eB0GvD0VORU0vnQyyFIYJGEEm8drQnEAD1cr/2w3CALWLZNrWxYHiYLaaDHtXe1jKnX6
 VF7xIGQr7P5sjXxVO13lh6do+lAnIRcFXMoY4BSNeCihuiTNoCl+UVilpFavESGNn3/D
 YlWoGrgOOdDVbsEWIjgMaIBLeZMg7kU4HiUevErIKtQSygRqAgPtGgkvpgePrsC79VqR
 PZsg==
X-Gm-Message-State: AOAM532Qmps2T22/QF+1krjylNZPdzB5EBjDaxXAXyPaVtVkr7XGEpmE
 xSm1xq6HRcsEJzfXzii5W7EE+c1ILv0kjIqhEJe3Lyi8Jz3Vf/JouD6GntHe6/ZJTqwqvCA7Gpb
 Rpx85SV0AEo9gi2U=
X-Received: by 2002:a17:907:8a24:: with SMTP id
 sc36mr29847025ejc.318.1643909803304; 
 Thu, 03 Feb 2022 09:36:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkG3ipP7zL3kaeqi8DgE6r7zdEFx8uRA6B9NgaG+4IB5yxRF4fz8vE4DEHKMNMv1fViTewaA==
X-Received: by 2002:a17:907:8a24:: with SMTP id
 sc36mr29847008ejc.318.1643909803034; 
 Thu, 03 Feb 2022 09:36:43 -0800 (PST)
Received: from gator (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id v5sm22990257edb.15.2022.02.03.09.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:36:42 -0800 (PST)
Date: Thu, 3 Feb 2022 18:36:40 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 09/11] target/arm/kvm: host cpu: Add support for sve<N>
 properties
Message-ID: <20220203173640.shxkmatdcsfzzvtj@gator>
References: <20191101085140.5205-1-peter.maydell@linaro.org>
 <20191101085140.5205-10-peter.maydell@linaro.org>
 <CAFEAcA8pS6_SYWMFJ0=EyHVQ9V1MTiM_OCjkvqb5znqJ91w_qw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8pS6_SYWMFJ0=EyHVQ9V1MTiM_OCjkvqb5znqJ91w_qw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 03, 2022 at 04:46:21PM +0000, Peter Maydell wrote:
> On Fri, 1 Nov 2019 at 08:51, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > From: Andrew Jones <drjones@redhat.com>
> >
> > Allow cpu 'host' to enable SVE when it's available, unless the
> > user chooses to disable it with the added 'sve=off' cpu property.
> > Also give the user the ability to select vector lengths with the
> > sve<N> properties. We don't adopt 'max' cpu's other sve property,
> > sve-max-vq, because that property is difficult to use with KVM.
> > That property assumes all vector lengths in the range from 1 up
> > to and including the specified maximum length are supported, but
> > there may be optional lengths not supported by the host in that
> > range. With KVM one must be more specific when enabling vector
> > lengths.
> 
> Hi; I've been looking at the '-cpu max' vs '-cpu host' code
> as part of trying to sort out the 'hvf' accelerator doing
> oddly different things with them. I noticed an oddity
> introduced in this patch. In the commit message you say that
> we deliberately leave the 'sve-max-vq' property out of the
> new aarch64_add_sve_properties(), because it is difficult to
> use with KVM. But in the code for handling '-cpu max' in
> aarch64_max_initfn():
> 
> > @@ -602,17 +617,11 @@ static void cpu_arm_set_sve(Object *obj, Visitor *v, const char *name,
> >  static void aarch64_max_initfn(Object *obj)
> >  {
> >      ARMCPU *cpu = ARM_CPU(obj);
> > -    uint32_t vq;
> > -    uint64_t t;
> >
> >      if (kvm_enabled()) {
> >          kvm_arm_set_cpu_features_from_host(cpu);
> > -        if (kvm_arm_sve_supported(CPU(cpu))) {
> > -            t = cpu->isar.id_aa64pfr0;
> > -            t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
> > -            cpu->isar.id_aa64pfr0 = t;
> > -        }
> 
> because this 'if' doesn't exit the function early...
> 
> >      } else {
> > +        uint64_t t;
> >          uint32_t u;
> >          aarch64_a57_initfn(obj);
> >
> > @@ -712,17 +721,9 @@ static void aarch64_max_initfn(Object *obj)
> >  #endif
> >      }
> 
> ...all this code at the tail of the function runs for both KVM
> and TCG, and it still sets the sve-max-vq property, even for
> using '-cpu max' with KVM.
> 
> > -    object_property_add(obj, "sve", "bool", cpu_arm_get_sve,
> > -                        cpu_arm_set_sve, NULL, NULL, &error_fatal);
> > +    aarch64_add_sve_properties(obj);
> >      object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_max_vq,
> >                          cpu_max_set_sve_max_vq, NULL, NULL, &error_fatal);
> > -
> > -    for (vq = 1; vq <= ARM_MAX_VQ; ++vq) {
> > -        char name[8];
> > -        sprintf(name, "sve%d", vq * 128);
> > -        object_property_add(obj, name, "bool", cpu_arm_get_sve_vq,
> > -                            cpu_arm_set_sve_vq, NULL, NULL, &error_fatal);
> > -    }
> >  }
> 
> Was this intentional?

No, darn. I don't know how many times I rebased that series and was always
careful to ensure sve-max-vq was left in the non-kvm part of the above
condition. I guess the final rebase finally got me...

> 
> I'd like to fix up the weird divergence between -cpu host and
> -cpu max, either by moving sve-max-vq into aarch64_add_sve_properties()
> so it's present on both, or by changing the aarch64_max_initfn() so
> it only adds the property when using TCG.

The later, please. sve-max-vq won't work for any of the machines that
support SVE that I know of, so I think it's a bad idea for KVM.

> 
> (I think also this code may get the '-cpu max,aarch64=off' case wrong,
> as it doesn't guard the calls to add the sve and pauth properties
> with the "if aarch64" feature check.)

Yes, but these property dependencies may need to be checked at property
finalize time. That means that the properties may get added, but then
they will error out if the user tried to enable them. Otherwise, they'll
be disabled and the QMP query will inform the user that they cannot be
enabled.

Thanks,
drew


