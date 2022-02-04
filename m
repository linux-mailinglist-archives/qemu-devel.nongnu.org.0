Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E891A4A99F0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 14:29:43 +0100 (CET)
Received: from localhost ([::1]:53776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFyek-0006YQ-H2
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 08:29:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFyI0-0001gF-0f
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 08:06:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nFyHp-0001g4-UE
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 08:06:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643979932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HY/opIyPEaayryOHIOviqAWPozlf589DkCMj+09Ks6c=;
 b=N1su6neOMs/IXjVUgZVKVkjF2M3/Vm6sVAsEYLDGesHRu5uKNX/66SOkty6w+GL+Kd8Lco
 slY9vBCMk+euXDx3fIK0kw4UgAC2p/Phk/L2dH/Xo5r3Bwz+JiRWVWbRWCqNPi+Vs9lwd8
 vIiWZdM0HsfHdEoT5XWZF3O4bZnfD2U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-NCpVLn53Pu6-lUYZdn-M-A-1; Fri, 04 Feb 2022 08:05:31 -0500
X-MC-Unique: NCpVLn53Pu6-lUYZdn-M-A-1
Received: by mail-wm1-f69.google.com with SMTP id
 r66-20020a1c4445000000b00355272f7d08so567828wma.9
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 05:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HY/opIyPEaayryOHIOviqAWPozlf589DkCMj+09Ks6c=;
 b=z4SptogBxV5Z55eaNgGQxFEwewKA0IBZhOgsLjS0Aje6JDDHFQuu4kmCsxPry2dMF5
 +gn+FSaOisjfLOJHQiIsrjiJbUNSUjR4obIQNGKA4QBnAT6Vp1+1pNrc5hg90cBnUJoj
 Qp3uHfkbNEhWoVI39Hyveb08IsP/FkODLq02qfrhwSeJz6JI72v5c/Akmkdn/Xh7qk1G
 ACAHRNJ/G2NKOcEed7KHh09meP2Vi8mTEvLToYaMNMXUlCUZdCpg5vCu8CpNkjullhZf
 lPdMYYfHi1Q6GAK2BwJEf0Y62tJuHp9zO7jypDcmPZO5DwTH1bPPzeeh6Xx4BelX0aPg
 sOUQ==
X-Gm-Message-State: AOAM531WNuZC45DwfqbqnyC2KTdSB2glNIoSI21SzxjKtoygpJj1BSb3
 69GM0ynFpfvPd3Boa6z/tIuhCCCbsvbx4vdIq+RuytHR0Pfirrzvd9zoL6gmFqDlLqsTBH5ywPS
 LTmdLRXwkfGc26lc=
X-Received: by 2002:a7b:c458:: with SMTP id l24mr2218527wmi.108.1643979930043; 
 Fri, 04 Feb 2022 05:05:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgcr8q68osUdWKZdBuTjeffPzJia0Z0/epc+zOVk2gMz1LJmg/e+Tsevnlid0OyNAkgxwR9w==
X-Received: by 2002:a7b:c458:: with SMTP id l24mr2218508wmi.108.1643979929852; 
 Fri, 04 Feb 2022 05:05:29 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id i13sm2436590wrf.3.2022.02.04.05.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 05:05:28 -0800 (PST)
Date: Fri, 4 Feb 2022 08:05:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v4 1/1] virtio: fix the condition for iommu_platform not
 supported
Message-ID: <20220204080404-mutt-send-email-mst@kernel.org>
References: <20220202195438.379753-1-pasic@linux.ibm.com>
 <20220203170635.1dd2b98d.pasic@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220203170635.1dd2b98d.pasic@linux.ibm.com>
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

On Thu, Feb 03, 2022 at 05:06:35PM +0100, Halil Pasic wrote:
> On Wed,  2 Feb 2022 20:54:38 +0100
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> >      }
> > @@ -82,9 +78,14 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
> >          return;
> >      }
> >  
> > +    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >      if (klass->get_dma_as != NULL && has_iommu) {
> >          virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> >          vdev->dma_as = klass->get_dma_as(qbus->parent);
> > +        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> > +            error_setg(errp,
> > +                       "iommu_platform=true is not supported by the device");
> > +        }
> 
> I'm wondering, would it be wise to change the message? Since this is now
> dependent on the VM/bus the device is plugged into the message might be a
> little misleading: i.e. the very same device could work perfectly fine
> with iommu_platform=true if the "surroundings" are different.
> 
> Maybe "the device has no IOMMU support (iommu_platform=true)" would be a
> better option. On the other hand changing the message has its downsides
> as well.

I personally don't care much frankly.

> Also I realized that keeping the return after error_setg() might have
> been a good idea for the case more logic is added at the end of the
> function.

OK so you are sending v5 with this change then?

> In any case I would like to address these, if necessary with a separate
> patch. I don't want the fix to experience any further delays.
> 
> Regards,
> Halil


