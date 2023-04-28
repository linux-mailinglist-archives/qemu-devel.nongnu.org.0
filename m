Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EE26F1B55
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 17:20:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psPsp-0005sc-8y; Fri, 28 Apr 2023 11:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1psPsm-0005sP-Mk
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 11:19:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1psPsk-00032j-LE
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 11:19:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682695173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zgXopFuSp/uK9UxtmbiNDOfmhRwNve+wkq/g82IJVeU=;
 b=fP2/TLX/lhN9C6T4/JAAcngEmWTN+YEbgPohhcrCL/+LqEsLK3UMvYYLrZQFb064d00dvy
 KXff+lDwy6vkIQAtiMyaeSNyJ2o+ml8hrB9nXhOoplU27EiMJ8pP0UoNO7affrMCiob0is
 sNNpn3VV2yP2sq/v3i/gjzFZhryw8uA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-CfyghkS4MaqqLoy8pXnB4w-1; Fri, 28 Apr 2023 11:19:29 -0400
X-MC-Unique: CfyghkS4MaqqLoy8pXnB4w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-953759a9d18so989998866b.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 08:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682695167; x=1685287167;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zgXopFuSp/uK9UxtmbiNDOfmhRwNve+wkq/g82IJVeU=;
 b=agbZpJuFTwalCVmyvEw5utw+l0PWzfGFS/iuGsfiYk0a9ublEoXENwqwEzsR5T5cEI
 TxdUbuarS7+RPEEeYG+RBSCBHm+qkKDks385WCKgdnv/0L5+I/6228utN2RwwW64Iqfc
 XqV4O/zhUI6vmUj76cZLtG+krroMlooODgsJ0QTjajyH1AKr6f8ysSYJYKrgqtqPyti1
 x3yPDPf33LWJ6r+B7AxwbmItqLD7sEjiMIHypDSHRVXMs2B1BROYzVvKOk1uMypeSW1r
 Wds1t2regX+6I7AKLTLCo7qrVM+73bXw6+jeNOG25otjClMSOZcQyL+ANm34NWsPfgrk
 dvSQ==
X-Gm-Message-State: AC+VfDyVGEzU4HEr28DkmghZ94l5BNxPjm3d9NYjj54ZfwNUBdC8cAb3
 7ucmuBw7o4jN2qorHl7b27OO88onEv8cjlEcEKXDKhwh73o3AyY6BdU8prU7f103Con8LIrKaKU
 buJrgQcboio9y1rs6AR5F/8cJbydt9Yk=
X-Received: by 2002:a17:907:1c24:b0:94f:3338:12a2 with SMTP id
 nc36-20020a1709071c2400b0094f333812a2mr5243168ejc.33.1682695167091; 
 Fri, 28 Apr 2023 08:19:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Jy8I0ZxeZwBHPZzgQuINLfhfV5L8WQdOIvl7EldTOlz6Ulg//tf57ASkZiuSaEHws85p5ehWiwvTDekj9ngI=
X-Received: by 2002:a17:907:1c24:b0:94f:3338:12a2 with SMTP id
 nc36-20020a1709071c2400b0094f333812a2mr5243136ejc.33.1682695166733; Fri, 28
 Apr 2023 08:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230428151351.1365822-1-thuth@redhat.com>
In-Reply-To: <20230428151351.1365822-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 28 Apr 2023 19:19:14 +0400
Message-ID: <CAMxuvaymcjpTBWxMkX0kSrMkSCpH-NUB99Fnc1eqv7fk2HThGg@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: Disable the spice test of readconfig-test on
 FreeBSD
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, 
 Kyle Evans <kevans@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000adc43d05fa66ffb8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--000000000000adc43d05fa66ffb8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 7:14=E2=80=AFPM Thomas Huth <thuth@redhat.com> wrot=
e:

> The spice test is currently hanging on FreeBSD. It likely was
> never working before, since in the past, our configure script
> was failing to detect this feature due to a bug in the spice
> package there (it just got enabled recently by the commit
> https://cgit.freebsd.org/ports/commit/?id=3Dcf16b1c9063351325f0 ).
> To get the CI working again, let's disable the failing test for
> now until someone has enough spare time to debug and fix the real
> underlying problem.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  tests/qtest/readconfig-test.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.=
c
> index 2160603880..918d45684b 100644
> --- a/tests/qtest/readconfig-test.c
> +++ b/tests/qtest/readconfig-test.c
> @@ -86,8 +86,8 @@ static void test_x86_memdev(void)
>      qtest_quit(qts);
>  }
>
> -
> -#ifdef CONFIG_SPICE
> +/* FIXME: The test is currently broken on FreeBSD */
> +#if defined(CONFIG_SPICE) && !defined(__FreeBSD__)
>  static void test_spice_resp(QObject *res)
>  {
>      Visitor *v;
> @@ -209,7 +209,7 @@ int main(int argc, char *argv[])
>          qtest_add_func("readconfig/x86/memdev", test_x86_memdev);
>          qtest_add_func("readconfig/x86/ich9-ehci-uhci",
> test_docs_config_ich9);
>      }
> -#ifdef CONFIG_SPICE
> +#if defined(CONFIG_SPICE) && !defined(__FreeBSD__)
>      qtest_add_func("readconfig/spice", test_spice);
>  #endif
>
> --
> 2.31.1
>
>

--000000000000adc43d05fa66ffb8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 28, 2023 at 7:14=E2=80=AF=
PM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The =
spice test is currently hanging on FreeBSD. It likely was<br>
never working before, since in the past, our configure script<br>
was failing to detect this feature due to a bug in the spice<br>
package there (it just got enabled recently by the commit<br>
<a href=3D"https://cgit.freebsd.org/ports/commit/?id=3Dcf16b1c9063351325f0"=
 rel=3D"noreferrer" target=3D"_blank">https://cgit.freebsd.org/ports/commit=
/?id=3Dcf16b1c9063351325f0</a> ).<br>
To get the CI working again, let&#39;s disable the failing test for<br>
now until someone has enough spare time to debug and fix the real<br>
underlying problem.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Re=
viewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0tests/qtest/readconfig-test.c | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/tests/qtest/readconfig-test.c b/tests/qtest/readconfig-test.c<=
br>
index 2160603880..918d45684b 100644<br>
--- a/tests/qtest/readconfig-test.c<br>
+++ b/tests/qtest/readconfig-test.c<br>
@@ -86,8 +86,8 @@ static void test_x86_memdev(void)<br>
=C2=A0 =C2=A0 =C2=A0qtest_quit(qts);<br>
=C2=A0}<br>
<br>
-<br>
-#ifdef CONFIG_SPICE<br>
+/* FIXME: The test is currently broken on FreeBSD */<br>
+#if defined(CONFIG_SPICE) &amp;&amp; !defined(__FreeBSD__)<br>
=C2=A0static void test_spice_resp(QObject *res)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Visitor *v;<br>
@@ -209,7 +209,7 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;readconfig/x86/memde=
v&quot;, test_x86_memdev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;readconfig/x86/ich9-=
ehci-uhci&quot;, test_docs_config_ich9);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-#ifdef CONFIG_SPICE<br>
+#if defined(CONFIG_SPICE) &amp;&amp; !defined(__FreeBSD__)<br>
=C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;readconfig/spice&quot;, test_spice=
);<br>
=C2=A0#endif<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000adc43d05fa66ffb8--


