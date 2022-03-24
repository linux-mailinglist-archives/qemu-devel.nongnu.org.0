Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426E74E6A01
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 21:51:59 +0100 (CET)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXUR4-0001ao-9r
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 16:51:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUP8-0000m0-2b
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:49:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41098)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nXUP6-0006yg-G9
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 16:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648154995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yYeKXwFMf0JKme00Uu1Ea9X1/schybPG2ezIP832Ing=;
 b=N3zlg8lhiMpjb7zDK6bRGiZnrGTdXlOoSsmpMtbSju7MoAT7iihVSP26Oj487NZlzLNT6X
 SDosnGL908yKVBXnZ3I9otUv+Sy4L1WgxiMjqhuYrUjfv6k/5U6YcWmguDVzg8ApFy+/uO
 bHghOS1p0nVGj2ZD7ntjNjf/Qrvwwak=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-MJJHKm6fNAmBXA_Wr14CBA-1; Thu, 24 Mar 2022 16:49:54 -0400
X-MC-Unique: MJJHKm6fNAmBXA_Wr14CBA-1
Received: by mail-vs1-f70.google.com with SMTP id
 d3-20020a67c483000000b0032562b5ff34so592252vsk.12
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 13:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yYeKXwFMf0JKme00Uu1Ea9X1/schybPG2ezIP832Ing=;
 b=KgZac9SJOg67r++F1kZv01YysTXdvFHkC2cEd3d+yfE1SOWV+mXEVLDhJUcBBbzvQ3
 nq++Be/obQ2F+Z8L8ffNO4i35oPP71vwbVsLedK4araJ+OFSAI0lL59IrQTIFcFiESfA
 qKz+0zCrkgdMxzKZJYiacYDn90aDxLOpHdQTKMj9v2MWvosBqLSqr34rNTkCkVd8G00N
 2wT6bFb3/OipGCr32jfnf8koOXAbnhKFi7Q0T3Sl0p1OesOlVLXzIGcfBTgXF3RGfw1t
 vcHlqAKeog7LTZv/MonvAvGOaoBM7ZcFXaOrv3CZE4YcNhB5Ao2o0icrbBuqzVx3M3/Q
 GSmA==
X-Gm-Message-State: AOAM533u0ZHaoWE1DzOLDFDb+iblQm5u8iTOnalOfdtiAs3vmHN8vHp9
 EFUfyCXIwkBxsVJDaLqHqqFM8p7ZsYlyy0K3HSnZxGKtXSWyOC3fEydV4n6MHOvd9c2zU7XL3qa
 l/qTadRjfLBc91uOal0WBanP95O1h7p8=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr3461510vkf.35.1648154993882; 
 Thu, 24 Mar 2022 13:49:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+PaPbLObOFWHtC09GOfnON01/1DA10xztQAf8NhWSxS2qqdmK5MZrAR2IN/KjdifCX2EtdYwrUlTh6JYHkBY=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr3461498vkf.35.1648154993657; Thu, 24 Mar
 2022 13:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220324175015.232794-1-victortoso@redhat.com>
 <20220324175015.232794-5-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-5-victortoso@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 24 Mar 2022 16:49:42 -0400
Message-ID: <CAFn=p-bJ-220xBnyayYspQsf-h_mOH3PV8W6W_vUXOkFW=LZsA@mail.gmail.com>
Subject: Re: [PATCH 04/14] qapi: fix example of BLOCK_JOB_PENDING event
To: Victor Toso <victortoso@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000eea45c05dafcfcc8"
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
Cc: Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eea45c05dafcfcc8
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 24, 2022, 1:50 PM Victor Toso <victortoso@redhat.com> wrote:

> * Event's name: BLOCK_JOB_WAITING -> BLOCK_JOB_PENDING
> * Argument device -> id
>
> Signed-off-by: Victor Toso <victortoso@redhat.com>
> ---
>  qapi/block-core.json | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 5b6c069dd9..ea96e1b009 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -5226,8 +5226,8 @@
>  #
>  # Example:
>  #
> -# <- { "event": "BLOCK_JOB_WAITING",
> -#      "data": { "device": "drive0", "type": "mirror" },
> +# <- { "event": "BLOCK_JOB_PENDING",
> +#      "data": { "type": "mirror", "id": "backup_1" },
>  #      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
>  #
>  ##
> --
> 2.35.1
>

Ow, how'd I get away with this? It was just always wrong and we never
noticed?

Cool.

Reviewed-by: John Snow <jsnow@redhat.com>

(Whoa, this is from 2018? It feels like it was from way before then.)

>

--000000000000eea45c05dafcfcc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 24, 2022, 1:50 PM Victor =
Toso &lt;<a href=3D"mailto:victortoso@redhat.com" target=3D"_blank">victort=
oso@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* Eve=
nt&#39;s name: BLOCK_JOB_WAITING -&gt; BLOCK_JOB_PENDING<br>
* Argument device -&gt; id<br>
<br>
Signed-off-by: Victor Toso &lt;<a href=3D"mailto:victortoso@redhat.com" rel=
=3D"noreferrer" target=3D"_blank">victortoso@redhat.com</a>&gt;<br>
---<br>
=C2=A0qapi/block-core.json | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qapi/block-core.json b/qapi/block-core.json<br>
index 5b6c069dd9..ea96e1b009 100644<br>
--- a/qapi/block-core.json<br>
+++ b/qapi/block-core.json<br>
@@ -5226,8 +5226,8 @@<br>
=C2=A0#<br>
=C2=A0# Example:<br>
=C2=A0#<br>
-# &lt;- { &quot;event&quot;: &quot;BLOCK_JOB_WAITING&quot;,<br>
-#=C2=A0 =C2=A0 =C2=A0 &quot;data&quot;: { &quot;device&quot;: &quot;drive0=
&quot;, &quot;type&quot;: &quot;mirror&quot; },<br>
+# &lt;- { &quot;event&quot;: &quot;BLOCK_JOB_PENDING&quot;,<br>
+#=C2=A0 =C2=A0 =C2=A0 &quot;data&quot;: { &quot;type&quot;: &quot;mirror&q=
uot;, &quot;id&quot;: &quot;backup_1&quot; },<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 &quot;timestamp&quot;: { &quot;seconds&quot;: 1=
265044230, &quot;microseconds&quot;: 450486 } }<br>
=C2=A0#<br>
=C2=A0##<br>
-- <br>
2.35.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div>Ow, how=
&#39;d I get away with this? It was just always wrong and we never noticed?=
</div><div><br></div><div>Cool.</div><div><br></div><div>Reviewed-by: John =
Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt;</div>=
<div><br></div><div>(Whoa, this is from 2018? It feels like it was from way=
 before then.)<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"></blockquote></div></div></div>
</div>

--000000000000eea45c05dafcfcc8--


