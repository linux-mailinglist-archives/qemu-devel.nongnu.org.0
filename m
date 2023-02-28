Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0EC6A5F79
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:17:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5TJ-0004bT-Io; Tue, 28 Feb 2023 14:17:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pX5TE-0004Wg-BL
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:17:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pX5TC-0005G8-7M
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677611818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hi5hMwcWzPaG93Fchw8SrAJZFLgxwu4b/iNXrEbAwd8=;
 b=V6Wq5JGB69HfqvM5ot/MHv7H6Zw3LoHt+Es1xYk7Y04uzrRmCiZ36XBYBGNE9LJl0TXLy9
 SvDWB71PuFZEmr5mH7vHSMcSnrQhaLBqByKfucrAUZ9LTDcg9BP2bbcHVFG59TALz8kRiS
 PaNW36ZXIFZX4Uh4hLy2oFSlGC01ucE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-QfVHgWDROk-CPBZ2U6ursA-1; Tue, 28 Feb 2023 14:16:57 -0500
X-MC-Unique: QfVHgWDROk-CPBZ2U6ursA-1
Received: by mail-ed1-f71.google.com with SMTP id
 d24-20020a056402401800b004b65da6d5e2so9785731eda.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hi5hMwcWzPaG93Fchw8SrAJZFLgxwu4b/iNXrEbAwd8=;
 b=ntQ0gnoJ7ksuRU6bRvcuhs/4m+sUN4V4RRjeiyQ5jWE8mB9J+8OrmDh/lFGFoA4GTy
 5vi7aTxqViIZK3WWj+Of5qfbtaLGVmaZd9+wBNQPu6iD03j3RSviYL/CMMcRVEl5z6eO
 4Uadq4nflajUnMJH2YqOH51VT4orBnaHEcVaUD4IWnCDaRg5AQ7vuyW4tKdcSVersoKn
 OlVOfIEeycVYxphtopSD7Q2IO86HkbEOiBWhhwOuSYPfQwnTyFIm9P0L7LBK7dsr/AQS
 IkdrgsWD3Mck26GTiVgw6g/oGHeaBfjB1plxAG0ygVUIeyGr2HCROt3W3WpC3mugWb5I
 nCjA==
X-Gm-Message-State: AO0yUKVUWuwFMGXAuj0AFmC9EhTnt5y0+U8zHqlr0DsM+oeSDugoUKuv
 sCEzuqDfbEP8r3gxhEHe4IO6y8s6KJ/65MzJriKbFXiME05dEApcLiSfaC+7v2sJpSEWLOVr6Nd
 /bcv5Ev/OhR4YlISGOAtpm8PbsUp5qKM=
X-Received: by 2002:a50:d745:0:b0:4ad:7302:8bce with SMTP id
 i5-20020a50d745000000b004ad73028bcemr2269932edj.8.1677611815905; 
 Tue, 28 Feb 2023 11:16:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/mLOLBWCaaVCq1gwAF0aaI8cATdVA3uVUQkoI2D8+KQB1k/pY6G8ykN1rxyjIETF1PgsBGEBUYLsJGfyNfXUE=
X-Received: by 2002:a50:d745:0:b0:4ad:7302:8bce with SMTP id
 i5-20020a50d745000000b004ad73028bcemr2269921edj.8.1677611815656; Tue, 28 Feb
 2023 11:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20230207142535.1153722-1-marcandre.lureau@redhat.com>
 <20230207142535.1153722-8-marcandre.lureau@redhat.com>
 <20230228155456.6iqmkof76xvcjuws@redhat.com>
In-Reply-To: <20230228155456.6iqmkof76xvcjuws@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 28 Feb 2023 23:16:44 +0400
Message-ID: <CAMxuvawA37yDP_nAmgJcGE6Cc4_YZewO4wpbrFDxjEr-dpC+3w@mail.gmail.com>
Subject: Re: [PATCH v3 07/10] qapi: implement conditional command arguments
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Michael Roth <michael.roth@amd.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000057f23205f5c77029"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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

--00000000000057f23205f5c77029
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Feb 28, 2023 at 7:55 PM Eric Blake <eblake@redhat.com> wrote:

> On Tue, Feb 07, 2023 at 06:25:32PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > The generated code doesn't quite handle the conditional arguments.
> > For example, 'bar' in 'test-if-cmd' is not correctly surrounded by #if
> > conditions. See generated code in qmp_marshal_test_if_cmd().
> >
> > Note that if there are multiple optional arguments at the last position=
,
> > there might be compilation issues due to extra comas. I left an assert
> > and FIXME for later.
>
> Would it be simpler to just state that ALL commands that want to use
> optional arguments must use a boxed type?  Then the function signature
> is simple (a single boxed type), and the logic of the optional
> parameter is now contained within the type rather than within the
> function signature.
>
>
Possibly, but I would prefer if we leave that as a FIXME, because review
rate isn't quite fast, and it delays other patches that are pending for
months already ...

--00000000000057f23205f5c77029
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 28, 2023 at 7:55 PM Eri=
c Blake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, F=
eb 07, 2023 at 06:25:32PM +0400, <a href=3D"mailto:marcandre.lureau@redhat.=
com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; The generated code doesn&#39;t quite handle the conditional arguments.=
<br>
&gt; For example, &#39;bar&#39; in &#39;test-if-cmd&#39; is not correctly s=
urrounded by #if<br>
&gt; conditions. See generated code in qmp_marshal_test_if_cmd().<br>
&gt; <br>
&gt; Note that if there are multiple optional arguments at the last positio=
n,<br>
&gt; there might be compilation issues due to extra comas. I left an assert=
<br>
&gt; and FIXME for later.<br>
<br>
Would it be simpler to just state that ALL commands that want to use<br>
optional arguments must use a boxed type?=C2=A0 Then the function signature=
<br>
is simple (a single boxed type), and the logic of the optional<br>
parameter is now contained within the type rather than within the<br>
function signature.<br>
<br></blockquote><div><br></div><div>Possibly, but I would prefer if we lea=
ve that as a FIXME, because review rate isn&#39;t quite fast, and it delays=
 other patches that are pending for months already ... <br></div></div></di=
v>

--00000000000057f23205f5c77029--


