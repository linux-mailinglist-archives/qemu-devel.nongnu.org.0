Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383354D297F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 08:32:49 +0100 (CET)
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRqoR-0007Cf-Pu
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 02:32:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRqmc-0006QM-Bt
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 02:31:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRqmX-0001XM-QE
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 02:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646811047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BdIMgO+vW+ACu+cUR3GEWxDDEWwgLBRVaOHcVnSPSVs=;
 b=i2g55pJ4IAcMjx4EzZeR4qkIgLwKfbMLCPCGPgThYmexlAb05D+nyL36X0OQJeLtry+RUM
 W/WBK/QPLKozHpoG//8EquD0L6Fv4OF+ClI9pXyw4gCRdawQaO5wEou8HtDd31PrPBWOFS
 LeFD2Gtg9tK6T4z3jwc999AnpDQvLn4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-jaBqgR7UOPK6C3N5zkaOMA-1; Wed, 09 Mar 2022 02:30:46 -0500
X-MC-Unique: jaBqgR7UOPK6C3N5zkaOMA-1
Received: by mail-wr1-f71.google.com with SMTP id
 a11-20020adffb8b000000b001efe754a488so437546wrr.13
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 23:30:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BdIMgO+vW+ACu+cUR3GEWxDDEWwgLBRVaOHcVnSPSVs=;
 b=p3JwB+VC1rjGecMUrcRrTmPk8+ZL6KD2MYSEsJ/oL1yRghk826PtXjkFv47TyCf8h/
 p6x9ErrFBoqWmukRLZ+TTSyEwjXb2QBMTInNQbUZz/dx4mClP0libAY0fH4frbBsGlL9
 +X6I9jliMwaZr2vetO41OFeiqVdKmKJbvUwfM8yxrA2BMWLxMj7VyAQxCKiIUBBboB3C
 owthD7f8YkZ55Ynl0PtH2EKRZRoeFONld0AFUANMN38NUE5Ec7XDxQCHfqnKuGeiUlBE
 igYspxTGjPka2nEc2ReKsQPrh4z2XHrpeqI8pIM3EMXk1fLyXzCRnRh4XAZ+hxOZ2Bjv
 TsOQ==
X-Gm-Message-State: AOAM530qel+9n1hiEeSa+cNcvB9dw7SSgiUQzt10/E3RZYehsO4q6ITZ
 3NHCNHGR/PDh2koDfjFFTBUdVG+IMV8/dPmwTkIdHNbkCTW4qD2PiVzS7723YtvmjfnvKtDjhil
 UGtUDgdcGYBJAgFc=
X-Received: by 2002:a5d:49c9:0:b0:1f0:16b2:584f with SMTP id
 t9-20020a5d49c9000000b001f016b2584fmr14912303wrs.710.1646811045146; 
 Tue, 08 Mar 2022 23:30:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnotz408aC23A9IZAD87LSAQWy359msZHiQrQ7WqskF3fUEstezB9Epmp0u54T+VlgDtCoow==
X-Received: by 2002:a5d:49c9:0:b0:1f0:16b2:584f with SMTP id
 t9-20020a5d49c9000000b001f016b2584fmr14912264wrs.710.1646811044873; 
 Tue, 08 Mar 2022 23:30:44 -0800 (PST)
Received: from redhat.com ([2.55.46.250]) by smtp.gmail.com with ESMTPSA id
 f13-20020adff8cd000000b001f03439743fsm877350wrq.75.2022.03.08.23.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 23:30:43 -0800 (PST)
Date: Wed, 9 Mar 2022 02:30:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
Message-ID: <20220309023020-mutt-send-email-mst@kernel.org>
References: <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
 <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
 <20220308024724-mutt-send-email-mst@kernel.org>
 <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
 <20220308054623-mutt-send-email-mst@kernel.org>
 <CAJaqyWcuitG+01pjO__tYERN9910fL_JGiHG88xU=fTG3KmpJw@mail.gmail.com>
 <20220308071253-mutt-send-email-mst@kernel.org>
 <56b837a6-c67d-5ffc-bd70-ba51d996a6c2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <56b837a6-c67d-5ffc-bd70-ba51d996a6c2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Eugenio Perez Martin <eperezma@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 09, 2022 at 11:38:35AM +0800, Jason Wang wrote:
> 
> 在 2022/3/8 下午8:16, Michael S. Tsirkin 写道:
> > On Tue, Mar 08, 2022 at 12:37:33PM +0100, Eugenio Perez Martin wrote:
> > > On Tue, Mar 8, 2022 at 11:48 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > On Tue, Mar 08, 2022 at 04:20:53PM +0800, Jason Wang wrote:
> > > > > > Not by itself but I'm not sure we can guarantee guest will not
> > > > > > attempt to use the IOVA addresses we are reserving down
> > > > > > the road.
> > > > > The IOVA is allocated via the listeners and stored in the iova tree
> > > > > per GPA range as IOVA->(GPA)->HVA.Guests will only see GPA, Qemu
> > > > > virtio core see GPA to HVA mapping. And we do a reverse lookup to find
> > > > > the HVA->IOVA we allocated previously.  So we have double check here:
> > > > > 
> > > > > 1) Qemu memory core to make sure the GPA that guest uses is valid
> > > > > 2) the IOVA tree that guarantees there will be no HVA beyond what
> > > > > guest can see is used
> > > > > 
> > > > > So technically, there's no way for the guest to use the IOVA address
> > > > > allocated for the shadow virtqueue.
> > > > > 
> > > > > Thanks
> > > > I mean, IOVA is programmed in the host hardware to translate to HPA, right?
> > > > 
> > > Yes, that's right if the device uses physical maps. Also to note, SVQ
> > > vring is allocated in multiples of host huge pages to avoid garbage or
> > > unintended access from the device.
> > > 
> > > If a vdpa device uses physical addresses, kernel vdpa will pin qemu
> > > memory first and then will send IOVA to HPA translation to hardware.
> > > But this IOVA space is not controlled by the guest, but by SVQ. If a
> > > guest's virtqueue buffer cannot be translated first to GPA, it will
> > > not be forwarded.
> > > 
> > > Thanks!
> > Right. So if guests send a buffer where buffer address overlaps the
> > range we used for the SVQ, then I think at the moment guest won't work.
> 
> 
> There's no way for a guest to do this, it can only use GPA

With a vIOMMU it can.

> but the Qemu
> won't let vDPA to use GPA as IOVA. Dedicated IOVA ranges were allocated for
> those GPA ranges so SVQ won't use IOVA that is overlapped with what Guest
> use.
> 
> Thanks
> 
> 
> > 


