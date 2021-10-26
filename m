Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B94C43BBED
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:57:14 +0200 (CEST)
Received: from localhost ([::1]:33206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfTVR-0007Ag-2l
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:57:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTTB-00054C-1R
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:54:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfTT8-0006fo-OR
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:54:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635281690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HQ4OLYBnZ8DpIh/dsoSTo3p6Q2znUnlZsbbGN78stVM=;
 b=GG7DNGukB/7Tc00QYSpo9qtF+56DZyXnczIf3N0jJzK1F+CwlkM555tNshaRW+VaxDQgGP
 mXGf6SQzNQ8ogrnR9DrqAoS5zD3tRU+r74vYAU7TnnjcxC/15snAzplbz4I/sTDBaf8pLk
 8ixbok4pKBq9OTJu166o7hM/P6+s+IE=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-0qL6xiF0PQeEZPMkSJgWxQ-1; Tue, 26 Oct 2021 16:54:45 -0400
X-MC-Unique: 0qL6xiF0PQeEZPMkSJgWxQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 35-20020ab00526000000b002cbb1968fc8so249357uax.1
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HQ4OLYBnZ8DpIh/dsoSTo3p6Q2znUnlZsbbGN78stVM=;
 b=ostHQ6Ld0YPFdmOmw2An2J7v2f/Q0Ya6843gh9bqcv10m0kyS0PlNyChgu0vfEvA9V
 F8posRQakn0o3Z30B4NNSgUzDKb+GbsL05fu1HSyBBNqxOOyLYyhWdo0CT6CanUYiDJY
 BKEPUgW4IH0BWQRwj3qlYpYMNPj+V+6xyLhKDW9DsXE5upi4E3NYM9LpvnjuR5iXEVHl
 1kZmZW9hAhofsRIr0CaCEOlSwSdObGYZdoygbHkuUddPzBlSrsbSWHFhWGngTmbLmvoe
 DcHkosqh9+1S+MdruWYlEX47IECgdHHNwjbgIciEC0RHC4yaECnOGwnrLchY5WCkZ8kg
 4c2A==
X-Gm-Message-State: AOAM530lcpD44ygIFNT78EVbCUUfNALnW457oDRzPa4IIWFAMILKWA1p
 8DEP78sBs9fpv5XrhLp/OZR2H7fJNva0JSeoEt8RoBu5rrAJrmKqiFVM0Ab5QRKwBl3L2qefVPl
 ijxQCku/0ZMtM3Xx3DA7qfHjN5KP4bss=
X-Received: by 2002:ab0:759a:: with SMTP id q26mr4181114uap.128.1635281685345; 
 Tue, 26 Oct 2021 13:54:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx78DzO7InjB6brsnfTkBKlaJXDMGczVpRKnYmXB1oA1gbvY8DH0KTvhT8Iam347RVEre0Kh5OUugtRL2LB2Rw=
X-Received: by 2002:ab0:759a:: with SMTP id q26mr4181097uap.128.1635281685189; 
 Tue, 26 Oct 2021 13:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211025042405.3762351-1-armbru@redhat.com>
 <20211025042405.3762351-6-armbru@redhat.com>
In-Reply-To: <20211025042405.3762351-6-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 16:54:34 -0400
Message-ID: <CAFn=p-ZfdUO5hfxjqFLt_kUD24jvAbPURyJ6Cozvdq5SLb0YcA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] block: Deprecate transaction type drive-backup
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f429be05cf47af9a"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, libvir-list@redhat.com,
 qemu-devel <qemu-devel@nongnu.org>, mdroth@linux.vnet.ibm.com,
 Peter Krempa <pkrempa@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f429be05cf47af9a
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 12:24 AM Markus Armbruster <armbru@redhat.com>
wrote:

> Several moons ago, Vladimir posted
>
>     Subject: [PATCH v2 3/3] qapi: deprecate drive-backup
>     Date: Wed,  5 May 2021 16:58:03 +0300
>     Message-Id: <20210505135803.67896-4-vsementsov@virtuozzo.com>
>     https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg01394.html
>
> with this
>
>     TODO: We also need to deprecate drive-backup transaction action..
>     But union members in QAPI doesn't support 'deprecated' feature. I tried
>     to dig a bit, but failed :/ Markus, could you please help with it? At
>     least by advice?
>
> This is one way to resolve it.  Sorry it took so long.
>
>
I'll share the blame for not pushing back on the other series, but ...


> John explored another way, namely adding feature flags to union
> branches.  Could also be useful, say to add different features to
> branches in multiple unions sharing the same tag enum.
>
>
... this way seems simpler for now, and I trust your intuition on what's
easier to support as I don't have a solid grasp of the C interfaces at play
for actually parsing the input. We can always revisit the other thing later
if/when we need it.


> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/transaction.json | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/transaction.json b/qapi/transaction.json
> index d175b5f863..381a2df782 100644
> --- a/qapi/transaction.json
> +++ b/qapi/transaction.json
> @@ -54,6 +54,10 @@
>  # @blockdev-snapshot-sync: since 1.1
>  # @drive-backup: Since 1.6
>  #
> +# Features:
> +# @deprecated: Member @drive-backup is deprecated.  Use member
> +#              @blockdev-backup instead.
> +#
>  # Since: 1.1
>  ##
>  { 'enum': 'TransactionActionKind',
> @@ -62,7 +66,7 @@
>              'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
>              'blockdev-backup', 'blockdev-snapshot',
>              'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
> -            'drive-backup' ] }
> +            { 'name': 'drive-backup', 'features': [ 'deprecated' ] } ] }
>
>  ##
>  # @AbortWrapper:
> --
> 2.31.1
>
>
Seems pretty clean to me overall. What's the reason for wanting it to be
RFC?

--000000000000f429be05cf47af9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 12:24 AM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sev=
eral moons ago, Vladimir posted<br>
<br>
=C2=A0 =C2=A0 Subject: [PATCH v2 3/3] qapi: deprecate drive-backup<br>
=C2=A0 =C2=A0 Date: Wed,=C2=A0 5 May 2021 16:58:03 +0300<br>
=C2=A0 =C2=A0 Message-Id: &lt;<a href=3D"mailto:20210505135803.67896-4-vsem=
entsov@virtuozzo.com" target=3D"_blank">20210505135803.67896-4-vsementsov@v=
irtuozzo.com</a>&gt;<br>
=C2=A0 =C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021=
-05/msg01394.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.o=
rg/archive/html/qemu-devel/2021-05/msg01394.html</a><br>
<br>
with this<br>
<br>
=C2=A0 =C2=A0 TODO: We also need to deprecate drive-backup transaction acti=
on..<br>
=C2=A0 =C2=A0 But union members in QAPI doesn&#39;t support &#39;deprecated=
&#39; feature. I tried<br>
=C2=A0 =C2=A0 to dig a bit, but failed :/ Markus, could you please help wit=
h it? At<br>
=C2=A0 =C2=A0 least by advice?<br>
<br>
This is one way to resolve it.=C2=A0 Sorry it took so long.<br>
<br></blockquote><div><br></div><div>I&#39;ll share the blame for not pushi=
ng back on the other series, but ...<br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
John explored another way, namely adding feature flags to union<br>
branches.=C2=A0 Could also be useful, say to add different features to<br>
branches in multiple unions sharing the same tag enum.<br>
<br></blockquote><div><br></div><div>... this way seems simpler for now, an=
d I trust your intuition on what&#39;s easier to support as I don&#39;t hav=
e a solid grasp of the C interfaces at play for actually parsing the input.=
 We can always revisit the other thing later if/when we need it.<br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0qapi/transaction.json | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qapi/transaction.json b/qapi/transaction.json<br>
index d175b5f863..381a2df782 100644<br>
--- a/qapi/transaction.json<br>
+++ b/qapi/transaction.json<br>
@@ -54,6 +54,10 @@<br>
=C2=A0# @blockdev-snapshot-sync: since 1.1<br>
=C2=A0# @drive-backup: Since 1.6<br>
=C2=A0#<br>
+# Features:<br>
+# @deprecated: Member @drive-backup is deprecated.=C2=A0 Use member<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 @blockdev-backup instead=
.<br>
+#<br>
=C2=A0# Since: 1.1<br>
=C2=A0##<br>
=C2=A0{ &#39;enum&#39;: &#39;TransactionActionKind&#39;,<br>
@@ -62,7 +66,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;block-dirty-bitmap-dis=
able&#39;, &#39;block-dirty-bitmap-merge&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;blockdev-backup&#39;, =
&#39;blockdev-snapshot&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;blockdev-snapshot-inte=
rnal-sync&#39;, &#39;blockdev-snapshot-sync&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;drive-backup&#39; ] }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { &#39;name&#39;: &#39;drive-bac=
kup&#39;, &#39;features&#39;: [ &#39;deprecated&#39; ] } ] }<br>
<br>
=C2=A0##<br>
=C2=A0# @AbortWrapper:<br>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>Seems pretty clean to me overall. What=
&#39;s the reason for wanting it to be RFC?<br></div></div></div>

--000000000000f429be05cf47af9a--


