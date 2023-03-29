Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611D16CDC9C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 16:34:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phWrY-00017i-KQ; Wed, 29 Mar 2023 10:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1phWrW-00017M-Km
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:33:18 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1phWrU-0006Qv-85
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:33:18 -0400
Received: by mail-ed1-x52f.google.com with SMTP id x3so64132928edb.10
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 07:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680100393;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OdZsUed2SIMSveT8SlLd7e6mOBngxhh0ebnywzWdXf0=;
 b=hw0XhCRcLF/wUTBp+QAubxIvL3tCDOVChAMVKgZHTndBSa4977mOsNZlLsi06LIdqa
 1F7N3V8ASrE4SY0O+Ce4F0lbLytl2vL1Pn2MKm0bHseNlSFXP+h+esidw1fee/akLuBj
 zaiNa4TDL672n/8yG8jTSx3HZawvzTC9N6mvGp01d6/qB/TUmeiA2tdnnFgS5/Q/Eitv
 LFyOOXLcZwtTDXmV20BTn8nJCDx+/adGKX6pWlmc1mCypPgRQEBxxmSmmB+s0tRs74jc
 VrEIv0mhFPvDsbtWK+NKb067AMSulU0SwCpmzPQAV/2ttoKmVcJljQ0VkMOBSHy+8wBi
 hJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680100393;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OdZsUed2SIMSveT8SlLd7e6mOBngxhh0ebnywzWdXf0=;
 b=izAkWt8pP439s3u7aBVg2494kOqI9zF3OTd17GZEfDwlRxffPWK4TxOtAlU17kySwj
 toJtsXrT42sV4CwCQ5AjIXQaPVzz8wmNXizlyE8jUPMBSLyWEJqE8oguS5BB/f5o4sNx
 ljiXdHMYY2sieh67ofpXijQWndSzFsSdMfw3qMaF+nE+8FeiRao8SjOP8Y8NxIOCxQ/f
 3ZV6aDJlb1tZarlusqzGYCTsxgjaiIcJaiVKqadIuI7tob+g3rQW2F05ZvticKbBxG6O
 78cxF6rpN62BnAbfOn1LWTXAtGAth+GQh+yZoSv3KhP9+NDdCqTSo8EcRyjm2bgwqGAS
 ujxQ==
X-Gm-Message-State: AAQBX9cvUYhzcfaccDMdS0GCE3Ou+4XDCesxl1uYJ05JS3g1M26Cfdbr
 OFCCQk6R5FouWlSjmNfagQ/lfum+UjUw3ooNBRPK1Q==
X-Google-Smtp-Source: AKy350bjDuNSNnBd3bM87JeZ/W2NbP3gzFfNfsxW/fxySMi3xnhxWEZEM4EkgvWRnT6eCCz/TD34g2+M+rG2FdHX9ls=
X-Received: by 2002:a17:906:5fca:b0:930:310:abcf with SMTP id
 k10-20020a1709065fca00b009300310abcfmr9887202ejv.2.1680100393330; Wed, 29 Mar
 2023 07:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <mvmy1nfslvi.fsf@suse.de> <ZCREaEiPyzYogkFj@redhat.com>
In-Reply-To: <ZCREaEiPyzYogkFj@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 29 Mar 2023 16:06:40 +0200
Message-ID: <CANCZdfpMtWtXfCWy_2S-PedFgayLHh_zW--aBUBc-m7uZ8988g@mail.gmail.com>
Subject: Re: [PATCH v2] linux-user: preserve incoming order of environment
 variables in the target
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Andreas Schwab <schwab@suse.de>, Laurent Vivier <laurent@vivier.eu>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000021b9cf05f80adb58"
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--00000000000021b9cf05f80adb58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023, 4:00 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Wed, Mar 29, 2023 at 03:55:13PM +0200, Andreas Schwab wrote:
> > Do not reverse the order of environment variables in the target environ
> > array relative to the incoming environ order.  Some testsuites depend o=
n
> a
> > specific order, even though it is not defined by any standard.
> >
> > Signed-off-by: Andreas Schwab <schwab@suse.de>
> > ---
> >  linux-user/main.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
>
> bsd-user/main.c appears to have an identical code pattern that
> will need the same fix
>

Agreed. I am finishing up a vacation but was going to check on this... I
agree that bsd-user wants to do this too...

Warner

>
> > diff --git a/linux-user/main.c b/linux-user/main.c
> > index 4b18461969..dbfd3ee8f1 100644
> > --- a/linux-user/main.c
> > +++ b/linux-user/main.c
> > @@ -691,7 +691,13 @@ int main(int argc, char **argv, char **envp)
> >      envlist =3D envlist_create();
> >
> >      /* add current environment into the list */
> > +    /* envlist_setenv adds to the front of the list; to preserve envir=
on
> > +       order add from back to front */
> >      for (wrk =3D environ; *wrk !=3D NULL; wrk++) {
> > +        continue;
> > +    }
> > +    while (wrk !=3D environ) {
> > +        wrk--;
> >          (void) envlist_setenv(envlist, *wrk);
> >      }
> >
> > --
> > 2.40.0
> >
> >
> > --
> > Andreas Schwab, SUSE Labs, schwab@suse.de
> > GPG Key fingerprint =3D 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B=
9D7
> > "And now for something completely different."
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>
>

--00000000000021b9cf05f80adb58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 29, 2023, 4:00 PM Daniel P. Berrang=C3=A9 =
&lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Wed, Mar 29, 2023 at 03:55:13=
PM +0200, Andreas Schwab wrote:<br>
&gt; Do not reverse the order of environment variables in the target enviro=
n<br>
&gt; array relative to the incoming environ order.=C2=A0 Some testsuites de=
pend on a<br>
&gt; specific order, even though it is not defined by any standard.<br>
&gt; <br>
&gt; Signed-off-by: Andreas Schwab &lt;<a href=3D"mailto:schwab@suse.de" ta=
rget=3D"_blank" rel=3D"noreferrer">schwab@suse.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 linux-user/main.c | 6 ++++++<br>
&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
<br>
bsd-user/main.c appears to have an identical code pattern that<br>
will need the same fix<br></blockquote></div></div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Agreed. I am finishing up a vacation but was going to=
 check on this... I agree that bsd-user wants to do this too...</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Warner</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">
&gt; <br>
&gt; diff --git a/linux-user/main.c b/linux-user/main.c<br>
&gt; index 4b18461969..dbfd3ee8f1 100644<br>
&gt; --- a/linux-user/main.c<br>
&gt; +++ b/linux-user/main.c<br>
&gt; @@ -691,7 +691,13 @@ int main(int argc, char **argv, char **envp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 envlist =3D envlist_create();<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* add current environment into the list */<br>
&gt; +=C2=A0 =C2=A0 /* envlist_setenv adds to the front of the list; to pre=
serve environ<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0order add from back to front */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (wrk =3D environ; *wrk !=3D NULL; wrk++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 while (wrk !=3D environ) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 wrk--;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) envlist_setenv(envlist, *wrk)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.40.0<br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Andreas Schwab, SUSE Labs, <a href=3D"mailto:schwab@suse.de" target=3D=
"_blank" rel=3D"noreferrer">schwab@suse.de</a><br>
&gt; GPG Key fingerprint =3D 0196 BAD8 1CE9 1970 F4BE=C2=A0 1748 E4D4 88E3 =
0EEA B9D7<br>
&gt; &quot;And now for something completely different.&quot;<br>
&gt; <br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000021b9cf05f80adb58--

