Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F736AB49B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 03:19:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ0Rf-00036z-D6; Sun, 05 Mar 2023 21:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZ0Rd-00035b-3r
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:19:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pZ0Rb-0006sI-9D
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 21:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678069158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vGxVTFqgZJQvKGV/mS7dcGqHGKPakYtwGXnWdI4Avv4=;
 b=NDxI4w0uuOKpFZqFfmMIZdlLZ7NacOPxOcRawu5NfUDEhJwE110VkLuZ1EcudylPFQPEcX
 KnXj3paStbCPPE9nicKZEhSTv2YeYWnAjb6fHkcblCE3U5efwbnY/fYaGUoQkMpXMVs75H
 0cysoNlF0bz/Tp9Z3+RCynTynV3Oo0I=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-8t42qFeGMV-DZZdTVboV0A-1; Sun, 05 Mar 2023 21:19:16 -0500
X-MC-Unique: 8t42qFeGMV-DZZdTVboV0A-1
Received: by mail-io1-f69.google.com with SMTP id
 y6-20020a056602120600b0074c87f954bfso4675266iot.4
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 18:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vGxVTFqgZJQvKGV/mS7dcGqHGKPakYtwGXnWdI4Avv4=;
 b=cvePkJeJA+sRTZEirOX9hLDirVxUS5X6IbZUt1L9GSs1yUjNGfJLbfxFTkHlW9NYb1
 oX7BTb9AfXSA789kXvFG075heeVHVJ8assz0GfdL8yKbLyuzQe0HOPVCUBDSBRTtohkD
 CZacsXJ/mkedD7YRyi5L25I+Ebu8x47KcCaqHizZeu4gVl2trawf5n6Rf1DU6yPBqiid
 EHQeEVABz55P5y1mIs2DdJ/qZI1KqS1zyNP3ormuIATgagSVrGiq8FGYnQK4eMO1l1q9
 RuXoSab/nCur8KwvuvFwkNiGKrxnz5IwslVz9JnTCUwkmT5ajjcefMlOvew4NcUOqRM/
 ox+w==
X-Gm-Message-State: AO0yUKV8ON1ytFuIUhwfldXOWFlwLIuqmzCW90rCzH9VKv2TcugzMlhw
 hqJ5ynWkaGb2teKWSEui/xyIre/oB+pImn1BKjqWBZUrNG6Lsqs9m0p6OL3/c99dHaoYpgdMT/X
 QyfyEeST6X6smm28=
X-Received: by 2002:a05:6e02:188f:b0:317:9c76:db61 with SMTP id
 o15-20020a056e02188f00b003179c76db61mr11091940ilu.12.1678069156096; 
 Sun, 05 Mar 2023 18:19:16 -0800 (PST)
X-Google-Smtp-Source: AK7set9OdyYe4DVk72Fkfr1OHHa4wfFZ6/nnjZ/SRB8DRciUqiJey73an4B+fJbmJa6R5Pjp1IS31g==
X-Received: by 2002:a05:6e02:188f:b0:317:9c76:db61 with SMTP id
 o15-20020a056e02188f00b003179c76db61mr11091925ilu.12.1678069155772; 
 Sun, 05 Mar 2023 18:19:15 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 j17-20020a02a691000000b0039deb26853csm2877084jam.10.2023.03.05.18.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 18:19:15 -0800 (PST)
Date: Sun, 5 Mar 2023 19:19:13 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Cc: qemu-devel@nongnu.org, Cedric Le Goater <clg@redhat.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>
Subject: Re: [PATCH v3 00/13] vfio/migration: Device dirty page tracking
Message-ID: <20230305191913.562b7a85.alex.williamson@redhat.com>
In-Reply-To: <d8c298a7-41a3-49bf-6c5c-b071b1398160@oracle.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230305135734.71d54dd1.alex.williamson@redhat.com>
 <d8c298a7-41a3-49bf-6c5c-b071b1398160@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Sun, 5 Mar 2023 23:33:35 +0000
Joao Martins <joao.m.martins@oracle.com> wrote:

> On 05/03/2023 20:57, Alex Williamson wrote:
> > On Sat,  4 Mar 2023 01:43:30 +0000
> > Joao Martins <joao.m.martins@oracle.com> wrote:
> >   
> >> Hey,
> >>
> >> Presented herewith a series based on the basic VFIO migration protocol v2
> >> implementation [1].
> >>
> >> It is split from its parent series[5] to solely focus on device dirty
> >> page tracking. Device dirty page tracking allows the VFIO device to
> >> record its DMAs and report them back when needed. This is part of VFIO
> >> migration and is used during pre-copy phase of migration to track the
> >> RAM pages that the device has written to and mark those pages dirty, so
> >> they can later be re-sent to target.
> >>
> >> Device dirty page tracking uses the DMA logging uAPI to discover device
> >> capabilities, to start and stop tracking, and to get dirty page bitmap
> >> report. Extra details and uAPI definition can be found here [3].
> >>
> >> Device dirty page tracking operates in VFIOContainer scope. I.e., When
> >> dirty tracking is started, stopped or dirty page report is queried, all
> >> devices within a VFIOContainer are iterated and for each of them device
> >> dirty page tracking is started, stopped or dirty page report is queried,
> >> respectively.
> >>
> >> Device dirty page tracking is used only if all devices within a
> >> VFIOContainer support it. Otherwise, VFIO IOMMU dirty page tracking is
> >> used, and if that is not supported as well, memory is perpetually marked
> >> dirty by QEMU. Note that since VFIO IOMMU dirty page tracking has no HW
> >> support, the last two usually have the same effect of perpetually
> >> marking all pages dirty.
> >>
> >> Normally, when asked to start dirty tracking, all the currently DMA
> >> mapped ranges are tracked by device dirty page tracking. If using a
> >> vIOMMU we block live migration. It's temporary and a separate series is
> >> going to add support for it. Thus this series focus on getting the
> >> ground work first.
> >>
> >> The series is organized as follows:
> >>
> >> - Patches 1-7: Fix bugs and do some preparatory work required prior to
> >>   adding device dirty page tracking.
> >> - Patches 8-10: Implement device dirty page tracking.
> >> - Patch 11: Blocks live migration with vIOMMU.
> >> - Patches 12-13 enable device dirty page tracking and document it.
> >>
> >> Comments, improvements as usual appreciated.  
> > 
> > Still some CI failures:
> > 
> > https://gitlab.com/alex.williamson/qemu/-/pipelines/796657474
> > 
> > The docker failures are normal, afaict the rest are not.  Thanks,
> >   
> 
> Ugh, sorry
> 
> The patch below scissors mark (and also attached as a file) fixes those build
> issues. I managed to reproduce on i386 target builds, and these changes fix my
> 32-bit build.
> 
> I don't have a working Gitlab setup[*] though to trigger the CI to enable to
> wealth of targets it build-tests. If you could kindly test the patch attached in
> a new pipeline (applied on top of the branch you just build) below to understand
> if the CI gets happy. I will include these changes in the right patches (patch 8
> and 10) for the v4 spin.

Looks like this passes:

https://gitlab.com/alex.williamson/qemu/-/pipelines/796750136

Thanks,
Alex


