Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E723E612C64
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 20:17:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opDmk-00079Q-K2; Sun, 30 Oct 2022 15:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1opDmj-000793-9H
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 15:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1opDmg-0004eu-EO
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 15:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667157349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jwvgUhFSoq/vqW414LrD6TNNhRSYSJrF35UXhE5TnbQ=;
 b=ivqHXiZr73aj6RqfgKKjiLZRa3XAQmEWJ4VGGLePcwVxZmM5GIs97Lk/bI3q9NMSm/ank6
 EiaOer0QBiB8MTGScdkQaRqFiz5mGLjX2txxLrlc3Kh+4k39pAc5FhBN9b4VMJYXWUHHXi
 9u4cZyi5vtkD5/w8QI2h5IQFJ4cbU7Y=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-rvS3wopnONSZZ8rXxVYBwQ-1; Sun, 30 Oct 2022 15:15:46 -0400
X-MC-Unique: rvS3wopnONSZZ8rXxVYBwQ-1
Received: by mail-io1-f70.google.com with SMTP id
 x21-20020a5d9455000000b006bc1172e639so6888151ior.18
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 12:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jwvgUhFSoq/vqW414LrD6TNNhRSYSJrF35UXhE5TnbQ=;
 b=S6v7zRsd5OQfVM3CsytewMYuFkZ5QuA2RBT8SD2nCIcEFm1LU2/kbeqKBJ+svTX5ia
 PQACDksMSDC/Jwz1S0qBZsUQ1on4T63rV15mr97abq2dU+3oUrypvtpBPA5seoYY6Smt
 ULTxOn0Fwyw10VMyfR2klvgJAl9ikf2b0h1nAvnfvwthwxULS66jqDkefdjuOJ2qApoo
 GrvZrXPG6YeYm9owNQnizEzJretUa0RIiDnLvJylal0e0dADOe6H1tGVqPPtqQ6RoWLa
 okVt8wZnoe6QiraL8++b4rpkMsPUJfnVlifcDf5sY4OXKyhbr1I7Nrz9BLpRB75H4uPh
 lXtA==
X-Gm-Message-State: ACrzQf3aEfqdXFZYzZ2SMQzazZuVDnMbKriC4YVxlSQZi26whJ0tuokv
 Nz6cLkgKQX/w41+vD/zqtgqw9lXQvjfL5+MDkH6VnEUrgtYtWb0OOtSDARGF9P9WPOT9Q8VdkkO
 a7iGfTQ4FmFgVX+fcK3HQWMmFSBqAgL4=
X-Received: by 2002:a02:3f5c:0:b0:375:4602:f639 with SMTP id
 c28-20020a023f5c000000b003754602f639mr4321040jaf.22.1667157345375; 
 Sun, 30 Oct 2022 12:15:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6RrnadAA0wsVa2rf7HNBGwvYjoLsJRLsXAN8DHI9qVVl26rtkCZ6GQfHPA2S4F8PGRuqpsJ9jGcu0r5xUDZiQ=
X-Received: by 2002:a02:3f5c:0:b0:375:4602:f639 with SMTP id
 c28-20020a023f5c000000b003754602f639mr4321022jaf.22.1667157345047; Sun, 30
 Oct 2022 12:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-4-nsoffer@redhat.com>
 <d8bfb034-74ce-9092-a75a-0548cfcd2fcc@redhat.com>
 <CAMRbyytwEW-kMmZ7eBpEuU-Ka=O+DsbjuwykQAsLo5N3kjwWBw@mail.gmail.com>
In-Reply-To: <CAMRbyytwEW-kMmZ7eBpEuU-Ka=O+DsbjuwykQAsLo5N3kjwWBw@mail.gmail.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sun, 30 Oct 2022 21:15:29 +0200
Message-ID: <CAMRbyyv9ET-5p-EyEDhKtQ=z3FK2O+Kr4Mka=h1MbMiUbK56eQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] qemu-img: Speed up checksum
To: Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000056304505ec455199"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000056304505ec455199
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 30, 2022 at 7:38 PM Nir Soffer <nsoffer@redhat.com> wrote:

> On Wed, Oct 26, 2022 at 4:54 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
>> On 01.09.22 16:32, Nir Soffer wrote:
>>
> [...]

> > +    /* The current chunk. */
>> > +    int64_t offset;
>> > +    int64_t length;
>> > +    bool zero;
>> > +
>> > +    /* Always true for zero extent, false for data extent. Set to true
>> > +     * when reading the chunk completes. */
>>
>> Qemu codestyle requires /* and */ to be on separate lines for multi-line
>> comments (see checkpatch.pl).
>>
>
> I'll change that. Do we have a good way to run checkpatch.pl when using
> git-publish?
>
> Maybe a way to run checkpatch.pl on all patches generated by git publish
> automatically?
>

I found
https://blog.vmsplice.net/2011/03/how-to-automatically-run-checkpatchpl.html
and it seems to work well.

--00000000000056304505ec455199
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Oct 30, 2022 at 7:38 PM Nir Soffe=
r &lt;<a href=3D"mailto:nsoffer@redhat.com">nsoffer@redhat.com</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Wed, Oct 26, 2022 at 4:5=
4 PM Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D"_blank"=
>hreitz@redhat.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On 01.09.22 16:32, Nir Soffer =
wrote:<br></blockquote></div></div></blockquote><div>[...]=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 /* The current chunk. */<br>
&gt; +=C2=A0 =C2=A0 int64_t offset;<br>
&gt; +=C2=A0 =C2=A0 int64_t length;<br>
&gt; +=C2=A0 =C2=A0 bool zero;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Always true for zero extent, false for data extent. =
Set to true<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* when reading the chunk completes. */<br>
<br>
Qemu codestyle requires /* and */ to be on separate lines for multi-line <b=
r>
comments (see <a href=3D"http://checkpatch.pl" rel=3D"noreferrer" target=3D=
"_blank">checkpatch.pl</a>).<br></blockquote><div><br></div><div>I&#39;ll c=
hange that. Do we have a good way to run=C2=A0<a href=3D"http://checkpatch.=
pl/" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a>=C2=A0when using=
</div><div>git-publish?</div><div><br></div><div>Maybe a way to run <a href=
=3D"http://checkpatch.pl" target=3D"_blank">checkpatch.pl</a> on all patche=
s generated by git publish</div><div>automatically?</div></div></div></bloc=
kquote><div><br></div><div>I found=C2=A0<a href=3D"https://blog.vmsplice.ne=
t/2011/03/how-to-automatically-run-checkpatchpl.html">https://blog.vmsplice=
.net/2011/03/how-to-automatically-run-checkpatchpl.html</a></div><div>and i=
t seems to work well.</div></div></div>

--00000000000056304505ec455199--


