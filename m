Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB673696A5A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:52:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyXB-0007lR-2P; Tue, 14 Feb 2023 11:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRyX8-0007lE-N9
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:51:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRyX4-0002tm-As
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:51:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676393513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YXDm5OUpSV5N76yHMGoPwpTaM3z3vDcG/ttbFA020JA=;
 b=Uxk9NYZ05ZAFluvAfTGJdBgSv9Tu7/F5gisI0tWubDGQ8H0Rs/57CaWr6RQ3SYsr6auCT2
 UCtPyiEAC3SwLo+llZSyu1ETLAKJvXkSGRKasfI4A8bUFSrsE8Bg9xnhxDv7LYy7KR1JaE
 O8PuhuhcBwnEpj/5NpwsNoI6CKVm5F0=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-oqEVbHoNONyn5mmnOI5uAw-1; Tue, 14 Feb 2023 11:51:46 -0500
X-MC-Unique: oqEVbHoNONyn5mmnOI5uAw-1
Received: by mail-pg1-f198.google.com with SMTP id
 f19-20020a631013000000b004e8c27fa528so6086002pgl.17
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676393505;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YXDm5OUpSV5N76yHMGoPwpTaM3z3vDcG/ttbFA020JA=;
 b=mBbSD6vt5WbqzXStt3ayRICPCkWSDIoygUE8tG4rL1MQQrGEbxO6nNcI3rRH069fDb
 UWWKT66aakVP8fkL/6wGoVdoLtZyQCJVchUyHrvkze9weZTxHUSQCnGhBO0lS7UvZV9p
 gDAC6LoRECZvfSRt7TKlOXVdDyd3fZwGZaYfhdeQImK8GDo/oxwLLfYEMTn62Qen7NZc
 35MWAqipqZMSxP7eOVgCWUfccTRiAXOfxVwJe01PoPnOkEWyx7B4J0QyRiOzgIUdoFML
 mE+1fWAxWVucRW6yEAD8rIEOLY9TafbyFbOWHiG3iv7vozfplwmO36Zb5NMaywogrOIM
 mFlg==
X-Gm-Message-State: AO0yUKXRYtNkVxMpZDI7uCJFsiBInL4FvxcmEnu5ra8pT4KBSH4qWVj1
 jsXuiph10xY8Mnw/dOxT4px1O8IeQw7G1SbjUBaMG78QfwGG9irca2VxjsGia9Nq+EBb5Y9jpPN
 BkUAhvWAFNuxbj6uwu/SH36CzJzpcQ2U=
X-Received: by 2002:aa7:9ec5:0:b0:5a8:beb3:d561 with SMTP id
 r5-20020aa79ec5000000b005a8beb3d561mr556445pfq.17.1676393505400; 
 Tue, 14 Feb 2023 08:51:45 -0800 (PST)
X-Google-Smtp-Source: AK7set/aKvr8ib9PIABtJGSjlrksi7itVHndvYgyFCKGRblxx3kX7PahsKxVG/Gj1FrZVnvu4TPGTGFX6GZaJvtn7jw=
X-Received: by 2002:aa7:9ec5:0:b0:5a8:beb3:d561 with SMTP id
 r5-20020aa79ec5000000b005a8beb3d561mr556443pfq.17.1676393505165; Tue, 14 Feb
 2023 08:51:45 -0800 (PST)
MIME-Version: 1.0
References: <20230213132009.918801-1-armbru@redhat.com>
 <CAFn=p-brOeNFLUgpxRJSBEiXvKLZN=1iv8q6rLnX3DO_SD++6Q@mail.gmail.com>
In-Reply-To: <CAFn=p-brOeNFLUgpxRJSBEiXvKLZN=1iv8q6rLnX3DO_SD++6Q@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Feb 2023 11:51:34 -0500
Message-ID: <CAFn=p-Yvv4Bcsu0158+3caJ2maxGb-0ZUCTfu1uLnve9-swGrg@mail.gmail.com>
Subject: Re: [PATCH 0/2] docs/devel/qapi-code-gen: Update features doc,
 minor improvements
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000061302f05f4abc71f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

--00000000000061302f05f4abc71f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 14, 2023, 11:49 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Mon, Feb 13, 2023, 8:20 AM Markus Armbruster <armbru@redhat.com> wrote=
:
>
>> *** BLURB HERE ***
>>
>
> =F0=9F=A4=AB
>
>
>> Markus Armbruster (2):
>>   docs/devel/qapi-code-gen: Belatedly update features documentation
>>   docs/devel/qapi-code-gen: Fix a missing 'may', clarify SchemaInfo
>>
>>  docs/devel/qapi-code-gen.rst | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> --
>> 2.39.0
>>
>
Oops, also meant to add:

Reviewed-by: John Snow <jsnow@redhat.com>

--00000000000061302f05f4abc71f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Feb 14, 2023, 11:49 AM John Snow &lt;<a href=
=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"auto"><div><br><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 13, 2023, 8:20 A=
M Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=3D"_bla=
nk" rel=3D"noreferrer">armbru@redhat.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">*** BLURB HERE ***<br></blockquote></div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">=F0=9F=A4=AB</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
Markus Armbruster (2):<br>
=C2=A0 docs/devel/qapi-code-gen: Belatedly update features documentation<br=
>
=C2=A0 docs/devel/qapi-code-gen: Fix a missing &#39;may&#39;, clarify Schem=
aInfo<br>
<br>
=C2=A0docs/devel/qapi-code-gen.rst | 16 ++++++++--------<br>
=C2=A01 file changed, 8 insertions(+), 8 deletions(-)<br>
<br>
-- <br>
2.39.0<br>
</blockquote></div></div></div></blockquote></div></div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Oops, also meant to add:=C2=A0</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Reviewed-by: John Snow &lt;<a href=3D"mai=
lto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</div></div>

--00000000000061302f05f4abc71f--


