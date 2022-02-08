Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BC24ADAFD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 15:17:32 +0100 (CET)
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHRJD-0007mi-LP
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 09:17:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nHPeG-0001hn-S6
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:31:15 -0500
Received: from [2a00:1450:4864:20::434] (port=37606
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1nHPeC-0002x5-0k
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 07:31:08 -0500
Received: by mail-wr1-x434.google.com with SMTP id w11so30468036wra.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 04:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Af4YX31fAKtYi/XrzniNdzxMPIXfE1Q/iMd/futVkVI=;
 b=r+qQeS/iA5+3oPhZHSc6GYat1js8AlLPO76+zKtTtFLwEmEVzym1vW9VN11PazLC6a
 iQjAmKDWafboF5Lu+io9IBc8Q/xqnVpRrcp6CTRE42XDbMxPCVzY2UCsHa93cczDs+I7
 xSnF4d6VWeAzt+qzoW1KZb7Ki5o7EdRunzgtYg/ZZ1HULaLlC9UthQMc2E15L545KJTr
 CllhntslPzBo6c7DgFso+dIHmaCaLzMoMavLaojcXbzWZSUcklIVtQDJCn7UCui0ri6F
 Ei0xWuckLvFN+XfkL6sWQgVIMxaj1pz1hU0IJbsMB5EX3ZzFk8Gm4WceQmO8gGKZCYrD
 88Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Af4YX31fAKtYi/XrzniNdzxMPIXfE1Q/iMd/futVkVI=;
 b=X7pts86FMV9r8OJAxF+yCiAl9uh1RX6SJ0haw1G6VkiAgi8XB16pbTt/MseKAnuYP/
 mmcRXRNdB0V1atubO2d1dGYtPErU30shrRprnWMnaGZpXNtHanwXINhx1S6itEDO4pL5
 dd98omOLjSeViRWkvUsE+9gjPMZE6uUNx+Btzpkc/AtVvrNLIuNKTk3OkzMBfT5JO3wa
 5NyySrcPpOcxQLwmboL8EmBMjedctvPq+jVpPV15ZjCZ0PxVc9yH6Nr8xh0CS1iKRKcu
 okPE68roadzYxfcXpxP6TbBezmG+lDImUQGaSDAEiWRF8z6g0RuTIn/IUksAbCc4zPqZ
 Y83Q==
X-Gm-Message-State: AOAM530geg1+HAibYbdRDI/40lbDTqqmJGYZ9LI3KOxSv+fqnG9DTvlS
 0btAkaihcGe9pUcaNQitGAjtow==
X-Google-Smtp-Source: ABdhPJyY4obnYR8U9/p9PVPqNlf/VPvvjclNra6DNmGjTpMSwgrLA/ePoFe46DZOqk102YCJk/5kQg==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr3428462wrz.518.1644323439774; 
 Tue, 08 Feb 2022 04:30:39 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id i2sm2555689wmq.23.2022.02.08.04.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:30:39 -0800 (PST)
Date: Tue, 8 Feb 2022 12:30:16 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 3/4] virtio-iommu: Support bypass domain
Message-ID: <YgJiWMcPp5OlCUWY@myrica>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-4-jean-philippe@linaro.org>
 <bf447d9b-c039-ccdc-f24f-ab8b56c1b196@redhat.com>
 <YfffLBO47Sh3uq1b@work-vm>
 <140a23d7-d128-1273-6f07-0883e13c4600@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <140a23d7-d128-1273-6f07-0883e13c4600@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 thuth@redhat.com, mst@redhat.com, cohuck@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, Juan Quintela <quintela@redhat.com>, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 02, 2022 at 02:21:37PM +0100, Eric Auger wrote:
> >>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> >>> index ec02029bb6..a112428c65 100644
> >>> --- a/hw/virtio/virtio-iommu.c
> >>> +++ b/hw/virtio/virtio-iommu.c
> >>> @@ -43,6 +43,7 @@
> >>>  
> >>>  typedef struct VirtIOIOMMUDomain {
> >>>      uint32_t id;
> >>> +    bool bypass;
> >> I am afraid this will break the migration if you don't change
> >> vmstate_domain.
> >>
> >> See static const VMStateDescription vmstate_domain.
> >> Also you need to migrate the new bypass field.
> >>
> >> Logically we should handle this with a vmstate subsection I think to
> >> handle migration of older devices. However I doubt the device has been
> >> used in production environment supporting migration so my guess is we
> >> may skip that burden and just add the missing field. Adding Juan, Dave &
> >> Peter for advices.
> > I'm not sure about users of this; if no one has used it then yeh; you
> > could bump up the version_id to make it a bit clearer.
> 
> Thank you for your input. Yes to me it sounds OK to only bump the
> version_id while adding the new field.

Ok. Just to make sure we're on the same page, this means we don't support
migration from new->old or old->new instances, since the migration stream
doesn't carry a version ID for the virtio-iommu-device and domain
vmstates, as far as I understand. I also believe backward-incompatible
changes are fine this time around, though I don't have much visibility in
what's being used.

Thanks,
Jean

