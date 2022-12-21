Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D194652CC0
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 07:16:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7sN7-0006lU-Cy; Wed, 21 Dec 2022 01:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p7sN5-0006lG-GJ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 01:14:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1p7sN3-0006YS-Kt
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 01:14:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671603268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nfmMtz5UJ23oiQ4feoB/6H0sYtlD1lIewRFC5pcAS58=;
 b=G9Dds54opOS7cz4gDdNsl1lIx8aKegKNPlI1p7zXMInzMGEwcE5oPDDw4v35xYYRm1xoJo
 HlefvEz7Hrjgz7WKTYunwtRswTDZxOd+86ivXGr/XfbPI8Zd+zwqm+oZFXKLDXB+IuMIH8
 YDUNxbEYugVjMoSpkJDu0W3DCq6gXTA=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-IdCE2g67M0CWWk6Ps2HnaQ-1; Wed, 21 Dec 2022 01:14:26 -0500
X-MC-Unique: IdCE2g67M0CWWk6Ps2HnaQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 s17-20020a4a7311000000b004a35a996d0bso6626156ooc.20
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 22:14:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nfmMtz5UJ23oiQ4feoB/6H0sYtlD1lIewRFC5pcAS58=;
 b=wAmltdTOofYUUPF2UYMGk46Z9LWaMnonYkHEf16TNl1QF1nwqjeXY9b2GNNJdRu+lB
 e3RIz+U0urcnEhMeA5HpNeW7HgBt/AVdN1snDRybjhnHa02LAEVZ3vdF8RcKKLk5G7sz
 Gn+uswwpAECEnqO6gBuYnHc3S06KR29tkSdjRVpQ1DwWCom5nbZ+TJlDysgAiOcq4Flw
 N+j/HnRiB0mANWjX8x1zNTtJe/f30jgmwIsv+vSnvlT38DfCriPADicCS4vP+XvlZJ+6
 pt+0CRXp2XlVUtJR0XwN2AM8MwlzKHMyDHoAfRQyy1JTyFpMsIgD8qc6hTV6juCRr0Fa
 fY1w==
X-Gm-Message-State: AFqh2kp8Gc3lBHhjiF9+hSh8vy52IVkrbBqQP/Ba0Wyt3kUPBUEYgrRC
 +qBycjZxfNr2DKN6vbipUVWtKfrkWtFMXyjQTPzO/h3l6gW8SgaUjmyZCZfU2TkaTHoqUsRTkYN
 01Ojlz46G6F1Bl1WLkE+p4mq0ALanwS0=
X-Received: by 2002:a54:4e96:0:b0:361:11fc:d1f9 with SMTP id
 c22-20020a544e96000000b0036111fcd1f9mr49538oiy.105.1671603265554; 
 Tue, 20 Dec 2022 22:14:25 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtdOJFgPNbx4mFJRIbSR9csBqOHEfv8drPg/wIdkK/DSnTbEFbFtgxN02RkE0apgfXRTEEWzgw2UgbT/lh+0bg=
X-Received: by 2002:a54:4e96:0:b0:361:11fc:d1f9 with SMTP id
 c22-20020a544e96000000b0036111fcd1f9mr49537oiy.105.1671603265385; Tue, 20 Dec
 2022 22:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20221209130805.3614970-1-lulu@redhat.com>
 <20221220093253-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221220093253-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 21 Dec 2022 14:13:48 +0800
Message-ID: <CACLfguViBrWj3Zt4jkLRoyRuKr7CtHQ2wYwNK9QvOzEBSpBYMA@mail.gmail.com>
Subject: Re: [PATCH v12 0/1] vhost-vdpa: add support for vIOMMU
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: jasowang@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

On Tue, 20 Dec 2022 at 22:33, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Dec 09, 2022 at 09:08:04PM +0800, Cindy Lu wrote:
> > These patches are to support vIOMMU in vdpa device
> > Verified in vp_vdpa/vdpa_sim_net driverand intel_iommu
> > virtio-iommu device
>
> Pls address comments and repost.
>
Hi Micheal
There are some issues found while dpdk running with svq enable
we are still working on it, and will post a new version after we
address the bugs
Thanks
Cindy
> > changes in V3
> > 1. Move function vfio_get_xlat_addr to memory.c
> > 2. Use the existing memory listener, while the MR is
> > iommu MR then call the function iommu_region_add/
> > iommu_region_del
> >
> > changes in V4
> > 1.make the comments in vfio_get_xlat_addr more general
> >
> > changes in V5
> > 1. Address the comments in the last version
> > 2. Add a new arg in the function vfio_get_xlat_addr, which shows whether
> > the memory is backed by a discard manager. So the device can have its
> > own warning.
> >
> > changes in V6
> > move the error_report for the unpopulated discard back to
> > memeory_get_xlat_addr
> >
> > changes in V7
> > organize the error massage to avoid the duplicate information
> >
> > changes in V8
> > Organize the code follow the comments in the last version
> >
> > changes in V9
> > Organize the code follow the comments
> >
> > changes in V10
> > Address the comments
> >
> > changes in V11
> > Address the comments
> > fix the crash found in test
> >
> > changes in V12
> > Address the comments, squash patch 1 into the next patch
> > improve the code style issue
> >
> > Cindy Lu (1):
> >   vhost-vdpa: add support for vIOMMU
> >
> >  hw/virtio/vhost-vdpa.c         | 162 ++++++++++++++++++++++++++++++---
> >  include/hw/virtio/vhost-vdpa.h |  10 ++
> >  2 files changed, 161 insertions(+), 11 deletions(-)
> >
> > --
> > 2.34.3
>


