Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B0F6F67E9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 11:03:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puUrT-0006uu-RG; Thu, 04 May 2023 05:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puUrH-0006p0-Rn
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:02:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1puUrD-0008Je-1r
 for qemu-devel@nongnu.org; Thu, 04 May 2023 05:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683190954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZsAH2pYzpiIT6KvLHOUmptBqC59/uJnhTnSZzDHELpI=;
 b=J94Nzjc0SdWq5am8tuliBa4KJ8OFoiksudvx6+nMo5gnW8+j2AQJbZnsKmfuWM9qs2TdN1
 UVWfyD/mR4T2GK9u8leYz5SVMAxTv3xcCo2bAAbwk5e67/uc8JIpvqLVg5DyztU4UqT0cD
 9V2+RXDbEz03gckFMXjg1HtYRDErhQI=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-dmA24r2SOI6atGyS3oEybQ-1; Thu, 04 May 2023 05:02:32 -0400
X-MC-Unique: dmA24r2SOI6atGyS3oEybQ-1
Received: by mail-yb1-f198.google.com with SMTP id
 3f1490d57ef6-b9a7df507c5so502152276.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 02:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683190951; x=1685782951;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZsAH2pYzpiIT6KvLHOUmptBqC59/uJnhTnSZzDHELpI=;
 b=bfCYdDrdBouEiRM2R5rjZ6ygIHulwYF+4YEaWoiJccBY824EZkp0Vt6A1Da59R0cvj
 QMbs/Z2gLMCBYO5KPlSVxFrPoNrLvehTJFKViLaxuv0BYMBIjpuruToLwjKysdL7RUe5
 Hv6oMu6y7ShS0cuEqlJaMYlGTKio2J5vk1NF7MqB0vMvd5srxBCsRB5829j01zMZZ9BR
 6Lza2F6z+lmqUQK7/vzaFGKpAf6E9t75zObdvJ9K4N8LZgOYt5m5MW2RUwPGw4l5Q7br
 hDd3mFi22nhLUbiTGqTZaMcttTdb7zulnL6QM9BiCuVOEqmAzZE99cbcZZfqyavg9Yt0
 f6Uw==
X-Gm-Message-State: AC+VfDzkrLTfABf3DzDFHPy6pIfNcZ8LvFnIw1LyL6vagJeDnzJnIm0R
 1qtD1XA5ZE8yhwHLme520rRaXuwCuSauVjV8iztqm2IQoKh0sqkTLonohBcEck/8d1Mve86oZP7
 yt26ueFViCQS3LyZW1EzcHIDHL7HKN3c=
X-Received: by 2002:a25:e792:0:b0:b9d:8613:6936 with SMTP id
 e140-20020a25e792000000b00b9d86136936mr19894523ybh.50.1683190951581; 
 Thu, 04 May 2023 02:02:31 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ478GxWdemAeGAM3Xh8cPqhjUWR8zpRPW/xohFxZMrn4PCXeZ3ueXNlVn3g4x9v2woK3aKDGxcyAh1CtyFGnbc=
X-Received: by 2002:a25:e792:0:b0:b9d:8613:6936 with SMTP id
 e140-20020a25e792000000b00b9d86136936mr19894506ybh.50.1683190951362; Thu, 04
 May 2023 02:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230504075409.121515-1-thuth@redhat.com>
 <ZFNqhe6abcx/1Svs@redhat.com>
In-Reply-To: <ZFNqhe6abcx/1Svs@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 4 May 2023 12:02:20 +0300
Message-ID: <CAPMcbCroDcsx43vVpqKPB7gzDfhEWhRtav1q3x9=21nE=p8oCA@mail.gmail.com>
Subject: Re: [PATCH] qga/commands-win32.c: Drop the check for _WIN32_WINNT >=
 0x0601
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Michael Roth <michael.roth@amd.com>
Content-Type: multipart/alternative; boundary="000000000000bed6b605fada6ea3"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, HTML_OBFUSCATE_05_10=0.26, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--000000000000bed6b605fada6ea3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, May 4, 2023 at 11:19=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com>
wrote:

> On Thu, May 04, 2023 at 09:54:09AM +0200, Thomas Huth wrote:
> > All current versions of glib require _WIN32_WINNT set to 0x0601
> > or higher already, and we also use this value as a minimum in our
> > osdep.h header file, so there is no way to still compile this code
> > with an older version of the Windows ABI. Thus we can drop this
> > check now.
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  qga/commands-win32.c | 2 --
> >  1 file changed, 2 deletions(-)
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
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

--000000000000bed6b605fada6ea3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 4=
, 2023 at 11:19=E2=80=AFAM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:be=
rrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Thu, May 04, 2023 at 09:54:09AM +0=
200, Thomas Huth wrote:<br>
&gt; All current versions of glib require _WIN32_WINNT set to 0x0601<br>
&gt; or higher already, and we also use this value as a minimum in our<br>
&gt; osdep.h header file, so there is no way to still compile this code<br>
&gt; with an older version of the Windows ABI. Thus we can drop this<br>
&gt; check now.<br>
&gt; <br>
&gt; Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" tar=
get=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 qga/commands-win32.c | 2 --<br>
&gt;=C2=A0 1 file changed, 2 deletions(-)<br>
<br>
Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div>

--000000000000bed6b605fada6ea3--


