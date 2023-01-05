Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7E965EA45
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:01:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOuJ-0007Tg-7R; Thu, 05 Jan 2023 06:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pDOuH-0007TJ-Os
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pDOuG-0008Is-2Z
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:59:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672919975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2GNzp9hM4Sq63ERk9M+QvcrhVPVNNG9w+hGF3Y205V8=;
 b=ZYm2Z+GLBpmxHZLe42z4YauvSL4kud3Nzbf154Xd07XlMi1zsaHxoN6AkrtxHVPUArm976
 IB16x5e2oaE/lEujYmJR8sZnUDnInCJqIrkF9lOsxLfMjnzxHiCZiJTojTfDXhZd+EemI/
 e+/KDvj6syG4HGO5mogPLEPy4f45M3g=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-NbE7y26wNI6LOPgNd7X8uQ-1; Thu, 05 Jan 2023 06:59:33 -0500
X-MC-Unique: NbE7y26wNI6LOPgNd7X8uQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 o43-20020ab0596e000000b0038421e4c7deso12153320uad.19
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 03:59:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2GNzp9hM4Sq63ERk9M+QvcrhVPVNNG9w+hGF3Y205V8=;
 b=Za5OSFhsTbliDOffbpnPQ62wnbUJkZaH/qc/rT3KZifIO0STyRfGErMKQdn/YzxBoU
 YrCZnAk7oOseWSYgOyFjJi8JdWzOpjcbIr0U4J0Qhm7TgxyIr8h54PvwLxVEwsofVs8V
 a7Fm+oxx7jEzV/pVzoAwGZAcGY59XOYW4fLx7JlMiuU5MJcFb1nmWMRZJ656xwxPEOYy
 nPlYxXiUwq2ffE8eRTQqtUuQEncWDdJzFf2S7JxN/VYpFPio3MzK3kmQxewTfeO21iLj
 WTf/nIqMIO9Si0c+rdGr+BI3s3EtO7fTAWyWHkAKeE9Ug/xEGWIjw/85wmdN+Hv+x5/G
 JAhA==
X-Gm-Message-State: AFqh2krxPUiXAYJcgV2dKyD39iUcEkMtKh1kDrgKisoI1jkZcSyGxHlG
 gKB+lgBLj2o13EIqMa+7ubpV5nGkrQc5RJYWGWllP59eGZ2vzql1vfj5YE3VJ4FcoyvmF6RNBaL
 NvOydVc0L5Fpwy34ZDAazwfoXrRzFfUQ=
X-Received: by 2002:ab0:48ce:0:b0:418:455f:2e94 with SMTP id
 y14-20020ab048ce000000b00418455f2e94mr4748692uac.75.1672919973029; 
 Thu, 05 Jan 2023 03:59:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvPZisvjhVeJ1VNnR7w0pAUAOhqpmIZO3arAfi7eJvoMCDczJ8Inp/BT6ynhtCxK6kAqVBbIgoccV37quDBR54=
X-Received: by 2002:ab0:48ce:0:b0:418:455f:2e94 with SMTP id
 y14-20020ab048ce000000b00418455f2e94mr4748690uac.75.1672919972719; Thu, 05
 Jan 2023 03:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20230104195633.86143-1-stefanha@redhat.com>
 <CABgObfZmc7YNCRQWqhuJSDxi-Pz7B1HJCEDmLZDaj_MPPm+83A@mail.gmail.com>
 <Y7a14QNkit3keLm1@fedora>
In-Reply-To: <Y7a14QNkit3keLm1@fedora>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 5 Jan 2023 12:59:21 +0100
Message-ID: <CABgObfZ4-89bwi-LLddbw3Of-pYNHfjSo01G7Ej0J7__Yth0vg@mail.gmail.com>
Subject: Re: [PATCH] block-backend: fix virtio-scsi assertion failure with
 blk_drain_noref()
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, 
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Qing Wang <qinwang@redhat.com>, 
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b64ae905f18308b6"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000b64ae905f18308b6
Content-Type: text/plain; charset="UTF-8"

Il gio 5 gen 2023, 12:35 Stefan Hajnoczi <stefanha@redhat.com> ha scritto:

> On Wed, Jan 04, 2023 at 10:37:34PM +0100, Paolo Bonzini wrote:
> > blk_root_drained_end is not thread-safe too. I started looking at that
> with
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg925670.html;
> that's
> > certainly a prerequisite for this patch to be a full fix, but I have not
> > checked if it's enough because I don't have the QEMU sources at hand
> right
> > now.
>
> Thanks for letting me know.
>
> Do you think blk_drain_noref() makes sense at all, or should
> scsi_purge_requests() avoid calling blk_drain() somehow?
>

I think it makes sense as a stop gap measure.

Perhaps these iothread unrefs could also be changed to happen in a
main-loop BH, but I wouldn't rush that. Unref is also the main culprit for
functions that end up calling aio_poll from coroutine context (which should
be prohibited!) and Kevin was looking at that.

Paolo


> Stefan
>

--000000000000b64ae905f18308b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 5 gen 2023, 12:35 Stefan Hajnoczi &lt;<a href=
=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a>&gt; ha scritto:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Wed, Jan 04, 2023 at 10:37:34PM +01=
00, Paolo Bonzini wrote:<br>
&gt; blk_root_drained_end is not thread-safe too. I started looking at that=
 with<br>
&gt; <a href=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg92567=
0.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.mail-ar=
chive.com/qemu-devel@nongnu.org/msg925670.html</a>; that&#39;s<br>
&gt; certainly a prerequisite for this patch to be a full fix, but I have n=
ot<br>
&gt; checked if it&#39;s enough because I don&#39;t have the QEMU sources a=
t hand right<br>
&gt; now.<br>
<br>
Thanks for letting me know.<br>
<br>
Do you think blk_drain_noref() makes sense at all, or should<br>
scsi_purge_requests() avoid calling blk_drain() somehow?<br></blockquote></=
div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I think it makes se=
nse as a stop gap measure.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Perhaps these iothread unrefs could also be changed to happen in a main-=
loop BH, but I wouldn&#39;t rush that. Unref is also the main culprit for f=
unctions that end up calling aio_poll from coroutine context (which should =
be prohibited!) and Kevin was looking at that.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Stefan<br>
</blockquote></div></div></div>

--000000000000b64ae905f18308b6--


