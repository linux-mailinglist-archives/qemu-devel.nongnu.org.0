Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ECD66B7D0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 08:07:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHJaB-0008QB-Ic; Mon, 16 Jan 2023 02:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHJa8-0008Px-1Z
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 02:07:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pHJa6-0002On-MW
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 02:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673852817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/chksCIn5KKTR+p9jKw8t8bk5GmjFL44/4phuz2uNEU=;
 b=h94wIxhG3G/BxWPvDBKlWVHGrIlgi22GZF4AMFXqFCrzw8YPVgdsZkHAKDo3n5fn1IIrSi
 gyZW3INHUyc9kJxGWydBIn3+sASH+wXvogr/0XZ49W2f8aSZIqbY22s60ahJP8KuDSmzDO
 UTt2NiPNZAnMt35Gw2MhP8+IfSCv34U=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-VIDFC7CPOY61_x2LpHz2zw-1; Mon, 16 Jan 2023 02:06:56 -0500
X-MC-Unique: VIDFC7CPOY61_x2LpHz2zw-1
Received: by mail-oi1-f200.google.com with SMTP id
 d20-20020a05680808f400b0035e4213541cso6391833oic.7
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 23:06:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/chksCIn5KKTR+p9jKw8t8bk5GmjFL44/4phuz2uNEU=;
 b=LWgh2Ar6ZODXi6Rd56ah4MwSZetynk7ZIRnqzaLia8yBJSSpdlRlh+h21rbB0nmG4o
 HXPx/50zlqBh+oy8rIKICxgNblnBT6FA7zWgJkWMkS0iRU4gLMDVQoiQyZnyhmzLvpHQ
 kjZJxeEThhLrt83APb0nRKjfsav6EmhJeZlszNQ7zLV5CeARVmWe+yFXlobITRXu93R0
 SPQ5ueivGc5BdOUNf0MV8vpMV8bfJqaLSbO7PgbopZP78QD6vizcyyFDcl+4tjHGM1Q2
 YZtTq/UMZy3D92NEOzK91I3n1Ta6g/3BO8pjHJEJzy/OR8dU97J3Gc6Q8lZsPtUYo4/E
 tu4A==
X-Gm-Message-State: AFqh2krEsRnZlEJLiMuwwQs8MRMY9l92QvCBltqQ3jQUluH1g1p34yyW
 PLrW2M7YBa7yhmVEc6orsRuSWO5N2UJ7nM47Xp0zmTHS8hC9hmDaW83xj5pIlgp+WdaDm2gZ8Py
 rtIpoggCGYsMNVpl3AjBxN+SZ2pS+uY0=
X-Received: by 2002:a05:6808:150f:b0:363:a978:6d41 with SMTP id
 u15-20020a056808150f00b00363a9786d41mr3737327oiw.280.1673852815817; 
 Sun, 15 Jan 2023 23:06:55 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvTmgOoQNh6WhuWtab56X7uWc73oFHV12+GuzbkQCzQ/DHxhJcdPwYtHAHCPBgYodx8QxplrbHlYR5anmZQFbM=
X-Received: by 2002:a05:6808:150f:b0:363:a978:6d41 with SMTP id
 u15-20020a056808150f00b00363a9786d41mr3737321oiw.280.1673852815606; Sun, 15
 Jan 2023 23:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20221129081037.12099-1-jasowang@redhat.com>
 <CAPv0NP74wPer5uqrWYh8EeFO_YSATNuo5UpADD2QrE34=FwkrQ@mail.gmail.com>
In-Reply-To: <CAPv0NP74wPer5uqrWYh8EeFO_YSATNuo5UpADD2QrE34=FwkrQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 16 Jan 2023 15:06:44 +0800
Message-ID: <CACGkMEvREZQGT=bbpbGAW4UmPreMJ=SriYp3d5L0_FCECQ6yvg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix UNMAP notifier for intel-iommu
To: Viktor Prutyanov <viktor@daynix.com>
Cc: mst@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org, 
 eric.auger@redhat.com, Yan Vugenfirer <yvugenfi@redhat.com>
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

On Mon, Jan 16, 2023 at 7:30 AM Viktor Prutyanov <viktor@daynix.com> wrote:
>
> On Tue, Nov 29, 2022 at 11:10 AM Jason Wang <jasowang@redhat.com> wrote:
> >
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
> >
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
> >
>
> Hi Jason,
>
> I've tried the series with Windows Server 2022 guest with vhost and
> intel-iommu (device-iotlb=off) and now networking on this system has
> become working.
> So, as we discussed, I'm waiting for the series to be accepted in some
> form to continue my work about supporting guests who refuse Device-TLB
> on systems with device-iotlb=on.
>
> Tested-by: Viktor Prutyanov <viktor@daynix.com>

Great, Peter has some comments on this series, so I will probably send
a new version (probably after the chinese new year).

Thanks

>
> Best regards,
> Viktor Prutyanov
>


