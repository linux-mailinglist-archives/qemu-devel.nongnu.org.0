Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EC36A2F6D
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 13:40:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWGJJ-0002f6-Es; Sun, 26 Feb 2023 07:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pWGJG-0002eg-8U
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 07:39:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pWGJE-0004Ip-EQ
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 07:39:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677415158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2WsPDKCuViy6SniuXUMfmKkbxkBR28aBLrMuwO5ZP28=;
 b=ZAANsiA+LQOgJugD0rwY7OsS3BzmOcCMxRvivEILv1tBz8p+VC1vZZu3VkBa/9dUBCGhaC
 KQZwBoIr5e+MmpTSjZdZcOPQapier4usyHAVdDkYhtIhcMd9hycJWHAFYBUoo3QadZ1Dqq
 Q2LTq2Qy2h0q39ZO2KE+kaGdXgi3jvU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-610-PDhjhpZdN-qNpj2JqmfCfQ-1; Sun, 26 Feb 2023 07:39:16 -0500
X-MC-Unique: PDhjhpZdN-qNpj2JqmfCfQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 c1-20020a0564021f8100b004acbe232c03so4728854edc.9
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 04:39:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2WsPDKCuViy6SniuXUMfmKkbxkBR28aBLrMuwO5ZP28=;
 b=BHIBb3bVs38yd8CzE2vWRlrs/CpWpJqLhB2QdTX+CyaoT2XxwWKrYgkG1h39B4XxOe
 cgYQJi1J9MP78Ce3OWBoi/Jy1PttmZfmWnyhcim6S+ev+kTiBtO5k7EYVTXOKNmkToYa
 YcJTm6tw314hB6vRKxogi9rCFRiXdjKXQiYtenABE51iq900e2+kQCzg1M7V0uFlx34z
 64bcokkGWtz20Hd/2f5NFK7olrpSN67aTAwGlr+wUN42RgOyHifFYXso9bCb00igOXRX
 YyuLfpcr8XT5qAiWJ0I4eJIN8OY+r0CslCVZJNpkovnVjqfDeNe8S5eHYkTcacXfXldW
 Ypqw==
X-Gm-Message-State: AO0yUKXCVtuHM+O85A2ILKHylgS3dtlEfnpvgaFs3t9IIkYwfPEnspWV
 OMXaKvHOhxLA65ZitlUvv5/k/KsqLqJF5kLOwToJWab40me+0209exmUfOylypfDS9q4XQvS7+5
 wA43LFgnJi39TdapEKMRbA8Q9qUlGJNI=
X-Received: by 2002:a17:906:9419:b0:877:e539:810b with SMTP id
 q25-20020a170906941900b00877e539810bmr13421101ejx.2.1677415155713; 
 Sun, 26 Feb 2023 04:39:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+KgOWgBZylZwy5GrnAudAKszmwJiXi8ymkAxGOrjjVXKzGsOwVdsDOxFQhe25tGyJGO4G+kdWCwa6HvYmsBkI=
X-Received: by 2002:a17:906:9419:b0:877:e539:810b with SMTP id
 q25-20020a170906941900b00877e539810bmr13421096ejx.2.1677415155447; Sun, 26
 Feb 2023 04:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20230225094903.53167-1-philmd@linaro.org>
In-Reply-To: <20230225094903.53167-1-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sun, 26 Feb 2023 16:39:03 +0400
Message-ID: <CAMxuvazgMMtduim4rHPO__VteFJTa2BKtRd4Vg9i+01uKLed1A@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] dump: Make most of it target agnostic (build once)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Janosch Frank <frankja@linux.ibm.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007b525605f599a6ef"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
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

--0000000000007b525605f599a6ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2023 at 1:49 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org>
wrote:

> All series reviewed.
>
> Since v5:
> - reword one commit description (Thomas)
> - drop CONFIG_SOFTMMU, unify softmmu_ss (Richard)
>
> Since v4:
> - more unused headers removed
> - KISS, use a bit of #ifdef'ry to avoid a stub file
>
> Thanks to Richard help, we can now build dump.o once
> for all targets, keeping win_dump.o for x86* targets.
>
> Philippe Mathieu-Daud=C3=A9 (5):
>   dump: Replace tswapN() -> cpu_to_dumpN()
>   dump: Replace TARGET_PAGE_SIZE -> qemu_target_page_size()
>   dump: Clean included headers
>   dump: Simplify compiling win_dump.o by introducing
>     win_dump_available()
>   dump: Add create_win_dump() stub for non-x86 targets
>
>  dump/dump-hmp-cmds.c |  2 +-
>  dump/dump.c          | 35 +++++++++++++----------------------
>  dump/meson.build     |  6 ++----
>  dump/win_dump.c      | 38 ++++++++++++++++++++++++++++----------
>  dump/win_dump.h      |  5 ++++-
>  5 files changed, 48 insertions(+), 38 deletions(-)
>
>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--0000000000007b525605f599a6ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 25, 2023 at 1:49 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">philmd@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">All series reviewed.<br>
<br>
Since v5:<br>
- reword one commit description (Thomas)<br>
- drop CONFIG_SOFTMMU, unify softmmu_ss (Richard)<br>
<br>
Since v4:<br>
- more unused headers removed<br>
- KISS, use a bit of #ifdef&#39;ry to avoid a stub file<br>
<br>
Thanks to Richard help, we can now build dump.o once<br>
for all targets, keeping win_dump.o for x86* targets.<br>
<br>
Philippe Mathieu-Daud=C3=A9 (5):<br>
=C2=A0 dump: Replace tswapN() -&gt; cpu_to_dumpN()<br>
=C2=A0 dump: Replace TARGET_PAGE_SIZE -&gt; qemu_target_page_size()<br>
=C2=A0 dump: Clean included headers<br>
=C2=A0 dump: Simplify compiling win_dump.o by introducing<br>
=C2=A0 =C2=A0 win_dump_available()<br>
=C2=A0 dump: Add create_win_dump() stub for non-x86 targets<br>
<br>
=C2=A0dump/dump-hmp-cmds.c |=C2=A0 2 +-<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 35 +++++++++++++-----=
-----------------<br>
=C2=A0dump/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++----<br>
=C2=A0dump/win_dump.c=C2=A0 =C2=A0 =C2=A0 | 38 ++++++++++++++++++++++++++++=
----------<br>
=C2=A0dump/win_dump.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 ++++-<br>
=C2=A05 files changed, 48 insertions(+), 38 deletions(-)<br>
<br></blockquote><div><br></div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &l=
t;<a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.co=
m</a>&gt;<br><br></div></div></div>

--0000000000007b525605f599a6ef--


