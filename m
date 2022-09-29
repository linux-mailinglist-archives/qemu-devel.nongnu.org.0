Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3855EEFBA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:52:13 +0200 (CEST)
Received: from localhost ([::1]:37444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odoL6-0004Sh-4I
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odnjf-0003Hf-Kc
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:13:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1odnjb-0003p7-9p
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 03:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664435606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uidj0sWkcBhauPHgW1Mk2o9OcKlm6ghdzeFqOEIA57Q=;
 b=BmvG0yZm0Y209yWfZrheZljNBwgC5d0c7nvVpAhEPaEqXms836AZUc53uwJ1ZDoxA9QiUg
 bR4ni0IAhXP5TjR4mrMqMNFe3oyfDkQn3lssQidxnM2zZnhmEqRFL1x6rt22m7H67Wek28
 +McrOXfArTwNDc7Ov790eAgQQeHus9w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-98-sE2CpdoQMmOR5zk8Xg8W9g-1; Thu, 29 Sep 2022 03:13:17 -0400
X-MC-Unique: sE2CpdoQMmOR5zk8Xg8W9g-1
Received: by mail-wm1-f72.google.com with SMTP id
 d5-20020a05600c34c500b003b4fb42ccdeso2553063wmq.8
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 00:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=uidj0sWkcBhauPHgW1Mk2o9OcKlm6ghdzeFqOEIA57Q=;
 b=NvkX4x17XgD/s1C26/7KSNJt5ec6NvAN2oWMLnKx89mJlGqnGcuo1LDtC8HwOKY1hA
 6RbJuvJ2SuzfKLGCKeciRviuFVKqDMEAtoA94zhe3E/G97Hweyi331f/2cm5xmeP9fnQ
 x/vpPJ9iIY87heW7rSTPEvUkOoxCHvz9L3ZXEmaEIuZN1szAbaaZZb75F7Q4Cua3FSjf
 PnOYbMJwPApZ9e7CQMKjqRT2HFA+9LvXxeZD24MylunVFf8rueiOIK7hvcynA+C/o8Yb
 HkVmBHiFxTB9nbe4GFU/GatdQA6IPxGk59Px9sOI3fpwNkNnPZrWJBP77gDetf4WjggS
 basg==
X-Gm-Message-State: ACrzQf0EKJnUI1DFxR3RyYekqMQSIA+GcWBzEwSfJ8gSp91Ioe7HgwpF
 cRQOl7kfA/Bwy/XSf2KV0l4RWY4I1Q3DmJdkZuir0fTHUBvMpwG5/c5KPJTmVcDzoql3XVoX/Zx
 UXauEMJQ2L61MxB0=
X-Received: by 2002:a5d:650e:0:b0:228:b09e:de9a with SMTP id
 x14-20020a5d650e000000b00228b09ede9amr1139852wru.360.1664435595705; 
 Thu, 29 Sep 2022 00:13:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM510xK7NyhtUXYuJO7C2rpx5NBEgckrHo67IdQ2j6kTBtkfmJI6teayZ9i6nzF+rio3xN0DjA==
X-Received: by 2002:a5d:650e:0:b0:228:b09e:de9a with SMTP id
 x14-20020a5d650e000000b00228b09ede9amr1139827wru.360.1664435595445; 
 Thu, 29 Sep 2022 00:13:15 -0700 (PDT)
Received: from redhat.com ([2.55.47.213]) by smtp.gmail.com with ESMTPSA id
 f2-20020adff982000000b0022afedf3c87sm5782220wrr.105.2022.09.29.00.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 00:13:14 -0700 (PDT)
Date: Thu, 29 Sep 2022 03:13:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Si-Wei Liu <si-wei.liu@oracle.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Cindy Lu <lulu@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: Re: [PATCH 2/3] vdpa: load vlan configuration at NIC startup
Message-ID: <20220929031210-mutt-send-email-mst@kernel.org>
References: <20220906163621.1144675-3-eperezma@redhat.com>
 <CACGkMEvnVavevtxWa49Yew+Nnkx_Wfmgf1JLVXCBe=zkpvdHnQ@mail.gmail.com>
 <CACGkMEswG2nmTve+p2MU9ue5CuwAu69CpeOUzYnu_BVfZE56JA@mail.gmail.com>
 <CAJaqyWf=NfkL_2uXVapJ6qCLziBc2jg+jMyR+cBQu+yDG6eg5w@mail.gmail.com>
 <CACGkMEvW5ZUZEcx9COvwjAT5PUraoko8k1foBez=T1nmhjKpDw@mail.gmail.com>
 <34969f96-b7c4-c9f8-2248-3e84a84148b2@oracle.com>
 <CAJaqyWfZBHSTwY+WRDbwS+Sw0NsXsmpfhgpOtmLNM3dUWzrd7w@mail.gmail.com>
 <411586c9-22a2-1bd5-fbcd-a7658fd00446@oracle.com>
 <CAJaqyWcJ9Ci5=0jw_WcVuY27mG+H7uUq_imkV3+CWycCEt_h8A@mail.gmail.com>
 <5c5ad692-7162-ec05-cf40-dffa310706c8@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c5ad692-7162-ec05-cf40-dffa310706c8@oracle.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 21, 2022 at 04:00:58PM -0700, Si-Wei Liu wrote:
> > > >    The spec doesn't explicitly say anything about that
> > > > as far as I see.
> > > Here the spec is totally ruled by the (software artifact of)
> > > implementation rather than what a real device is expected to work with
> > > VLAN rx filters. Are we sure we'd stick to this flawed device
> > > implementation? The guest driver seems to be agnostic with this broken
> > > spec behavior so far, and I am afraid it's an overkill to add another
> > > feature bit or ctrl command to VLAN filter in clean way.
> > > 
> > I agree with all of the above. So, double checking, all vlan should be
> > allowed by default at device start?
> That is true only when VIRTIO_NET_F_CTRL_VLAN is not negotiated. If the
> guest already negotiated VIRTIO_NET_F_CTRL_VLAN before being migrated,
> device should resume with all VLANs filtered/disallowed.
> 
> >   Maybe the spec needs to be more
> > clear in that regard?
> Yes, I think this is crucial. Otherwise we can't get consistent behavior,
> either from software to vDPA, or cross various vDPA vendors.

OK. Can you open a github issue for the spec? We'll try to address.
Also, is it ok if we make it a SHOULD, i.e. best effort filtering?

-- 
MST


