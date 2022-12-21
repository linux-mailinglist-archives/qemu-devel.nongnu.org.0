Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424DE652BBA
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 04:18:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7pbm-0008PB-H6; Tue, 20 Dec 2022 22:17:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p7pbk-0008Oo-I9
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 22:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p7pbi-0002yi-Tz
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 22:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671592645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qYfjuBp6JKVqaaoQpF1V0XVKRa4Dzr/DyjXRjhFcH3o=;
 b=QGleabQKaA2mYxV954zw7yxT2hJP+W0fwO3Xq0P++bVhv3GXK+ZW7rPVLGiOqgEU2oTSHz
 QNPiQ5Aqklj+dy21IPeRk+SOD/DIulqggT8mPUaWz4hnIDGx91oUhpB5UtOqg4EzoXwOkz
 h5+okkvvSg1fppJNucUMBgETRcFHA8o=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-Q1PSAXXUOfK0A-v5j4C7FA-1; Tue, 20 Dec 2022 22:17:21 -0500
X-MC-Unique: Q1PSAXXUOfK0A-v5j4C7FA-1
Received: by mail-ot1-f69.google.com with SMTP id
 ca5-20020a056830610500b0066ea21701ceso7971252otb.7
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 19:17:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qYfjuBp6JKVqaaoQpF1V0XVKRa4Dzr/DyjXRjhFcH3o=;
 b=LKoay2HT3RWGlrLQI+0+C3oEJ7BEZCJ5+osvCGhJDHtEOBcfDEG8qE+RvnC2hV9zyf
 sP7KaDMszU/KsfxmCPDAnnR8g9J+vyKTg6dSVAFIiYyjWRE09cLrrM1BPImtre4AyIVP
 DOUFw4SE754PC285YfYODoEGRj+2Q4Cf2u1YRJa0dQ/hnzl+TTJLd6d6QZxRdMbob6GZ
 Sc2CYTY3ke6AjrOhZqqEXW8NNhYKar/7dFIcclGxNcGKkPaAc7wSTmcmyOZctBQ04ll6
 KClb4aNzYzzNsruyEEla4RfnG/JJCPrrpZIyoL3jFtmj8nge9sasXNWxgSbd0+LmLjHA
 rFcw==
X-Gm-Message-State: AFqh2ko0CqQ5G38cOw8tGKbVGQxmjl8EgX3XM6E3u3N3HwnzvX3FXels
 taDpA/SNPwqdEkbYIcLmz+xxEIb5GTJRHVUGC/+BT3goY08vljRsUtUQRsmrleXMVBzC/ww3hZL
 1ybKvHIa+QlabY8fZf1ZW81rUdfxP+cc=
X-Received: by 2002:a05:6870:3d97:b0:144:b22a:38d3 with SMTP id
 lm23-20020a0568703d9700b00144b22a38d3mr2738oab.280.1671592640763; 
 Tue, 20 Dec 2022 19:17:20 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtMbRuBs8LHObZl/VXEvJQcsT2ugl7EjVDLCUYYub/zv9kc3FUGkJale6CL/2d0GbAxO8B04jURYWASHG7bt4w=
X-Received: by 2002:a05:6870:3d97:b0:144:b22a:38d3 with SMTP id
 lm23-20020a0568703d9700b00144b22a38d3mr2734oab.280.1671592640594; Tue, 20 Dec
 2022 19:17:20 -0800 (PST)
MIME-Version: 1.0
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221220085253-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221220085253-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 21 Dec 2022 11:17:09 +0800
Message-ID: <CACGkMEt-RiXRwAGngvghNDVX9mWdQyhn4BRFPL80TfFtFUYJ+g@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix UNMAP notifier for intel-iommu
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: peterx@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 viktor@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Dec 20, 2022 at 9:53 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Nov 29, 2022 at 04:10:34PM +0800, Jason Wang wrote:
> > Hi All:
> >
> > According to ATS, device should work if ATS is disabled. This is not
> > correctly implemented in the current intel-iommu since it doesn't
> > handle the UNMAP notifier correctly. This breaks the vhost-net +
> > vIOMMU without dt.
> >
> > The root casue is that the when there's a device IOTLB miss (note that
> > it's not specific to PCI so it can work without ATS), Qemu doesn't
> > build the IOVA tree, so when guest start an IOTLB invalidation, Qemu
> > won't trigger the UNMAP notifier.
> >
> > Fixing by build IOVA tree during IOMMU translsation.
> >
> > Thanks
>
>
> IIUC you were going to post v2? At least commit log fixes.

Yes.

Thanks

>
> > Jason Wang (3):
> >   intel-iommu: fail MAP notifier without caching mode
> >   intel-iommu: fail DEVIOTLB_UNMAP without dt mode
> >   intel-iommu: build iova tree during IOMMU translation
> >
> >  hw/i386/intel_iommu.c | 58 ++++++++++++++++++++++++-------------------
> >  1 file changed, 33 insertions(+), 25 deletions(-)
> >
> > --
> > 2.25.1
>


