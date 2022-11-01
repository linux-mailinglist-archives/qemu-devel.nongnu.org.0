Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4370E614347
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 03:32:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oph4E-0001Zw-54; Mon, 31 Oct 2022 22:31:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oph4C-0001Z9-Bz
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 22:31:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oph4A-0006oo-Nw
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 22:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667269910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Kc8W9+dFOLgSF27xvDCLeDhFEgtDH4rZ0hPKTTsH/I=;
 b=L3KD+dPFBA1PxES+OVWMAlsm0nRSA1sSXtx1aV3thYBr1T/sKoMKnhORJnWvkGpWDyVhoz
 u97pYXIcYwiyrQYs8eX8rA6h4bOCEaD/V46JoaBki48F2+wefE6vRV76BGrd/v0YN4hx7l
 0y5rAsA8j/Zytg1RtEvLGmTMxDHXfRo=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-589-o-0LYESdPSC2fJHBa5-dkg-1; Mon, 31 Oct 2022 22:31:47 -0400
X-MC-Unique: o-0LYESdPSC2fJHBa5-dkg-1
Received: by mail-oi1-f199.google.com with SMTP id
 p204-20020aca42d5000000b00354da838ce9so5285460oia.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 19:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5Kc8W9+dFOLgSF27xvDCLeDhFEgtDH4rZ0hPKTTsH/I=;
 b=f9O/Q0xiCnA8KRR13gOs5tFRFeh7oOdEvlMn6v6+s366f4kw+MMasv0wSZenuFUcu6
 ZDf5HHM35VTReD7LC7BM2jAUFA7eaw0IiMHBfZOs8pRgzBLwhZiDsZ6gCL5xHxRZRrfR
 vknenLPiIp6dqULp3K7arRsP7/v+VdK43vyx/VclwdfDgzLsgsp/yFPqjp45/PhU0fTF
 MdLRVfGo/W9v5cq/jLF+KtClE0qijZEjP0Qt2flD1Ev85fKNB2HVehEaXCr9w1Z09HQX
 kSW4UCMojEn+U+HwGF2/lNaKimGmgSNFAMDDU+OkJcJmXid6c6SkcVIzFgBP1ytDw9Hf
 nxaw==
X-Gm-Message-State: ACrzQf1RT0sz/otHi5VIcAbb/4cjfxw9q0vQlxdqMrx422IZzHZpT7Cn
 rRSZ4j+kJnJMzNiQvTdh//QcSz+SvFku7VOr7EfMrO4p38IW/xlaLW9tbzfq3VrCaj0NIoomMGF
 b2I35tzIGWANugDCG50yJ3JgZruJbscU=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr16491891oiw.35.1667269906935; 
 Mon, 31 Oct 2022 19:31:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NSuNsZfu51YjLWvGezaK0ICPQ/0o6iQgOLVjf8gek1tN2bk+6bpmSr7gth/YhwHu+rBXsdrzJv7Z26EEjCbY=
X-Received: by 2002:a05:6808:1483:b0:354:a36e:5b with SMTP id
 e3-20020a056808148300b00354a36e005bmr16491878oiw.35.1667269906772; Mon, 31
 Oct 2022 19:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221020155251.398735-1-eperezma@redhat.com>
 <20221026165830-mutt-send-email-mst@kernel.org>
 <986d8ba9-2634-3224-d548-cf5563639c49@redhat.com>
 <CAJaqyWd4PsYwnnPV0-qh4RhY4k0yLn1fHx=V=h86OTqi0pXQvQ@mail.gmail.com>
In-Reply-To: <CAJaqyWd4PsYwnnPV0-qh4RhY4k0yLn1fHx=V=h86OTqi0pXQvQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 1 Nov 2022 10:31:35 +0800
Message-ID: <CACGkMEt2U5xisCWy9BEw4dJEpHQAOrkcLY+jkoHRGEvQZ18KTw@mail.gmail.com>
Subject: Re: [PATCH 0/4] Shadow VirtQueue event index support
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Gautam Dawar <gdawar@xilinx.com>,
 Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Si-Wei Liu <si-wei.liu@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 28, 2022 at 2:50 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Oct 28, 2022 at 4:44 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/10/27 04:58, Michael S. Tsirkin =E5=86=99=E9=81=93:
> > > On Thu, Oct 20, 2022 at 05:52:47PM +0200, Eugenio P=C3=A9rez wrote:
> > >> Event idx helps to reduce the number of notifications between the de=
vice
> > >> and the driver. It allows them to specify an index on the circular
> > >> descriptors rings where to issue the notification, instead of a sing=
le
> > >> binary indicator.
> > >>
> > >> Adding support for SVQ.
> > >
> > > Jason seems to be taking this through net
> > >
> > > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >
> >
> > Ok, I've queued this.
> >
> > Eugenio, please post the fix for endian on top.
> >
>
> I've got a v2 ready to send, would it be possible to send it right now
> and send a v2 pull? That would save a few commits where the vdpa
> devices do not work with big endian architectures.

Probably too late, but I queue the fixes on top to rc1.

Thanks

>
> Thanks!
>


