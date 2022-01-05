Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D8C484EA5
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 08:17:45 +0100 (CET)
Received: from localhost ([::1]:43894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n50YJ-0000VN-JZ
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 02:17:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n50Jm-00075s-4U
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 02:02:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n50Jj-0000jk-H1
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 02:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641366158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cuCWLIyJQ1vi7atNixhNIZ4gV2swfIte21MGrgapnOc=;
 b=WWr44q7V1NBKAzvpzTKG5UyQItyiCf2PZ+g/lUmwzXgH0mJLcWM7GZpCc02LH+d2ul1MyX
 HMnbZw0PKtj7GiC9kjvQyPkIp/ynoE87TXIfKlWKM+ToM+JfL0/qAvQZ1VUl2tbHKw+EXB
 bJuVq9k7XWldFn9gSKBXDk2KW6Y2+U4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-t9T1ilfbMNCn0Tu1Q629sw-1; Wed, 05 Jan 2022 02:02:36 -0500
X-MC-Unique: t9T1ilfbMNCn0Tu1Q629sw-1
Received: by mail-wm1-f69.google.com with SMTP id
 d4-20020a05600c34c400b00345d5d47d54so744054wmq.6
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 23:02:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cuCWLIyJQ1vi7atNixhNIZ4gV2swfIte21MGrgapnOc=;
 b=ayC8phPEjwHt0vrABflFLLApexg+Heu3QSuNCz0BiiuXPKb1l8Pok7DsBu+Ae+aelw
 DgCbHXLV+G19dYxZLWVVaxOQ6xW30a+GK5lgZsHhtHg32HZFZS8T9oUgMKwdNeB6Hm1J
 Xyb8HkdbfrIypJl5xE5SVwxiE/DDPZxyAha4UC9LqVsNaTAS3fH8+XVmJNiRiFLWdi/0
 cp9ETYzr4NCIVWx8AuAHiofc7KUlXk0E0whGqVa3QlJ2tMTEYf57nH4R14h4tkXQZ7Fs
 AoF4Uu06BLb8M7FKKTVz60L//M6ekO3T8cnx5ndgVA1LBrQd2cILQxtxBVa0H8Qhp3OR
 8dAQ==
X-Gm-Message-State: AOAM531YGJCLE0PH1ErLcocCIcpXREmxvYgGfTNxKLQmrtAdVI9sciSG
 qm8b5YK1HGmlcl0xEUDBZp6ViFOqdM7BxJP1COa6+48mFoNFLnPH1A+Knoioq4yFNlsew22TLvs
 5fDoXrZR+BV54dog=
X-Received: by 2002:adf:efc5:: with SMTP id i5mr44911320wrp.263.1641366155495; 
 Tue, 04 Jan 2022 23:02:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOPM0pJ0zgQt0qaJvChWZzRlZR6Tsa2QD2CSQZvojYWZJxV3vHUK7XqwnG/ts70e0VU/MVpg==
X-Received: by 2002:adf:efc5:: with SMTP id i5mr44911302wrp.263.1641366155272; 
 Tue, 04 Jan 2022 23:02:35 -0800 (PST)
Received: from redhat.com ([2.55.4.139])
 by smtp.gmail.com with ESMTPSA id j11sm1089306wmq.23.2022.01.04.23.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 23:02:34 -0800 (PST)
Date: Wed, 5 Jan 2022 02:02:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
Message-ID: <20220105020008-mutt-send-email-mst@kernel.org>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Yechuan <yechuan@huawei.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 huangzhichao@huawei.com, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini <pbonzini@redhat.com>, "Longpeng\(Mike\)" <longpeng2@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 05, 2022 at 12:35:53PM +0800, Jason Wang wrote:
> On Wed, Jan 5, 2022 at 8:59 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
> >
> > From: Longpeng <longpeng2@huawei.com>
> >
> > To support generic vdpa deivce, we need add the following ioctls:
> > - GET_VECTORS_NUM: the count of vectors that supported
> 
> Does this mean MSI vectors? If yes, it looks like a layer violation:
> vhost is transport independent.

Well *guest* needs to know how many vectors device supports.
I don't think there's a way around that. Do you?
Otherwise guests will at best be suboptimal.

>  And it reveals device implementation
> details which block (cross vendor) migration.
> 
> Thanks

Not necessarily, userspace can hide this from guest if it
wants to, just validate.


> > - GET_CONFIG_SIZE: the size of the virtio config space
> > - GET_VQS_NUM: the count of virtqueues that exported
> >
> > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > ---
> >  linux-headers/linux/vhost.h | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
> > index c998860d7b..c5edd75d15 100644
> > --- a/linux-headers/linux/vhost.h
> > +++ b/linux-headers/linux/vhost.h
> > @@ -150,4 +150,14 @@
> >  /* Get the valid iova range */
> >  #define VHOST_VDPA_GET_IOVA_RANGE      _IOR(VHOST_VIRTIO, 0x78, \
> >                                              struct vhost_vdpa_iova_range)
> > +
> > +/* Get the number of vectors */
> > +#define VHOST_VDPA_GET_VECTORS_NUM     _IOR(VHOST_VIRTIO, 0x79, int)
> > +
> > +/* Get the virtio config size */
> > +#define VHOST_VDPA_GET_CONFIG_SIZE     _IOR(VHOST_VIRTIO, 0x80, int)
> > +
> > +/* Get the number of virtqueues */
> > +#define VHOST_VDPA_GET_VQS_NUM         _IOR(VHOST_VIRTIO, 0x81, int)
> > +
> >  #endif
> > --
> > 2.23.0
> >


