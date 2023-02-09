Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC20690C14
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 15:41:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ864-0006Id-P4; Thu, 09 Feb 2023 09:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1pQ861-0006IE-LN
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:40:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1pQ860-0007XX-3x
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 09:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675953618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M2saHMvhWJVXyGwY4wsGmSgx120+ZgJRgfQe0Y2C81Q=;
 b=Y2IKtYCcG8dN0YK5Vnm6xpEjNuc2tQ7d2miq+G2/x/gtSY4IZ4NB+UUBMk+tTNk6cL8wUn
 3LBGhimcB04bSDOQr8cp7HP2ayc5wiR/0UlfNqGnOQmCcryAiK0UCk0ytAPgVfvrGCCmod
 BVMFNr29CQaLIQaJIbrizmk1J0Bluw4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-U27dnGawPiuO7PKZYcIoSw-1; Thu, 09 Feb 2023 09:39:04 -0500
X-MC-Unique: U27dnGawPiuO7PKZYcIoSw-1
Received: by mail-ej1-f72.google.com with SMTP id
 ti11-20020a170907c20b00b00886244203fcso1628171ejc.2
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 06:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M2saHMvhWJVXyGwY4wsGmSgx120+ZgJRgfQe0Y2C81Q=;
 b=zvSyG6QROUhaQyobf0X/UVESWi2ZpLvjq6ZnwwjvX/d2djEaqPqzNZ6msXljXqBy5E
 E7SjHFQdUKY6vJT33FOLCikwcerXN0IL+3nHIdEoGISdEpzXGIgiF3qK6da+mRDvnu6S
 wfOKm88XPBauNvbMd9k5H7KUlDJu7kek/+l1EPU2T1AvwSpZ4822vG8j/YJbgAMkuAb8
 sjaReBNGZLAg0KjQZnFzlGoMbNm95GLKhJtC0D8+7PKTG2j73Zlyf/ytf9iUFHZTo0pk
 9m8z/cihuWDbRZB8ObT4mned2/QDvIj7MiPY48SuV+PUp0isz2xWcEJbrsPykoPculA7
 jDTw==
X-Gm-Message-State: AO0yUKUheA+CU22dnwd7/aQeG7HzZdLS2YiXxem8E7HmHLXptqaACZN8
 oC4P12rITiNFAKXzw+1/ZgLOwH83P4UOPq0FAEwdlicYoj5DLEELKIhxNvOqkqbsqm169Q5VYvJ
 qIbZfAmgIpAvZQ+LTIlxn60snKjVT5cQ=
X-Received: by 2002:a17:906:3385:b0:88e:e46a:6c2 with SMTP id
 v5-20020a170906338500b0088ee46a06c2mr566013eja.15.1675953543784; 
 Thu, 09 Feb 2023 06:39:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/SKFEKSB6RqYIctoudZ7K2r9qxVLVU+TPp60s/JHSFVyGqN9q+3Ny/j7+RY3fUSjZGVOEpGu4Sc1ojQlEDzy8=
X-Received: by 2002:a17:906:3385:b0:88e:e46a:6c2 with SMTP id
 v5-20020a170906338500b0088ee46a06c2mr565991eja.15.1675953543567; Thu, 09 Feb
 2023 06:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <CAJs=3_DQQPGUYK_Fv4tuiVcdJ6V1dtRjRkUL3_EqNhwJt-+kYg@mail.gmail.com>
In-Reply-To: <CAJs=3_DQQPGUYK_Fv4tuiVcdJ6V1dtRjRkUL3_EqNhwJt-+kYg@mail.gmail.com>
From: Lei Yang <leiyang@redhat.com>
Date: Thu, 9 Feb 2023 22:38:27 +0800
Message-ID: <CAPpAL=zmoqr3PY8gJ10xDWh-S3YOK5+wn9X0J1FQzu9+7HOJow@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] Dynamycally switch to vhost shadow virtqueues at
 vdpa net migration
To: Alvaro Karsz <alvaro.karsz@solid-run.com>
Cc: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leiyang@redhat.com;
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

QE tested this series on the rhel. Creating two vdpa_sim devices, and
boot two VMs without shadow vq. The migration was successful and
everything worked fine

Tested-by: Lei Yang <leiyang@redhat.com>

Alvaro Karsz <alvaro.karsz@solid-run.com> =E4=BA=8E2023=E5=B9=B42=E6=9C=888=
=E6=97=A5=E5=91=A8=E4=B8=89 18:29=E5=86=99=E9=81=93=EF=BC=9A
>
> HI Eugenio, thanks for the series!
>
> I tested the series with our DPU, SolidNET.
>
> The test went as follow:
>
> - Create 2 virtio net vdpa devices, every device in a separated VF.
> - Start 2 VMs with the vdpa device as a single network device, without
> shadow vq.
>    The source VM with "-netdev
> vhost-vdpa,vhostdev=3D/dev/vhost-vdpa-0,id=3Dhostnet0"
>    The destination VM with "-netdev
> vhost-vdpa,vhostdev=3D/dev/vhost-vdpa-1,id=3Dhostnet0"
> - Boot the source VM, test the network by pinging.
> - Migrate
> - Test the destination VM network.
>
> Everything worked fine.
>
> Tested-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
>


