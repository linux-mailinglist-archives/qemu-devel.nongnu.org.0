Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1596C6FF6AE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:02:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8i7-0000Si-MT; Thu, 11 May 2023 12:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1px8hx-0000SR-9m
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:59:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1px8hv-0006Ej-6P
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683820794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1JjuBr5AprDk9zDy1s3wTc3bbxUzKWwAo2l9pBkUpgE=;
 b=IXX+DvSIGGBAx3Rt8NDJ6hgYYSdD6quB7K52lzQhBtMrSQ0v/QM4Sa3Ora3ZvT6NWCtxOV
 87Sf8NIrkfqhczrh5KzDqMc2fpDbSbEojYpMXZebtQh376uyYRWpGhkmYXRaN5yIzvLfsi
 imb3MeIac8NQsw9Y8kDaxzw9p5NAATo=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413--9ne-BbRMA6CmPmVjKjxdQ-1; Thu, 11 May 2023 11:59:52 -0400
X-MC-Unique: -9ne-BbRMA6CmPmVjKjxdQ-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6435b851de0so5272249b3a.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683820791; x=1686412791;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1JjuBr5AprDk9zDy1s3wTc3bbxUzKWwAo2l9pBkUpgE=;
 b=aTY8PG6JyaTNBGFSmP2gppV+eL8m3f8megWWB2o2AG3QpreLdhVErDY93OWtM0N4WJ
 1rtjpBnFWx8Fob9c9OAHYsKoGFDojXVJbL6RarA1tu28d9EcTfh0x4M4wYvYCwl3o1QL
 2aX4vH4sa/2nNxw3Xa7rKbsIeAqWu9M0qxAeFPZfPkapw4rr8m6Sy7OCnRJERELA6gdi
 mPvgI/fho1mjBvW4KoBU+NAqeRyuR4n4ZHmY0rO8zDlWAFWQXoTbTCA/dCIRM1jzJo7W
 4ZgAZzeI27Vf/SfDBmgPEN/LVrB2Y9zeE6GktIdBvYMWuS54ppCL6SVNkz4gixVrofiq
 rzOg==
X-Gm-Message-State: AC+VfDwU4M6DsKqZ0uzPkLEyEpKhqxoyOndnd+oyie5aeP47c50Bhuew
 QEpuY+zdk4CI7IBPOHkffUnOFAFJ6K5mYdZMcbPIzLxh+Vn2I4LlVNOvaCYt7RZv5kha7Rwgrvk
 mCkO6OfvCfUNdYm0p5jMYkfp0jBXqDwc=
X-Received: by 2002:a05:6a00:244e:b0:634:7ba3:d142 with SMTP id
 d14-20020a056a00244e00b006347ba3d142mr30284700pfj.10.1683820791554; 
 Thu, 11 May 2023 08:59:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Bl6dpGiDNTW0ef4QcbG8m1K6f4xpTruE2XxPYRbPqnuLjNE80eaj3W8Hb1K18Pxob0YASok2PGl7ZCJ0Du40=
X-Received: by 2002:a05:6a00:244e:b0:634:7ba3:d142 with SMTP id
 d14-20020a056a00244e00b006347ba3d142mr30284672pfj.10.1683820791340; Thu, 11
 May 2023 08:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230511035435.734312-1-jsnow@redhat.com>
 <20230511035435.734312-8-jsnow@redhat.com>
 <e9f60dff-0cc5-82c9-cb68-8c43b7de80a4@redhat.com>
 <CAFn=p-YyBkDsmshShv3jJiL_wSMR6SVy5Z8axgsE4gWkh-r_ZQ@mail.gmail.com>
 <CABgObfaFPQ9tTGho4mtD3k6sp=WZ_KMArdZj-ZgXU_qA5LhGdQ@mail.gmail.com>
In-Reply-To: <CABgObfaFPQ9tTGho4mtD3k6sp=WZ_KMArdZj-ZgXU_qA5LhGdQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 11 May 2023 11:59:40 -0400
Message-ID: <CAFn=p-YxtwR9UUHc9HCc7s0GU9dCpsKBQZEy3zQf3w9rybn9pg@mail.gmail.com>
Subject: Re: [PATCH 07/27] mkvenv: add diagnose() method for ensure() failures
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kyle Evans <kevans@freebsd.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000223c0205fb6d1483"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000223c0205fb6d1483
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023, 11:57 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

>
>
> Il gio 11 mag 2023, 17:53 John Snow <jsnow@redhat.com> ha scritto:
>
>>
>> You're right, in the "optional" case for sphinx the error isn't really
>> *that* bad or serious. I'll try to work this or something very similar t=
o
>> it in.
>>
>> I was thinking it could be up to the caller to discard the input, but I
>> suppose we can also route the semantics down into the tool, too.
>>
>> I'll play with it.
>>
>
> If you think that what I posted is okay or at least a start, I can squash
> it in.
>
> Paolo
>

I didn't want to bet that there wouldn't be more feedback =F0=9F=98=85

but, you can squash it in pre-emptively and I'll do the same and we'll just
see what happens.

--js

>

--000000000000223c0205fb6d1483
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, May 11, 2023, 11:57 AM Paolo Bonzini =
&lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div><br><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il gio 11 m=
ag 2023, 17:53 John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; ha scritto:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><div dir=3D"auto"><div><br></div><div dir=3D"a=
uto">You&#39;re right, in the &quot;optional&quot; case for sphinx the erro=
r isn&#39;t really *that* bad or serious. I&#39;ll try to work this or some=
thing very similar to it in.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">I was thinking it could be up to the caller to discard the input, but =
I suppose we can also route the semantics down into the tool, too.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll play with it.</div></di=
v></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">If=
 you think that what I posted is okay or at least a start, I can squash it =
in.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div></b=
lockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">I didn&#39;t =
want to bet that there wouldn&#39;t be more feedback =F0=9F=98=85</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">but, you can squash it in pre-emp=
tively and I&#39;ll do the same and we&#39;ll just see what happens.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">--js</div><div class=3D"gmail_=
quote" dir=3D"auto"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
dir=3D"auto"><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
</blockquote></div></div></div>
</blockquote></div></div></div>
</blockquote></div></div>

--000000000000223c0205fb6d1483--


