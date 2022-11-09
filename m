Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B53622F3D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 16:42:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnDA-0006Hh-NG; Wed, 09 Nov 2022 10:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1osnD8-00065n-Iq
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:41:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1osnD6-0000Kf-S4
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:41:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668008511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A+e687B2xvoD8sByt1+glR3yDXj339/X7TA2XYXrUrs=;
 b=IdRYc5ZwocrmEx2Dl0PMa9CbBXN4yyZViXqKYnFgZ3xapADKaenTWKYDhrT2nojQT+THP3
 /fG5Wn/PlyehF26V6RPkxUvJVsOBPccnPNe/MzKRvo59c338kpqbvkNTITJryGymZKUEhg
 nnzhpg5WwIXTvvIXhftqkxG0l7ButPQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-543--dsG2EQ_MciD1ozvU6XPFw-1; Wed, 09 Nov 2022 10:41:50 -0500
X-MC-Unique: -dsG2EQ_MciD1ozvU6XPFw-1
Received: by mail-pg1-f200.google.com with SMTP id
 q63-20020a632a42000000b0045724b1dfb9so9637248pgq.3
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 07:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A+e687B2xvoD8sByt1+glR3yDXj339/X7TA2XYXrUrs=;
 b=QmtsYlfkUQNE4/hJ5z3TD6IDnSCNgdDFkAaRNQvmQO2s9XgaLfUFZveLLTf5NyBBp7
 wgEv464Dqwred78nzGTDZpAuy7MynTXL/zqILlWvRSCk8mnF3qdzYH+OvZ7KxmHwXoa4
 PBF9zi/NubBt1Rr7mOqU8eoyrO/ydBRUt/C1su9MysmButams9xMJhyFWKgw4KpHZLZS
 aTrRZRSWlhhcLeGCW1QbJS2NY2JWoTaSrR1In/a+FS23Z0e9eV9/hXDjz8mVvPZUA5Mj
 KSzrjnb2N/GdjWWCr1GpcissYuB2bHog2rd8iAIV3d2kuk9zKZyS4YRdNV+g+25mkxa6
 eXDw==
X-Gm-Message-State: ACrzQf1eYVjX0rJbIFSzGLP4JDGyd94cuyxtYVxv15vu36MTj4ZPzwul
 DvLng2mCcnb7W/RdAmYowAdO/f9/7OtZ51Hj0993k3p7JYXFd8BukS8YM8CM8YYhFeEf9aU3YCh
 Nv8gey4+XcECbv+ZVGUvQ4hfyPaBFHzk=
X-Received: by 2002:aa7:810d:0:b0:563:1fa6:fecc with SMTP id
 b13-20020aa7810d000000b005631fa6feccmr61614653pfi.24.1668008509667; 
 Wed, 09 Nov 2022 07:41:49 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7S4LsqJNO5tqd3Uvucl2M1rELcYV2iwwjmZmGtpV+AsNCYGTHrXsceAoSvTpmTikJxxGtqTORs/p6F9izMk4w=
X-Received: by 2002:aa7:810d:0:b0:563:1fa6:fecc with SMTP id
 b13-20020aa7810d000000b005631fa6feccmr61614623pfi.24.1668008509426; Wed, 09
 Nov 2022 07:41:49 -0800 (PST)
MIME-Version: 1.0
References: <20220810184220.2362292-1-eperezma@redhat.com>
 <20220810184220.2362292-6-eperezma@redhat.com>
 <CACGkMEsEO1hqRMp6d5fR6eMCqCPD4A_8nFTd2ABswWiwX2xSFw@mail.gmail.com>
 <CAJaqyWevZ7d2iNPo68nUP_DdVExD7PMFoJjsFuQ=w5tsMmG2+A@mail.gmail.com>
 <CACGkMEtVBOYzxvzz-p7pN8NF=uLUO9NeVtgKtSD_fHgz8aUDLQ@mail.gmail.com>
 <CAJaqyWcYTSnaNNgb5YRwD_fALWDMwwPzXYKfPc-m669LWcZM2Q@mail.gmail.com>
 <CACGkMEtOvj2zqt-wuvE6DRA429EuouA0w_6=nStqPFRu0B7aEA@mail.gmail.com>
In-Reply-To: <CACGkMEtOvj2zqt-wuvE6DRA429EuouA0w_6=nStqPFRu0B7aEA@mail.gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 9 Nov 2022 16:41:13 +0100
Message-ID: <CAJaqyWdrCdWJdp2caQrQ9kbwCksjhA0O+watyfp6bACeO3UEJA@mail.gmail.com>
Subject: Re: [RFC 5/8] vdpa: Add vdpa memory listener
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Cornelia Huck <cohuck@redhat.com>, Eli Cohen <eli@mellanox.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Tue, Aug 23, 2022 at 5:58 AM Jason Wang <jasowang@redhat.com> wrote:
>
> On Fri, Aug 19, 2022 at 6:35 PM Eugenio Perez Martin
> <eperezma@redhat.com> wrote:
> >
> > On Fri, Aug 19, 2022 at 11:01 AM Jason Wang <jasowang@redhat.com> wrote=
:
> > >
> > > On Fri, Aug 19, 2022 at 4:30 PM Eugenio Perez Martin
> > > <eperezma@redhat.com> wrote:
> > > >
> > > > On Fri, Aug 19, 2022 at 8:29 AM Jason Wang <jasowang@redhat.com> wr=
ote:
> > > > >
> > > > > On Thu, Aug 11, 2022 at 2:42 AM Eugenio P=C3=A9rez <eperezma@redh=
at.com> wrote:
> > > > > >
> > > > > > This enable net/vdpa to restart the full device when a migratio=
n is
> > > > > > started or stopped.
> > > > > >
> > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > >
> > > > > I have the following questions
> > > > >
> > > > > 1) any reason that we need to make this net specific? The dirty p=
age
> > > > > tracking via shadow virtqueue is pretty general. And the net spec=
ific
> > > > > part was done via NetClientInfo anyhow.
> > > >
> > > > The listener is only used to know when migration is started / stopp=
ed,
> > > > no need for actual memory tracking. Maybe there is a better way to =
do
> > > > so?
> > >
> > > Not sure, SaveVMHandlers?
> > >
> >
> > I'm fine with investigating this, but the only entry in the doc says
> > it's the "legacy way". I assume the "modern way" is through
> > VMStateDescription, which is in virtio-net.
>
> Right.
>
> >
> > The "pre_save" member already assumes the vhost backend is stopped, so
> > I'm not sure if this way is valid.
>
> I wonder if we can
>
> 1) new VhostOps
> 2) call that ops in vhost_log_gloabal_start/stop?
>

Bringing this thread up as I'm rebasing on top of the latest asid version.

We can detect that moment when set_features is called to set _F_LOG.
The problem is that it makes us duplicate the startup and teardown
code of the backend.

SVQ was proposed originally that way [1].

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg06049.html

Thanks!


