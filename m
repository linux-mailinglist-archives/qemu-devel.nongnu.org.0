Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6769696A52
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 17:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyVc-0006t0-Ui; Tue, 14 Feb 2023 11:50:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRyVU-0006r8-Gm
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:50:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRyVS-0002GB-D6
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 11:50:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676393412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VdzEaV77S+kGBYjaSUYsRBEN4uEyavs372Ptxh8ZhyU=;
 b=Pxww/CHmkgWtagP6QOcEJWLU8LOufvUlvnq0ZlgBVSRb8DD74kcBiSwrPDH2I8DpnbDAip
 Cgk2b45OghJVc20ht6EdhJZboZGl7kioNYxl3qVIS/XbleGsiyVRSoQnXzqfGN3gVhv2uy
 bgGQoLLUoXyrxWkYyiKmqZ320SZfCZ4=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-1-33g0rrUWPP-CbC740mFCmA-1; Tue, 14 Feb 2023 11:50:10 -0500
X-MC-Unique: 33g0rrUWPP-CbC740mFCmA-1
Received: by mail-pl1-f197.google.com with SMTP id
 z8-20020a170902834800b001990ad8de5bso9440454pln.10
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 08:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VdzEaV77S+kGBYjaSUYsRBEN4uEyavs372Ptxh8ZhyU=;
 b=5YnNyMDyhOE4S2JQFgXcw0ifA+/ILDahFnzLZaBAEbLYptoNT1CG9N73x5jD8a9QPn
 6gAJIoEpsErnoAPi1cT867XMtpUMyJwrF2VaNeCHlDnC7TzcFt+VVKvOa6RmJO/cO9up
 zzpx/p9c4yFClidEDVnT4Y9o+OkjvAsrW3nKfmF7aHHrpIj61mXXZfMB/hzO/6vt08xt
 sx3u2T1m89/AcPVOoV5N5whDyBgzYSuxL1fNVDXH5LEEtZMv/giKaQYGeUHn1mhxGqbl
 hxnOoNYKw2LlBoRgnFvotCT38+hLbsttA/UwKTHNTnexw7afqsr6WH2sCiAGnG4yhTBU
 OYOw==
X-Gm-Message-State: AO0yUKVIzGkD/Og6Ju15DpJYTRSGdB6fUw6CYv9akjLyJam7FPmVAjz6
 bvOPSDGFuQM0SfX9X56PbK3NyOUwM2G/k9dUIWd/v7t8VbQjkQoF1I0caZMn3je6lXkq9Y3h5Rx
 vfJl68BaC0RRRkvz8JDOZR8IzfJI/N8g=
X-Received: by 2002:a17:90a:9f42:b0:234:2592:efbe with SMTP id
 q2-20020a17090a9f4200b002342592efbemr5439pjv.131.1676393409539; 
 Tue, 14 Feb 2023 08:50:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+XrBB9LfgHjh2nj7M0eSmweRXGzeq4aZsfhPfv7y5Hk46Vdcz5utiW7bpYZSHDqP96dHb+6cptK1R7rV7IAD8=
X-Received: by 2002:a17:90a:9f42:b0:234:2592:efbe with SMTP id
 q2-20020a17090a9f4200b002342592efbemr5431pjv.131.1676393409227; Tue, 14 Feb
 2023 08:50:09 -0800 (PST)
MIME-Version: 1.0
References: <20230213132009.918801-1-armbru@redhat.com>
In-Reply-To: <20230213132009.918801-1-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Feb 2023 11:49:58 -0500
Message-ID: <CAFn=p-brOeNFLUgpxRJSBEiXvKLZN=1iv8q6rLnX3DO_SD++6Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] docs/devel/qapi-code-gen: Update features doc,
 minor improvements
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a9617005f4abc1f4"
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

--000000000000a9617005f4abc1f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 13, 2023, 8:20 AM Markus Armbruster <armbru@redhat.com> wrote:

> *** BLURB HERE ***
>

=F0=9F=A4=AB


> Markus Armbruster (2):
>   docs/devel/qapi-code-gen: Belatedly update features documentation
>   docs/devel/qapi-code-gen: Fix a missing 'may', clarify SchemaInfo
>
>  docs/devel/qapi-code-gen.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> --
> 2.39.0
>
>

--000000000000a9617005f4abc1f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Feb 13, 2023, 8:20 AM Markus Armbruster &lt;<a=
 href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">*** BLURB HERE ***<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">=F0=9F=A4=AB</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
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
<br>
</blockquote></div></div></div>

--000000000000a9617005f4abc1f4--


