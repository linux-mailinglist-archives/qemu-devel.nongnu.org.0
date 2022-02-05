Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9514AA546
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:19:46 +0100 (CET)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG9jt-0005KB-Fj
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:19:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nG9g2-0003d4-1G
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:15:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nG9fx-0007Yn-W4
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644023733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PLYSDAft5GQOV/EMlhbkyyfaw0CogbHeiuoX9QqI8Dc=;
 b=BciQIurU0JPkXrEsaVVluW399IeMLO7ThLFIAZ2rzq8mN3PaqVaAUadtPfcQsLDk3OkOuq
 oZqlcXsTJTd7kQT/jCi8GtL2veF3WxrIyDTAKyKiFYc/Rj2CDy2sKSbx1C8BofCo85T6xe
 DlZonp/CNMPbRim3o9xDho1pmFpD4kA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-F_I9T8OCPGGeL1ombIn26w-1; Fri, 04 Feb 2022 20:15:32 -0500
X-MC-Unique: F_I9T8OCPGGeL1ombIn26w-1
Received: by mail-wr1-f70.google.com with SMTP id
 d14-20020adfa34e000000b001e306be1ec8so45467wrb.17
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:15:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PLYSDAft5GQOV/EMlhbkyyfaw0CogbHeiuoX9QqI8Dc=;
 b=3inZV1BHfTfG6oZpB6ECrblkzmIuw8LrsKolhMw4Q3w0BuWJZq9a42kBYedWTCgn1q
 cW4Ku4WedesgUCl0Xdp8m47kW+Kg1nz5VNlC4ddgghpOrQm8y04Z1HRE/JjYllDNrJyw
 K6iK2uiQ0HjwTx6rECCrK6O3sPiDM1wiImnRlGKxdU6//1txvfS2DO/hwzs2vIVJUlTQ
 ag5rJga3AJH4ZBk6MMxw3Zn4zSCp+Y0wXjBHXGtELP15Ea0cujxQBxqfDn8glpxrjKdF
 2PKqrfkK8rUGwrhDxxsBXogozM9BB2sDsHCk6EuK/nOaP0pFKo14IFuc0tW3cQmf5oXF
 huqw==
X-Gm-Message-State: AOAM533+fr/qFb/qTgIGZ/LTXBQ0G3G0l2TdRZdssP8FW2TtPopxWwue
 jp075ZYcaWaQ7quHR8nguaFNyoNIpmNx2B1HzcXtO2mh6XF1PkEcrxVOpKgJG1iq8H1QmIZhNpz
 wtOW2zsxfz723Z1I=
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr1118368wmh.84.1644023731177; 
 Fri, 04 Feb 2022 17:15:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybSqIeqaAxItdf6cFcans7BNLikyWrSVyq3NkIczWmBqLpM6jknWoV1Va8nbNp2UNc4LkIww==
X-Received: by 2002:a7b:cc0b:: with SMTP id f11mr1118345wmh.84.1644023730860; 
 Fri, 04 Feb 2022 17:15:30 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id o8sm2545524wmc.46.2022.02.04.17.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:15:30 -0800 (PST)
Date: Fri, 4 Feb 2022 20:15:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v4 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220204201506-mutt-send-email-mst@kernel.org>
References: <20220202195438.379753-1-pasic@linux.ibm.com>
 <20220203170635.1dd2b98d.pasic@linux.ibm.com>
 <20220204080404-mutt-send-email-mst@kernel.org>
 <20220205010205.17e1de76.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220205010205.17e1de76.pasic@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Jason Wang <jasowang@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Jakob Naucke <Jakob.Naucke@ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 05, 2022 at 01:02:05AM +0100, Halil Pasic wrote:
> On Fri, 4 Feb 2022 08:05:25 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Thu, Feb 03, 2022 at 05:06:35PM +0100, Halil Pasic wrote:
> > > On Wed,  2 Feb 2022 20:54:38 +0100
> > > Halil Pasic <pasic@linux.ibm.com> wrote:
> > >   
> > > >      }
> > > > @@ -82,9 +78,14 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> > > >          return;
> > > >      }
> > > >  
> > > > +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > > >      if (klass->get_dma_as != NULL && has_iommu) {
> > > >          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> > > >          vdev->dma_as = klass->get_dma_as(qbus->parent);
> > > > +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> > > > +            error_setg(errp,
> > > > +                       "iommu_platform=true is not supported by the device");
> > > > +        }  
> > > 
> > > I'm wondering, would it be wise to change the message? Since this is now
> > > dependent on the VM/bus the device is plugged into the message might be a
> > > little misleading: i.e. the very same device could work perfectly fine
> > > with iommu_platform=true if the "surroundings" are different.
> > > 
> > > Maybe "the device has no IOMMU support (iommu_platform=true)" would be a
> > > better option. On the other hand changing the message has its downsides
> > > as well.  
> > 
> > I personally don't care much frankly.
> > 
> > > Also I realized that keeping the return after error_setg() might have
> > > been a good idea for the case more logic is added at the end of the
> > > function.  
> > 
> > OK so you are sending v5 with this change then?
> 
> As stated below, I would prefer to get this merged. If I change the
> message, I guess I have to drop the r-b's and the I'm sure the if
> somebody decides to add logic to the end of the function that person
> will be careful enough.

yes but you wrote about return after error_setg above.

> > 
> > > In any case I would like to address these, if necessary with a separate
> > > patch. I don't want the fix to experience any further delays.
> > > 
> > > Regards,
> > > Halil  
> > 


