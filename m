Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C93646E77E3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 12:59:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp5Vt-0005XI-S8; Wed, 19 Apr 2023 06:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pp5Vr-0005X7-L0
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 06:58:11 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pp5Vo-0007W5-Fz
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 06:58:11 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-54f21cdfadbso443761707b3.7
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681901877; x=1684493877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/G1sK8Jh15riGAz1xV1lWtlF/Mn3PHL0U2zrssLXsOo=;
 b=Yjs3clCo/W9K6m9xEkj8Uicv0SxZDUqdCZf4TfYht1GorbLa7jxOj5YyjXYRmyve+e
 zYoFfteKGxEQRsyTevuBzvJm1F9pj3QrW/0Ocqcjzzp41nQGQxZyaAtZZ1ZLvGDSrMBB
 MRR9phcd/KaXBKdbABdg9xOIy2KOhH62L/WGNAgq2Pn1QD33iKi2vczU4ybW/nsRMVFN
 GGeCcehai+yCTHmEND7eV37Vpcgt1saM1x+4VGkN1xQ6zNlgQhBbEIzMi2ziIYKmTFf/
 s+VZfszdybKNtQYNhaU33loBEu5xAK3a403P4jd+6FacLcHGnIp82IvlO42Cryb1Xh61
 3wOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681901877; x=1684493877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/G1sK8Jh15riGAz1xV1lWtlF/Mn3PHL0U2zrssLXsOo=;
 b=ayYc+Lga6tsHir6vf45JwsMdPXrxV0N/ZRjkCVVxVsJkV7vlfDvURsm/YISjeI0Ai6
 /9esBhrAx5go9hwTQCl5YflTnMuqoKhgFrOrN0vm7y36iQ44OkEFU8eanYvVFPPwVrsb
 T/+F7iWTbYDvgGUJL+yW5LEDGzsA26LT6Hifc1cnNV0N6RZA8ZA7ufFsWFf4eM1MizWA
 w9WWZJQ1d291+gJjBN7trwuEvEmhDPC00Q+6Ns32zbG8+J7y2oQrlNiCre0sxgW8Qqjs
 XDdBJcHjzagxFNfKXkX3X1bqt32MvuVG3vj/ZdApkejXviTJLqNNTw2RPFmY4MeEByiA
 MnGQ==
X-Gm-Message-State: AAQBX9ftjX9MbNf4XnxNiiYMd9ZWGf2OlOIBsqIPKVkVQXi0vXvUt/er
 xVf2JkosHXy95YXtu3WQHUIqtcE5a5BTkuy64xM=
X-Google-Smtp-Source: AKy350Z8GgZeHpt+GrwZPQuRBan900PbycPfk+jnoYz14X1BiH5o2yi9GV5NQjD9LZFsypQmJ3ipEUQlyyArEbWF4Y0=
X-Received: by 2002:a81:89c6:0:b0:54f:c305:9ad4 with SMTP id
 z189-20020a8189c6000000b0054fc3059ad4mr2469373ywf.35.1681901876961; Wed, 19
 Apr 2023 03:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230411150515.14020-1-hreitz@redhat.com>
 <20230411150515.14020-3-hreitz@redhat.com>
 <20230412210641.GC2813183@fedora>
 <246691c3-2287-7472-3615-7ec0f074445c@redhat.com>
 <CAJSP0QU-iDTT+xtkZ_xRf4vX+hM0WY+H1SXSuyS+cjiogz3A_A@mail.gmail.com>
 <b0cd4f54-94ed-09a4-cec2-e81f36da4008@redhat.com>
 <CAJaqyWegMfuc8s6bKdxdM4uVixmhy-F3xUUyOCYS1yGDXoiVZA@mail.gmail.com>
 <e4cc0882-c6e0-a830-45d6-e3aab398ab98@redhat.com>
In-Reply-To: <e4cc0882-c6e0-a830-45d6-e3aab398ab98@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 19 Apr 2023 06:57:44 -0400
Message-ID: <CAJSP0QWJJn7=Ck_5TCnGd5DLx9Rwmr_SvS2+nU89eU1A8=pUSQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] vhost-user: Interface for migration state transfer
To: Hanna Czenczek <hreitz@redhat.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org, 
 virtio-fs@redhat.com, German Maglione <gmaglione@redhat.com>, 
 Anton Kuchin <antonkuchin@yandex-team.ru>, Juan Quintela <quintela@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Wed, 19 Apr 2023 at 06:45, Hanna Czenczek <hreitz@redhat.com> wrote:
>
> On 14.04.23 17:17, Eugenio Perez Martin wrote:
> > On Thu, Apr 13, 2023 at 7:55=E2=80=AFPM Hanna Czenczek <hreitz@redhat.c=
om> wrote:
>
> [...]
>
> >> Basically, what I=E2=80=99m hearing is that I need to implement a diff=
erent
> >> feature that has no practical impact right now, and also fix bugs arou=
nd
> >> it along the way...
> >>
> > To fix this properly requires iterative device migration in qemu as
> > far as I know, instead of using VMStates [1]. This way the state is
> > requested to virtiofsd before the device reset.
> >
> > What does virtiofsd do when the state is totally sent? Does it keep
> > processing requests and generating new state or is only a one shot
> > that will suspend the daemon? If it is the second I think it still can
> > be done in one shot at the end, always indicating "no more state" at
> > save_live_pending and sending all the state at
> > save_live_complete_precopy.
>
> This sounds to me as if we should reset all devices during migration,
> and I don=E2=80=99t understand that.  virtiofsd will not immediately proc=
ess
> requests when the state is sent, because the device is still stopped,
> but when it is re-enabled (e.g. because of a failed migration), it will
> have retained its state and continue processing requests as if nothing
> happened.  A reset would break this and other stateful back-ends, as I
> think Stefan has mentioned somewhere else.
>
> It seems to me as if there are devices that need a reset, and so need
> suspend+resume around it, but I also think there are back-ends that
> don=E2=80=99t, where this would only unnecessarily complicate the back-en=
d
> implementation.

Existing vhost-user backends must continue working, so I think having
two code paths is (almost) unavoidable.

One approach is to add SUSPEND/RESUME to the vhost-user protocol with
a corresponding VHOST_USER_PROTOCOL_F_SUSPEND feature bit. vhost-user
frontends can identify backends that support SUSPEND/RESUME instead of
device reset. Old vhost-user backends will continue to use device
reset.

I said avoiding two code paths is almost unavoidable. It may be
possible to rely on existing VHOST_USER_GET_VRING_BASE's semantics (it
stops a single virtqueue) instead of SUSPEND. RESUME is replaced by
VHOST_USER_SET_VRING_* and gets the device going again. However, I'm
not 100% sure if this will work (even for all existing devices). It
would require carefully studying both the spec and various
implementations to see if it's viable. There's a chance of losing the
performance optimization that VHOST_USER_SET_STATUS provided to DPDK
if the device is not reset.

In my opinion SUSPEND/RESUME is the cleanest way to do this.

Stefan

