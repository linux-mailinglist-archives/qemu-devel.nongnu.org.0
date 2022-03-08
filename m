Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEBE4D171E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 13:18:43 +0100 (CET)
Received: from localhost ([::1]:42680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRYna-0006Xa-FY
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 07:18:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRYm6-0005AW-29
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 07:17:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRYm2-0005QX-Si
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 07:17:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646741825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q4MFrwUeHA8411pLnFPfvridBdBqiDj0gRgIbPX7Bco=;
 b=QxXypeYAeSHh7UelYAptIP+HuXj6WlCJRRrfvtyjQfZSUuAtHpPoHuYdBvhr5BbzOfZTP+
 /zPTD3L8SAWK7F0F5azZpUadZlWOV+qLCgngviuxqkKXn/wpMAcNG3S/KcTsxywj3rPdUK
 NUq6XSy9MqLD3FPKQW31LC5rsuIB2sI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-twi5sMS9O_iiIqTnAeJVzA-1; Tue, 08 Mar 2022 07:17:04 -0500
X-MC-Unique: twi5sMS9O_iiIqTnAeJVzA-1
Received: by mail-ed1-f69.google.com with SMTP id
 h17-20020a05640250d100b004133863d836so10514194edb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 04:17:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q4MFrwUeHA8411pLnFPfvridBdBqiDj0gRgIbPX7Bco=;
 b=W8pOpJAt4GjqsAhYx3VrhSEY9fDoCk7ZvQlLAyEgysP9YQ1/UDwF8nTM71l1M2hdGu
 X6h7QaYhsCnGpNoYyOYlVVdGQ/Sf3AVR/aIko3sqYlX5Esy7rJkV4aVMDJAkD00M/uRl
 ala3fIYXUdJDafcU9jVgPkKOtyxDv0rGYbVxg+YN2b8ULRW94qyaOCaVO1d/ZAkWIjb3
 SURoizij7vc8kuZ1iZOCcTuNE1QsIKRHz4Kp0yvyxsGsiW2qHv5LKrXjqu0z9LagB9Kn
 3fp3kRYYSTY+CxBbYRw2yQMB11tXJp4ghhcnYXWEECiofSwf02gmpyAjc5DCNedDrMTn
 LGag==
X-Gm-Message-State: AOAM530glg99AucvjV5LKqvdrYzaQnhA8uCBLwB09cHxRTz1LQ9jQKJb
 LT39ZpDBaNg09rxHKhUHyA/k8gRdOUs6c7g8//svlMV1dIyRvcs/T3V4q9sNHvHfz8Ycxc6hYTW
 XaCP4VMoOo2FCSU0=
X-Received: by 2002:a17:906:1c57:b0:69f:2625:3f67 with SMTP id
 l23-20020a1709061c5700b0069f26253f67mr12471658ejg.632.1646741823322; 
 Tue, 08 Mar 2022 04:17:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyv3KjBNigyGaaSVueJxA+9S47u/8qNhANARzSvnWtSt6/hRP6zGr3bHeHqG0RYzeGW5mXQEA==
X-Received: by 2002:a17:906:1c57:b0:69f:2625:3f67 with SMTP id
 l23-20020a1709061c5700b0069f26253f67mr12471627ejg.632.1646741823073; 
 Tue, 08 Mar 2022 04:17:03 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 dx10-20020a170906a84a00b006da8608e09fsm5748303ejb.9.2022.03.08.04.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 04:17:02 -0800 (PST)
Date: Tue, 8 Mar 2022 07:16:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
Message-ID: <20220308071253-mutt-send-email-mst@kernel.org>
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <14d4fde4-6ea5-4805-b684-c33f6b448565@redhat.com>
 <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
 <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
 <20220308024724-mutt-send-email-mst@kernel.org>
 <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
 <20220308054623-mutt-send-email-mst@kernel.org>
 <CAJaqyWcuitG+01pjO__tYERN9910fL_JGiHG88xU=fTG3KmpJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWcuitG+01pjO__tYERN9910fL_JGiHG88xU=fTG3KmpJw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 12:37:33PM +0100, Eugenio Perez Martin wrote:
> On Tue, Mar 8, 2022 at 11:48 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Mar 08, 2022 at 04:20:53PM +0800, Jason Wang wrote:
> > > > Not by itself but I'm not sure we can guarantee guest will not
> > > > attempt to use the IOVA addresses we are reserving down
> > > > the road.
> > >
> > > The IOVA is allocated via the listeners and stored in the iova tree
> > > per GPA range as IOVA->(GPA)->HVA.Guests will only see GPA, Qemu
> > > virtio core see GPA to HVA mapping. And we do a reverse lookup to find
> > > the HVA->IOVA we allocated previously.  So we have double check here:
> > >
> > > 1) Qemu memory core to make sure the GPA that guest uses is valid
> > > 2) the IOVA tree that guarantees there will be no HVA beyond what
> > > guest can see is used
> > >
> > > So technically, there's no way for the guest to use the IOVA address
> > > allocated for the shadow virtqueue.
> > >
> > > Thanks
> >
> > I mean, IOVA is programmed in the host hardware to translate to HPA, right?
> >
> 
> Yes, that's right if the device uses physical maps. Also to note, SVQ
> vring is allocated in multiples of host huge pages to avoid garbage or
> unintended access from the device.
> 
> If a vdpa device uses physical addresses, kernel vdpa will pin qemu
> memory first and then will send IOVA to HPA translation to hardware.
> But this IOVA space is not controlled by the guest, but by SVQ. If a
> guest's virtqueue buffer cannot be translated first to GPA, it will
> not be forwarded.
> 
> Thanks!

Right. So if guests send a buffer where buffer address overlaps the
range we used for the SVQ, then I think at the moment guest won't work.

-- 
MST


