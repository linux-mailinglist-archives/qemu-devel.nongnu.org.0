Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D36F669356
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 10:52:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGGjB-0008VE-11; Fri, 13 Jan 2023 04:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pGGj8-0008Uk-1u
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 04:51:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pGGj5-0000Sx-Oq
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 04:51:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673603514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKioc8Ry7+msFHxsjQpiArE5o3FuRZ+QZs2xDYw/NJk=;
 b=QPK41LlUGjtHiW+Nijbia8imu1lMjZ6HPmVAj9vc3xJeJ0BH7xO033cuuk2HJ6ALAWdJa3
 6J0nRrDiercOLiebELHZwwrdMwmU01xVslVaCJWXWBUfRi2O+kFeQq5YTMZOImVDTK0Wvn
 qH9D3dmxQwyGNMppMlchaCLzsPp1VYE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-Dqzzewo8PHS2qCDKySKYtg-1; Fri, 13 Jan 2023 04:51:51 -0500
X-MC-Unique: Dqzzewo8PHS2qCDKySKYtg-1
Received: by mail-wr1-f70.google.com with SMTP id
 g24-20020adfa498000000b002bbeb5fc4b7so3442923wrb.10
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 01:51:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KKioc8Ry7+msFHxsjQpiArE5o3FuRZ+QZs2xDYw/NJk=;
 b=qPe8/Lt/qSXIwJHhf2IyATx9X4hX36eiUgTYIyemEogIZ+VHkLVOM3UiNi3Kp/6YXg
 HGhxQNUAMUDLCRdNMFW4hKIlJCLAEpg9QvySuxGaYpi7CcxjaC89EuVO9j4m6B02l4s4
 NOU4kXuW2x4Jx09EGvVGZplucTSc23IZoEOqMUxPtm41aTOwLIrU2UA01tkwacJyjiWg
 ZAix4MnOp4ypYKzi2PTuk2NTtkmqtF1eSGdzEKIX/PpV5Y+o8DvNpcZVcluh/UEg/fHj
 iOdzW0hN98a3kz8+t2uOMJfGcFAl+DOyOaAaQrM5dUyRo1FNb2ar5FyZgwuHJiX9+i08
 Nx0A==
X-Gm-Message-State: AFqh2kqwvtk9CdJ9FZjejd9l+fB9b1qIKCcuW2cRIXm89NX4JULNHLQR
 Mx6K3OG7NRJu57rv3Owh4k7unUZRALJq11Dll2hNWzQHgj5sa9lyxr3sfnU/2eH9uWIXiWcK/ZL
 r6ay9R3tDplHgu3Q=
X-Received: by 2002:a05:600c:4f55:b0:3cf:7197:e67c with SMTP id
 m21-20020a05600c4f5500b003cf7197e67cmr56513361wmq.25.1673603510370; 
 Fri, 13 Jan 2023 01:51:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu+Xs9tBJDhpFQx/h7RZszZihOLI+HgStE66jRAL6+5ALj5DT1NMFijrOEtuqdZT/FL+ewuwg==
X-Received: by 2002:a05:600c:4f55:b0:3cf:7197:e67c with SMTP id
 m21-20020a05600c4f5500b003cf7197e67cmr56513342wmq.25.1673603510091; 
 Fri, 13 Jan 2023 01:51:50 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-244.retail.telecomitalia.it.
 [79.46.200.244]) by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm38859394wmq.18.2023.01.13.01.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 01:51:49 -0800 (PST)
Date: Fri, 13 Jan 2023 10:51:43 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 si-wei.liu@oracle.com, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 alvaro.karsz@solid-run.com, Shannon Nelson <snelson@pensando.io>,
 Laurent Vivier <lvivier@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Gautam Dawar <gdawar@xilinx.com>, Cornelia Huck <cohuck@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: Re: [RFC v2 06/13] vhost: delay set_vring_ready after DRIVER_OK
Message-ID: <20230113095143.si4qzblki3votezg@sgarzare-redhat>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-7-eperezma@redhat.com>
 <CACGkMEvvjvhFrd5DJOMM0d7OWm0=9t6-YPzsZLZ8ZeZ4RU6PQw@mail.gmail.com>
 <CAJaqyWdePpv_htcrQ1TuEcz99x9Ri7ysFJz3+L7PuaLaPzNZjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWdePpv_htcrQ1TuEcz99x9Ri7ysFJz3+L7PuaLaPzNZjw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

On Fri, Jan 13, 2023 at 09:19:00AM +0100, Eugenio Perez Martin wrote:
>On Fri, Jan 13, 2023 at 5:36 AM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On Fri, Jan 13, 2023 at 1:25 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>> >
>> > To restore the device at the destination of a live migration we send the
>> > commands through control virtqueue. For a device to read CVQ it must
>> > have received the DRIVER_OK status bit.
>>
>> This probably requires the support from the parent driver and requires
>> some changes or fixes in the parent driver.
>>
>> Some drivers did:
>>
>> parent_set_status():
>> if (DRIVER_OK)
>>     if (queue_enable)
>>         write queue_enable to the device
>>
>> Examples are IFCVF or even vp_vdpa at least. MLX5 seems to be fine.
>>
>
>I don't get your point here. No device should start reading CVQ (or
>any other VQ) without having received DRIVER_OK.
>
>Some parent drivers do not support sending the queue enable command
>after DRIVER_OK, usually because they clean part of the state like the
>set by set_vring_base. Even vdpa_net_sim needs fixes here.
>
>But my understanding is that it should be supported so I consider it a
>bug. Especially after queue_reset patches. Is that what you mean?
>
>> >
>> > However this opens a window where the device could start receiving
>> > packets in rx queue 0 before it receives the RSS configuration. To avoid
>> > that, we will not send vring_enable until all configuration is used by
>> > the device.
>> >
>> > As a first step, run vhost_set_vring_ready for all vhost_net backend after
>> > all of them are started (with DRIVER_OK). This code should not affect
>> > vdpa.
>> >
>> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> > ---
>> >  hw/net/vhost_net.c | 17 ++++++++++++-----
>> >  1 file changed, 12 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> > index c4eecc6f36..3900599465 100644
>> > --- a/hw/net/vhost_net.c
>> > +++ b/hw/net/vhost_net.c
>> > @@ -399,6 +399,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>> >          } else {
>> >              peer = qemu_get_peer(ncs, n->max_queue_pairs);
>> >          }
>> > +        r = vhost_net_start_one(get_vhost_net(peer), dev);
>> > +        if (r < 0) {
>> > +            goto err_start;
>> > +        }
>> > +    }
>> > +
>> > +    for (int j = 0; j < nvhosts; j++) {
>> > +        if (j < data_queue_pairs) {
>> > +            peer = qemu_get_peer(ncs, j);
>> > +        } else {
>> > +            peer = qemu_get_peer(ncs, n->max_queue_pairs);
>> > +        }
>>
>> I fail to understand why we need to change the vhost_net layer? This
>> is vhost-vDPA specific, so I wonder if we can limit the changes to e.g
>> vhost_vdpa_dev_start()?
>>
>
>The vhost-net layer explicitly calls vhost_set_vring_enable before
>vhost_dev_start, and this is exactly the behavior we want to avoid.
>Even if we make changes to vhost_dev, this change is still needed.

I'm working on something similar since I'd like to re-work the following 
commit we merged just before 7.2 release:
     4daa5054c5 vhost: enable vrings in vhost_dev_start() for vhost-user
     devices

vhost-net wasn't the only one who enabled vrings independently, but it 
was easy enough for others devices to avoid it and enable them in 
vhost_dev_start().

Do you think can we avoid in some way this special behaviour of 
vhost-net and enable the vrings in vhost_dev_start?

Thanks,
Stefano

>
>And we want to explicitly enable CVQ first, which "only" vhost_net
>knows which is. To perform that in vhost_vdpa_dev_start would require
>quirks, involving one or more of:
>* Ignore vq enable calls if the device is not the CVQ one. How to
>signal what is the CVQ? Can we trust it will be the last one for all
>kind of devices?
>* Enable queues that do not belong to the last vhost_dev from the enable call.
>* Enable the rest of the queues from the last enable in reverse order.
>* Intercalate the "net load" callback between enabling the last
>vhost_vdpa device and enabling the rest of devices.
>* Add an "enable priority" order?
>
>Thanks!
>
>> Thanks
>>
>> >
>> >          if (peer->vring_enable) {
>> >              /* restore vring enable state */
>> > @@ -408,11 +420,6 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>> >                  goto err_start;
>> >              }
>> >          }
>> > -
>> > -        r = vhost_net_start_one(get_vhost_net(peer), dev);
>> > -        if (r < 0) {
>> > -            goto err_start;
>> > -        }
>> >      }
>> >
>> >      return 0;
>> > --
>> > 2.31.1
>> >
>>
>


