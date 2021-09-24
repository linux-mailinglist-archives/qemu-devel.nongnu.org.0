Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3737416B2F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 07:29:35 +0200 (CEST)
Received: from localhost ([::1]:60234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTdmA-0002mF-Al
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 01:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mTdku-0001wS-3l
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 01:28:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mTdkq-0008W4-7W
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 01:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632461290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w2LeTS8WHkjlVNPEVInxjvADIiu7gRG/TOLviolZaMU=;
 b=OwoQ2c/9/R4nZyyM1WCNszXZpPf5v2CCkf8NRlEGrWL9N9Y5F++wHUWmAROAZLMB3I351t
 q06uxEFOsEyu7hzIehbtC2jYmgHM4J44bIqajubMBWT7S7DbErN/7A+g7pO8L+LSGLWuiv
 uBrPPBDPsDrL/vXcaGBN/pOLvIcAK1k=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-IJFk7oOJNO2u0mmkqVKIOQ-1; Fri, 24 Sep 2021 01:28:08 -0400
X-MC-Unique: IJFk7oOJNO2u0mmkqVKIOQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 h9-20020a17090a470900b001791c0352aaso5531989pjg.2
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 22:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w2LeTS8WHkjlVNPEVInxjvADIiu7gRG/TOLviolZaMU=;
 b=bOLtzve4XskgpvncqOIpmdoFVBehx7/uQfpsHnqNe5tyPZLTYEWpJdiS1Cnxm1QVqv
 bUnt3YeI7sEyTSybb5Q2Z4c40Jg+qoOVD3LEFa9W7zIKsYxwu2oMcpfd+cvh8YKr3yFu
 e6d19Ze/0xpuC/PC3MQFcwpCItZUpiQQ6dGpi6lxLq3sERTLSMerN7qYuG18viDq94G+
 olbvHuCpMuuygXm5mIJOROVHCJZQiy0jGfperaLTqH00graSq4sx/EpgNxI7O4qjRIXE
 eV8YGXw3uRzlfY18fd+iasz8NKix1wtVUIYPsvQZoz+wWVVp+BBde2oyixOBCDqetgeS
 jafA==
X-Gm-Message-State: AOAM532H5V43zuxoCppauioPTszATzSUWHlygVYl4fCx9Ijz6H10kdBJ
 KoIWzDgIJPVhZGHPUy68ftM1HuJ1O9iY9X8K7PY84xDeS3UkN56s8CX2yp7E0PjtKhTKwe9f7fO
 +95mFG7/g+GBW/8xsYaomxwTyVSP+e5s=
X-Received: by 2002:a62:8496:0:b0:43c:204e:acc8 with SMTP id
 k144-20020a628496000000b0043c204eacc8mr8184011pfd.71.1632461287238; 
 Thu, 23 Sep 2021 22:28:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPm8tMUuQezoUgNQcwzgVEq+x4G73fNg6HXPaWCgR5IOu/clzgHIU1D30gnNdJTLJ0B+6A4PDFYkRVzVWcoVQ=
X-Received: by 2002:a62:8496:0:b0:43c:204e:acc8 with SMTP id
 k144-20020a628496000000b0043c204eacc8mr8183983pfd.71.1632461286799; Thu, 23
 Sep 2021 22:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210923130436.1187591-1-pbonzini@redhat.com>
 <5ab3b92b-92ef-e13d-4ec0-f73bec5a3782@de.ibm.com>
In-Reply-To: <5ab3b92b-92ef-e13d-4ec0-f73bec5a3782@de.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 24 Sep 2021 07:27:54 +0200
Message-ID: <CABgObfabAj_AyFAr0kXa5tXntpBXBfXxf+mB=Ocbg=jUh5FMzA@mail.gmail.com>
Subject: Re: [PATCH] block: introduce max_hw_iov for use in scsi-generic
To: Christian Borntraeger <borntraeger@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001c100f05ccb7036e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: Halil Pasic <pasic@linux.ibm.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001c100f05ccb7036e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, the question is whether it still exists...

Paolo

El jue., 23 sept. 2021 16:48, Christian Borntraeger <borntraeger@de.ibm.com=
>
escribi=C3=B3:

>
>
> Am 23.09.21 um 15:04 schrieb Paolo Bonzini:
> > Linux limits the size of iovecs to 1024 (UIO_MAXIOV in the kernel
> > sources, IOV_MAX in POSIX).  Because of this, on some host adapters
> > requests with many iovecs are rejected with -EINVAL by the
> > io_submit() or readv()/writev() system calls.
> >
> > In fact, the same limit applies to SG_IO as well.  To fix both the
> > EINVAL and the possible performance issues from using fewer iovecs
> > than allowed by Linux (some HBAs have max_segments as low as 128),
> > introduce a separate entry in BlockLimits to hold the max_segments
> > value from sysfs.  This new limit is used only for SG_IO and clamped
> > to bs->bl.max_iov anyway, just like max_hw_transfer is clamped to
> > bs->bl.max_transfer.
> >
> > Reported-by: Halil Pasic <pasic@linux.ibm.com>
> > Cc: Hanna Reitz <hreitz@redhat.com>
> > Cc: Kevin Wolf <kwolf@redhat.com>
> > Cc: qemu-block@nongnu.org
> > Fixes: 18473467d5 ("file-posix: try BLKSECTGET on block devices too, do
> not round to power of 2", 2021-06-25)
>
> This sneaked in shortly before the 6.1 release (between rc0 and rc1 I
> think).
> Shouldnt that go to stable in cass this still exist?
>
>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   block/block-backend.c          | 6 ++++++
> >   block/file-posix.c             | 2 +-
> >   block/io.c                     | 1 +
> >   hw/scsi/scsi-generic.c         | 2 +-
> >   include/block/block_int.h      | 7 +++++++
> >   include/sysemu/block-backend.h | 1 +
> >   6 files changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index 6140d133e2..ba2b5ebb10 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -1986,6 +1986,12 @@ uint32_t blk_get_max_transfer(BlockBackend *blk)
> >       return ROUND_DOWN(max, blk_get_request_alignment(blk));
> >   }
> >
> > +int blk_get_max_hw_iov(BlockBackend *blk)
> > +{
> > +    return MIN_NON_ZERO(blk->root->bs->bl.max_hw_iov,
> > +                        blk->root->bs->bl.max_iov);
> > +}
> > +
> >   int blk_get_max_iov(BlockBackend *blk)
> >   {
> >       return blk->root->bs->bl.max_iov;
> > diff --git a/block/file-posix.c b/block/file-posix.c
> > index cb9bffe047..1567edb3d5 100644
> > --- a/block/file-posix.c
> > +++ b/block/file-posix.c
> > @@ -1273,7 +1273,7 @@ static void raw_refresh_limits(BlockDriverState
> *bs, Error **errp)
> >
> >           ret =3D hdev_get_max_segments(s->fd, &st);
> >           if (ret > 0) {
> > -            bs->bl.max_iov =3D ret;
> > +            bs->bl.max_hw_iov =3D ret;
> >           }
> >       }
> >   }
> > diff --git a/block/io.c b/block/io.c
> > index a19942718b..f38e7f81d8 100644
> > --- a/block/io.c
> > +++ b/block/io.c
> > @@ -136,6 +136,7 @@ static void bdrv_merge_limits(BlockLimits *dst,
> const BlockLimits *src)
> >       dst->min_mem_alignment =3D MAX(dst->min_mem_alignment,
> >                                    src->min_mem_alignment);
> >       dst->max_iov =3D MIN_NON_ZERO(dst->max_iov, src->max_iov);
> > +    dst->max_hw_iov =3D MIN_NON_ZERO(dst->max_hw_iov, src->max_hw_iov)=
;
> >   }
> >
> >   typedef struct BdrvRefreshLimitsState {
> > diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
> > index 665baf900e..0306ccc7b1 100644
> > --- a/hw/scsi/scsi-generic.c
> > +++ b/hw/scsi/scsi-generic.c
> > @@ -180,7 +180,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq
> *r, SCSIDevice *s, int len)
> >           page =3D r->req.cmd.buf[2];
> >           if (page =3D=3D 0xb0) {
> >               uint64_t max_transfer =3D
> blk_get_max_hw_transfer(s->conf.blk);
> > -            uint32_t max_iov =3D blk_get_max_iov(s->conf.blk);
> > +            uint32_t max_iov =3D blk_get_max_hw_iov(s->conf.blk);
> >
> >               assert(max_transfer);
> >               max_transfer =3D MIN_NON_ZERO(max_transfer, max_iov *
> qemu_real_host_page_size)
> > diff --git a/include/block/block_int.h b/include/block/block_int.h
> > index f1a54db0f8..c31cbd034a 100644
> > --- a/include/block/block_int.h
> > +++ b/include/block/block_int.h
> > @@ -702,6 +702,13 @@ typedef struct BlockLimits {
> >        */
> >       uint64_t max_hw_transfer;
> >
> > +    /* Maximal number of scatter/gather elements allowed by the
> hardware.
> > +     * Applies whenever transfers to the device bypass the kernel I/O
> > +     * scheduler, for example with SG_IO.  If larger than max_iov
> > +     * or if zero, blk_get_max_hw_iov will fall back to max_iov.
> > +     */
> > +    int max_hw_iov;
> > +
> >       /* memory alignment, in bytes so that no bounce buffer is needed =
*/
> >       size_t min_mem_alignment;
> >
> > diff --git a/include/sysemu/block-backend.h
> b/include/sysemu/block-backend.h
> > index 29d4fdbf63..82bae55161 100644
> > --- a/include/sysemu/block-backend.h
> > +++ b/include/sysemu/block-backend.h
> > @@ -211,6 +211,7 @@ uint32_t blk_get_request_alignment(BlockBackend
> *blk);
> >   uint32_t blk_get_max_transfer(BlockBackend *blk);
> >   uint64_t blk_get_max_hw_transfer(BlockBackend *blk);
> >   int blk_get_max_iov(BlockBackend *blk);
> > +int blk_get_max_hw_iov(BlockBackend *blk);
> >   void blk_set_guest_block_size(BlockBackend *blk, int align);
> >   void *blk_try_blockalign(BlockBackend *blk, size_t size);
> >   void *blk_blockalign(BlockBackend *blk, size_t size);
> >
>
>

--0000000000001c100f05ccb7036e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, the question is whether it still exists...<div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">El jue., 23 sept. 2021 16:=
48, Christian Borntraeger &lt;<a href=3D"mailto:borntraeger@de.ibm.com">bor=
ntraeger@de.ibm.com</a>&gt; escribi=C3=B3:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><br>
<br>
Am 23.09.21 um 15:04 schrieb Paolo Bonzini:<br>
&gt; Linux limits the size of iovecs to 1024 (UIO_MAXIOV in the kernel<br>
&gt; sources, IOV_MAX in POSIX).=C2=A0 Because of this, on some host adapte=
rs<br>
&gt; requests with many iovecs are rejected with -EINVAL by the<br>
&gt; io_submit() or readv()/writev() system calls.<br>
&gt; <br>
&gt; In fact, the same limit applies to SG_IO as well.=C2=A0 To fix both th=
e<br>
&gt; EINVAL and the possible performance issues from using fewer iovecs<br>
&gt; than allowed by Linux (some HBAs have max_segments as low as 128),<br>
&gt; introduce a separate entry in BlockLimits to hold the max_segments<br>
&gt; value from sysfs.=C2=A0 This new limit is used only for SG_IO and clam=
ped<br>
&gt; to bs-&gt;bl.max_iov anyway, just like max_hw_transfer is clamped to<b=
r>
&gt; bs-&gt;bl.max_transfer.<br>
&gt; <br>
&gt; Reported-by: Halil Pasic &lt;<a href=3D"mailto:pasic@linux.ibm.com" ta=
rget=3D"_blank" rel=3D"noreferrer">pasic@linux.ibm.com</a>&gt;<br>
&gt; Cc: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D"_bl=
ank" rel=3D"noreferrer">hreitz@redhat.com</a>&gt;<br>
&gt; Cc: Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com" target=3D"_blan=
k" rel=3D"noreferrer">kwolf@redhat.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:qemu-block@nongnu.org" target=3D"_blank" rel=3D"=
noreferrer">qemu-block@nongnu.org</a><br>
&gt; Fixes: 18473467d5 (&quot;file-posix: try BLKSECTGET on block devices t=
oo, do not round to power of 2&quot;, 2021-06-25)<br>
<br>
This sneaked in shortly before the 6.1 release (between rc0 and rc1 I think=
).<br>
Shouldnt that go to stable in cass this still exist?<br>
<br>
<br>
&gt; Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com=
" target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0block/block-backend.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
6 ++++++<br>
&gt;=C2=A0 =C2=A0block/file-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0block/io.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 =C2=A0hw/scsi/scsi-generic.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 +-<br>
&gt;=C2=A0 =C2=A0include/block/block_int.h=C2=A0 =C2=A0 =C2=A0 | 7 +++++++<=
br>
&gt;=C2=A0 =C2=A0include/sysemu/block-backend.h | 1 +<br>
&gt;=C2=A0 =C2=A06 files changed, 17 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/block/block-backend.c b/block/block-backend.c<br>
&gt; index 6140d133e2..ba2b5ebb10 100644<br>
&gt; --- a/block/block-backend.c<br>
&gt; +++ b/block/block-backend.c<br>
&gt; @@ -1986,6 +1986,12 @@ uint32_t blk_get_max_transfer(BlockBackend *blk=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return ROUND_DOWN(max, blk_get_request_align=
ment(blk));<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +int blk_get_max_hw_iov(BlockBackend *blk)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return MIN_NON_ZERO(blk-&gt;root-&gt;bs-&gt;bl.max_hw_i=
ov,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 blk-&gt;root-&gt;bs-&gt;bl.max_iov);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0int blk_get_max_iov(BlockBackend *blk)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return blk-&gt;root-&gt;bs-&gt;bl.max_iov;<b=
r>
&gt; diff --git a/block/file-posix.c b/block/file-posix.c<br>
&gt; index cb9bffe047..1567edb3d5 100644<br>
&gt; --- a/block/file-posix.c<br>
&gt; +++ b/block/file-posix.c<br>
&gt; @@ -1273,7 +1273,7 @@ static void raw_refresh_limits(BlockDriverState =
*bs, Error **errp)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D hdev_get_max_segments(=
s-&gt;fd, &amp;st);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &gt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bs-&gt;bl.max_iov =3D ret;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bs-&gt;bl.max_hw_iov =3D re=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; diff --git a/block/io.c b/block/io.c<br>
&gt; index a19942718b..f38e7f81d8 100644<br>
&gt; --- a/block/io.c<br>
&gt; +++ b/block/io.c<br>
&gt; @@ -136,6 +136,7 @@ static void bdrv_merge_limits(BlockLimits *dst, co=
nst BlockLimits *src)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dst-&gt;min_mem_alignment =3D MAX(dst-&gt;mi=
n_mem_alignment,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src-&gt;min_mem_ali=
gnment);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dst-&gt;max_iov =3D MIN_NON_ZERO(dst-&gt;max=
_iov, src-&gt;max_iov);<br>
&gt; +=C2=A0 =C2=A0 dst-&gt;max_hw_iov =3D MIN_NON_ZERO(dst-&gt;max_hw_iov,=
 src-&gt;max_hw_iov);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0typedef struct BdrvRefreshLimitsState {<br>
&gt; diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c<br>
&gt; index 665baf900e..0306ccc7b1 100644<br>
&gt; --- a/hw/scsi/scsi-generic.c<br>
&gt; +++ b/hw/scsi/scsi-generic.c<br>
&gt; @@ -180,7 +180,7 @@ static int scsi_handle_inquiry_reply(SCSIGenericRe=
q *r, SCSIDevice *s, int len)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page =3D r-&gt;req.cmd.buf[2];=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (page =3D=3D 0xb0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t max_tra=
nsfer =3D blk_get_max_hw_transfer(s-&gt;conf.blk);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t max_iov =3D blk_ge=
t_max_iov(s-&gt;conf.blk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t max_iov =3D blk_ge=
t_max_hw_iov(s-&gt;conf.blk);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(max_trans=
fer);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_transfer =3D=
 MIN_NON_ZERO(max_transfer, max_iov * qemu_real_host_page_size)<br>
&gt; diff --git a/include/block/block_int.h b/include/block/block_int.h<br>
&gt; index f1a54db0f8..c31cbd034a 100644<br>
&gt; --- a/include/block/block_int.h<br>
&gt; +++ b/include/block/block_int.h<br>
&gt; @@ -702,6 +702,13 @@ typedef struct BlockLimits {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t max_hw_transfer;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 /* Maximal number of scatter/gather elements allowed by=
 the hardware.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Applies whenever transfers to the device bypass=
 the kernel I/O<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* scheduler, for example with SG_IO.=C2=A0 If lar=
ger than max_iov<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* or if zero, blk_get_max_hw_iov will fall back t=
o max_iov.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 int max_hw_iov;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* memory alignment, in bytes so that no bou=
nce buffer is needed */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t min_mem_alignment;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-bac=
kend.h<br>
&gt; index 29d4fdbf63..82bae55161 100644<br>
&gt; --- a/include/sysemu/block-backend.h<br>
&gt; +++ b/include/sysemu/block-backend.h<br>
&gt; @@ -211,6 +211,7 @@ uint32_t blk_get_request_alignment(BlockBackend *b=
lk);<br>
&gt;=C2=A0 =C2=A0uint32_t blk_get_max_transfer(BlockBackend *blk);<br>
&gt;=C2=A0 =C2=A0uint64_t blk_get_max_hw_transfer(BlockBackend *blk);<br>
&gt;=C2=A0 =C2=A0int blk_get_max_iov(BlockBackend *blk);<br>
&gt; +int blk_get_max_hw_iov(BlockBackend *blk);<br>
&gt;=C2=A0 =C2=A0void blk_set_guest_block_size(BlockBackend *blk, int align=
);<br>
&gt;=C2=A0 =C2=A0void *blk_try_blockalign(BlockBackend *blk, size_t size);<=
br>
&gt;=C2=A0 =C2=A0void *blk_blockalign(BlockBackend *blk, size_t size);<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000001c100f05ccb7036e--


