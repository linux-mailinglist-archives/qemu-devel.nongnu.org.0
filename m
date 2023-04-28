Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49B6F196D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 15:27:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psO6b-0006EW-Ov; Fri, 28 Apr 2023 09:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1psO6Z-0006E7-Bn
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 09:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1psO6X-0002CJ-Mo
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 09:25:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682688340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=04TxhtFMh9ZnWtQG/Y82p1P6ew39k+6n7axEiQ01hVA=;
 b=dTDEO6MJurJummLT+BPkXjmsu+4GmiKzxTs7fMPMozmAc8wVWZaAGMhwoe+xCdVQnojfu2
 rBYK61KA70n2AQPMc3dtYY1fhWr1peD1l38THNy6+fbbkJ+9yVCBefTG0rSI3Xr65JUf6i
 wbBkHP1/ifPEUZ7+vsJJmavfMInyGyg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-HUUUvrtZMaKTavI9JsSXJQ-1; Fri, 28 Apr 2023 09:25:38 -0400
X-MC-Unique: HUUUvrtZMaKTavI9JsSXJQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5050340f541so9331744a12.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 06:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682688337; x=1685280337;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=04TxhtFMh9ZnWtQG/Y82p1P6ew39k+6n7axEiQ01hVA=;
 b=Vp6/tqV2Iigzmm0h503satLWmddD/TYeP7XvTJoOeJuczZAV71OxgbRg09ZRvKDLhL
 FjpV9mFTPesrTR9A60NwLuk2CxkX6jLdL9ghSiJ/U/zgCHXNqNXWyL7owu8d+3GrlGu5
 E3TeoX5b/4NSnnB/+HM3YBmloosnXW+um/tX1y253H4ZhKArF0pBQzmDCB+xCCNXZkxM
 MaaOFymP7sE9cexCqTGpfIYzfCTcO+tfAcss9Oe6gqPh7sBggjGd04usEt45ZMVHSQ9m
 gHjiWA/KM4rZNzn2cF9a0rA14qKzIohe/bJ/R138leo8Opji2JXWiIeyL1c6FB0yOwdd
 155Q==
X-Gm-Message-State: AC+VfDwz9xFkRDqrZFKWPQt7Fw/CDR7MdMT5wBD+BF3oV9An8nWprtyy
 vf//D+nSSEEz2fH6EFIHoB0n6dVYfqtApvSelLRkv7AlmmP7K/asQmmixNboeZC18KADlfnBDW2
 TZYV+Sr7Uyaul1isG7msg5U7tACnHGgE=
X-Received: by 2002:a17:907:948f:b0:933:be1:8f4f with SMTP id
 dm15-20020a170907948f00b009330be18f4fmr5217172ejc.9.1682688337376; 
 Fri, 28 Apr 2023 06:25:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4QQHXGJUmsbGem3e/FTiIVCH0VttI9a+q3vdxb/b9KuinS+UaZk9sFkW+C2Tph711l8sxqfR7cXkNw/bSEMLc=
X-Received: by 2002:a17:907:948f:b0:933:be1:8f4f with SMTP id
 dm15-20020a170907948f00b009330be18f4fmr5217151ejc.9.1682688337067; Fri, 28
 Apr 2023 06:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230428105429.1687850-1-armbru@redhat.com>
 <20230428105429.1687850-8-armbru@redhat.com>
In-Reply-To: <20230428105429.1687850-8-armbru@redhat.com>
From: Ani Sinha <anisinha@redhat.com>
Date: Fri, 28 Apr 2023 18:55:26 +0530
Message-ID: <CAK3XEhOM7XdSpX=_w4ziwBO2rnLmEPdYC01UT_HbLNGMgM324Q@mail.gmail.com>
Subject: Re: [PATCH 07/17] qapi: Tidy up a slightly awkward TODO comment
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, peter.maydell@linaro.org, 
 pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com, 
 thuth@redhat.com, philmd@linaro.org, mst@redhat.com, imammedo@redhat.com, 
 eblake@redhat.com, kraxel@redhat.com, kwolf@redhat.com, hreitz@redhat.com, 
 arei.gonglei@huawei.com, pizhenwei@bytedance.com, jsnow@redhat.com, 
 vsementsov@yandex-team.ru, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 wangyanan55@huawei.com, quintela@redhat.com, peterx@redhat.com, 
 leobras@redhat.com, jasowang@redhat.com, yuval.shaia.ml@gmail.com, 
 pavel.dovgaluk@ispras.ru, jiri@resnulli.us, stefanb@linux.vnet.ibm.com, 
 stefanha@redhat.com, lukasstraub2@web.de, kkostiuk@redhat.com, 
 qemu-block@nongnu.org, victortoso@redhat.com
Content-Type: multipart/alternative; boundary="000000000000995be205fa6568f5"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
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

--000000000000995be205fa6568f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 4:24=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:

> MigrateSetParameters has a TODO comment sitting right behind its doc
> comment.  I wrote it this way to keep it out of the manual, but that
> reason is not obvious.
>
> The previous commit (sphinx/qapidoc: Do not emit TODO sections into
> user manuals) lets me move it into the doc comment as a TODO section.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>

Reviewed-by: Ani Sinha <anisinha@redhat.com>


> ---
>  qapi/migration.json | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 82000adce4..11c09800c2 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -945,10 +945,11 @@
>  # Features:
>  # @unstable: Member @x-checkpoint-delay is experimental.
>  #
> +# TODO: either fuse back into MigrationParameters, or make
> +#       MigrationParameters members mandatory
> +#
>  # Since: 2.4
>  ##
> -# TODO either fuse back into MigrationParameters, or make
> -# MigrationParameters members mandatory
>  { 'struct': 'MigrateSetParameters',
>    'data': { '*announce-initial': 'size',
>              '*announce-max': 'size',
> --
> 2.39.2
>
>

--000000000000995be205fa6568f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 28, 2023 at 4:24=E2=80=AF=
PM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">MigrateSetParameters has a TODO comment sitting right behind its doc<br=
>
comment.=C2=A0 I wrote it this way to keep it out of the manual, but that<b=
r>
reason is not obvious.<br>
<br>
The previous commit (sphinx/qapidoc: Do not emit TODO sections into<br>
user manuals) lets me move it into the doc comment as a TODO section.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Ani Sinha &lt;<a href=3D"mailto:anisinha@redhat.com">anisi=
nha@redhat.com</a>&gt;</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
---<br>
=C2=A0qapi/migration.json | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qapi/migration.json b/qapi/migration.json<br>
index 82000adce4..11c09800c2 100644<br>
--- a/qapi/migration.json<br>
+++ b/qapi/migration.json<br>
@@ -945,10 +945,11 @@<br>
=C2=A0# Features:<br>
=C2=A0# @unstable: Member @x-checkpoint-delay is experimental.<br>
=C2=A0#<br>
+# TODO: either fuse back into MigrationParameters, or make<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0MigrationParameters members mandatory<br>
+#<br>
=C2=A0# Since: 2.4<br>
=C2=A0##<br>
-# TODO either fuse back into MigrationParameters, or make<br>
-# MigrationParameters members mandatory<br>
=C2=A0{ &#39;struct&#39;: &#39;MigrateSetParameters&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;*announce-initial&#39;: &#39;size&#39;,=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*announce-max&#39;: &#=
39;size&#39;,<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div>

--000000000000995be205fa6568f5--


