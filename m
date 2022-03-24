Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271214E6956
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 20:31:13 +0100 (CET)
Received: from localhost ([::1]:42588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXTAu-0002Qb-8m
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 15:31:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSvV-0001v9-Ku
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 15:15:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXSvS-0006Ls-J3
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 15:15:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648149313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pObK1qpsEfOMxb8okBE7NkNr+uSpjLYIrK2NplTepAU=;
 b=I24z+ZaeSQvvsSNj9sKBF+padq7hHg2ckFYHa3xSXCaEjpoLUotoYbZ2WnqKYakfUQ9prJ
 YQTvR/4eAEOmyi5OtIai4ZKdkGg6AuIfbrp24AMzoTwhHOzFH2trnZ6EY2M7pNDh15X8mr
 49maNCj1V5qJRqqkIeRXrR4kissyAXw=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-j3w0o_f5NIunTyMfe5wgzg-1; Thu, 24 Mar 2022 15:15:11 -0400
X-MC-Unique: j3w0o_f5NIunTyMfe5wgzg-1
Received: by mail-vs1-f69.google.com with SMTP id
 g20-20020a67dc94000000b003253f7908dbso1177285vsk.13
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 12:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pObK1qpsEfOMxb8okBE7NkNr+uSpjLYIrK2NplTepAU=;
 b=mMUM35zuSkIinAtgjw+cA8wG4A+sJC2J/4ts3/carDathVZns3iIvefAR432HDuTwa
 5lWT0ifH6LiD4Xx9gDoxicxXPPRbz/kQaYVyrduwkwErlBZNrDqTm5cpDYQdokVCFpQy
 XeXianNafsGxscP4pqDwfABtvasDStNCKtBGcIsbgHfoSr9cKVWt/WZb4JAWJRqj4av7
 VDztRTKZew8C70JbZJ2cVkXPEi7hfxabe65sEqqfp5DN3z5T8Wn2Ntoie8INc6pbSmiJ
 V2FJlcWqlrFIpeezx1SnWZp5Y/N9jrEZyUWTLCQgUbHTGW9XqB2cXdNlOOu6FIbxgODO
 5pgA==
X-Gm-Message-State: AOAM532udzTqoc+YK5wMEiTGIO7EcFUupHtL7ch7Wy7ISt43giDTPiT6
 lfl0i6rb0EIVc8BOCO8F9BQHjOxqIvvi/VToXWFAL3swRndaUaZhI86CUHSE8izDmwIkM1/wKyl
 DvcVsorwoIQTizRxeUBnwuhPYcGnOBzc=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr3467810vst.11.1648149310955; 
 Thu, 24 Mar 2022 12:15:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKkW6XeKKjh+ACmabujglx+/kc7xj7ZK22hWD+MrYKxvCqFogknXVbpFPQWrThc5c2jFHULkavwDgFtvJzZ6o=
X-Received: by 2002:a05:6102:c8e:b0:321:7348:6c2a with SMTP id
 f14-20020a0561020c8e00b0032173486c2amr3467802vst.11.1648149310664; Thu, 24
 Mar 2022 12:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-3-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-3-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 15:15:01 -0400
Message-ID: <CAFn=p-bXtNoJ=WpYk6s3Wkkq6QCoQ4YjbLKegAB6xgMxCO+CDg@mail.gmail.com>
Subject: Re: [PATCH 02/14] qapi: fix example of BLOCK_IMAGE_CORRUPTED event
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000033060705dafbaa2f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000033060705dafbaa2f
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 24, 2022, 1:50 PM Victor Toso <victortoso@redhat.com> wrote:

> Fatal is not optional.
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/block-core.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index e89f2dfb5b..585a9e020e 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -5008,7 +5008,7 @@
>  # <- { "event": "BLOCK_IMAGE_CORRUPTED",
>  #      "data": { "device": "ide0-hd0", "node-name": "node0",
>  #                "msg": "Prevented active L1 table overwrite", "offset":
> 196608,
> -#                "size": 65536 },
> +#                "size": 65536, "fatal": false },
>  #      "timestamp": { "seconds": 1378126126, "microseconds": 966463 } }
>  #
>  # Since: 1.7
> --
> 2.35.1
>

Is this the correct fatality setting for this particular case? Default is
implied to be true.

>

--00000000000033060705dafbaa2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 24, 2022, 1:50 PM Victor Toso &lt;<a href=
=3D"mailto:victortoso@redhat.com">victortoso@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Fatal is not optional.<br>
<br>
Signed-off-by: Victor Toso &lt;<a href=3D"mailto:victortoso@redhat.com" tar=
get=3D"_blank" rel=3D"noreferrer">victortoso@redhat.com</a>&gt;<br>
---<br>
=C2=A0qapi/block-core.json | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/qapi/block-core.json b/qapi/block-core.json<br>
index e89f2dfb5b..585a9e020e 100644<br>
--- a/qapi/block-core.json<br>
+++ b/qapi/block-core.json<br>
@@ -5008,7 +5008,7 @@<br>
=C2=A0# &lt;- { &quot;event&quot;: &quot;BLOCK_IMAGE_CORRUPTED&quot;,<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 &quot;data&quot;: { &quot;device&quot;: &quot;i=
de0-hd0&quot;, &quot;node-name&quot;: &quot;node0&quot;,<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;msg&qu=
ot;: &quot;Prevented active L1 table overwrite&quot;, &quot;offset&quot;: 1=
96608,<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;size&quot;:=
 65536 },<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;size&quot;:=
 65536, &quot;fatal&quot;: false },<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 &quot;timestamp&quot;: { &quot;seconds&quot;: 1=
378126126, &quot;microseconds&quot;: 966463 } }<br>
=C2=A0#<br>
=C2=A0# Since: 1.7<br>
-- <br>
2.35.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Is this the correct fatality setting for this particular case? Defaul=
t is implied to be true.</div><div dir=3D"auto"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000033060705dafbaa2f--


