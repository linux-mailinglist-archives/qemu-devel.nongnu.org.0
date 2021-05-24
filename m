Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8EA38F30A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 20:33:26 +0200 (CEST)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llFOH-0008H1-6A
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 14:33:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llFLx-0005rd-38
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:31:01 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:40728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llFLu-0001Jg-Jc
 for qemu-devel@nongnu.org; Mon, 24 May 2021 14:31:00 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id e8so11418433qvp.7
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 11:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VkUHZouAjxO7+PbfQpHrLl/qWDm2fsDo25zz63I007g=;
 b=vgC/lhKPLm7NkvhCWYkgs1teBnScLwnoYa+R+Vo9RCGPbWPwLbGUwZKP6Jgi0FzMj+
 JYChp5K9+eE53V/XicsoUel7w5aTzdjX3PjFxe+jsM1CkBoO5cbFuq009rHlG4KWGdUK
 4rQoYbnJoh77+SoOrf/OyLjIqT49WSrsVPZBjODl5JbXzoCBwA2XXn+z582KEkgtsqIG
 vVFS+/XCX9XcZZFdETuH/v1blYTFNgiJ5fM8tLjH7j0a95e3Cr8rUbYPZReGV4AtylAQ
 EX5YUqIxxLpuL40jUF1lDqnF0I0m8IOuvEv9yHeTmDjKXIT6p8AToQ/DTdZFvm6lTcSN
 WD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VkUHZouAjxO7+PbfQpHrLl/qWDm2fsDo25zz63I007g=;
 b=TATJ5+l2CDxX3YTQTUuZHxDepbplyquA14XuHG3TXiuTN4E5hQqJkOrLqvKICA0GW4
 0aqk9w5EW3lXyhSgNSrh3NxBDchDwBV5Kaou5hB0fZhQrmrS0Qb6/Qps0K12eLyx12ps
 WR4oDWD1ID772dPlD/hZOez6RKUC0lsKC+IBuCY/K+dfYFfCq/EvLFqBPQB1sCngHtfV
 GISkg+sVkuxVliwQVR0B035nza1J5MzF307gR3gi6hcy7Mwg2uoJF+z7tSzsPNO3q9u5
 A/8puq/sMsKafNLqimPD1TR/MXCOSIh5/yh3asoTUtomSB23GVvltneYx6R6xvYhDsda
 NC2Q==
X-Gm-Message-State: AOAM531W4liKANaa+w+im3cg+mzZAJlSYvJxiHDYQqy223JF/Urda29q
 fnb3wNO+t/YUYgKN2x0Ft/V2ZcQ6GookMAZLmG0=
X-Google-Smtp-Source: ABdhPJzc1VMVdd1OkXU0LjNYcrOHeZ5f90No8INcybMVNz9Mb4xxeDEHUa3m9A59ZUJiYXOjdHccuwnUfQy1eLvOgDs=
X-Received: by 2002:a0c:f005:: with SMTP id z5mr32392041qvk.33.1621881056882; 
 Mon, 24 May 2021 11:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210521142829.326217-1-kit.westneat@gmail.com>
 <56fc3bb8-d6fd-c038-2bcf-8288a5bbacab@redhat.com>
In-Reply-To: <56fc3bb8-d6fd-c038-2bcf-8288a5bbacab@redhat.com>
From: Kit Westneat <kit.westneat@gmail.com>
Date: Mon, 24 May 2021 14:30:44 -0400
Message-ID: <CA+F2jReT5pObS+X2Pvr41ikTtffDpiyMXE8Z0Z3PxYRD1PdK3g@mail.gmail.com>
Subject: Re: [PATCH] hw/scsi: Fix sector translation bug in
 scsi_unmap_complete_noio
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000437ef205c3179c5c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=kit.westneat@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000437ef205c3179c5c
Content-Type: text/plain; charset="UTF-8"

I started looking into adding tests, but it doesn't look like blkdebug
supports changing the blocksize. I saw that it supports changing the memory
alignment to 4k via the align parameter, but it doesn't implement
bdrv_probe_blocksizes so the blocksize stays at 512.

Would it be worth adding a blocksize parameter to blkdebug? (or maybe
log-blksize & phys-blksize?) Or is there another way to set the blocksize
of a qdev?

Thanks,
Kit



On Fri, May 21, 2021 at 11:20 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 21/05/21 16:28, Kit Westneat wrote:
> > check_lba_range expects sectors to be expressed in original qdev
> blocksize, but
> > scsi_unmap_complete_noio was translating them to 512 block sizes, which
> was
> > causing sense errors in the larger LBAs in devices using a 4k block size.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/345
> > Signed-off-by: Kit Westneat <kit.westneat@gmail.com>
> > ---
> >   hw/scsi/scsi-disk.c | 12 +++++++-----
> >   1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
> > index 3580e7ee61..e8a547dbb7 100644
> > --- a/hw/scsi/scsi-disk.c
> > +++ b/hw/scsi/scsi-disk.c
> > @@ -1582,6 +1582,7 @@ invalid_field:
> >       scsi_check_condition(r, SENSE_CODE(INVALID_FIELD));
> >   }
> >
> > +/* sector_num and nb_sectors expected to be in qdev blocksize */
> >   static inline bool check_lba_range(SCSIDiskState *s,
> >                                      uint64_t sector_num, uint32_t
> nb_sectors)
> >   {
> > @@ -1614,11 +1615,12 @@ static void scsi_unmap_complete_noio(UnmapCBData
> *data, int ret)
> >       assert(r->req.aiocb == NULL);
> >
> >       if (data->count > 0) {
> > -        r->sector = ldq_be_p(&data->inbuf[0])
> > -            * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
> > -        r->sector_count = (ldl_be_p(&data->inbuf[8]) & 0xffffffffULL)
> > -            * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
> > -        if (!check_lba_range(s, r->sector, r->sector_count)) {
> > +        uint64_t sector_num = ldq_be_p(&data->inbuf[0]);
> > +        uint32_t nb_sectors = ldl_be_p(&data->inbuf[8]) & 0xffffffffULL;
> > +        r->sector = sector_num * (s->qdev.blocksize / BDRV_SECTOR_SIZE);
> > +        r->sector_count = nb_sectors * (s->qdev.blocksize /
> BDRV_SECTOR_SIZE);
> > +
> > +        if (!check_lba_range(s, sector_num, nb_sectors)) {
> >               block_acct_invalid(blk_get_stats(s->qdev.conf.blk),
> >                                  BLOCK_ACCT_UNMAP);
> >               scsi_check_condition(r, SENSE_CODE(LBA_OUT_OF_RANGE));
> >
>
> Queued, thanks!
>
> If you want to produce a testcase for tests/qtest/virtio-scsi-test.c, I
> won't complain.
>
> Paolo
>
>

--000000000000437ef205c3179c5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I started looking into adding tests, but it doesn&#39=
;t look like blkdebug supports changing the blocksize. I saw that it suppor=
ts changing the memory alignment to 4k via the align parameter, but it does=
n&#39;t implement bdrv_probe_blocksizes so the blocksize stays at 512.<br><=
/div><div><br></div><div>Would it be worth adding a blocksize parameter to =
blkdebug? (or maybe log-blksize &amp; phys-blksize?) Or is there another wa=
y to set the blocksize of a qdev?</div><div><br></div><div>Thanks,</div><di=
v>Kit<br></div><div><br></div><div><br></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 21, 2021 at 11:20 =
AM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 21/05/21 16:28, Kit Westneat wrote:<br>
&gt; check_lba_range expects sectors to be expressed in original qdev block=
size, but<br>
&gt; scsi_unmap_complete_noio was translating them to 512 block sizes, whic=
h was<br>
&gt; causing sense errors in the larger LBAs in devices using a 4k block si=
ze.<br>
&gt; <br>
&gt; Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/345=
" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu=
/-/issues/345</a><br>
&gt; Signed-off-by: Kit Westneat &lt;<a href=3D"mailto:kit.westneat@gmail.c=
om" target=3D"_blank">kit.westneat@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/scsi/scsi-disk.c | 12 +++++++-----<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c<br>
&gt; index 3580e7ee61..e8a547dbb7 100644<br>
&gt; --- a/hw/scsi/scsi-disk.c<br>
&gt; +++ b/hw/scsi/scsi-disk.c<br>
&gt; @@ -1582,6 +1582,7 @@ invalid_field:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0scsi_check_condition(r, SENSE_CODE(INVALID_F=
IELD));<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/* sector_num and nb_sectors expected to be in qdev blocksize */<br>
&gt;=C2=A0 =C2=A0static inline bool check_lba_range(SCSIDiskState *s,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t sec=
tor_num, uint32_t nb_sectors)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -1614,11 +1615,12 @@ static void scsi_unmap_complete_noio(UnmapCBDa=
ta *data, int ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0assert(r-&gt;req.aiocb =3D=3D NULL);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (data-&gt;count &gt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;sector =3D ldq_be_p(&amp;data-&gt;i=
nbuf[0])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (s-&gt;qdev.blocksize / B=
DRV_SECTOR_SIZE);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;sector_count =3D (ldl_be_p(&amp;dat=
a-&gt;inbuf[8]) &amp; 0xffffffffULL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * (s-&gt;qdev.blocksize / B=
DRV_SECTOR_SIZE);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!check_lba_range(s, r-&gt;sector, r-&=
gt;sector_count)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t sector_num =3D ldq_be_p(&amp;dat=
a-&gt;inbuf[0]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t nb_sectors =3D ldl_be_p(&amp;dat=
a-&gt;inbuf[8]) &amp; 0xffffffffULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;sector =3D sector_num * (s-&gt;qdev=
.blocksize / BDRV_SECTOR_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;sector_count =3D nb_sectors * (s-&g=
t;qdev.blocksize / BDRV_SECTOR_SIZE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!check_lba_range(s, sector_num, nb_se=
ctors)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0block_acct_inval=
id(blk_get_stats(s-&gt;qdev.conf.blk),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BLOCK_ACCT_UNMAP);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scsi_check_condi=
tion(r, SENSE_CODE(LBA_OUT_OF_RANGE));<br>
&gt; <br>
<br>
Queued, thanks!<br>
<br>
If you want to produce a testcase for tests/qtest/virtio-scsi-test.c, I <br=
>
won&#39;t complain.<br>
<br>
Paolo<br>
<br>
</blockquote></div>

--000000000000437ef205c3179c5c--

