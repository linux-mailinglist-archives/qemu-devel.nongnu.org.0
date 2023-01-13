Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1895F669452
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 11:38:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGHR9-0004p0-S7; Fri, 13 Jan 2023 05:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pGHR8-0004od-08
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:37:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1pGHR5-0008MZ-TH
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 05:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673606242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tYCVLhTOXdJr7MT5TCkyY+jLtLRqHJN2dPiJW1syW1U=;
 b=GXjxs5zODQqOZGj4m7uPzx7cz9deYeSaD54PwGPlE9kWQjya/QAhvD7HJvB2W2UC6h0zDh
 W2MA53RWTz6/BK3Ib7XLfPD/5YVq0HlRMFmY41hTAeMF4sNomZV7JgxkbrGpXc0UJhK/nV
 1eh1UDaMB+o3dWFYwufqQzTG6somJRQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-455-J0PduuYLOW6gTSSlKPNhRg-1; Fri, 13 Jan 2023 05:37:21 -0500
X-MC-Unique: J0PduuYLOW6gTSSlKPNhRg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bp6-20020a05620a458600b006ffd3762e78so14994438qkb.13
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 02:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tYCVLhTOXdJr7MT5TCkyY+jLtLRqHJN2dPiJW1syW1U=;
 b=LZV6LRdfdh7zW2R3vYxscr2RV84ugqfptrcSqHh7C2GZ7ICY8KZa63DPZPTbsVM7FL
 qjm1gliaDdW/OlD6qL544yZmjiYr3IeifeSNRhMdIa/PyUoeodQOuXjAGgNzUNwGCJra
 v9VLMKn5DyMG+TRO1gawXzvS2LabiqEh5NOGoQl7VhnthkzKzHjl+JdfzpEkXspRT+Pa
 CgjFMHwvosSPaNEEN1X2PP+hHjyxjiL5APgL5XBnki+1f//5KOhnYYYqGGmtKFRRXTWz
 JJH6wNrg8qdZdChiO98JKPVeHystNh3AqXACPuFKaVUWmmdIRfiR3zh+EkeWtcEEQr0A
 Qu9g==
X-Gm-Message-State: AFqh2kryv1yWm+uRqURb6zYi7g/auU1Pevz0sOBBJ2jBA0fgfgfmGWeB
 G86d36TKFJoU96EA0mFHDhVdOBPqv+CBv5Rj+iBA3m4wBqb74TIqtJM/9AKHU5wr3vYMJlinGfv
 rxvoILGrb2WRzwYw=
X-Received: by 2002:a05:622a:2284:b0:3a8:55c:a893 with SMTP id
 ay4-20020a05622a228400b003a8055ca893mr112352340qtb.0.1673606233750; 
 Fri, 13 Jan 2023 02:37:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuXZ08yG/mSjid2hhp4qXf7vVNuGxHNPZ33VtoEYrmTuIhT61AeM4Uor7LcAvCAk86+c3x0iw==
X-Received: by 2002:a05:622a:2284:b0:3a8:55c:a893 with SMTP id
 ay4-20020a05622a228400b003a8055ca893mr112352314qtb.0.1673606233484; 
 Fri, 13 Jan 2023 02:37:13 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-244.retail.telecomitalia.it.
 [79.46.200.244]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05620a034b00b006fa31bf2f3dsm12268101qkm.47.2023.01.13.02.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 02:37:13 -0800 (PST)
Date: Fri, 13 Jan 2023 11:37:04 +0100
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
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: Re: [RFC v2 06/13] vhost: delay set_vring_ready after DRIVER_OK
Message-ID: <20230113103704.tqa7ie2ggppqj6uo@sgarzare-redhat>
References: <20230112172434.760850-1-eperezma@redhat.com>
 <20230112172434.760850-7-eperezma@redhat.com>
 <CACGkMEvvjvhFrd5DJOMM0d7OWm0=9t6-YPzsZLZ8ZeZ4RU6PQw@mail.gmail.com>
 <CAJaqyWdePpv_htcrQ1TuEcz99x9Ri7ysFJz3+L7PuaLaPzNZjw@mail.gmail.com>
 <20230113095143.si4qzblki3votezg@sgarzare-redhat>
 <CAJaqyWfrb+JN8ZMfvi1eWt-uM9sQvYb=uKvygDu9bj0OmL0pUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWfrb+JN8ZMfvi1eWt-uM9sQvYb=uKvygDu9bj0OmL0pUA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Fri, Jan 13, 2023 at 11:03:17AM +0100, Eugenio Perez Martin wrote:
>On Fri, Jan 13, 2023 at 10:51 AM Stefano Garzarella <sgarzare@redhat.com> wrote:
>>
>> On Fri, Jan 13, 2023 at 09:19:00AM +0100, Eugenio Perez Martin wrote:
>> >On Fri, Jan 13, 2023 at 5:36 AM Jason Wang <jasowang@redhat.com> wrote:
>> >>
>> >> On Fri, Jan 13, 2023 at 1:25 AM Eugenio Pérez <eperezma@redhat.com> wrote:
>> >> >
>> >> > To restore the device at the destination of a live migration we send the
>> >> > commands through control virtqueue. For a device to read CVQ it must
>> >> > have received the DRIVER_OK status bit.
>> >>
>> >> This probably requires the support from the parent driver and requires
>> >> some changes or fixes in the parent driver.
>> >>
>> >> Some drivers did:
>> >>
>> >> parent_set_status():
>> >> if (DRIVER_OK)
>> >>     if (queue_enable)
>> >>         write queue_enable to the device
>> >>
>> >> Examples are IFCVF or even vp_vdpa at least. MLX5 seems to be fine.
>> >>
>> >
>> >I don't get your point here. No device should start reading CVQ (or
>> >any other VQ) without having received DRIVER_OK.
>> >
>> >Some parent drivers do not support sending the queue enable command
>> >after DRIVER_OK, usually because they clean part of the state like the
>> >set by set_vring_base. Even vdpa_net_sim needs fixes here.
>> >
>> >But my understanding is that it should be supported so I consider it a
>> >bug. Especially after queue_reset patches. Is that what you mean?
>> >
>> >> >
>> >> > However this opens a window where the device could start receiving
>> >> > packets in rx queue 0 before it receives the RSS configuration. To avoid
>> >> > that, we will not send vring_enable until all configuration is used by
>> >> > the device.
>> >> >
>> >> > As a first step, run vhost_set_vring_ready for all vhost_net backend after
>> >> > all of them are started (with DRIVER_OK). This code should not affect
>> >> > vdpa.
>> >> >
>> >> > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
>> >> > ---
>> >> >  hw/net/vhost_net.c | 17 ++++++++++++-----
>> >> >  1 file changed, 12 insertions(+), 5 deletions(-)
>> >> >
>> >> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>> >> > index c4eecc6f36..3900599465 100644
>> >> > --- a/hw/net/vhost_net.c
>> >> > +++ b/hw/net/vhost_net.c
>> >> > @@ -399,6 +399,18 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>> >> >          } else {
>> >> >              peer = qemu_get_peer(ncs, n->max_queue_pairs);
>> >> >          }
>> >> > +        r = vhost_net_start_one(get_vhost_net(peer), dev);
>> >> > +        if (r < 0) {
>> >> > +            goto err_start;
>> >> > +        }
>> >> > +    }
>> >> > +
>> >> > +    for (int j = 0; j < nvhosts; j++) {
>> >> > +        if (j < data_queue_pairs) {
>> >> > +            peer = qemu_get_peer(ncs, j);
>> >> > +        } else {
>> >> > +            peer = qemu_get_peer(ncs, n->max_queue_pairs);
>> >> > +        }
>> >>
>> >> I fail to understand why we need to change the vhost_net layer? This
>> >> is vhost-vDPA specific, so I wonder if we can limit the changes to e.g
>> >> vhost_vdpa_dev_start()?
>> >>
>> >
>> >The vhost-net layer explicitly calls vhost_set_vring_enable before
>> >vhost_dev_start, and this is exactly the behavior we want to avoid.
>> >Even if we make changes to vhost_dev, this change is still needed.
>>
>> I'm working on something similar since I'd like to re-work the following
>> commit we merged just before 7.2 release:
>>      4daa5054c5 vhost: enable vrings in vhost_dev_start() for vhost-user
>>      devices
>>
>> vhost-net wasn't the only one who enabled vrings independently, but it
>> was easy enough for others devices to avoid it and enable them in
>> vhost_dev_start().
>>
>> Do you think can we avoid in some way this special behaviour of
>> vhost-net and enable the vrings in vhost_dev_start?
>>
>
>Actually looking forward to it :). If that gets merged before this
>series, I think we could drop this patch.

I hope to send a RFC net week :-) let's see...

>
>If I'm not wrong the enable/disable dance is used just by vhost-user
>at the moment.

Yep, I got the same.

My doubts are that for vhost-user-net we enable only the first 
VirtIONet->curr_queue_pairs queue IIUC. While for other devices (and 
maybe also for vDPA devices) we enable all of them.

I need to figure out if it's safe to do this for vhost-user-net as well, 
otherwise I need to find a way to leave this behavior.

>
>Maxime, could you give us some hints about the tests to use to check
>that changes do not introduce regressions in vhost-user?

Yep, any help on how to test is very appreciated.

Thanks,
Stefano


