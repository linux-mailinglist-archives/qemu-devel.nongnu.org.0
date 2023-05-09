Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FFF6FCA38
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:28:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwPF5-0003er-Q7; Tue, 09 May 2023 11:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPF2-0003dJ-Tu
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwPF0-0001S4-JJ
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683646021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8m7PEmzgaBL/JhjaqwQjQ12qDIfaWyKl1eItT5WEFPA=;
 b=NPq3xPusMypdo7OflB4sV5uHAiH3yHdEQTOTuuJakAInuqlqZNPc4v4B3qOEBIsHP9lbJF
 sMHLWrw7TR0372GqVLEt50En37YFJpbeTvw5vl/C3/unThKyj3Lm6wlTXqz9SNYLuaASHh
 ClNgRFZMbLyh6OjyDNii1T3goKxIwyE=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-eA2uvvNNNPm_QoQdh3lxwg-1; Tue, 09 May 2023 11:26:59 -0400
X-MC-Unique: eA2uvvNNNPm_QoQdh3lxwg-1
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-b9a7553f95dso12063508276.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683646018; x=1686238018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8m7PEmzgaBL/JhjaqwQjQ12qDIfaWyKl1eItT5WEFPA=;
 b=DPyGalS4I3UIrlHv3Jk+d7cOF+d8Lmv/6IdFQonDF1CeB7Ppu+VMVqdNvOeZNqy5+8
 AcNg/r+rMM3Dj7CGxIMohIRKUTnPXWs9r054/qx09y0SJ9EswYrXSNainYiGTtpAcQKv
 eZ1dCOH/gmUpceId4ub97/EsYmI1uFpy8SJYIuVhK9Uuss+gRqer+YKAxI7a0oakNm+V
 s7HJRWqSjNMdv3GOah+d1EZ5IIy574ycui5fzJ3hdujiFT2br2ilcd12eHyjkFn2wfx1
 YHrtrmZbvMxDL9ZcCxd56rnNVVEuathq41sWNMo40/bUfMFmvo5mtGXL3shfg+Qd8/DA
 jB2w==
X-Gm-Message-State: AC+VfDxLCqlCYzzf1IDkDZ9CYnicUeaCtK5CCunZktRPrxlJUBy8gZdE
 21JsLdRfdTUdlFaT5wB5MkBusDXky5RvxKGxuRXUu1jGukM66B0c0nIHb0E5bW5R5+UvlJvV2PM
 ZgeNMf2mi3JfGjDx2EorXWB2g8Bx63mo=
X-Received: by 2002:a25:3a87:0:b0:b95:630:1de1 with SMTP id
 h129-20020a253a87000000b00b9506301de1mr14376990yba.46.1683646018762; 
 Tue, 09 May 2023 08:26:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5MB0lavUFHXYiGgwGv5dXKrf4gYZvZP2BURz1GN812Ouk9IXvNKBFzFPX0JsGrCdZJS1xjIF74aCdpp9oGxdU=
X-Received: by 2002:a25:3a87:0:b0:b95:630:1de1 with SMTP id
 h129-20020a253a87000000b00b9506301de1mr14376967yba.46.1683646018460; Tue, 09
 May 2023 08:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230412210641.GC2813183@fedora>
 <CAJaqyWfm=g_hr9=WpsnwJ4hdpVb7K7p5rirWjvx=PxKYUp8trA@mail.gmail.com>
 <20230417153810.GE3852722@fedora>
 <CAJaqyWePM_a7AafP9qS40hmYXKHDyMsvn5g24zk=cH8L6s-kUw@mail.gmail.com>
 <CAJSP0QWUfxzad3EmT3r1hhaWmXDQt9Nj1LRPhPs_w79S9GAb1A@mail.gmail.com>
 <CAJaqyWfaDVZDJtMvPUhdRE283e80rB3WFd3RF9i=buaBYG=PKA@mail.gmail.com>
 <20230418175924.GB4041499@fedora>
 <CAJaqyWd9Ec7hpfv_NUDxOuwK4weyRTm-cVNOuv8VTiGVzyYjHQ@mail.gmail.com>
 <CAJSP0QWx_9TJa_0QRfhNg6JQemAWCc0ZagvkSxj15bbM5tGD4w@mail.gmail.com>
 <a95c1ad494ce5f8d7f27af788708966e7ba1925a.camel@redhat.com>
 <20230508191235.GA926999@fedora>
 <CAJaqyWdAyVaLJykLEkHwK3BpcvP2RPJQ1ok02F9LRe26QT75Aw@mail.gmail.com>
 <c082fe16-6c83-3445-67fc-26da718d5479@redhat.com>
In-Reply-To: <c082fe16-6c83-3445-67fc-26da718d5479@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 9 May 2023 17:26:21 +0200
Message-ID: <CAJaqyWf3JdGucdpH2Xd7f-W1vuFB2QdLfBX+skzfy9Dv-ZwdNQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel@nongnu.org, 
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, May 9, 2023 at 11:01=E2=80=AFAM Hanna Czenczek <hreitz@redhat.com> =
wrote:
>
> On 09.05.23 08:31, Eugenio Perez Martin wrote:
> > On Mon, May 8, 2023 at 9:12=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat=
.com> wrote:
>
> [...]
>
> >> VHOST_USER_GET_VRING_BASE itself isn't really enough because it stops =
a
> >> specific virtqueue but not the whole device. Unfortunately stopping al=
l
> >> virtqueues is not the same as SUSPEND since spontaneous device activit=
y
> >> is possible independent of any virtqueue (e.g. virtio-scsi events and
> >> maybe virtio-net link status).
> >>
> >> That's why I think SUSPEND is necessary for a solution that's generic
> >> enough to cover all device types.
> >>
> > I agree.
> >
> > In particular virtiofsd is already resetting all the device at
> > VHOST_USER_GET_VRING_BASE if I'm not wrong, so that's even more of a
> > reason to implement suspend call.
>
> Oh, no, just the vring in question.  Not the whole device.
>
> In addition, we still need the GET_VRING_BASE call anyway, because,
> well, we want to restore the vring on the destination via SET_VRING_BASE.
>

Ok, that makes sense, sorry for the confusion!

Thanks!


