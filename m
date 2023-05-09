Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1D46FBD91
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 05:15:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwDnX-0006O1-Uj; Mon, 08 May 2023 23:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pwDnU-0006Nn-ND
 for qemu-devel@nongnu.org; Mon, 08 May 2023 23:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pwDnP-0004WR-RA
 for qemu-devel@nongnu.org; Mon, 08 May 2023 23:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683602026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o75Ru7kQfL8IyLpL0OgmKJ7fcRdyL4gpn3GSyGjGUOo=;
 b=UPuGT5DaaSBBYa93JRWkQlW3LG2GpkWGrqHKqwW+L3/40cTurtdOSmE8sKz4dU/zxBKbwV
 KOjavxrC3/35SBK9VLqOIa2Dx2sBoJYRAfISzS6a2wdDOmzlhQKFWi+tTWddsamM9e+be5
 CBjq3zPofC+Euryd2wgXeFutMnPmgfQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396--BkaQt5iMi2ZiFhx3iqNRg-1; Mon, 08 May 2023 23:13:45 -0400
X-MC-Unique: -BkaQt5iMi2ZiFhx3iqNRg-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2ad8df9f9a8so11034381fa.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 20:13:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683602024; x=1686194024;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o75Ru7kQfL8IyLpL0OgmKJ7fcRdyL4gpn3GSyGjGUOo=;
 b=RL4ZqUxTSIIho+Hc0bj12z7AGD9MxOAg8XNT2YNAOnGS6pTQk5V/SLoHCj7qnTN8xe
 FY6JNIlddLSRu3Qk6w/dPGc8iW0sCZ3SIJ8t3vusnnSbrHbi/f/JWPY6B6PH5XG12Oc2
 UWt7tmvNBOrfDYTk+KcuVCdcqwauVb5U0kKrMEuIjx5mvOD9BR1lKw5IxoQ8512UYq2A
 KzLnOtAZL0Cc7QSbDQo6KU/rSe2RWP0RP3ZcmH3DPbwsFCEjhwU2VfZ2/1CIkI0E/I5w
 0XXshWmfAgIRl7He+7t9JXo753xyTJgiSRIV5FMFoKAIQbbwsm2eQB/BKJZu6UJmJ/G1
 Xd/A==
X-Gm-Message-State: AC+VfDzDLjIpZFmtyI9WK2qlT8Fc2yAt5kHSSs2E/uSTLuwItFTJ3Hla
 nluIt/eQ1mQqy5Vxt340v7W+HPzzU6hQKesJYiDH4zykW/fhmUrh9jdU9V6o4A2wfNUPI2sfO9L
 vm9h1VlW2L0rBeHAZs7G2utfzeWFtkmE=
X-Received: by 2002:a2e:9895:0:b0:2a8:c333:1886 with SMTP id
 b21-20020a2e9895000000b002a8c3331886mr320143ljj.6.1683602023954; 
 Mon, 08 May 2023 20:13:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7dnqoNtJVrNTVRM0Z5+dyJn7sBFTWkf+sYdl/kK/AlEI0hT+A2s/NDIrwu5pitxM9OA9zlOAG70SYW9+UnobM=
X-Received: by 2002:a2e:9895:0:b0:2a8:c333:1886 with SMTP id
 b21-20020a2e9895000000b002a8c3331886mr320137ljj.6.1683602023645; Mon, 08 May
 2023 20:13:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230504101447.389398-1-eperezma@redhat.com>
 <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
 <CAJaqyWfzs00bi5qDHnyHVnf0vEK02hSiC15uJpGVi_eoRTmg7Q@mail.gmail.com>
 <20230508062210-mutt-send-email-mst@kernel.org>
 <CAJaqyWfVUJOPOpzibvW8iNtfizYzyCTQOxac-U86520pke3C4Q@mail.gmail.com>
In-Reply-To: <CAJaqyWfVUJOPOpzibvW8iNtfizYzyCTQOxac-U86520pke3C4Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 9 May 2023 11:13:32 +0800
Message-ID: <CACGkMEs_RtSg5aNuP4BB_GLon43uXorZmEnaiEwqnRyftWFozw@mail.gmail.com>
Subject: Re: [PATCH] virtio-net: not enable vq reset feature unconditionally
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 Lei Yang <leiyang@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Tue, May 9, 2023 at 1:32=E2=80=AFAM Eugenio Perez Martin <eperezma@redha=
t.com> wrote:
>
> On Mon, May 8, 2023 at 12:22=E2=80=AFPM Michael S. Tsirkin <mst@redhat.co=
m> wrote:
> >
> > On Mon, May 08, 2023 at 11:09:46AM +0200, Eugenio Perez Martin wrote:
> > > On Sat, May 6, 2023 at 4:25=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alib=
aba.com> wrote:
> > > >
> > > > On Thu,  4 May 2023 12:14:47 +0200, =3D?utf-8?q?Eugenio_P=3DC3=3DA9=
rez?=3D <eperezma@redhat.com> wrote:
> > > > > The commit 93a97dc5200a ("virtio-net: enable vq reset feature") e=
nables
> > > > > unconditionally vq reset feature as long as the device is emulate=
d.
> > > > > This makes impossible to actually disable the feature, and it cau=
ses
> > > > > migration problems from qemu version previous than 7.2.
> > > > >
> > > > > The entire final commit is unneeded as device system already enab=
le or
> > > > > disable the feature properly.
> > > > >
> > > > > This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> > > > > Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> > > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > > >
> > > > > ---
> > > > > Tested by checking feature bit at  /sys/devices/pci.../virtio0/fe=
atures
> > > > > enabling and disabling queue_reset virtio-net feature and vhost=
=3Don/off
> > > > > on net device backend.
> > > >
> > > > Do you mean that this feature cannot be closed?
> > > >
> > > > I tried to close in the guest, it was successful.
> > > >
> > >
> > > I'm not sure what you mean with close. If the device dataplane is
> > > emulated in qemu (vhost=3Doff), I'm not able to make the device not
> > > offer it.
> > >
> > > > In addition, in this case, could you try to repair the problem inst=
ead of
> > > > directly revert.
> > > >
> > >
> > > I'm not following this. The revert is not to always disable the featu=
re.
> > >
> > > By default, the feature is enabled. If cmdline states queue_reset=3Do=
n,
> > > the feature is enabled. That is true both before and after applying
> > > this patch.
> > >
> > > However, in qemu master, queue_reset=3Doff keeps enabling this featur=
e
> > > on the device. It happens that there is a commit explicitly doing
> > > that, so I'm reverting it.
> > >
> > > Let me know if that makes sense to you.
> > >
> > > Thanks!
> >
> >
> > question is this:
> >
> >     DEFINE_PROP_BIT64("queue_reset", _state, _field, \
> >                       VIRTIO_F_RING_RESET, true)
> >
> >
> >
> > don't we need compat for 7.2 and back for this property?
> >
>
> I think that part is already covered by commit 69e1c14aa222 ("virtio:
> core: vq reset feature negotation support"). In that regard, maybe we
> can simplify the patch message simply stating that queue_reset=3Doff
> does not work.
>
> Thanks!

Ack

Thanks

>


