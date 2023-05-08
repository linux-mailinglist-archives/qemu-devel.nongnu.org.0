Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C66656FB5F4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 19:33:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw4ix-0000IB-Df; Mon, 08 May 2023 13:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pw4ie-0000HJ-Vr
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:32:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pw4id-0005ME-8a
 for qemu-devel@nongnu.org; Mon, 08 May 2023 13:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683567134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dwl/2mkaZAf+RzimAvEBJiRYXFXCTB5wQ3c4swjezK8=;
 b=UPcQ8IOPJeIRheB6uezIksGbYM6tusGiSfuw5HrXG8QpwDSSBsC2Wc4MtqBVtNvVbIckXr
 k6XV4tgEZrgvRVoVW7rLeHtFMSdEZFdwRMh8+HzaG5cgbuvPJOua2Gxohg4XSCey4Sjf7X
 ASQ8qzxCDgYEUdd9wsW3XcgH2NzcvtI=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-KQxBsGiwPi-ibRPSWtjFsw-1; Mon, 08 May 2023 13:32:12 -0400
X-MC-Unique: KQxBsGiwPi-ibRPSWtjFsw-1
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-ba22ced2f40so5163108276.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 10:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683567132; x=1686159132;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dwl/2mkaZAf+RzimAvEBJiRYXFXCTB5wQ3c4swjezK8=;
 b=RLAhTKCsbqKeaV3mNy84jZLPlgJhBlww8S39gGDrjoNf3eq57Arj0pCy/Uz5OB99hK
 sbLlLI+VVaTC4Ne5Iz1qMIyUleXivVE8VHL5BxBa3pMEpwWj59YTT7tT0k/J4Xg2bslX
 du/S0a/NsE2VkzrAlZkl2PHT76uM8M9ZmaqMm7jyz1BPsp+O0iflCeSHpZq35mpzt0sk
 Ep2t7SiC9zTOM2tU6n66YP55SeZ248lDU4+DiLZIt5cJMTaUKY2QNZ7LKpDLrRLmEEbA
 SDGI1qE41G6PevM6cu18zpU2vn4ZzBqk8rcibquvcqhe/7o80/UJTmL/V0I+ZxZriu+L
 he7Q==
X-Gm-Message-State: AC+VfDx/zviycSzyNdC6/4yz22SHHT+pwlQgQn4Eiwz+WuTBkkl+W7eL
 vedTEY1WAsDjv98Dd9WnVuTeQUL08qlEtgrpIZBxXqhbNTj7K6O1eAu8bvpO9+lJAWPE5+VIKBx
 Aj7OdMbrSZqXT2IPkn8QsWaRC9i/0hyw+sC+PLycEYg==
X-Received: by 2002:a25:f803:0:b0:b9e:9159:6a0c with SMTP id
 u3-20020a25f803000000b00b9e91596a0cmr11554920ybd.6.1683567132224; 
 Mon, 08 May 2023 10:32:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6a5uEM4tqDJWvRYNK0RmxC3+cabHP++E+HHb6m2eqbxl1TYM1aPYXglfeUqF4WkwLbAVKH3i3Wh8xo0tZqFpo=
X-Received: by 2002:a25:f803:0:b0:b9e:9159:6a0c with SMTP id
 u3-20020a25f803000000b00b9e91596a0cmr11554904ybd.6.1683567131998; Mon, 08 May
 2023 10:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230504101447.389398-1-eperezma@redhat.com>
 <1683339216.3364966-2-xuanzhuo@linux.alibaba.com>
 <CAJaqyWfzs00bi5qDHnyHVnf0vEK02hSiC15uJpGVi_eoRTmg7Q@mail.gmail.com>
 <20230508062210-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230508062210-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 8 May 2023 19:31:35 +0200
Message-ID: <CAJaqyWfVUJOPOpzibvW8iNtfizYzyCTQOxac-U86520pke3C4Q@mail.gmail.com>
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

On Mon, May 8, 2023 at 12:22=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, May 08, 2023 at 11:09:46AM +0200, Eugenio Perez Martin wrote:
> > On Sat, May 6, 2023 at 4:25=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.alibab=
a.com> wrote:
> > >
> > > On Thu,  4 May 2023 12:14:47 +0200, =3D?utf-8?q?Eugenio_P=3DC3=3DA9re=
z?=3D <eperezma@redhat.com> wrote:
> > > > The commit 93a97dc5200a ("virtio-net: enable vq reset feature") ena=
bles
> > > > unconditionally vq reset feature as long as the device is emulated.
> > > > This makes impossible to actually disable the feature, and it cause=
s
> > > > migration problems from qemu version previous than 7.2.
> > > >
> > > > The entire final commit is unneeded as device system already enable=
 or
> > > > disable the feature properly.
> > > >
> > > > This reverts commit 93a97dc5200a95e63b99cb625f20b7ae802ba413.
> > > > Fixes: 93a97dc5200a ("virtio-net: enable vq reset feature")
> > > > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > > >
> > > > ---
> > > > Tested by checking feature bit at  /sys/devices/pci.../virtio0/feat=
ures
> > > > enabling and disabling queue_reset virtio-net feature and vhost=3Do=
n/off
> > > > on net device backend.
> > >
> > > Do you mean that this feature cannot be closed?
> > >
> > > I tried to close in the guest, it was successful.
> > >
> >
> > I'm not sure what you mean with close. If the device dataplane is
> > emulated in qemu (vhost=3Doff), I'm not able to make the device not
> > offer it.
> >
> > > In addition, in this case, could you try to repair the problem instea=
d of
> > > directly revert.
> > >
> >
> > I'm not following this. The revert is not to always disable the feature=
.
> >
> > By default, the feature is enabled. If cmdline states queue_reset=3Don,
> > the feature is enabled. That is true both before and after applying
> > this patch.
> >
> > However, in qemu master, queue_reset=3Doff keeps enabling this feature
> > on the device. It happens that there is a commit explicitly doing
> > that, so I'm reverting it.
> >
> > Let me know if that makes sense to you.
> >
> > Thanks!
>
>
> question is this:
>
>     DEFINE_PROP_BIT64("queue_reset", _state, _field, \
>                       VIRTIO_F_RING_RESET, true)
>
>
>
> don't we need compat for 7.2 and back for this property?
>

I think that part is already covered by commit 69e1c14aa222 ("virtio:
core: vq reset feature negotation support"). In that regard, maybe we
can simplify the patch message simply stating that queue_reset=3Doff
does not work.

Thanks!


