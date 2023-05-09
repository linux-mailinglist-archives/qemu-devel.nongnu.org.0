Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AF26FC1C9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:35:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwInG-0007lT-BB; Tue, 09 May 2023 04:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwIn8-0007lG-2z
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:33:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pwIn5-0006Mw-Jz
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:33:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683621225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5h2xfYUu5iiDFMTAJNzxYs/AkufK7wfidaMjI4g4PKY=;
 b=MfZX7vXmncmoGBnG+ANsUXufWH2MO5o7Jf8FPVTaU09WUZ2TvoUociMbzGh0M+uJqzwk8y
 xTyrzcZ3xSrpz51t1NSAupYeC1UBUee0FSXIIB6nWAdyMN9n/sMTvSwQn1c8J6C/5I36bW
 2pJZpNA+Fot1DBO5BHDXx+MCevbxqSo=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-wJN_QYulNDai9SxHbVnX0Q-1; Tue, 09 May 2023 04:33:44 -0400
X-MC-Unique: wJN_QYulNDai9SxHbVnX0Q-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-b9a6eeea78cso1323963276.0
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 01:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683621223; x=1686213223;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5h2xfYUu5iiDFMTAJNzxYs/AkufK7wfidaMjI4g4PKY=;
 b=c7yMQb2+5XNwx5WXS11LtdYtUc5qD1sv73GR0JcV4FyCiWA+I14la6zuIv1XSbuHem
 XoiTDvDeQnCLuDVQWAUDOzDQmUjo8eJKHf2jpWbzYrRjlAXTkRRHOlDByOsjpeXczzSt
 wSYs2wZgxETeES4QyfsSDhqsAlZ+dbHCy3y77kSgmdhJwlxK3IPxJ6pyr7zpg/sBaQib
 1Rohb4NKMAOVv50N+VA4Izs4sd8hj+6O+j7xvgUCh2sPIgKLwh/5A/c/6bT8R3NtsFxO
 GuUns3ibvbr3Hk2qgS3TeK5FFrSjlXFBW9Uk51wz0IYI9FUAp87p8b6hxzyGi6AvH+W6
 OMDQ==
X-Gm-Message-State: AC+VfDw2ZMtVlTwgquQTPN3A7kHomxsqypx6tBwu0IB2+urFgdh5Zjvv
 rqJuZRVjwvy7lG6Adf1VajBHFklYW5uhyJQv71GWhU7Rl+J2Ff3xtZ8XkPavvzLORviHdIKqTdU
 inRttKcm/Wvdgo6SNBFLsuAUs1BUqnJM=
X-Received: by 2002:a25:cecc:0:b0:b9f:967b:95e5 with SMTP id
 x195-20020a25cecc000000b00b9f967b95e5mr14539123ybe.13.1683621223532; 
 Tue, 09 May 2023 01:33:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Cpiq+B6wfKY94VsdAn33B8SdiOMDKAKwhqCAGkxF/x/ERK1iNL5PzYX7NOs1SSeWZ+ZiArEtP8OinNp+RAYI=
X-Received: by 2002:a25:cecc:0:b0:b9f:967b:95e5 with SMTP id
 x195-20020a25cecc000000b00b9f967b95e5mr14539116ybe.13.1683621223275; Tue, 09
 May 2023 01:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230504101447.389398-1-eperezma@redhat.com>
 <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
 <CAJaqyWfzs00bi5qDHnyHVnf0vEK02hSiC15uJpGVi_eoRTmg7Q@mail.gmail.com>
 <20230508062210-mutt-send-email-mst@kernel.org>
 <CAJaqyWfVUJOPOpzibvW8iNtfizYzyCTQOxac-U86520pke3C4Q@mail.gmail.com>
 <20230508141103-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230508141103-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 9 May 2023 10:33:07 +0200
Message-ID: <CAJaqyWf6eaTJ58+CiVqcjvyKA3_Z86xwXX0TQqB_CsWbLusC0A@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: not enable vq reset feature unconditionally
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>, 
 Lei Yang <leiyang@redhat.com>, qemu-devel@nongnu.org
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

On Mon, May 8, 2023 at 8:11=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
>
> On Mon, May 08, 2023 at 07:31:35PM +0200, Eugenio Perez Martin wrote:
> > On Mon, May 8, 2023 at 12:22=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Mon, May 08, 2023 at 11:09:46AM +0200, Eugenio Perez Martin wrote:
> > > > On Sat, May 6, 2023 at 4:25=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.al=
ibaba.com> wrote:
> > > > >
> > > > > On Thu,  4 May 2023 12:14:47 +0200, =3D?utf-8?q?Eugenio_P=3DC3=3D=
A9rez?=3D <eperezma@redhat.com> wrote:
> > > > > > The commit 93a97dc5200a ("virtio-net: enable vq reset feature")=
 enables
> > > > > > unconditionally vq reset feature as long as the device is emula=
ted.
> > > > > > This makes impossible to actually disable the feature, and it c=
auses
> > > > > > migration problems from qemu version previous than 7.2.
> > > > > >
> > > > > > The entire final commit is unneeded as device system already en=
able or
> > > > > > disable the feature properly.
> > > > > >
> > > > > > This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> > > > > > Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> > > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > > >
> > > > > > ---
> > > > > > Tested by checking feature bit at  /sys/devices/pci.../virtio0/=
features
> > > > > > enabling and disabling queue_reset virtio-net feature and vhost=
=3Don/off
> > > > > > on net device backend.
> > > > >
> > > > > Do you mean that this feature cannot be closed?
> > > > >
> > > > > I tried to close in the guest, it was successful.
> > > > >
> > > >
> > > > I'm not sure what you mean with close. If the device dataplane is
> > > > emulated in qemu (vhost=3Doff), I'm not able to make the device not
> > > > offer it.
> > > >
> > > > > In addition, in this case, could you try to repair the problem in=
stead of
> > > > > directly revert.
> > > > >
> > > >
> > > > I'm not following this. The revert is not to always disable the fea=
ture.
> > > >
> > > > By default, the feature is enabled. If cmdline states queue_reset=
=3Don,
> > > > the feature is enabled. That is true both before and after applying
> > > > this patch.
> > > >
> > > > However, in qemu master, queue_reset=3Doff keeps enabling this feat=
ure
> > > > on the device. It happens that there is a commit explicitly doing
> > > > that, so I'm reverting it.
> > > >
> > > > Let me know if that makes sense to you.
> > > >
> > > > Thanks!
> > >
> > >
> > > question is this:
> > >
> > >     DEFINE_PROP_BIT64("queue_reset", _state, _field, \
> > >                       VIRTIO_F_RING_RESET, true)
> > >
> > >
> > >
> > > don't we need compat for 7.2 and back for this property?
> > >
> >
> > I think that part is already covered by commit 69e1c14aa222 ("virtio:
> > core: vq reset feature negotation support"). In that regard, maybe we
> > can simplify the patch message simply stating that queue_reset=3Doff
> > does not work.
> >
> > Thanks!
>
> that compat for 7.1 and not 7.2 though? is that correct?
>

Yes. queue_reset support was added for 7.2 and there are cases where
it can be on or off, like using vhost=3Don.

If a new rhel 7.2 guest starts with cmdline vhost=3Doff queue_reset=3Doff,
both the guest and device model still see queue_reset=3Don, so they will
migrate with queue_reset=3Don. In the case of a migration to a current
qemu master with cmdline vhost=3Doff queue_reset=3Doff, dst qemu will
complain and block the migration (untested).

I think this is the least bad of all the bad behaviors, as a sudden
change to honor cmdline will cause a change of the device features
that the guest sees. I'm not sure if there are better ways to
accomplish this.

Maybe I'm missing something?

Thanks!


