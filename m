Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8D559CFC2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 06:03:12 +0200 (CEST)
Received: from localhost ([::1]:44334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQL8A-00027M-Pi
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 00:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQL3s-0007VU-MG
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 23:58:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQL3n-0005Tt-Rz
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 23:58:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661227118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ble7UIXx4QJM0Rq6R/s87wn1BvKtropt7uZB4jdOJWA=;
 b=ZlduCYb+SKuRpJ6BqDOuZ+1yxTXitK8rASfTNMEk+DqIywhP9VOVjFuax65456CDMvMK4e
 H72YKfrrv/ZGa/ijefwJVvixLo71N7z7FZc2/3x6w5Cijg3LFqkSRue7FAQWEjybqP5ySb
 9dDllL4kkuWiNwkXvax+qqaqoplkafY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-151-ohNdg5KuMDGyGIaujGwT_g-1; Mon, 22 Aug 2022 23:58:37 -0400
X-MC-Unique: ohNdg5KuMDGyGIaujGwT_g-1
Received: by mail-lf1-f71.google.com with SMTP id
 h15-20020a056512220f00b00492bda6c536so3972994lfu.14
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 20:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=Ble7UIXx4QJM0Rq6R/s87wn1BvKtropt7uZB4jdOJWA=;
 b=ubyyRvqW+JTqSX0xAWGIA6vc4QGVHUYsxDXOepH6TLNJu03gYEbHkaAPephk9K2NqB
 Ofy4nJ2cdEwY8Jid2KKZ+vi/QKY2bU7d0knoEmQrbka4KcSfXEmKAI9I4VuWLQH71SMC
 JwIQqHT1QSBxzaeTTXAaoODyzxUcfMY0gyxnnerIS0ENwHNcda75WqFzcgV+Shv0Dlxs
 E/RnAr+jOvrQ0WipTkY6t2UYtBoIXZsx8pc/qc4/PNZP0sYF6jZ5iIHBorcpZlQn9WFw
 rl5GOSWrxsmKH1QyzzFTjK6eU0SMbma/sSjzVpFRwTCcd1CAO/WsllJoL06GqD6VSKmq
 f/8Q==
X-Gm-Message-State: ACgBeo3P+4Do9giRqmWbX1G+WnhfdRg4ygnLk70sfGIfni14sO0g6LTs
 BR0WkExmca463khOYbYhg/0RMDjcE+qwlfX76K9ao0g6PbknLwGrq+uXwt5boIX+cn3Cybn7CIb
 v0N6d0/EghY0Ei8q/gSW8rvMUyxz2irI=
X-Received: by 2002:a05:6512:6cb:b0:492:da9e:4689 with SMTP id
 u11-20020a05651206cb00b00492da9e4689mr4637716lff.641.1661227116070; 
 Mon, 22 Aug 2022 20:58:36 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6tuKkW67q/LMzk1MVC4pS5+IspLMEoSAhgdFm5R1nyqC68rckyPvLF79Rsm5QxETqWN/bbizTRtfzzDrZJbHs=
X-Received: by 2002:a05:6512:6cb:b0:492:da9e:4689 with SMTP id
 u11-20020a05651206cb00b00492da9e4689mr4637698lff.641.1661227115783; Mon, 22
 Aug 2022 20:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220810184220.2362292-1-eperezma@redhat.com>
 <20220810184220.2362292-6-eperezma@redhat.com>
 <CACGkMEsEO1hqRMp6d5fR6eMCqCPD4A_8nFTd2ABswWiwX2xSFw@mail.gmail.com>
 <CAJaqyWevZ7d2iNPo68nUP_DdVExD7PMFoJjsFuQ=w5tsMmG2+A@mail.gmail.com>
 <CACGkMEtVBOYzxvzz-p7pN8NF=uLUO9NeVtgKtSD_fHgz8aUDLQ@mail.gmail.com>
 <CAJaqyWcYTSnaNNgb5YRwD_fALWDMwwPzXYKfPc-m669LWcZM2Q@mail.gmail.com>
In-Reply-To: <CAJaqyWcYTSnaNNgb5YRwD_fALWDMwwPzXYKfPc-m669LWcZM2Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 23 Aug 2022 11:58:23 +0800
Message-ID: <CACGkMEtOvj2zqt-wuvE6DRA429EuouA0w_6=nStqPFRu0B7aEA@mail.gmail.com>
Subject: Re: [RFC 5/8] vdpa: Add vdpa memory listener
To: Eugenio Perez Martin <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 19, 2022 at 6:35 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Aug 19, 2022 at 11:01 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> > On Fri, Aug 19, 2022 at 4:30 PM Eugenio Perez Martin
> > <eperezma@redhat.com> wrote:
> > >
> > > On Fri, Aug 19, 2022 at 8:29 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > > >
> > > > On Thu, Aug 11, 2022 at 2:42 AM Eugenio P=C3=A9rez <eperezma@redhat=
.com> wrote:
> > > > >
> > > > > This enable net/vdpa to restart the full device when a migration =
is
> > > > > started or stopped.
> > > > >
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > >
> > > > I have the following questions
> > > >
> > > > 1) any reason that we need to make this net specific? The dirty pag=
e
> > > > tracking via shadow virtqueue is pretty general. And the net specif=
ic
> > > > part was done via NetClientInfo anyhow.
> > >
> > > The listener is only used to know when migration is started / stopped=
,
> > > no need for actual memory tracking. Maybe there is a better way to do
> > > so?
> >
> > Not sure, SaveVMHandlers?
> >
>
> I'm fine with investigating this, but the only entry in the doc says
> it's the "legacy way". I assume the "modern way" is through
> VMStateDescription, which is in virtio-net.

Right.

>
> The "pre_save" member already assumes the vhost backend is stopped, so
> I'm not sure if this way is valid.

I wonder if we can

1) new VhostOps
2) call that ops in vhost_log_gloabal_start/stop?

Thanks


