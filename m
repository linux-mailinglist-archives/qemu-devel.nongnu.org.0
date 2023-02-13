Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAC8693D31
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 05:01:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRQ0B-00060W-Jv; Sun, 12 Feb 2023 22:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRQ07-000608-SM
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 22:59:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pRQ05-00011f-T1
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 22:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676260772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z0pPhXxhzkzmqOKgaK/n/3+z+Xm0wtt4wKWkmyqEIH4=;
 b=gZ07eZLXZYNqGikHWgkTtNB2gqGhQNGkjTPvrT2M9NJ/EQ2rimqVs1dbue6cTo4bOrPgqs
 QgZEVRN9/ABouiMagcXTo9Rf6G3O5z67lqzg+BipApLZ5se4VOfI1RLmGvmTRlo19YmZQl
 CWwYZjIjRNb2scj+QO36SeXl7KdmMNI=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-s75F1LwSMJOTB_9cuaiGMg-1; Sun, 12 Feb 2023 22:59:30 -0500
X-MC-Unique: s75F1LwSMJOTB_9cuaiGMg-1
Received: by mail-ot1-f69.google.com with SMTP id
 j60-20020a9d17c2000000b0068bd57aa53aso5863651otj.17
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 19:59:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z0pPhXxhzkzmqOKgaK/n/3+z+Xm0wtt4wKWkmyqEIH4=;
 b=8RUnLHffVJMvLDweGSgiKRu+mwx5fs1evkjOhREZG2xNTLOBLLKf8isLmd7GiKxlip
 3tj4yr9hMMYSj1PfV5Rq1PE3sBojQ4TZpHsDIXbSFfe1YMf9qtiqWp550XpH1Hq0e+ck
 qIuRIXtKRSNW0JqcAA9lJBE4yFMIO3Fwg4YmgJ2DcKDt+vC3SVhc0jdZdX/Cpkupj/hz
 xiff8UuaMqDjTtcp5VGmjrn6HZOBfWarv/TtKl5HawDmCQC1hkXOSvLCVI7XjwslIBfv
 8L36UIYnBjdJjufN/I7Fi3vVYPiqdFUQ60Fcxv3UcMhQpnEHCuKZ3NEZZj8UevJ/4E8i
 NAPw==
X-Gm-Message-State: AO0yUKXnhiyEXO0lPhuCUs1MuWzG+N37ogdLS0PuiJIJScVLJHS89J7D
 0Q5BFSHOEOjppAhje1/z9Vx8IMP7IvTvuh/1yvcDZA9n82EKNZeoAODyAQeLwVnvlbHliRhDaaO
 PQgjuvmlB691/pwphTJteFUxNv2WXMMo=
X-Received: by 2002:a05:6808:23d6:b0:363:a978:6d41 with SMTP id
 bq22-20020a05680823d600b00363a9786d41mr1792875oib.280.1676260769941; 
 Sun, 12 Feb 2023 19:59:29 -0800 (PST)
X-Google-Smtp-Source: AK7set8PEeqmqZ8tOkcGNDHHSK2/CqVHaJ74PnKYkTMpUi5gYNmlOVLWJY+AAg9FimMJhl834NiRrU/Jc6eJNii9Z9A=
X-Received: by 2002:a05:6808:23d6:b0:363:a978:6d41 with SMTP id
 bq22-20020a05680823d600b00363a9786d41mr1792874oib.280.1676260769692; Sun, 12
 Feb 2023 19:59:29 -0800 (PST)
MIME-Version: 1.0
References: <20230202062126.67550-1-jasowang@redhat.com>
 <CAFEAcA8TbQFZTG_M3djxiXD+42y8C=QtXrfO9jVEOY4V1PAGGA@mail.gmail.com>
 <fe517a25-b7fc-3227-fb1b-b10be66898f0@redhat.com>
 <CAFEAcA9Z4G74W8k4t3=+vJ5x-W6Skuq_rjbxEj7GHq+7BWEeug@mail.gmail.com>
 <e076fc9f-c0fb-f871-559c-faa968418340@redhat.com>
In-Reply-To: <e076fc9f-c0fb-f871-559c-faa968418340@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 13 Feb 2023 11:59:18 +0800
Message-ID: <CACGkMEshL3eMD-Uy8COELBCaH_ROQXhA925RKmtWoJaN+DQ9hg@mail.gmail.com>
Subject: Re: [PULL 00/11] Net patches
To: Laurent Vivier <lvivier@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
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

On Mon, Feb 6, 2023 at 4:23 PM Laurent Vivier <lvivier@redhat.com> wrote:
>
> On 2/5/23 13:36, Peter Maydell wrote:
> > On Sat, 4 Feb 2023 at 20:09, Laurent Vivier <lvivier@redhat.com> wrote:
> >>
> >> On 2/4/23 15:57, Peter Maydell wrote:
> >>> On Thu, 2 Feb 2023 at 06:21, Jason Wang <jasowang@redhat.com> wrote:
> >>>>
> >>>> The following changes since commit 13356edb87506c148b163b8c7eb0695647d00c2a:
> >>>>
> >>>>     Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2023-01-24 09:45:33 +0000)
> >>>>
> >>>> are available in the git repository at:
> >>>>
> >>>>     https://github.com/jasowang/qemu.git tags/net-pull-request
> >>>>
> >>>> for you to fetch changes up to 2bd492bca521ee8594f1d5db8dc9aac126fc4f85:
> >>>>
> >>>>     vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check (2023-02-02 14:16:48 +0800)
> >>>>
> >>>> ----------------------------------------------------------------
> >>>
> >>> Something weird has happened here -- this pullreq is trying to
> >>> add tests/qtest/netdev-socket.c, but it already exists in the
> >>> tree and doesn't have the same contents as the version in your
> >>> pull request.
> >>>
> >>> Can you look at what's happened here and fix it up, please ?
> >>
> >> Thomas and Jason have queued the patch:
> >>
> >>     tests/qtest: netdev: test stream and dgram backends
> >>
> >> For Jason it's because it's needed by
> >>
> >>     net: stream: add a new option to automatically reconnect
> >>
> >> For me, both patches (in tree and Jason's one) are identical to my v7
> >> (except the one that is merged does not have Thomas' acked-by).
> >
> > When I tried to merge the pullreq I got conflicts because they
> > weren't the same, notably in the set of #include lines.
>
> The differences in the file are introduced by the following patch 10/11:
>
> 5b28ced1bc6d net: stream: add a new option to automatically reconnect
>
> Thanks,
> Laurent
>

Will send a new version of the pull (dropping the duplicated commit).

Thanks


