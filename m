Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7F2668E32
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 07:44:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGDmB-0003W8-Sn; Fri, 13 Jan 2023 01:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGDm8-0003Vu-Bz
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 01:42:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pGDm5-0001j0-W5
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 01:42:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673592167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LVU5YOr6XKAOel/IcgTLXYBpoAU0ZTnBjS8kYpc7SOA=;
 b=CDSfHpQ4Y/k0d0oe/VkhJoO883F5AEUprBkuK0gv/rcGTpYY4306LMCphZE6M9bUxRvYXV
 xKe0VLmLb0VJq5Ab215FwyXphOe377WSSnQJVwCDiaWsQOUrZg7Tupq426ydQVMTgH8kgs
 8y1KA/5kNyECHL5rUTXX6bYwB/yq2rw=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-ke3zbr22MyqM0iy95DmvTA-1; Fri, 13 Jan 2023 01:42:46 -0500
X-MC-Unique: ke3zbr22MyqM0iy95DmvTA-1
Received: by mail-yb1-f198.google.com with SMTP id
 r8-20020a252b08000000b007b989d5e105so18471848ybr.11
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 22:42:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LVU5YOr6XKAOel/IcgTLXYBpoAU0ZTnBjS8kYpc7SOA=;
 b=sgKi/5rkQ7ldJ22F8CtLFAfBKmHdp8om6DE2Vd1dromlHcNQx3FRKP94SvCti4qFUc
 KWwomeW0Vl5NvoYWOF7z9tphbmjDaZgndJCD3CIgTlfN1YLFlSHVOgTF1z2+gSqZsXez
 nuenLplc1K3yxNz5qXO9/wc+ULh7JBvLZUEw46HT4aP7fdXQxNQU1A2Cz6Tqsu34s9EP
 t2B7m/d1YrzD2xH2LPSx43vvq5fXFZX+Cj7fyKsd4Vr6UshEl2HGzGkdEj7Mo1WwDrhE
 km9WTlLEiK+0jOskGTk4XmWJ08nxLbpEDTlgUXaIcd8nPeT1YblLTSrpKlFE/VAJ2FUn
 eG/w==
X-Gm-Message-State: AFqh2koZmw637NBQmFKdfm4WqHEVSO2kKf2uswFYlnSMPS28ti1BO23F
 YEe82soWmUzcGOwQVipTUTDCBUmPPkLQ2Mt9UcLyf8qw7Zx1r2/Wcms89w2o7ZcLP8gr0Vu/Jgk
 f6GTbfenvN92OLN6OWkDMITlnpsvvQYg=
X-Received: by 2002:a81:6555:0:b0:499:f27a:2924 with SMTP id
 z82-20020a816555000000b00499f27a2924mr6333539ywb.411.1673592165818; 
 Thu, 12 Jan 2023 22:42:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuJDvjxciErNh6+bq5wpAYWlyC3nPJNRs783pC0PKDTouwzWHVIMEjTKMjVG7yRszrd8ILGJ1eLDNxYbfVj/iQ=
X-Received: by 2002:a81:6555:0:b0:499:f27a:2924 with SMTP id
 z82-20020a816555000000b00499f27a2924mr6333526ywb.411.1673592165609; Thu, 12
 Jan 2023 22:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-2-eperezma@redhat.com>
 <CACGkMEs2UaDFSn=_bvZ+6xXJCUAd71wVhBbp9r5mJLN=e_mG2A@mail.gmail.com>
In-Reply-To: <CACGkMEs2UaDFSn=_bvZ+6xXJCUAd71wVhBbp9r5mJLN=e_mG2A@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 13 Jan 2023 07:42:09 +0100
Message-ID: <CAJaqyWd3Lpq1+metjajg7C3v0FbdhAnH1AM=BxZs5eFwhn3sWg@mail.gmail.com>
Subject: Re: [RFC v2 01/13] vdpa: fix VHOST_BACKEND_F_IOTLB_ASID flag check
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, si-wei.liu@oracle.com, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, alvaro.karsz@solid-run.com, 
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, 
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Fri, Jan 13, 2023 at 4:12 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Jan 13, 2023 at 1:24 AM Eugenio P=C3=A9rez <eperezma@redhat.com> =
wrote:
> >
> > VHOST_BACKEND_F_IOTLB_ASID is the feature bit, not the bitmask. Since
> > the device under test also provided VHOST_BACKEND_F_IOTLB_MSG_V2 and
> > VHOST_BACKEND_F_IOTLB_BATCH, this went unnoticed.
> >
> > Fixes: c1a1008685 ("vdpa: always start CVQ in SVQ mode if possible")
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
> Acked-by: Jason Wang <jasowang@redhat.com>
>
> Do we need this for -stable?
>

The commit c1a1008685 was introduced in this development window so
there is no stable version of qemu with that patch. But I'm ok to CC
stable just in case for sure.

Thanks!

> Thanks
>
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
> >
>


