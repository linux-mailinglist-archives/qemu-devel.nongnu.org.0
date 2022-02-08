Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C50674ADB72
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:44:03 +0100 (CET)
Received: from localhost ([::1]:48006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRis-0008Oa-D1
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:44:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHQFP-0005KS-OJ
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:09:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nHQF7-0000bd-Eu
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 08:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644325752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2bTbEl8gYLj6ddVb3wCudTV0J3Pkilyx6hPZngLiU9k=;
 b=awEy89KpZfWPuUADb388YPEsc2n0ASdAtQkSywcPkowBoa5oHOEtBHPZtcteNwlOPQrXrK
 i/R97g1xNdZ7FpWSJyC+yDr+3WnNj+2Vn2VGN4IEpimAtKhdUgFOd1+4N5KsiG4xccCxVr
 t25DYwutTHSQOWBiVVTf9/ERpxCSFrw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-pVe5_B3XMWmTVmfS9JVCAw-1; Tue, 08 Feb 2022 08:09:11 -0500
X-MC-Unique: pVe5_B3XMWmTVmfS9JVCAw-1
Received: by mail-wr1-f69.google.com with SMTP id
 v9-20020adfa1c9000000b001e33e5dbd5fso393330wrv.17
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 05:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2bTbEl8gYLj6ddVb3wCudTV0J3Pkilyx6hPZngLiU9k=;
 b=p2eyyJEgm/01H0hDDdcQ8DBCvxCHdhFpzzB2JMbQn32uJ5TW/+qgwItGjI63QrDwne
 HpKvPy9o0/9+58bQBXU+edndvf7DK4sHFtyM2ZW8nIXvrxO8zVFrwgNnPT9sNZ3ArJU5
 JLC3hvkTTWu2ic/eGTk0kLmJjOIxN1rhhC17eUcOF08bWSthyvyV1XvGEQqo5VHsRLBr
 ee0frA6/4BZtDdXNDimtJ9GJenq/A0XLIpwTvrPCEoDSNrYjc0L8AmJ7Nnpp606lHX7a
 w0Rv1r//P7W9iMyxRFfbWG9CG1p59zk8VX+j3c3c72DB57koyuDgP0WK+bfndNBhEXHD
 i0rg==
X-Gm-Message-State: AOAM530bsgLT0mJnLD7oqpo1WeJG198Od5UWVjupX4HJX8z7OIieq1lZ
 rdscqIC/6tuUFBgwZubKpoCF64D1My8DFZlTH/Kpgwf4SS4/Q9bwILjCp0vKjCtUnws6qWSjXbd
 cHEuoLTzIwLtX4TQ=
X-Received: by 2002:a5d:5445:: with SMTP id w5mr3552192wrv.680.1644325750578; 
 Tue, 08 Feb 2022 05:09:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDkSdaeZC8QFttgK0CvZ3aWHVDvPowPQ1HpZlwy+Zo1P6mMcqYpPGhmXf5z46Ia2xxNcmJSg==
X-Received: by 2002:a5d:5445:: with SMTP id w5mr3552171wrv.680.1644325750401; 
 Tue, 08 Feb 2022 05:09:10 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id l11sm14896499wry.50.2022.02.08.05.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 05:09:08 -0800 (PST)
Date: Tue, 8 Feb 2022 13:09:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 3/4] virtio-iommu: Support bypass domain
Message-ID: <YgJrc5USsfszKrTw@work-vm>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-4-jean-philippe@linaro.org>
 <bf447d9b-c039-ccdc-f24f-ab8b56c1b196@redhat.com>
 <YfffLBO47Sh3uq1b@work-vm>
 <140a23d7-d128-1273-6f07-0883e13c4600@redhat.com>
 <YgJiWMcPp5OlCUWY@myrica>
MIME-Version: 1.0
In-Reply-To: <YgJiWMcPp5OlCUWY@myrica>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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
Cc: lvivier@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 thuth@redhat.com, Juan Quintela <quintela@redhat.com>, mst@redhat.com,
 cohuck@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 Eric Auger <eric.auger@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jean-Philippe Brucker (jean-philippe@linaro.org) wrote:
> On Wed, Feb 02, 2022 at 02:21:37PM +0100, Eric Auger wrote:
> > >>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> > >>> index ec02029bb6..a112428c65 100644
> > >>> --- a/hw/virtio/virtio-iommu.c
> > >>> +++ b/hw/virtio/virtio-iommu.c
> > >>> @@ -43,6 +43,7 @@
> > >>>  
> > >>>  typedef struct VirtIOIOMMUDomain {
> > >>>      uint32_t id;
> > >>> +    bool bypass;
> > >> I am afraid this will break the migration if you don't change
> > >> vmstate_domain.
> > >>
> > >> See static const VMStateDescription vmstate_domain.
> > >> Also you need to migrate the new bypass field.
> > >>
> > >> Logically we should handle this with a vmstate subsection I think to
> > >> handle migration of older devices. However I doubt the device has been
> > >> used in production environment supporting migration so my guess is we
> > >> may skip that burden and just add the missing field. Adding Juan, Dave &
> > >> Peter for advices.
> > > I'm not sure about users of this; if no one has used it then yeh; you
> > > could bump up the version_id to make it a bit clearer.
> > 
> > Thank you for your input. Yes to me it sounds OK to only bump the
> > version_id while adding the new field.
> 
> Ok. Just to make sure we're on the same page, this means we don't support
> migration from new->old or old->new instances, since the migration stream
> doesn't carry a version ID for the virtio-iommu-device and domain
> vmstates, as far as I understand. I also believe backward-incompatible
> changes are fine this time around, though I don't have much visibility in
> what's being used.

I think the stream only has it for top level devices; I've not dug into
this device.

Dave

> Thanks,
> Jean
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


