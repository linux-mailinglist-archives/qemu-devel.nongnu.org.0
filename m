Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF39656DC1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Dec 2022 18:57:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAEBy-0001F4-E4; Tue, 27 Dec 2022 12:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pAEBw-0001Ew-Bx
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:56:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pAEBu-0003yk-SS
 for qemu-devel@nongnu.org; Tue, 27 Dec 2022 12:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672163802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jB8RsBzil72xI6D+2AGXF9zutoco3rXk0aiWSltBswc=;
 b=giVKMSgnFZogIMz2ykbWdjlppb7ZZPKiaIm8P8dDADaKxIcPEj0XfRxWJ/+VFzyYl6YhHo
 iQ3xYb5JF1nVudbqCPDp1dirQbH+qByupLXo7SAqW4/pho+rvXe+Qzhl7luPdcmzcNipeV
 XHKfM1THZU1GX+V6Q7TcdBg+TliWpmQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-kV-g65a2Ns2t1eftwN2z6w-1; Tue, 27 Dec 2022 12:56:40 -0500
X-MC-Unique: kV-g65a2Ns2t1eftwN2z6w-1
Received: by mail-ed1-f69.google.com with SMTP id
 f15-20020a056402354f00b00485864db618so3228710edd.13
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 09:56:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jB8RsBzil72xI6D+2AGXF9zutoco3rXk0aiWSltBswc=;
 b=GvXK0PRzI5a5wOWQoKYMBVcNdRiInii95mkOJ1EY/EeM+aCpMmmfEaLYZ4PQGogpo/
 Snw1HIIZ049FzPLGiVEYmmAmUYnLsCHqYZfG7J5wsi5S0zlMOxxi8zlpcBVeWYb9g9Ol
 tdOrZrBgFvPXU8aUx+jLcbPmOizW2xDmyAnmDslUH0vRsRuJG/77Ut7B/50/owPUjU/x
 UaBbTHYXrGANTXEyvKbxTyVOrcQInvGU03mLfj4fGQCZqWyErptq1EVDEPr6YLmXnCBS
 nJO+qu3S8XZhKk3lGPvEkYWJt3pO1mgt9rJKpj9dokres6kiJ+KNFMlqkkKaBEE+s7UE
 hBZg==
X-Gm-Message-State: AFqh2koHhobI+TTYuE5kbHO6efNenyYHP6zIX8Y0sZZqE40z6Q/p1ho+
 0HMq7TnoTXARCJbrQuIeifddR0Upm+o5zuQM6qoZpu9fmcm6uJRkbOOT5r4I8z1V2lH3R7/rJa8
 +38RLwnw+QCIu/wk=
X-Received: by 2002:a50:fd87:0:b0:47f:1013:f3ac with SMTP id
 o7-20020a50fd87000000b0047f1013f3acmr19951120edt.4.1672163799586; 
 Tue, 27 Dec 2022 09:56:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv3bXcNBsBTP4sV4VoLVyPqSpqLfZ34DzjL/dtmyj29Zq2M6mEvxqNnD19NLAkqz0FyD9VsHA==
X-Received: by 2002:a50:fd87:0:b0:47f:1013:f3ac with SMTP id
 o7-20020a50fd87000000b0047f1013f3acmr19951103edt.4.1672163799404; 
 Tue, 27 Dec 2022 09:56:39 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 f20-20020a17090631d400b007bf24b8f80csm4214402ejf.63.2022.12.27.09.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 09:56:38 -0800 (PST)
Date: Tue, 27 Dec 2022 12:56:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: "Longpeng(Mike)" <longpeng2@huawei.com>, stefanha@redhat.com,
 jasowang@redhat.com, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, cohuck@redhat.com,
 sgarzare@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/3] vdpa: commit all host notifier MRs in a single MR
 transaction
Message-ID: <20221227125521-mutt-send-email-mst@kernel.org>
References: <20221227072015.3134-1-longpeng2@huawei.com>
 <20221227072015.3134-4-longpeng2@huawei.com>
 <3cdfb4fc-70a9-db51-ac49-4ba984a3045a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cdfb4fc-70a9-db51-ac49-4ba984a3045a@linaro.org>
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

On Tue, Dec 27, 2022 at 05:51:47PM +0100, Philippe Mathieu-Daudé wrote:
> On 27/12/22 08:20, Longpeng(Mike) wrote:
> > From: Longpeng <longpeng2@huawei.com>
> > 
> > This allows the vhost-vdpa device to batch the setup of all its MRs of
> > host notifiers.
> > 
> > This significantly reduces the device starting time, e.g. the time spend
> > on setup the host notifier MRs reduce from 423ms to 32ms for a VM with
> > 64 vCPUs and 3 vhost-vDPA generic devices (vdpa_sim_blk, 64vq per device).
> > 
> > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 25 +++++++++++++++++++------
> >   1 file changed, 19 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index fd0c33b0e1..870265188a 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -512,9 +512,18 @@ static void vhost_vdpa_host_notifiers_uninit(struct vhost_dev *dev, int n)
> >   {
> >       int i;
> > +    /*
> > +     * Pack all the changes to the memory regions in a single
> > +     * transaction to avoid a few updating of the address space
> > +     * topology.
> > +     */
> > +    memory_region_transaction_begin();
> > +
> >       for (i = dev->vq_index; i < dev->vq_index + n; i++) {
> >           vhost_vdpa_host_notifier_uninit(dev, i);
> >       }
> > +
> > +    memory_region_transaction_commit();
> >   }
> 
> Instead of optimizing one frontend, I wonder if we shouldn't expose
> a 'bool memory_region_transaction_in_progress()' helper in memory.c,
> and in virtio_queue_set_host_notifier_mr() backend, assert we are
> within a transaction. That way we'd optimize all virtio frontends.


If we are doing something like this, I'd rather pass around
a "transaction" structure so this can be checked statically.
Looks like something that can be done on top though.

-- 
MST


