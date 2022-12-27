Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55459656DBC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 18:55:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAE9h-0000If-LO; Tue, 27 Dec 2022 12:54:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pAE9f-0000IH-LZ
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:54:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pAE9e-0003U0-4i
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672163660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z4MhymrFbLMBFcpKIDP4gK0pYdoGSzZaS3kLiaMiiUI=;
 b=TVcYL94W0YnZNYl8aG4JG7/sdSrvFIG27fswgo3j9yGV8HEdA/5g9JWfMYklNCXVsQizF2
 g6Y0yziJJrLUm6cdctTIKtsmiUsIhOQX0VVIWTYuPPG4n/whgRAIY1FKv40btS0Z2lGcMR
 P2uEuipb0b+Ik+Kl+lFB/m48TXGmFUU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-KRTUWr_HMemvgDzheliP4A-1; Tue, 27 Dec 2022 12:54:18 -0500
X-MC-Unique: KRTUWr_HMemvgDzheliP4A-1
Received: by mail-ed1-f70.google.com with SMTP id
 q10-20020a056402518a00b00472a255eef7so9653312edd.15
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 09:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z4MhymrFbLMBFcpKIDP4gK0pYdoGSzZaS3kLiaMiiUI=;
 b=FTWMzbw9etZV4qKAGS/AR2UlFwXIteCGNMVDlgn3q42SgTLCUujiA5Z+oo/nLY2kvv
 xJW9WNyIcR8l6l/IqSwlEyfLJb4aaWYakBQnwcp9mx98Iw4bT447Ov7HZvmKjZFMakC2
 QoLSpJCBGYMblJWqVst7t/GCXHh3YsCTxxw86PYR2wZj4xGaQ1+2VCTZSIPR/ShIdCEK
 uTihRhu9ZWaqBY6oYVBu4l6u8589I75Mf6D+u4VEystCtWggPnxyu6QI17YYIpC9vepj
 b2lEQdfgwox54vNXRHyhdTMwkmOWD2X+hxppMi8cZw77lsYBGv25VDqvFtfQpfEuiklv
 GxfA==
X-Gm-Message-State: AFqh2kp5c/wsZ/zyPfoSl7W2Z4VflVHJooRSOEO73X9eQh9UyDyGrC1w
 uBfEblTtqwPba4t8kv3QnQiDYSUiNg++L2jjDkzffg6EJzsmY6yNGYyKLtn0Pz1Ixnv/gcbiP3V
 WMRxylwImpc32570=
X-Received: by 2002:a17:906:c192:b0:7c1:6fe:f4a2 with SMTP id
 g18-20020a170906c19200b007c106fef4a2mr18824698ejz.45.1672163657440; 
 Tue, 27 Dec 2022 09:54:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuFp/KMhVQ0wp2Tj+ShUyak1lPck4VhrbboEp5mpKBvZv3oyZyNG6086uRDbWThk3BVsMBj9w==
X-Received: by 2002:a17:906:c192:b0:7c1:6fe:f4a2 with SMTP id
 g18-20020a170906c19200b007c106fef4a2mr18824682ejz.45.1672163657254; 
 Tue, 27 Dec 2022 09:54:17 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 16-20020a170906319000b0084c2065b388sm4275035ejy.128.2022.12.27.09.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 09:54:16 -0800 (PST)
Date: Tue, 27 Dec 2022 12:54:12 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>, stefanha@redhat.com,
 jasowang@redhat.com, cohuck@redhat.com, sgarzare@redhat.com,
 pbonzini@redhat.com, arei.gonglei@huawei.com, yechuan@huawei.com,
 huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 2/3] vhost: configure all host notifiers in a single
 MR transaction
Message-ID: <20221227125331-mutt-send-email-mst@kernel.org>
References: <20221227072015.3134-1-longpeng2@huawei.com>
 <20221227072015.3134-3-longpeng2@huawei.com>
 <8054d186-0196-ccb0-091d-0ee9caadb576@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8054d186-0196-ccb0-091d-0ee9caadb576@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Tue, Dec 27, 2022 at 05:43:57PM +0100, Philippe Mathieu-Daudé wrote:
> On 27/12/22 08:20, Longpeng(Mike) wrote:
> > From: Longpeng <longpeng2@huawei.com>
> > 
> > This allows the vhost device to batch the setup of all its host notifiers.
> > This significantly reduces the device starting time, e.g. the time spend
> > on enabling notifiers reduce from 376ms to 9.1ms for a VM with 64 vCPUs
> > and 3 vhost-vDPA generic devices (vdpa_sim_blk, 64vq per device)
> > 
> > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > ---
> >   hw/virtio/vhost.c | 24 ++++++++++++++++++++++++
> >   1 file changed, 24 insertions(+)
> > 
> > diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > index 5994559da8..064d4abe5c 100644
> > --- a/hw/virtio/vhost.c
> > +++ b/hw/virtio/vhost.c
> > @@ -1562,16 +1562,25 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
> >           return r;
> >       }
> > +    /*
> > +     * Batch all the host notifiers in a single transaction to avoid
> > +     * quadratic time complexity in address_space_update_ioeventfds().
> > +     */
> > +    memory_region_transaction_begin();
> > +
> >       for (i = 0; i < hdev->nvqs; ++i) {
> >           r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
> >                                            true);
> >           if (r < 0) {
> >               error_report("vhost VQ %d notifier binding failed: %d", i, -r);
> > +            memory_region_transaction_commit();
> >               vhost_dev_disable_notifiers(hdev, vdev);
> 
> Could we 'break' here, ...
> 
> >               return r;
> >           }
> >       }
> > +    memory_region_transaction_commit();
> > +
> >       return 0;
> 
> ... and return 'r' here?


won't this commit twice? seems ugly ...

> >   }
> 
> Otherwise LGTM.


