Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B583E67FCED
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Jan 2023 06:44:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pM0U6-0005gh-SG; Sun, 29 Jan 2023 00:44:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pM0U4-0005gP-NG
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 00:44:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pM0U3-0008RD-6p
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 00:44:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674971046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5BQBGM7cdSrZUu9C20fxSrXWMSkHEg8SIM9mtzf8714=;
 b=Er4HEba33XGSVcS2mf+ZImD/DgYjVovS2iD2y7JY4O0T7befU76BXLx7W3lRuBSWZ7ZXmd
 UJDhz97vCJ/15MnU4fOfGinh9CFE5FNhiHu9ekMlc8qYT9uxO36AgcgozCYkmtX64/fkIN
 zpFcTyAOT+vteA5NG0wc85jP7J78gNg=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-552-GHKuCS0APGWCjVmkCvoZOA-1; Sun, 29 Jan 2023 00:44:03 -0500
X-MC-Unique: GHKuCS0APGWCjVmkCvoZOA-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-1631c656f97so3051491fac.1
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 21:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5BQBGM7cdSrZUu9C20fxSrXWMSkHEg8SIM9mtzf8714=;
 b=d/E3UsddTaU26j/429WyOERgOOgUjIsPjjThbkKRls5zDtiZ1qEPWLuLRwDEDViTmd
 9rcPM9rhC2T0lu2eHnMozMlVr4N/522xlxdIuYChUZip/zZjOOHloBAu/216V/m3HLSa
 ppqa9ODrnW1TrWqkfyz0zBnlQsphbZYZY6TSioGR9Y89c5lDA5Ifr+3JbMge8EY+1ZBu
 W2d7+u313ZxIMIASmtp1BhXqlXJ29h3qfrDZiBp7xR1wv8AHKhcApqHhBogoxaI2gSih
 vpA/hKPV9bz9Uq1UZB6ykNzNvTyr3F13IUzWJvT6xlb3LKO6/5MnIgQBgC4Dz6DrHj8O
 ORIQ==
X-Gm-Message-State: AFqh2koHdhpUC/fS5nN7c/gCQZXWWrr9n6cMV9hCr1YQ4sqgJGOyKaNv
 C3KeOfQT7EK5RT1hE3514RC02/6LqUR62k/Y4CUeNO076+xLUxneohCWqgUO0ilKg0xd5A/e+zF
 yDnyLRWG/mjtW/sNBifz/RTS0Dqs6psY=
X-Received: by 2002:a9d:51cd:0:b0:684:d018:10a6 with SMTP id
 d13-20020a9d51cd000000b00684d01810a6mr2316051oth.5.1674971043180; 
 Sat, 28 Jan 2023 21:44:03 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuYJA2VhONYHdvmmwe6A5nkuB1UsBhCbUPP9Q5d87hBX1RZ7Mf9jweaMO6mkr9usvcY3pvJNsvo4hdBeAGwRSE=
X-Received: by 2002:a9d:51cd:0:b0:684:d018:10a6 with SMTP id
 d13-20020a9d51cd000000b00684d01810a6mr2316050oth.5.1674971043012; Sat, 28 Jan
 2023 21:44:03 -0800 (PST)
MIME-Version: 1.0
References: <20230117105308.1337120-1-eperezma@redhat.com>
 <20230123093908-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230123093908-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Sun, 29 Jan 2023 13:43:52 +0800
Message-ID: <CACGkMEt36LzsDmw_SZc9JQXm4xnbycxA1NphNfYMunH9Sfk5PA@mail.gmail.com>
Subject: Re: [PATCH] vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, elic@nvidia.com, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 qemu-devel@nongnu.org, 
 Cindy Lu <lulu@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 leiyang@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jan 23, 2023 at 10:39 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jan 17, 2023 at 11:53:08AM +0100, Eugenio P=C3=A9rez wrote:
> > VHOST_BACKEND_F_IOTLB_ASID is the feature bit, not the bitmask. Since
> > the device under test also provided VHOST_BACKEND_F_IOTLB_MSG_V2 and
> > VHOST_BACKEND_F_IOTLB_BATCH, this went unnoticed.
> >
> > Fixes: c1a1008685 ("vdpa: always start CVQ in SVQ mode if possible")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > Acked-by: Jason Wang <jasowang@redhat.com>
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> Jason are you merging this?

Queued.

Thanks

>
> > ---
> > Originally on SUSPEND series, but it is a fix that it is worth to send
> > and apply individually:
> > https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg02574.html
> >
> > ---
> >  net/vhost-vdpa.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 1a13a34d35..de5ed8ff22 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -384,7 +384,7 @@ static int vhost_vdpa_net_cvq_start(NetClientState =
*nc)
> >              g_strerror(errno), errno);
> >          return -1;
> >      }
> > -    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
> > +    if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_IOTLB_ASID)) ||
> >          !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
> >          return 0;
> >      }
> > --
> > 2.31.1
>


