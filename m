Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD4360E6F0
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 20:03:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkhw-0000G6-53; Wed, 26 Oct 2022 14:00:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkhr-0000EA-AL
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:00:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkhh-0006Gn-KC
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666807232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d3gG4Wnf3zQ+7XkJXmPedeeWZkruwCa2XHQKTCdGYxE=;
 b=AMac3lbqGjyzogHTdR158XGn+S+2manBfdUb7M8tAoh/CYTblFF/XcYYAXzp3K+5H54qDs
 Rt5gH7O7z5vRrRhTbX6l79vvEJJNKe1FTwNAaoB3zWX0J/gBqT0rcLRm+MGkabaxAyho0A
 VwnUay48Sy5t7Gzar4/jRQucPO6OYNk=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-DlHwR9gAO6KF_XoODTJgHg-1; Wed, 26 Oct 2022 14:00:29 -0400
X-MC-Unique: DlHwR9gAO6KF_XoODTJgHg-1
Received: by mail-ot1-f72.google.com with SMTP id
 c8-20020a9d6c88000000b00660efaeb7d6so8767751otr.2
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 11:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d3gG4Wnf3zQ+7XkJXmPedeeWZkruwCa2XHQKTCdGYxE=;
 b=pvw680jrn4knzkccWs9P1NOuBIzSdTByy/MOGtaLGxG/9cYZul908rKbn+WQl7pL13
 DOrkED9o4avn3wgTelh9EPgmZ6QxhN2GIk2c/EXRkNkTWDWW4m+Aqw8GdEGZhGHW9zqK
 NacP2r+s1h8ZSTcbohPEOTD/wJWKegz2YlockCV8vzjGfxmGTEvEwboHwuVckkSpBj2F
 4TAhc5ZJwxyNIthvt1gUftfh7Q0cFbwSik79PoKAbi9cm8JtecLSrgUBzYuiyK5tb8zB
 1emD9EU5jWLgNHhnVyrZbiwDUE8xUbrCWXj7/tZNhUhJQ4aVGT7X5cXF/36AadBecCmF
 oYAQ==
X-Gm-Message-State: ACrzQf3XnQ8ehCoPp8QusZSyJ79Ujx373t9YwafJJO6bEovZhjlodrL5
 EWmYUk121AJUlxEzd80TE56OBkqIeO/dO4TrDh4TXmesi2WXGP5kKNy0XIBvCdeT5ndIOVydwOK
 nFtR4D/g72Ihyz7if/aPfp2vcyM/M6QE=
X-Received: by 2002:a05:6808:308c:b0:354:99ec:bbb7 with SMTP id
 bl12-20020a056808308c00b0035499ecbbb7mr2588389oib.68.1666807228351; 
 Wed, 26 Oct 2022 11:00:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4kBj60Sxx+XXHc+pzGcARHWx+k/GaxqZwMhdJ1kJ5/0vqZkhGpiLTNYt7RoA1BYaLl4XRX9mydSeERFYfljSM=
X-Received: by 2002:a05:6808:308c:b0:354:99ec:bbb7 with SMTP id
 bl12-20020a056808308c00b0035499ecbbb7mr2588382oib.68.1666807228113; Wed, 26
 Oct 2022 11:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221020220346.124381-1-bjorn.forsman@gmail.com>
 <CAPMcbCpPje_vo8RPQtT4AM_b1hH427exC2==1YRrotQKXLv7nQ@mail.gmail.com>
In-Reply-To: <CAPMcbCpPje_vo8RPQtT4AM_b1hH427exC2==1YRrotQKXLv7nQ@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 26 Oct 2022 21:00:16 +0300
Message-ID: <CAPMcbCqpxKhVK+JB5-5srm60wRS5Y=KS5Q0uTX+k47t9AYd95A@mail.gmail.com>
Subject: Re: [PATCH] qga: add channel path to error messages
To: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Cc: qemu-devel@nongnu.org, michael.roth@amd.com
Content-Type: multipart/alternative; boundary="000000000000bdb74305ebf3cc7c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000bdb74305ebf3cc7c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

PR was sent
https://patchew.org/QEMU/20221026175518.2636846-1-kkostiuk@redhat.com/

On Wed, Oct 26, 2022 at 8:31 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>
> On Fri, Oct 21, 2022 at 1:04 AM Bj=C3=B8rn Forsman <bjorn.forsman@gmail.c=
om>
> wrote:
>
>> It's useful to know which device was used if/when it fails.
>>
>> channel-win32.c had this since 2015, with
>> c69403fcd4a0cb89f838a212ab71e4a1a3464c95 ("qemu-ga: debug printouts to
>> help troubleshoot installation"), this brings channel-posix.c up to
>> speed.
>>
>> Signed-off-by: Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>
>> ---
>>  qga/channel-posix.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/qga/channel-posix.c b/qga/channel-posix.c
>> index 6796a02cff..e6dce985ae 100644
>> --- a/qga/channel-posix.c
>> +++ b/qga/channel-posix.c
>> @@ -138,7 +138,7 @@ static gboolean ga_channel_open(GAChannel *c, const
>> gchar *path,
>>              0
>>          );
>>          if (fd =3D=3D -1) {
>> -            error_setg_errno(errp, errno, "error opening channel");
>> +            error_setg_errno(errp, errno, "error opening channel '%s'",
>> path);
>>              return false;
>>          }
>>  #ifdef CONFIG_SOLARIS
>> @@ -163,7 +163,7 @@ static gboolean ga_channel_open(GAChannel *c, const
>> gchar *path,
>>          assert(fd < 0);
>>          fd =3D qga_open_cloexec(path, O_RDWR | O_NOCTTY | O_NONBLOCK, 0=
);
>>          if (fd =3D=3D -1) {
>> -            error_setg_errno(errp, errno, "error opening channel");
>> +            error_setg_errno(errp, errno, "error opening channel '%s'",
>> path);
>>              return false;
>>          }
>>          tcgetattr(fd, &tio);
>> --
>> 2.36.2
>>
>>

--000000000000bdb74305ebf3cc7c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">PR was sent <a href=3D"https://patchew.org/QEMU/2022102617=
5518.2636846-1-kkostiuk@redhat.com/">https://patchew.org/QEMU/2022102617551=
8.2636846-1-kkostiuk@redhat.com/</a></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 26, 2022 at 8:31 PM Konstan=
tin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redhat.com">kkostiuk@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkost=
iuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 21=
, 2022 at 1:04 AM Bj=C3=B8rn Forsman &lt;<a href=3D"mailto:bjorn.forsman@gm=
ail.com" target=3D"_blank">bjorn.forsman@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">It&#39;s useful to know w=
hich device was used if/when it fails.<br>
<br>
channel-win32.c had this since 2015, with<br>
c69403fcd4a0cb89f838a212ab71e4a1a3464c95 (&quot;qemu-ga: debug printouts to=
<br>
help troubleshoot installation&quot;), this brings channel-posix.c up to<br=
>
speed.<br>
<br>
Signed-off-by: Bj=C3=B8rn Forsman &lt;<a href=3D"mailto:bjorn.forsman@gmail=
.com" target=3D"_blank">bjorn.forsman@gmail.com</a>&gt;<br>
---<br>
=C2=A0qga/channel-posix.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qga/channel-posix.c b/qga/channel-posix.c<br>
index 6796a02cff..e6dce985ae 100644<br>
--- a/qga/channel-posix.c<br>
+++ b/qga/channel-posix.c<br>
@@ -138,7 +138,7 @@ static gboolean ga_channel_open(GAChannel *c, const gch=
ar *path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel &#39;%s&#39;&quot;, path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0#ifdef CONFIG_SOLARIS<br>
@@ -163,7 +163,7 @@ static gboolean ga_channel_open(GAChannel *c, const gch=
ar *path,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(fd &lt; 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fd =3D qga_open_cloexec(path, O_RDWR | O_=
NOCTTY | O_NONBLOCK, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, errno, &q=
uot;error opening channel &#39;%s&#39;&quot;, path);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcgetattr(fd, &amp;tio);<br>
-- <br>
2.36.2<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000bdb74305ebf3cc7c--


