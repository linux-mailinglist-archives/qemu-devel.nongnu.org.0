Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4462C5A0792
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 05:21:36 +0200 (CEST)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR3R1-0007Al-5I
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 23:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR3OQ-00058H-PX
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oR3ON-0005tz-2E
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 23:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661397530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCKgF03c6M35Fokfm2fyB6ND5018IpNP+LQeXcsN85E=;
 b=Ck/YeTYLuMsmflWD8EntjaII+uZyu4/M1oE1bBbhx8Y1N0ga/PFnGe4QtgsOAkxZkiJCEL
 CzBYpunkv/U/ODIKGckzMsTIOR+SMhtU26kh/51ZZ041BmvhCxLWxLcOFUFDrrhMv+RIX/
 ZHC/OvyDRChBsZm6TKJEP9hSAubASPg=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-35-D-_fZJgFOBKzuW8Oj5VicA-1; Wed, 24 Aug 2022 23:18:46 -0400
X-MC-Unique: D-_fZJgFOBKzuW8Oj5VicA-1
Received: by mail-lf1-f70.google.com with SMTP id
 v21-20020a197415000000b00492c4d45175so5376416lfe.4
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 20:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=kCKgF03c6M35Fokfm2fyB6ND5018IpNP+LQeXcsN85E=;
 b=sJuoZsP2ZOij7cFbk2rgS/g2B+ex1hY3a0y6kk97xFt2T4R29dVQ4/8lvpL/94U60T
 N1HGPx9CNY9ZuVUwZdtXMhGMclvFU//No1668h0IDDfptniIhrBxS3Ur7pV/TBMgFzbu
 pupCKzOPSVZpGRPWaBwtt9zGJ/K/0Ke6ejPdia53wUoVDgUEA2qcP8RqCZ9nrlezbfBW
 0XVv/qEAc6XOGrhfJeBB5GJmbISnhK/Fn9+nhkJkCr5S3TUsYtDyQmkiYKqOs/RUBB99
 z+gK1SB8WhFT4WJesU21dJc6Kq0Z+1oklsjaUCvUKymLa9FHLZvamCEQZL6+s4xU2wcy
 zxCQ==
X-Gm-Message-State: ACgBeo31SzghSdrXjVRWpAHDgT+8RroahTCw9MTMYxdR7P79MiYypOHP
 1AfeyyxduNuUuHcarxsp370F4c4MM0/1UOJLc7QmUc1MFmvF9ML8gWnaGtIYxm0MpW5QISMsXCM
 8NIMYoqvcG1QJPiq1OfBpUlSZbSsdtoQ=
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id
 y14-20020a0565123f0e00b0048a5edd99b2mr494066lfa.124.1661397524771; 
 Wed, 24 Aug 2022 20:18:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7oRT/74xgxuWR1asK5X2mR+68VaZQ+7mFCJmmqjMOhQAzKBcZ6DFV6UTcFObnvYaOQJDehQve4aVWznborsxg=
X-Received: by 2002:a05:6512:3f0e:b0:48a:5edd:99b2 with SMTP id
 y14-20020a0565123f0e00b0048a5edd99b2mr494042lfa.124.1661397524417; Wed, 24
 Aug 2022 20:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220824183551.197052-1-eperezma@redhat.com>
In-Reply-To: <20220824183551.197052-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 25 Aug 2022 11:18:33 +0800
Message-ID: <CACGkMEu9-8xm77wCdmrHgtE=G=7isbNOq3VU-PLLKA6foSWrNw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Vhost-vdpa Shadow Virtqueue multiqueue support.
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cindy Lu <lulu@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, 
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Aug 25, 2022 at 2:35 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> This series enables shadowed CVQ to intercept multiqueue commands through
> shadowed CVQ, update the virtio NIC device model so qemu send it in a
> migration, and the restore of that MQ state in the destination.
>
> It needs to be applied on top of [1].
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg02965.html
>
> v2:
> * Add vhost_vdpa_net_load_cmd helper to avoid out buffers castings.
> * Make cvq_cmd_in_buffer virtio_net_ctrl_ack type.
>
> Eugenio P=C3=A9rez (6):
>   vdpa: Make VhostVDPAState cvq_cmd_out_buffer control ack type
>   vdpa: extract vhost_vdpa_net_load_mac from vhost_vdpa_net_load
>   vdpa: Add vhost_vdpa_net_load_mq
>   vdpa: validate MQ CVQ commands
>   virtio-net: Update virtio-net curr_queue_pairs in vdpa backends
>   vdpa: Allow MQ feture in SVQ

(Typo here).

Looks good, let's wait for confirmation from Si Wei. Then I can queue
this series.

Thanks

>
>  hw/net/virtio-net.c |  17 +++-----
>  net/vhost-vdpa.c    | 101 ++++++++++++++++++++++++++++++++++----------
>  2 files changed, 85 insertions(+), 33 deletions(-)
>
> --
> 2.31.1
>
>


