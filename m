Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86FB41D08F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 02:28:56 +0200 (CEST)
Received: from localhost ([::1]:50468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVjwV-0006tx-DB
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 20:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVjvb-0006D1-Uu
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:27:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVjvZ-0003nB-5f
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 20:27:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632961675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=e6P8B1/ulSIpsjRU4o7yXGki013/HZbL7OwvRdNvhUw=;
 b=b6frGt7T2+46qr/Nz2xlqwwDzAi+X5YfM+K8swllbF8Uxs5dAgXyio/sHXg3JxBCKP3vYX
 mqLuJjVE+RRSGHS15aLUPzuwipfNwNVH20/EtxfNSlgdpBSa1YUJiTQaXXYQo8yVhZN6Yc
 fRPi8buQAdoRAQXyhO0Gw3wZslTY7Io=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-IdPQ0cqyMg2VoVBGT7NnyA-1; Wed, 29 Sep 2021 20:27:51 -0400
X-MC-Unique: IdPQ0cqyMg2VoVBGT7NnyA-1
Received: by mail-vk1-f197.google.com with SMTP id
 i7-20020ac5cd87000000b0029443ee8a47so1436629vka.15
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 17:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e6P8B1/ulSIpsjRU4o7yXGki013/HZbL7OwvRdNvhUw=;
 b=LAtZppzjPZ6Vr8SCDYMLnNv6PC7B8r2D2IBLbcguoOT91zu6C+D+wiC2deT10Nplem
 rpIFzlONarUftqki0yw8548ud7BOAFUxrqJ82QvrQfNLkn0uyblaTCkTrI1DsXE4GTQH
 zbuPI1ONoR8RdVjdiuaJxOhtFNdtRTCRD9E8HGyrwoMzTptg2Ki+ssni3rGinuArEcLq
 meq7nRC1BIifuVtxmauFsktzWT9awpcid7Nxd5RleVXaGyRrxyipQxOHIWo24dc1TSh+
 CUfII2j3PCce0tCzAOCjshEnQH7EolR9g8xqvlVvS7savAQFqH7Z/gHsf4CYaO0kC97M
 4ovg==
X-Gm-Message-State: AOAM5301rLrykcY+eOpyWEYpJpnhD98Q/WFAS6PpipZjmXBWhw8DE9hU
 b+o5B3B2N8rgsTnNxQeyYkDgRIL047hZlTxzhbRqeM66VHOnOHvZU2a7NR91oSJlYZcjfn+/op2
 rPwi+1sXUVDIvdPlMY9ymvo1OPuOV7PE=
X-Received: by 2002:a1f:8fc1:: with SMTP id r184mr1297492vkd.9.1632961671271; 
 Wed, 29 Sep 2021 17:27:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQBWBlAESjYbCOQF51tmiz2F/G4Jsj4apR3noEaCpsvYP3O6NkB5mJqvMlLXxtKwxhzHkBkhn1gPqjnBjPYSc=
X-Received: by 2002:a1f:8fc1:: with SMTP id r184mr1297461vkd.9.1632961670758; 
 Wed, 29 Sep 2021 17:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210929133427.44923-1-vsementsov@virtuozzo.com>
In-Reply-To: <20210929133427.44923-1-vsementsov@virtuozzo.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 29 Sep 2021 20:27:40 -0400
Message-ID: <CAFn=p-bsytX_DUL+RmHYUE_AdkXE6fgSi3W0E4-0--eVPhVBkA@mail.gmail.com>
Subject: Re: [PATCH 0/4] qemu-img compare --stat
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000515d6905cd2b8405"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Max Reitz <hreitz@redhat.com>,
 den@openvz.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000515d6905cd2b8405
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 29, 2021 at 9:34 AM Vladimir Sementsov-Ogievskiy <
vsementsov@virtuozzo.com> wrote:

> Hi all!
>
> Recently we faced the following task:
>
> Customer comes and say: incremental backup images are too fat. Does you
> incremental backup works correct?
>
> What to answer? We should check something. At least check that
> incremental images doesn't store same data twice. And we don't have a
> tool for it. I just wrote a simple python script to compare raw files
> cluster-by-cluster. Then we've mounted the qcow2 images with help of
> qemu-nbd, the resulting /dev/nbd* were compared and we proved that
> incremental backups don't store same data.
>
>
Good idea. I love diagnostic tools!


> But that leads to idea that some kind of that script would be good to
> have at hand.
>
> So, here is a new option for qemu-img compare, that is a lot more
> powerful and effective than original script, and allows to compare and
> calculate statistics, i.e. how many clusters differs, how many
> clusters changed from unallocated to data, and so on.
>
> For examples of output look at the test in patch 04.
>
> Vladimir Sementsov-Ogievskiy (4):
>   qemu-img: implement compare --stat
>   qemu-img: make --block-size optional for compare --stat
>   qemu-img: add --shallow option for qemu-img compare --stat
>   iotests: add qemu-img-compare-stat test
>
>  docs/tools/qemu-img.rst                       |  29 +-
>  qemu-img.c                                    | 275 +++++++++++++++++-
>  qemu-img-cmds.hx                              |   4 +-
>  .../qemu-iotests/tests/qemu-img-compare-stat  |  88 ++++++
>

And new tests! :-)


>  .../tests/qemu-img-compare-stat.out           | 106 +++++++
>  5 files changed, 484 insertions(+), 18 deletions(-)
>  create mode 100755 tests/qemu-iotests/tests/qemu-img-compare-stat
>  create mode 100644 tests/qemu-iotests/tests/qemu-img-compare-stat.out
>
>
>

--000000000000515d6905cd2b8405
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 29, 2021 at 9:34 AM Vladi=
mir Sementsov-Ogievskiy &lt;<a href=3D"mailto:vsementsov@virtuozzo.com">vse=
mentsov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Hi all!<br>
<br>
Recently we faced the following task:<br>
<br>
Customer comes and say: incremental backup images are too fat. Does you<br>
incremental backup works correct?<br>
<br>
What to answer? We should check something. At least check that<br>
incremental images doesn&#39;t store same data twice. And we don&#39;t have=
 a<br>
tool for it. I just wrote a simple python script to compare raw files<br>
cluster-by-cluster. Then we&#39;ve mounted the qcow2 images with help of<br=
>
qemu-nbd, the resulting /dev/nbd* were compared and we proved that<br>
incremental backups don&#39;t store same data.<br>
<br></blockquote><div><br></div><div>Good idea. I love diagnostic tools!<br=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
But that leads to idea that some kind of that script would be good to<br>
have at hand.<br>
<br>
So, here is a new option for qemu-img compare, that is a lot more<br>
powerful and effective than original script, and allows to compare and<br>
calculate statistics, i.e. how many clusters differs, how many<br>
clusters changed from unallocated to data, and so on.<br>
<br>
For examples of output look at the test in patch 04.<br>
<br>
Vladimir Sementsov-Ogievskiy (4):<br>
=C2=A0 qemu-img: implement compare --stat<br>
=C2=A0 qemu-img: make --block-size optional for compare --stat<br>
=C2=A0 qemu-img: add --shallow option for qemu-img compare --stat<br>
=C2=A0 iotests: add qemu-img-compare-stat test<br>
<br>
=C2=A0docs/tools/qemu-img.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 29 +-<br>
=C2=A0qemu-img.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 275 ++=
+++++++++++++++-<br>
=C2=A0qemu-img-cmds.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../qemu-iotests/tests/qemu-img-compare-stat=C2=A0 |=C2=A0 88 ++++++<=
br></blockquote><div><br></div><div>And new tests! :-)<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0.../tests/qemu-img-compare-stat.out=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 106 +++++++<br>
=C2=A05 files changed, 484 insertions(+), 18 deletions(-)<br>
=C2=A0create mode 100755 tests/qemu-iotests/tests/qemu-img-compare-stat<br>
=C2=A0create mode 100644 tests/qemu-iotests/tests/qemu-img-compare-stat.out=
<br>
<br>
<br>
</blockquote></div></div>

--000000000000515d6905cd2b8405--


