Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A76612137
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 10:00:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oogkm-00072n-Rh; Sat, 29 Oct 2022 03:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oogkk-000723-O2
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 03:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1oogkj-00076n-Bd
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 03:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667030376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rrOg6pitUaWH7CYXMxw5odXg6Te7I+fYCT4t7f5tgXU=;
 b=Qgfls3eh0kr9/j7tJ0E4Bot+vmDxHDB6ZQjSl2xTL3MZ/4rrMpCI2NfkCrYrAS6JDQl0qJ
 g+AW6qkDWq+B7+ispBKw7F9xirXiBfGgj3q1IiB7hb+bftpk2olclDodXa9snNZ9CXR9Hy
 hP7s7Fn4VX4htJLF9iKhHWZKieRP2CM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-18-Wd8pAL9iMYa_X4qnXQWUQw-1; Sat, 29 Oct 2022 03:59:31 -0400
X-MC-Unique: Wd8pAL9iMYa_X4qnXQWUQw-1
Received: by mail-ed1-f71.google.com with SMTP id
 b14-20020a056402278e00b004621a2642d7so4692482ede.1
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 00:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rrOg6pitUaWH7CYXMxw5odXg6Te7I+fYCT4t7f5tgXU=;
 b=CkFqaF6bvJqPuEXdgSBDfmimxJFkTsAMuQng0fGp3hMvLqtQHCyWi/5bxZljSPMKuH
 0B+uZE5bjmyqXHKGMAXukljDRa273PaAYh1w1rsnluzSCYu7UsSFgpKwFXMFRUmZKIKR
 JylNYdBpnt2SqKuJtNbT6S/86NS6i2hhBVqNJYxJEBiA1IJJsEtS9ubVc5o8e9qQwqE7
 Q4a7ExA+ox5iYNpOBXwduj5cgpeowdHBsIfy30/4vOkOnXusiWADN2Tntt1d7Dx00QRy
 KDB/jMU50Ikh7no6UjHM1jWfqc3hGqihm/i/6C0cAYJswEOppxtF5ebXFCnItaDvwskG
 H/Bg==
X-Gm-Message-State: ACrzQf2cCI+WelMtu4vdulabJb/3vI7BZPzGDEsWrzNXcIn440LeZpm9
 rHp62vWwTAgETmYHCjOvBuMfZqwyjUOFM44VXJLori57FfXRmZRJF+XlLh0pY+fXvDPnqXhMz6y
 9s8Qmu311LMS3vCsiZwJvtW/O1JpbcsU=
X-Received: by 2002:a17:907:7e95:b0:78d:e9cf:82c7 with SMTP id
 qb21-20020a1709077e9500b0078de9cf82c7mr3071277ejc.724.1667030370839; 
 Sat, 29 Oct 2022 00:59:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6byGRFA4qebYTz+SnZrUYUKsVmxKQ/38+LaXYlzO0c2t9YAj3dAFiQOX6R0LSo4tz2XbXxSdu6RUF/cFoZ3ro=
X-Received: by 2002:a17:907:7e95:b0:78d:e9cf:82c7 with SMTP id
 qb21-20020a1709077e9500b0078de9cf82c7mr3071258ejc.724.1667030370541; Sat, 29
 Oct 2022 00:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221027074032.1101939-1-lulu@redhat.com>
 <20221029035659-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221029035659-mutt-send-email-mst@kernel.org>
From: Cindy Lu <lulu@redhat.com>
Date: Sat, 29 Oct 2022 15:58:53 +0800
Message-ID: <CACLfguXaf5+q31jVk-ksX7FnCyMKaRETmM=hxQ16Qe2VP5SyPQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] vhost-vdpa: add support for vIOMMU
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: alex.williamson@redhat.com, jasowang@redhat.com, pbonzini@redhat.com, 
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org, sgarzare@redhat.com, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 29 Oct 2022 at 15:57, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Oct 27, 2022 at 03:40:30PM +0800, Cindy Lu wrote:
> > These patches are to support vIOMMU in vdpa device
> >
> > changes in V3
> > 1. Move function vfio_get_xlat_addr to memory.c
> > 2. Use the existing memory listener, while the MR is
> > iommu MR then call the function iommu_region_add/
> > iommu_region_del
> >
> > changes in V4
> > 1.make the comments in vfio_get_xlat_addr more general
>
> I expect there will be v5 addressing Alex's comments.
>
sure, Thanks Micheal, I will post it soon
Thanks
Cindy
> > Cindy Lu (2):
> >   vfio: move the function vfio_get_xlat_addr() to memory.c
> >   vhost-vdpa: add support for vIOMMU
> >
> >  hw/vfio/common.c               |  92 +----------------------
> >  hw/virtio/vhost-vdpa.c         | 131 ++++++++++++++++++++++++++++++---
> >  include/exec/memory.h          |   4 +
> >  include/hw/virtio/vhost-vdpa.h |  10 +++
> >  softmmu/memory.c               |  84 +++++++++++++++++++++
> >  5 files changed, 222 insertions(+), 99 deletions(-)
> >
> > --
> > 2.34.3
>


