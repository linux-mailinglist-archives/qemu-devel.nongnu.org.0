Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 390824DB925
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 21:04:46 +0100 (CET)
Received: from localhost ([::1]:47664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUZsy-0007Ab-Si
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 16:04:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUZr8-0006S8-CM
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 16:02:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nUZr4-0003Kq-3I
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 16:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647460964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iSuDC4c0wqHMaYfspa6sz7Z3+IUNFngG1Uln0YN7JfE=;
 b=Ad4coCVQx2bqGUSPA/ct9iVr7q3mpeVJWiaohf1VvFXBXSvktCbq4ei9UK9s7rjQiXt53a
 QjMMo8eQhHSXkGKfVAhn/ABgtK+E4TpkTOwHEfLiinSf/UC5usaWnJXbnAVmTi4DPbuiiW
 gy3pqelUG5YWwfdOClJ4ETWpT4rD+aw=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-gi1Qd5TNPN2ldq4G4w3rrw-1; Wed, 16 Mar 2022 16:02:43 -0400
X-MC-Unique: gi1Qd5TNPN2ldq4G4w3rrw-1
Received: by mail-vs1-f71.google.com with SMTP id
 v1-20020a676101000000b00320a3107c85so266060vsb.19
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 13:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iSuDC4c0wqHMaYfspa6sz7Z3+IUNFngG1Uln0YN7JfE=;
 b=1257tZXCMWFb86CfTmgbnTykeM0GhDUKt20FXILRmcPiNdj/KlxWOeT6RLIcYC7wxA
 ULt338NElf26lbAUoZqNbe6pRm4Rnr6gGWygptVxvUqzRRLoWv9eyOKrxWxYk1dRe7ax
 lY+Qdw97ZyHWJVXJyFrlE6Cod7SU09S37ZduBRBoysQAYFQP173PBh5KWKduFrMJT8I3
 eW72G/UpfF3rV6Au4+9N9CbeCRsFLnjUbSrCqzR3EHWNNCG7CaRW4GSjpS5BPvF6Um1T
 RWjy0sfuUVHq7VJhUzH045WjF5do60QxcNzYsL9if9SAiqKH9QOZlX/gDQ/HOgAuSAaw
 367A==
X-Gm-Message-State: AOAM530gZvuhHLAywCL6c+z0PmwcUXZKNkDvr4mjC86EZsFXI1N6xU8o
 zSl4QS8IeiFQY9isQmRWu12rsJ9uLb3tHc43crkaQqxUliMqjkcKVfJCRIznBfJ3baXE42TtZVv
 cko7L8yWsulR+1k7U2HGBPVMnhsR0zsY=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr705613vkf.35.1647460962579; 
 Wed, 16 Mar 2022 13:02:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzKrCwNVduJ+Tphb97IpARM0yiYB67r2o5PUSneg7u7JNdb5SsR7uFHFDzfIJDddRXA3tHtKoIeIqdqHefnwY=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr705597vkf.35.1647460962032; Wed, 16 Mar
 2022 13:02:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220316095344.2613706-1-marcandre.lureau@redhat.com>
In-Reply-To: <20220316095344.2613706-1-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 16 Mar 2022 16:02:32 -0400
Message-ID: <CAFn=p-ZVA2iVs9OiDG06jH4-NLGsfm1f6jBWkfmi8h8s_dcpkQ@mail.gmail.com>
Subject: Re: [PATCH 14/27] scripts/modinfo-collect: remove unused/dead code
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006c6fe705da5b657e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006c6fe705da5b657e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022, 5:53 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  scripts/modinfo-collect.py | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py
> index 61b90688c6dc..4e7584df6676 100755
> --- a/scripts/modinfo-collect.py
> +++ b/scripts/modinfo-collect.py
> @@ -18,13 +18,8 @@ def find_command(src, target, compile_commands):
>
>  def process_command(src, command):
>      skip =3D False
> -    arg =3D False
>      out =3D []
>      for item in shlex.split(command):
> -        if arg:
> -            out.append(x)
> -            arg =3D False
> -            continue
>          if skip:
>              skip =3D False
>              continue
> --
> 2.35.1.273.ge6ebfd0e8cbb
>

Acked-By <jsnow@redhat.com>

--0000000000006c6fe705da5b657e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Mar 16, 2022, 5:53 AM  &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a hre=
f=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank" rel=3D"noreferre=
r">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank" rel=3D"noreferrer">marcandre.lureau@redhat.=
com</a>&gt;<br>
---<br>
=C2=A0scripts/modinfo-collect.py | 5 -----<br>
=C2=A01 file changed, 5 deletions(-)<br>
<br>
diff --git a/scripts/modinfo-collect.py b/scripts/modinfo-collect.py<br>
index 61b90688c6dc..4e7584df6676 100755<br>
--- a/scripts/modinfo-collect.py<br>
+++ b/scripts/modinfo-collect.py<br>
@@ -18,13 +18,8 @@ def find_command(src, target, compile_commands):<br>
<br>
=C2=A0def process_command(src, command):<br>
=C2=A0 =C2=A0 =C2=A0skip =3D False<br>
-=C2=A0 =C2=A0 arg =3D False<br>
=C2=A0 =C2=A0 =C2=A0out =3D []<br>
=C2=A0 =C2=A0 =C2=A0for item in shlex.split(command):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if arg:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out.append(x)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arg =3D False<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if skip:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0skip =3D False<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
-- <br>
2.35.1.273.ge6ebfd0e8cbb<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Acked-By &lt;<a href=3D"mailto:jsnow@redhat.com">js=
now@redhat.com</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div=
></div></div>

--0000000000006c6fe705da5b657e--


