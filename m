Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 448644AC6B8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:06:13 +0100 (CET)
Received: from localhost ([::1]:50330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7Su-0001FH-BI
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:06:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nH6nS-000211-5T
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:23:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nH6nO-0002UX-BT
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644250995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5KqZOJXkLIT+PD+1JDKKSHzhxcrLtE2XFIlnZ87cHIo=;
 b=gnECN5xcO3LZm7p57QIdAlcDJsHY+pUJ5rs52PLcm/l23Xg1D8qFnWrVYAbBd/0n/FKyMx
 xvtSCjO50I5+jZDUe1/MdPQMHS3HBS4P3PA+eUUXKYLL8orNGL8UWC0MeXBTEn8aIsOdve
 v85wu2DWakO7NnqDsej/pG9VklKfJSA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-jrIpDproOsKeo0qDfJZNMg-1; Mon, 07 Feb 2022 11:23:14 -0500
X-MC-Unique: jrIpDproOsKeo0qDfJZNMg-1
Received: by mail-ej1-f70.google.com with SMTP id
 qq4-20020a17090720c400b006c6a6c55ed6so1908493ejb.12
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 08:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5KqZOJXkLIT+PD+1JDKKSHzhxcrLtE2XFIlnZ87cHIo=;
 b=EycUJ0QU69kO6YaveMrO3IhjscGUPOC0dAQHqfTy3OMbVcd9NJNN+X69R5QQuA3vJc
 1VD1CO+qDQIE3XO2rQbq8fANSa3DedNv5VNBeQB8pji/pTMJo2VZVDq8uzHXIzyJVmPA
 i9W6dYhK2uZld/4lUJs9ADvKdAqEKTNnwFSa5HQbN6/O3q3wb83Z8/IvOLHU0oqTH1Mp
 G2Bq3XhG80pww0VTH3wuHQviqEjgQtC+XMvbKmBJhqeC/Z8SLY1JK3YpThmGhAShwo8h
 EAAOzLM5dwxRlXV+CsRNjX8PRS6xaFEIjMKz6OM81KfPSuRQFUnws0cE/gvk0XS6F8KN
 Pw6A==
X-Gm-Message-State: AOAM531m2R2bUsmhswwiJo9lQKofRcx8lonOzrb3ng9c9WqNZJAJj+T1
 EM0PmSs6I5gLyLtN8qp7Iksw8zGuVd0vsB80Sp1724CGYgxyTawjm5S1LjQZiVWnFsEogrPPjyc
 nHtDpSkXtyb8pDrc=
X-Received: by 2002:a17:906:9741:: with SMTP id
 o1mr420152ejy.452.1644250993338; 
 Mon, 07 Feb 2022 08:23:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykL7kppS1UTarRQDDLpmW5GqzhFyG03HYrmwQRoj3ASCbE8JuwpmI3241xOks4wl0fAoEzdQ==
X-Received: by 2002:a17:906:9741:: with SMTP id
 o1mr420107ejy.452.1644250992827; 
 Mon, 07 Feb 2022 08:23:12 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id c20sm3664629edy.41.2022.02.07.08.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 08:23:12 -0800 (PST)
Date: Mon, 7 Feb 2022 11:23:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [RFC PATCH 1/1] virtio: fix feature negotiation for
 ACCESS_PLATFORM
Message-ID: <20220207112035-mutt-send-email-mst@kernel.org>
References: <20220203164556.2666565-1-pasic@linux.ibm.com>
 <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com>
 <874k5ax07t.fsf@redhat.com>
 <20220207160516.2aead931.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220207160516.2aead931.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 04:05:16PM +0100, Halil Pasic wrote:
> On Mon, 07 Feb 2022 14:41:58 +0100
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Mon, Feb 07 2022, Daniel Henrique Barboza <danielhb413@gmail.com> wrote:
> > 
> > > On 2/3/22 13:45, Halil Pasic wrote:  
> > >> Unlike most virtio features ACCESS_PATFORM is considered mandatory, i.e.  
> > 
> > s/ACCESS_PATFORM/ACCESS_PLATFORM/
> 
> Will fix.
> 
> > 
> > >> the driver must accept it if offered by the device. The virtio
> > >> specification says that the driver SHOULD accept the ACCESS_PLATFORM
> > >> feature if offered, and that the device MAY fail to operate if
> > >> ACCESS_PLATFORM was offered but not negotiated.
> > >> 
> > >> While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
> > >> the device when the driver fences ACCESS_PLATFORM. With commit  
> > >
> > >
> > > I believe a link to the virtio specification where this is being mentioned would
> > > be good to have in the commit message.  
> > 
> > It's in section 6.1 "Driver Requirements: Reserved Feature Bits": "A
> > driver SHOULD accept VIRTIO_F_ACCESS_PLATFORM if it is offered" and
> > section 6.2 "Device Requirements: Reserved Feature Bits": "A device MAY
> > fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not accepted."
> > 
> > That said, I'm not sure the wording in the spec translates to
> > "mandatory"... if the driver fails to accept the bit, the device can
> > choose to not work with the driver, but it's not forced to.
> 
> I didn't mean to claim that the spec makes this feature "mandatory", and
> this is why I paraphrased the spec. IMHO it is QEMU that considers it
> mandatory.

this:
A device MAY
fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not accepted

is the hint here.

> > There are
> > other instances where the device may reject FEATURES_OK (e.g. when the
> > driver does not accept a feature that is a pre-req for another feature),
> > I'd say it is up to the device whether something is mandatory or not. If
> > the device/setup cannot work without it, it certainly is mandatory, but
> > the driver only knows when FEATURES_OK is rejected without the feature.
> 
> Right but for the guys that write the drivers it is of interest to know
> what level of interoperability can  one can keep if certain
> 	features are
> not implemented. Usually it is safe to fence delay implementing
> features, as long as the support for the features is implemented in the
> order mandated by the spec.
> 
> > 
> > OTOH, the decision to make it mandatory is certainly sound, and covered
> > by the spec. As the driver must be prepared for the device failing to
> > accept FEATURES_OK, we can make it mandatory here -- we should just not
> > say that it is considered mandatory from a spec standpoint. The spec
> > allows to make it mandatory, and we make it mandatory in our
> > implementation.
> 
> Right. Was never my intention to say that it is considered mandatory
> by the spec. I guess the spec considers it less optional than the
> run of the mill features.

It would be nice to have a security considerations section.

The point is that within guest, with ACCESS_PLATFORM it should be safe
to assume that device can be passed through to nested guests or
userspace.



> Should I change the first sentence to something like "Unlike most virtio
> features ACCESS_PATFORM is considered mandatory by QEMU, i.e. the driver
> must accept it if offered by the device."
> 
> [..]
> 
> Regards,
> Halil


