Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE2358A073
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 20:26:01 +0200 (CEST)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJfXk-00013Q-2d
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 14:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJfPw-0005zK-99
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:17:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oJfPs-0001EM-0H
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 14:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659637069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+9D4J5FXERbiy4CcwgLzv9vTV99nR5su8r0up/lUlk=;
 b=N4fJ8ervJsNPJ4FCPXLhRbIE2c2d8X/Nu0mGCb4H+3UIljcYi9bJZqPHUFm6J9pg9pI9Nw
 WacXJ0uS2Y9UjW7td+9qFQWcV+KQgSbYyN2YeizYZbiJUp8Js+l08Mcxw19xL82cDRECuq
 kIMibePj4b9KwsNysR/8q7ewHlXNdc0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-r8mKY41UMdObKZutcWfFdQ-1; Thu, 04 Aug 2022 14:17:48 -0400
X-MC-Unique: r8mKY41UMdObKZutcWfFdQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 196-20020a6301cd000000b0041b0f053fd1so226090pgb.6
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 11:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=E+9D4J5FXERbiy4CcwgLzv9vTV99nR5su8r0up/lUlk=;
 b=zf/yuPlL+zVMP2ioXU+2hiF/2h3YMt86Z2MWnSqO0SuQ7K41e819NvhNyADNl7A61K
 PhfxGmjJgfTuslLrxoxuwsd7qvI2UGFv0SfXqZTaf5zIcYOnOnXlxH0rNziMuk7PTEqp
 lg0sJ918WidLrbInCekImQ2SWItq1HpfN1UWEIAq86GpAU0zobs+zwamDj1EqaQZCfE2
 zITEnNkW9zTVOV2DfoyejWAR6Lbaa/ebzR3/AprbRTthF2DYAbRr/MTLrInbC09x3Tbp
 NwK/ye999vYfLUT0+afPgoHd7o081cPzHzDJXySZiK+sKu84V0m+PoJ85N1B3zWmLSdO
 czwQ==
X-Gm-Message-State: ACgBeo2niE2owcyuy7rAbvo1GiKObCzCRoB2mzB3i9sSUS3RAScpBbon
 xHlQt6StrhfpAuHhfxzacK7uFDEVfnqPlvVucTiUqrpa/V6LJ1OaWtoWhcpIywIuSAvBIEQ4cgT
 unTBkLAYwgDItk5tlEX9PhAF11WkDRxc=
X-Received: by 2002:a17:902:ccc4:b0:16c:5766:51f9 with SMTP id
 z4-20020a170902ccc400b0016c576651f9mr3057653ple.84.1659637067356; 
 Thu, 04 Aug 2022 11:17:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7/U1co9iFC2vT3DRiO6uItvtgQtUNJCPvbIhB2+ngL54TY3iGxZRL2Y2PxWjwo5nlOyys+f8t06uLtwTQg8lU=
X-Received: by 2002:a17:902:ccc4:b0:16c:5766:51f9 with SMTP id
 z4-20020a170902ccc400b0016c576651f9mr3057626ple.84.1659637067027; Thu, 04 Aug
 2022 11:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220802175731.312115-1-eperezma@redhat.com>
 <c665ec60-fea6-8b10-4d4a-615ff20af1a6@redhat.com>
In-Reply-To: <c665ec60-fea6-8b10-4d4a-615ff20af1a6@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 4 Aug 2022 20:17:10 +0200
Message-ID: <CAJaqyWfteZAdmhruow9CTF+VHzfSoy396-zWJnyMfYzp_0WZJg@mail.gmail.com>
Subject: Re: [PATCH v5 00/10] NIC vhost-vdpa state restore via Shadow CVQ
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-level <qemu-devel@nongnu.org>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Parav Pandit <parav@mellanox.com>, 
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, 
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 4, 2022 at 6:21 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/8/3 01:57, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > CVQ of net vhost-vdpa devices can be intercepted since the work of [1].=
 The
> > virtio-net device model is updated. The migration was blocked because a=
lthough
> > the state can be megrated between VMM it was not possible to restore on=
 the
> > destination NIC.
> >
> > This series add support for SVQ to inject external messages without the=
 guest's
> > knowledge, so before the guest is resumed all the guest visible state i=
s
> > restored. It is done using standard CVQ messages, so the vhost-vdpa dev=
ice does
> > not need to learn how to restore it: As long as they have the feature, =
they
> > know how to handle it.
> >
> > This series needs fixes [1], [2] and [3] to be applied to achieve full =
live
> > migration.
> >
> > Thanks!
> >
> > [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02984.h=
tml
> > [2] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03993.h=
tml
>
>
> Note that the above has been merged into master.
>
> And the series looks good overall, just some comments to make the code
> easier to be read and maintained in the future.
>

I think I addressed all of them, plus some others that were decided to
leave for later. We can revert them if it's not fine.

Sending a new version.

Thanks!


