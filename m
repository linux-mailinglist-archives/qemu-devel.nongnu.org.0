Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFDD6EA525
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 09:46:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pplSz-0006Yx-1w; Fri, 21 Apr 2023 03:46:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplSq-0006YQ-63
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:45:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pplSo-000159-1D
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682063149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q7Ka1LsO5BtLkE+z0a2QWcvGpJukOdPiHssSI+d2LB4=;
 b=WHRkRAxhXOV+MXoVIL8tq+n8mdQZoQQB7qLwCd3qMJNPVIHJan47NfkJFe1hNC7jK90FFt
 lTofsSRnQ+xWcbj3mf9+Sug0G8ON3HN9ifAdOawmFdB8rUXDsl7TzeXqwN7hY26gwZP8mS
 +r0zcPQcHryVuHlGkzK+knxJGJlfUzs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-zLkFK5k9OJC4YHE1qLZi4g-1; Fri, 21 Apr 2023 03:45:47 -0400
X-MC-Unique: zLkFK5k9OJC4YHE1qLZi4g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f080f53d62so5312905e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 00:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682063146; x=1684655146;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7Ka1LsO5BtLkE+z0a2QWcvGpJukOdPiHssSI+d2LB4=;
 b=mAgpOss51N5ArANSNuaVyUYv3ZPnOeqZ17+0tOPlNYvgJYN1lOYdPXNethhyElW1pt
 PKcyztvetiuSpgr0i9HRdXMX+kazl0xdGAiZgHf2itKK5Zw7z6/nXVSccD5S649xPDxR
 kqlkQSXQWfdNlDbMyeG8vbT4+w/vhO8FqJytQyMOpFvlNGmB36voaEZbMzCEqKKQRuYm
 mdQgLSCJJT6+t4DOIMZ9Ld+EHlo4+A+gFKYhmLby9m3Ylgd6jaoZXMBhRpJNDu3CyZRQ
 uaJDGHl/a0IOc+7mqvZwZSf9TF12O+ENFWar42mtwp6fxsKI8VyQupmHmaUEGLyyKOYo
 33Ug==
X-Gm-Message-State: AAQBX9esMLo7iREcXRWrPs+JSV9T1MXP2QYlsKqqaVXkkonEZGSa47+u
 5/wJ5zgBRUL/vSfQVflsD5H8dO4dpMIwb3lDBRQ2fcWxOWfDXlMcHEi8ne/OzzcMr0rYQf1n64z
 H3XnYvR+e0pm/zHk=
X-Received: by 2002:adf:fe8b:0:b0:2ef:ae4e:3549 with SMTP id
 l11-20020adffe8b000000b002efae4e3549mr3092454wrr.55.1682063146329; 
 Fri, 21 Apr 2023 00:45:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y8aUBoofNQw/iiZH7C4IMTJUCyM6oMUB9F98qRZ9fnp2yNKrF5SCtLDU23E6bJmZAMptRl2A==
X-Received: by 2002:adf:fe8b:0:b0:2ef:ae4e:3549 with SMTP id
 l11-20020adffe8b000000b002efae4e3549mr3092426wrr.55.1682063146005; 
 Fri, 21 Apr 2023 00:45:46 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d43cb000000b002ff77b033b1sm3816430wrr.33.2023.04.21.00.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 00:45:45 -0700 (PDT)
Date: Fri, 21 Apr 2023 03:45:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Gautam Dawar <gdawar@xilinx.com>, alvaro.karsz@solid-run.com,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Lei Yang <leiyang@redhat.com>, si-wei.liu@oracle.com,
 Eli Cohen <eli@mellanox.com>, Shannon Nelson <snelson@pensando.io>,
 Laurent Vivier <lvivier@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Harpreet Singh Anand <hanand@xilinx.com>
Subject: Re: [PATCH for 8.1 v2 2/6] vdpa: add vhost_vdpa_reset_status_fd
Message-ID: <20230421034518-mutt-send-email-mst@kernel.org>
References: <20230323195404.1247326-1-eperezma@redhat.com>
 <20230323195404.1247326-3-eperezma@redhat.com>
 <CACGkMEuAcfrnC1_9ttFwecVV6fcs00GUfxBBGUKpXnZVmgmHeQ@mail.gmail.com>
 <CAJaqyWduKd3Vccwo-sR==DZC8ncbv39jxPwfRQ35O7JHZ5Czcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJaqyWduKd3Vccwo-sR==DZC8ncbv39jxPwfRQ35O7JHZ5Czcg@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Mar 28, 2023 at 09:37:16AM +0200, Eugenio Perez Martin wrote:
> > > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > > index bbabea18f3..7a2053b8d9 100644
> > > --- a/hw/virtio/vhost-vdpa.c
> > > +++ b/hw/virtio/vhost-vdpa.c
> > > @@ -335,38 +335,45 @@ static const MemoryListener vhost_vdpa_memory_listener = {
> > >      .region_del = vhost_vdpa_listener_region_del,
> > >  };
> > >
> > > -static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
> > > -                             void *arg)
> > > +static int vhost_vdpa_dev_fd(const struct vhost_dev *dev)
> > >  {
> > >      struct vhost_vdpa *v = dev->opaque;
> > > -    int fd = v->device_fd;
> > > -    int ret;
> > >
> > >      assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
> > > +    return v->device_fd;
> > > +}
> > > +
> > > +static int vhost_vdpa_call_fd(int fd, unsigned long int request, void *arg)
> > > +{
> > > +    int ret = ioctl(fd, request, arg);
> > >
> > > -    ret = ioctl(fd, request, arg);
> > >      return ret < 0 ? -errno : ret;
> > >  }
> > >
> > > -static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
> > > +static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
> > > +                           void *arg)
> > > +{
> > > +    return vhost_vdpa_call_fd(vhost_vdpa_dev_fd(dev), request, arg);
> > > +}
> > > +
> > > +static int vhost_vdpa_add_status_fd(int fd, uint8_t status)
> > >  {
> > >      uint8_t s;
> > >      int ret;
> > >
> > > -    trace_vhost_vdpa_add_status(dev, status);
> > > -    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
> >
> > We can stick a vhost_vdpa_call() function that calls
> > vhost_vdpa_call_fd() then we can avoid a lot of changes?
> >
> 
> I don't follow this. vhost_vdpa_call already calls vhost_vdpa_call_fd.
> 
> Thanks!


Jason were you going to reply?


