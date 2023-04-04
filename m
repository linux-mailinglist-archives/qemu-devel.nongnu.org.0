Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869AA6D69C1
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 19:05:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjk4D-0003hj-MV; Tue, 04 Apr 2023 13:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pjk4A-0003hN-RW
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 13:03:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1pjk48-0003J4-B1
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 13:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680627806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NSBW+jjizSbfVzvgN5BIFNL0c1pRYgkYU7fuwh8KRN8=;
 b=OZpVRuzXGlH7PoDn/XZdrzGDc1VyGcjj4NdHUzS7R5ssVjU/HobBWYIcxv6hSoAtHqnZ02
 BOenKETiEevYOMYMdmFrJZBeXr7LA8ob8tZetTNLrJ7Vce00LVcUcDNPiG53LHuT88tHa1
 I2mG/aHtzAoTrkUkfk1duMy+SNHEGak=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-MeYiIRrvPKi0SeKVh55wWw-1; Tue, 04 Apr 2023 13:03:24 -0400
X-MC-Unique: MeYiIRrvPKi0SeKVh55wWw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-5446a91c40cso330855407b3.18
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 10:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680627801;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NSBW+jjizSbfVzvgN5BIFNL0c1pRYgkYU7fuwh8KRN8=;
 b=JkYTPHyhvS9nNryt+7gAZEOEGrsvfICS+Hbt2WoOK51/I4j3vcc+XuhhA4Ze9aY4l1
 sD5SSZwVRhhCwvVcwQSIqFJFApezjCfArulnIMqczis/IBcq9jh4i7mPLIX28Yy7mLRJ
 LMliV6IXlhwheLSdVW7ryLXlREUMMeX+vNzThzBwxAjMlIcwyxXkLWlqGQn6ofOSqvY4
 d0Iy3lIEFYXg0+1x8qcrIhgdf1TTvES36uc6oq+2hFKiHv55lfK9bPWAFsk4UAwv1LR9
 ITcag+qdrtKTkWO08MxYPCYOrgNwC5z6bbeUWgtTVmEfHZw1McCb2RQI1dfxfat456QA
 eAnA==
X-Gm-Message-State: AAQBX9eS7oC3RexygLtHaP8xPlnygMly20juT9i9w5Z8uHTVy8Vs/LyB
 4axPpspaLg9F9VvTGrj+qAKthOfu3C3sBv/cz8y1GJ+65cEM7XV3UIJJb18rrWSJ/lorc58x6Zo
 9DtM24GpnQJ96jFFcSQh3gS4lgehiKb0=
X-Received: by 2002:a25:d1cd:0:b0:ac9:cb97:bd0e with SMTP id
 i196-20020a25d1cd000000b00ac9cb97bd0emr1919373ybg.5.1680627801253; 
 Tue, 04 Apr 2023 10:03:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350bZ/0a+a4MCRZSC5b5Y9O6GpOLDrDA7id3NLuYf5pHI1h2yHbQM+WsmiEzEhIqHOEbeQNwRFOFfJs+ewBdmW1k=
X-Received: by 2002:a25:d1cd:0:b0:ac9:cb97:bd0e with SMTP id
 i196-20020a25d1cd000000b00ac9cb97bd0emr1919348ybg.5.1680627801022; Tue, 04
 Apr 2023 10:03:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230404115912.2829251-1-armbru@redhat.com>
 <20230404115912.2829251-2-armbru@redhat.com>
In-Reply-To: <20230404115912.2829251-2-armbru@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 4 Apr 2023 20:03:09 +0300
Message-ID: <CAPMcbCrvOy439x1pR53eY=VepvFdXrR3U_4cP_Mik3rZqN58AQ@mail.gmail.com>
Subject: Re: [PATCH 01/16] qga/qapi-schema: Tidy up documentation of
 guest-fsfreeze-status
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com, eblake@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, arei.gonglei@huawei.com, pizhenwei@bytedance.com, 
 jsnow@redhat.com, vsementsov@yandex-team.ru, eduardo@habkost.net, 
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, quintela@redhat.com, 
 jasowang@redhat.com, yuval.shaia.ml@gmail.com, stefanha@redhat.com, 
 kraxel@redhat.com, qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000014793805f885a7c2"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
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

--00000000000014793805f885a7c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Tue, Apr 4, 2023 at 2:59=E2=80=AFPM Markus Armbruster <armbru@redhat.com=
> wrote:

> Delete "error state indicates", because it doesn't make sense.
> I suspect it was an accident.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qga/qapi-schema.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 796434ed34..f349345116 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -420,7 +420,7 @@
>  ##
>  # @guest-fsfreeze-status:
>  #
> -# Get guest fsfreeze state. error state indicates
> +# Get guest fsfreeze state.
>  #
>  # Returns: GuestFsfreezeStatus ("thawed", "frozen", etc., as defined
> below)
>  #
> --
> 2.39.2
>
>

--00000000000014793805f885a7c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 4=
, 2023 at 2:59=E2=80=AFPM Markus Armbruster &lt;<a href=3D"mailto:armbru@re=
dhat.com">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Delete &quot;error state indicates&quot;, becaus=
e it doesn&#39;t make sense.<br>
I suspect it was an accident.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0qga/qapi-schema.json | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json<br>
index 796434ed34..f349345116 100644<br>
--- a/qga/qapi-schema.json<br>
+++ b/qga/qapi-schema.json<br>
@@ -420,7 +420,7 @@<br>
=C2=A0##<br>
=C2=A0# @guest-fsfreeze-status:<br>
=C2=A0#<br>
-# Get guest fsfreeze state. error state indicates<br>
+# Get guest fsfreeze state.<br>
=C2=A0#<br>
=C2=A0# Returns: GuestFsfreezeStatus (&quot;thawed&quot;, &quot;frozen&quot=
;, etc., as defined below)<br>
=C2=A0#<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div>

--00000000000014793805f885a7c2--


