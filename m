Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2363D4EEBDF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 12:54:32 +0200 (CEST)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naEvH-0003VD-61
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 06:54:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1naEtY-0001Pr-93
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1naEtW-0005BW-ML
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 06:52:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648810362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nswqQ0IYG6x2H/kolNyR8ypXsbPHUaK+3SMEri0Up1s=;
 b=Um1iVFOAM5zAw5To6EyRFRte4dfXJAuHvQwo9jYh42K1+PcxIdIJr35zbkeqGQTcRGx03X
 xE6hKoYg9/DIoRrQV2tgGchLKNWi1MH1FVvIM/fJZ7Xm0MH1CbbMe+VvpBnL8k3yWyjjeZ
 4ZP2WFAj8lKSgQmxTnmPZbrRNOWj/U4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61--34zaMFzMW-FIPHAFmayJw-1; Fri, 01 Apr 2022 06:52:41 -0400
X-MC-Unique: -34zaMFzMW-FIPHAFmayJw-1
Received: by mail-qv1-f72.google.com with SMTP id
 fw9-20020a056214238900b0043522aa5b81so1685028qvb.21
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 03:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nswqQ0IYG6x2H/kolNyR8ypXsbPHUaK+3SMEri0Up1s=;
 b=ujyHCPrK9ByTpnqVhwgsSSXTikKhRauDSdNNUz+fDvjpMpXiSgUvTNwyfO4rNw0fA8
 nbht9vVfItL/05jqIpCjASGK5zxhbu6X2aZdGswqcHIdS1Dmqyocdfti+Ie+m4wOfwjr
 ACLPw7j/z/S1SbEwxyDLCYxnFxUQFcGraCAmg7pxe0/JFR9znWhMg1vgDYniAtJPxy08
 GR/ScUYR0u3S4AtURKIlDbB/1JhhMhRIne6ZaM6h4fPVlW3jImvqb1cqxx5Leitdebbg
 kOmtycDXu89VNIGbDNmKZRH/lCj1a3jjMjMUKIOxdx83n24cJNmmAeL3F176veG1sfg0
 giIg==
X-Gm-Message-State: AOAM532WQNaXfwl/pEB2G8KV0FY+oHNdIcRLiGD+/ACOc4yFDmiDMn52
 zk1roOGnU1RR+PXOehy2QHW1GCx63LPLvGy10YMlW5ysgUoz7zeHQfuPlkjgsp5ka14jwD5RY9J
 TS+XEaT4MoWLsBbsxPc4V4NJXyN554JQ=
X-Received: by 2002:ac8:5a0b:0:b0:2eb:9af4:c920 with SMTP id
 n11-20020ac85a0b000000b002eb9af4c920mr4249794qta.221.1648810360333; 
 Fri, 01 Apr 2022 03:52:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5z0t4K2SXs5obg0by5bP2FLShBJlxgibDvXoh+daYZLaiutoQtyFvPePnQ0DQXdVMYKObdN6RAWqkAD+WJww=
X-Received: by 2002:ac8:5a0b:0:b0:2eb:9af4:c920 with SMTP id
 n11-20020ac85a0b000000b002eb9af4c920mr4249786qta.221.1648810360098; Fri, 01
 Apr 2022 03:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220331182935.538101-1-eperezma@redhat.com>
 <CACGkMEvEKGxccu5_tFeVqthZrr_KfwVy2MFVw4rZhJbG90Z4QA@mail.gmail.com>
 <a20683a3-3534-7318-c52d-6bf03a7e9ef6@gmail.com>
In-Reply-To: <a20683a3-3534-7318-c52d-6bf03a7e9ef6@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 1 Apr 2022 12:52:04 +0200
Message-ID: <CAJaqyWd4vqduWwb=R9MrAuBT7HUj4VB-qE_by5K5FUqc6RGErw@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: use g_memdup2() instead of unsafe g_memdup()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 12:31 PM Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> On 1/4/22 04:31, Jason Wang wrote:
> > On Fri, Apr 1, 2022 at 2:29 AM Eugenio P=C3=A9rez <eperezma@redhat.com>=
 wrote:
> >>
> >> Fixing that literal checkpatch.pl because it will complain when we mod=
ify the file
>
> See https://www.mail-archive.com/qemu-devel@nongnu.org/msg834178.html
>

Sorry I missed that series. It performs more replacements so regarding
virtio it's better to push yours.

Thanks!

> >> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >
> > Acked-by: Jason Wang <jasowang@redhat.com>
> >
> >> ---
> >>   hw/net/virtio-net.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >> index 1067e72b39..e4748a7e6c 100644
> >> --- a/hw/net/virtio-net.c
> >> +++ b/hw/net/virtio-net.c
> >> @@ -1443,7 +1443,8 @@ static void virtio_net_handle_ctrl(VirtIODevice =
*vdev, VirtQueue *vq)
> >>           }
> >>
> >>           iov_cnt =3D elem->out_num;
> >> -        iov2 =3D iov =3D g_memdup(elem->out_sg, sizeof(struct iovec) =
* elem->out_num);
> >> +        iov2 =3D iov =3D g_memdup2(elem->out_sg,
> >> +                               sizeof(struct iovec) * elem->out_num);
> >>           s =3D iov_to_buf(iov, iov_cnt, 0, &ctrl, sizeof(ctrl));
> >>           iov_discard_front(&iov, &iov_cnt, sizeof(ctrl));
> >>           if (s !=3D sizeof(ctrl)) {
> >> --
> >> 2.27.0
> >>
> >
>


