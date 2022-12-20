Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44976521D4
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 14:56:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7d4l-0005V3-Bp; Tue, 20 Dec 2022 08:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p7d4j-0005Ty-3N
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:54:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p7d4h-0001AW-K5
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 08:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671544470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cFk4RrsHH3XIDeciaWFqUGsNnQ/N9ScmSTjUk5dLqIs=;
 b=Xnnl2OSKtJLRIGp+cXkpPAFny9ly5C8gz5VStFRzY9vOXyYspaxYCQbEUn8IX9T8YH7Bqh
 WEVi3rkqErYo+g2AoEifTVWRW/i9Y1X/NjAs9yu2w3VZXeclCFD2CqLLCr/HN7CxCIFyHS
 qQEmgR/F7Bm1lBfcTozo76uts3DLIVs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-86-2v47yn2bNQ-OpnAs7uQNlQ-1; Tue, 20 Dec 2022 08:54:29 -0500
X-MC-Unique: 2v47yn2bNQ-OpnAs7uQNlQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 b18-20020a056402351200b004761159f677so7919617edd.6
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 05:54:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFk4RrsHH3XIDeciaWFqUGsNnQ/N9ScmSTjUk5dLqIs=;
 b=DvjyqPXbTm4R0CIYg78tqOkhXC40v1pRSlTi64pvAJjt7/k8ebMP7EhJFtWBC+a96F
 Ox8teSurYiigbkki8XwSxUiTMLYqDgylbzirINN4NGMA6EQKCPC9zpoPmvbOBGrJc2NJ
 AZC0xOxMRR/K5hl8ecekv2ptOR+9IIiB+hBLJuAyJiSGzvACHmwRoGWwBO3Makq2/pBN
 mwRvCUSbVlmDOc825SytEBTHMDI3aQHUSXDzCwBwRQ2+439Fpi5e6+Z8bbIwwsK8DRH4
 k3OXp0TRoaNiSvr60P9YeyZISIvs9NBtLN4+qk6y8dsuFA0QSQqkE+uexMd8Tod+8Dtv
 fj1g==
X-Gm-Message-State: AFqh2kp/wGAzM5pnlfjswnOHLLZ7wmZ+W7Jugydhf7jbH4lKMOkJkdju
 Jtg4TPjwMpLcLAXV6veekaypCDU92D+YxybXMaN5WjLlOrNJqzBOJ+CfO+dhzCRAPoh56Obh0Mb
 EcQimU6nWiHs74T7FDuuJjC2VqG1P4tA=
X-Received: by 2002:a17:906:c9c7:b0:7f9:f8a7:730d with SMTP id
 hk7-20020a170906c9c700b007f9f8a7730dmr816523ejb.73.1671544467986; 
 Tue, 20 Dec 2022 05:54:27 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuavQqvPGE5hgLVdSLZELCpxQ/NQ2PrkSxO+H2EDrNPWI00Z1gv4z90PsYeZ849kz6+y24EGV92Jq6d8Y6YChM=
X-Received: by 2002:a17:906:c9c7:b0:7f9:f8a7:730d with SMTP id
 hk7-20020a170906c9c700b007f9f8a7730dmr816511ejb.73.1671544467816; Tue, 20 Dec
 2022 05:54:27 -0800 (PST)
MIME-Version: 1.0
References: <20221124173314.2123015-1-eperezma@redhat.com>
 <20221124173314.2123015-3-eperezma@redhat.com>
 <CACGkMEsbib_drMeDecQeHw2ND+s7T2zMOtcQMEtFBzW-0yV=hA@mail.gmail.com>
In-Reply-To: <CACGkMEsbib_drMeDecQeHw2ND+s7T2zMOtcQMEtFBzW-0yV=hA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 20 Dec 2022 14:53:50 +0100
Message-ID: <CAJaqyWez-Hsom+sWSJDHHOt9A95GDFMAzt0YtWay5TiGDyrtYg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] virtio_net: copy VIRTIO_NET_S_ANNOUNCE if device
 model has it
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Eli Cohen <eli@mellanox.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Laurent Vivier <lvivier@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 Lei Yang <leiyang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>, Cindy Lu <lulu@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Wed, Nov 30, 2022 at 7:58 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Nov 25, 2022 at 1:33 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > Status part of the emulated feature. It will follow device model, so we
> > must copy it as long as NIC device model has it set.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >  hw/net/virtio-net.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index eed629766f..bf71ef33e8 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -183,6 +183,7 @@ static void virtio_net_get_config(VirtIODevice *vde=
v, uint8_t *config)
> >              memcpy(netcfg.mac, n->mac, ETH_ALEN);
> >          }
> >
> > +        netcfg.status |=3D (n->status & VIRTIO_NET_S_ANNOUNCE);
>
> Do we need to care about the endian here? We use:
>
>     virtio_stw_p(vdev, &netcfg.status, n->status);
>
> At the beginning of this function.
>

Right, this is a miss. I'll fix it in the next version.

Thanks!


