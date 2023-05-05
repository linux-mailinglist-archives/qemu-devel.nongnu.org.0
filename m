Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FFB6F7CF3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 08:31:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puoxG-0002tc-MS; Fri, 05 May 2023 02:30:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1puoxD-0002tO-OV
 for qemu-devel@nongnu.org; Fri, 05 May 2023 02:30:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1puoxB-0003NZ-SE
 for qemu-devel@nongnu.org; Fri, 05 May 2023 02:30:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683268203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l26vs41RR1DTNs1r0mXPG4SsifTKZebF9IgkUbWUeAQ=;
 b=Jg+HP/Qg1PwbZz31DxuFjSxvKgActFZE15J4MoADfI3TwfLFJYEzYlM81joB7q0lAtery7
 dUm5kp6TdblTl/B3FwsVyXrKwNUUYWhl+tgKkPHADLzQpGuDyIiUh0BmwAuWcZfZuB/bld
 F9ZPlCagSZeKo93Yzbngk4eJvCtmsMo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-WssHiFyIPaOM9VzLLlMgog-1; Fri, 05 May 2023 02:30:02 -0400
X-MC-Unique: WssHiFyIPaOM9VzLLlMgog-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-307814dd87eso17586f8f.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 23:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683268201; x=1685860201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l26vs41RR1DTNs1r0mXPG4SsifTKZebF9IgkUbWUeAQ=;
 b=JbrvN5/+VJKRXxagriDAGGiScaAsjpXFUYIwxGVTxAfC6dlyEqYsRwHa42qY8ZaOJZ
 h7jyGH5vLL4qjIQMoqi8h9NU1Npg02+3sgdLFO136uxNZ6PMJjUB3wPuTj1eiWQ2aKhU
 h+rvd5g4lSdM/fG3kI33O+3tCM8PAezCOFOwTNOKcAPWN+LEQ7D+eUAiDcE9XbE/b6AR
 DScuFQZyG2hDEWQYXbXVj87950ATlD+gv2vDRE2Tm5ValQPLxC0iYCglajcQ+MJr46oH
 2jkwEfQf9y7oQOEI7GJZBmh2ZH19pYrfmGggLwiDBDH22I+u2gQZ0MlBL/IUvUmBD9JX
 pJIA==
X-Gm-Message-State: AC+VfDyhK30HYGnR5K4l3e/00lYye4muwPsPq7DFGsdcm42fvuzkvCRc
 R7UyXoButzWoRfB3Wy7cjRSSxS+VbYEomk27ZNbwPtVQM4C7dFZKJT4QjZIA0Q993cg6Hl/GMkH
 sM8WkEKsfPq8hYIvezTtjyHTWleDinlg=
X-Received: by 2002:a5d:5191:0:b0:2f2:7adf:3c67 with SMTP id
 k17-20020a5d5191000000b002f27adf3c67mr384191wrv.61.1683268201550; 
 Thu, 04 May 2023 23:30:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Ehb4jUD8VJJENrincHuDkDzto8MjmulsVsd370Pi5aIgcKW95U8beOt7VdGySQ/peBIgwnQsfpFBqFajj6oo=
X-Received: by 2002:a5d:5191:0:b0:2f2:7adf:3c67 with SMTP id
 k17-20020a5d5191000000b002f27adf3c67mr384184wrv.61.1683268201299; Thu, 04 May
 2023 23:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230503091337.2130631-1-lulu@redhat.com>
 <CACGkMEvssDLX0OAuVE2ZwK_SAdhjUr7fnbH6kbMAOzzJKbsJig@mail.gmail.com>
In-Reply-To: <CACGkMEvssDLX0OAuVE2ZwK_SAdhjUr7fnbH6kbMAOzzJKbsJig@mail.gmail.com>
From: Cindy Lu <lulu@redhat.com>
Date: Fri, 5 May 2023 14:29:23 +0800
Message-ID: <CACLfguXZiErCtA6UN4z8V3x6MSaGga7W86jjg6EYhKb3j8QqiA@mail.gmail.com>
Subject: Re: [RFC 0/7] vhost-vdpa: add support for iommufd
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

On Fri, May 5, 2023 at 11:29=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> Hi Cindy
>
> On Wed, May 3, 2023 at 5:13=E2=80=AFPM Cindy Lu <lulu@redhat.com> wrote:
> >
> > Hi All
> > There is the RFC to support the IOMMUFD in vdpa device
> > any comments are welcome
> > Thanks
> > Cindy
>
> Please post the kernel patch as well as a reference.
>
> Thanks
>
sure=EF=BC=8Cwill do
Thanks
cindy
> >
> > Cindy Lu (7):
> >   vhost: introduce new UAPI to support IOMMUFD
> >   qapi: support iommufd in vdpa
> >   virtio : add a ptr for vdpa_iommufd in VirtIODevice
> >   net/vhost-vdpa: Add the check for iommufd
> >   vhost-vdpa: Add the iommufd support in the map/unmap function
> >   vhost-vdpa: init iommufd function in vhost_vdpa start
> >   vhost-vdpa-iommufd: Add iommufd support for vdpa
> >
> >  hw/virtio/meson.build          |   2 +-
> >  hw/virtio/vhost-vdpa-iommufd.c | 240 +++++++++++++++++++++++++++++++++
> >  hw/virtio/vhost-vdpa.c         |  74 +++++++++-
> >  include/hw/virtio/vhost-vdpa.h |  47 +++++++
> >  include/hw/virtio/virtio.h     |   5 +
> >  linux-headers/linux/vhost.h    |  72 ++++++++++
> >  net/vhost-vdpa.c               |  31 +++--
> >  qapi/net.json                  |   1 +
> >  8 files changed, 451 insertions(+), 21 deletions(-)
> >  create mode 100644 hw/virtio/vhost-vdpa-iommufd.c
> >
> > --
> > 2.34.3
> >
>


