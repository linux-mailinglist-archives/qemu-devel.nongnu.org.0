Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5168C6A8D11
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 00:33:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXsOl-0005kj-8R; Thu, 02 Mar 2023 18:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXsOe-0005gv-TH
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 18:31:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXsOd-0004gq-3E
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 18:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677799894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UEQ6b/orgBxMNV6HPaYsp7/0JXbveTmvuQTE4Pbmt/M=;
 b=bP0qU3PxZQLNuotTOG7Lqfr/vGA5gZ2U5YY3Oi7NrSL96a69IOksjcTQz/Fo7hmRiShWs7
 DmT12qVzGicTrCoGscEyTgEsQnuQRaWAjN5RRzTeeIKr0UC38sjUap3fcBcEcUwXDsL/29
 ji87Ekt1b1LH0ZwRfEWBPQeF7hizAbQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-JoStGhbaMUu0CVjNr6Vchw-1; Thu, 02 Mar 2023 18:31:33 -0500
X-MC-Unique: JoStGhbaMUu0CVjNr6Vchw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j6-20020a05600c1c0600b003eaf882cb85so231631wms.9
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 15:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677799892;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UEQ6b/orgBxMNV6HPaYsp7/0JXbveTmvuQTE4Pbmt/M=;
 b=Pvut0YqV2nLdPgiXitjUBOIrz3vGJzXRpNyURAzsptbzjRkpL/IHNFEX9M+p8M8YEX
 cGAvNaiSx2yPxbsO20Mz9DxaIHYn6Kvwj1fObMzNgETGqoRSoPtnamcrPFY8DGiAfujn
 bK2yH8ORod5SwcQRAwpR2GCCBvQLXNWoMTSLJVsm2bq/CA2zcmmEjg8qRafQ2WBVbvWV
 XJTUEU0Py56FGvdkJZhKK1tWuGis7FrLolLqs1GVgpcd9yoPhTz97Weu/ZIZtkWjKZFj
 brDn/i95G/YvONqGkwmxoYNQV8xx6xw3LjGyBCjcj/2QAbHiGHWg2MEwIzeMcCMVvsJL
 bL8Q==
X-Gm-Message-State: AO0yUKVsU6B59U7Fu8ZnUHjrnbjNAIsKBWz4vZ0ZNX0ZQRW6C9uhgfwb
 P3OPfPpVX04LA1pSMQoK2+llb8trWWSqvn3ZaSanFiGR3iFn5KVjLbBHA+hWTmgrtuhD+G4ySlk
 leD/hfEjf488/AiI=
X-Received: by 2002:adf:e807:0:b0:2c8:a44a:bf25 with SMTP id
 o7-20020adfe807000000b002c8a44abf25mr21504wrm.50.1677799891872; 
 Thu, 02 Mar 2023 15:31:31 -0800 (PST)
X-Google-Smtp-Source: AK7set+phV5C81foKnDwr/m72cmFwg8cehYHe6AkYMSznBAxIuOhd+pd9bIfzgikXFTOowGgBvwwiw==
X-Received: by 2002:adf:e807:0:b0:2c8:a44a:bf25 with SMTP id
 o7-20020adfe807000000b002c8a44abf25mr21488wrm.50.1677799891577; 
 Thu, 02 Mar 2023 15:31:31 -0800 (PST)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a5d4312000000b002c7107ce17fsm606396wrq.3.2023.03.02.15.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 15:31:31 -0800 (PST)
Date: Thu, 2 Mar 2023 18:31:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Eli Cohen <eli@mellanox.com>,
 alvaro.karsz@solid-run.com, Lei Yang <leiyang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ
 feature
Message-ID: <20230302182928-mutt-send-email-mst@kernel.org>
References: <20230213191929.1547497-1-eperezma@redhat.com>
 <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
 <CAJaqyWfsBLvsJNF=RvhbirwNypzjfaO7thyK22s-nCjdaNs4yQ@mail.gmail.com>
 <20230214024736-mutt-send-email-mst@kernel.org>
 <CAJaqyWc8JON+QhJbqQCFx+q+qxb5LqjgsHS2wZ7R3v37uVU_sw@mail.gmail.com>
 <20230301163325-mutt-send-email-mst@kernel.org>
 <CAJaqyWfpbeoLfe1-GcoR=rtJMg1DGezMe8pjSNPQjBG4BzqMrA@mail.gmail.com>
 <20230302064234-mutt-send-email-mst@kernel.org>
 <CAJaqyWe0=R8OKXec1xvCWPrQOdum-Jp4V1_MCevi8nB4J7+kgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJaqyWe0=R8OKXec1xvCWPrQOdum-Jp4V1_MCevi8nB4J7+kgA@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Mar 02, 2023 at 03:47:48PM +0100, Eugenio Perez Martin wrote:
> On Thu, Mar 2, 2023 at 12:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Mar 02, 2023 at 12:30:52PM +0100, Eugenio Perez Martin wrote:
> > > > You need to pass this to guest. My point is that there is no reason to
> > > > get it from the kernel driver. QEMU can figure out whether the flag is
> > > > needed itself.
> > > >
> > >
> > > Ok, I can see now how the HW device does not have all the knowledge to
> > > offer this flag or not. But I'm not sure how qemu can know either.
> > >
> > > If qemu opens /dev/vhost-vdpa-N, how can it know it? It has no way to
> > > tell if the device is sw or hw as far as I know. Am I missing
> > > something?
> > >
> > > Thanks!
> >
> > This is what I said earlier.  You can safely assume vdpa needs this
> > flag. Only exception is vduse and we don't care about performance there.
> >
> 
> Ok now I get your point, thanks for explaining.
> 
> But I'm missing why it is wrong to start using it properly from the
> kernel.
>
> I didn't test vDPA in non x86 / PCI, but if it does not work
> because of the lack of this feature flag the right fix would be to
> offer it, not to start assuming it in qemu, isn't it?
> 
> I can see how "assume VIRTIO_F_ORDER_PLATFORM from qemu" may need code
> comments and extra explanations, but to start offering it properly
> from the device is expected somehow.
> 
> Thanks!

Does kernel always expose it?

-- 
MST


