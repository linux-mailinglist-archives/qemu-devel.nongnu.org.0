Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40001426D39
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:07:05 +0200 (CEST)
Received: from localhost ([::1]:39756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYrSh-0001st-Jm
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mYrRp-0001Da-O7
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:06:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mYrRj-0004rN-27
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633705561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rf7kPfzx3Yg/H6ycA28nBhGY5kFDbkJjW1odues4U3E=;
 b=Wbctn2RWG5koYKWUw7VljMfwYtb0yY8HHcjkYHuZVdbl6WvrgLkXtUSyJjHfdJ+4L5FOS2
 KkkDDwa7aOTtls576p0g+7cN7OX+VBa9m20fqTc0G71SK3zeQKURytpJkrQQwKDI0tdCJ2
 UXglIJ9+DMG6MfiZ7KdaCs++YaGiTDI=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-Op20AQkGOLmnj7ubuvJoEw-1; Fri, 08 Oct 2021 11:05:49 -0400
X-MC-Unique: Op20AQkGOLmnj7ubuvJoEw-1
Received: by mail-io1-f71.google.com with SMTP id
 m7-20020a6b7b47000000b005dc506c5e04so2562674iop.5
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=rf7kPfzx3Yg/H6ycA28nBhGY5kFDbkJjW1odues4U3E=;
 b=siT07G/NKz8aulnjwsw7f0EHkzzjfsGOUp5wOxyivUq/elAuGK49zVnJtWwsPTHIK6
 UDmxOrJdWJz4kwAD6AIQW8KsVyVXc4NGD+zat1JZnagwY//vEziXEwsFLyPa/L1JaDTn
 TMXsJ5/rDpatdnSfAhobHS8xzZQu1F4kLf7KDRCMtZO0Q8BdmP0WYhMtfKdHssTSlZAe
 tj6YqF2zH09MtWGFCIAx0ha/xuuL+ylw6hnm4mJz02DdpH+zslwrS5OxT9qNsAs/EZ3G
 +4x1LEAm9WpWojMC4VU1Y6Ep9eUkXSGmHFM8HYvq2oIVXls5hJ4LvLCqBS0qcoKZheMV
 aAeQ==
X-Gm-Message-State: AOAM531w2RUHU2bYZOdK280Gx+yInLvo4X47iy1A9RwtHKnqK7cmou+y
 FSlWPPCt3J/ZPdRvl6bmihpRCT6jJTHymLUetUaI6EfHVUkdEUltIEn/FJ+8yXRUH9aFpTc8RMY
 GE1YEJJzdNXG3uqY=
X-Received: by 2002:a05:6602:2c02:: with SMTP id
 w2mr8034741iov.45.1633705548664; 
 Fri, 08 Oct 2021 08:05:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp5fTqRXnSX/w7sOUVA7M0bV4TuvyL3x32lAg8tcq2M72yYmFt0iFIF/PQqOeLmsaZKOftag==
X-Received: by 2002:a05:6602:2c02:: with SMTP id
 w2mr8034713iov.45.1633705548428; 
 Fri, 08 Oct 2021 08:05:48 -0700 (PDT)
Received: from redhat.com (c-107-2-142-8.hsd1.co.comcast.net. [107.2.142.8])
 by smtp.gmail.com with ESMTPSA id z5sm1141221ile.42.2021.10.08.08.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:05:47 -0700 (PDT)
Date: Fri, 8 Oct 2021 09:05:45 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v2 0/2] vfio: Some fixes about vfio-pci MMIO RAM mapping
Message-ID: <20211008090546.2b8e10cb.alex.williamson@redhat.com>
In-Reply-To: <59ccc25e-3a5e-8963-209e-a3c9e5dece92@huawei.com>
References: <20210914015326.1494-1-jiangkunkun@huawei.com>
 <59ccc25e-3a5e-8963-209e-a3c9e5dece92@huawei.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 tangnianyao@huawei.com, ganqixin@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Oct 2021 09:27:04 +0800
Kunkun Jiang <jiangkunkun@huawei.com> wrote:

> Kindly ping,
>=20
> Hi all,
>=20
> Will=C2=A0this=C2=A0patch=C2=A0be=C2=A0picked=C2=A0up=C2=A0soon,=C2=A0or=
=C2=A0is=C2=A0there=C2=A0any=C2=A0other advice?

More reviews are always appreciated.  Requesting reviews by your
colleagues and/or exchanging reviews with other contributors are good
ways to offload maintainers and provide more confidence in the patch
series.  Thanks,

Alex


> On 2021/9/14 9:53, Kunkun Jiang wrote:
> > This series include patches as below:
> >
> > Patch 1:
> > - vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping in live migration
> >
> > Patch 2:
> > - Added a trace point to informe users when a MMIO RAM ection less than=
 PAGE_SIZE
> >
> > History:
> >
> > v1 -> v2:
> > - Add iterate sub-page BARs in vfio_pci_load_config and try to update t=
hem [Alex Williamson]
> >
> > Kunkun Jiang (2):
> >    vfio/pci: Fix vfio-pci sub-page MMIO BAR mmaping in live migration
> >    vfio/common: Add trace point when a MMIO RAM section less than
> >      PAGE_SIZE
> >
> >   hw/vfio/common.c |  7 +++++++
> >   hw/vfio/pci.c    | 15 ++++++++++++++-
> >   2 files changed, 21 insertions(+), 1 deletion(-)
> > =20
>=20


