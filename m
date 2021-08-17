Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DDE3EEA6F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 12:01:54 +0200 (CEST)
Received: from localhost ([::1]:44608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFvur-0001CT-22
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 06:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mFvsg-0000EE-OJ
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:59:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mFvsf-0000rf-1z
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 05:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629194376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=06sDEfDGYI4RclQ6lnAvTOfqcUI3llYjbvUURVw7524=;
 b=Q+SBCGbx+aNyGOqYYJyeTDyrio6hCGL+g8xUgkhvO/ZpbBOU+PtiFBKLrUvVx+lEcNZpy+
 0WgqEsNUzCad6UoSpbsvnAkbZfb7M6Kvlwr2d7gDHZbb+hdkjCqmm03F2FZhh5fMs/lTRM
 UPKvziipMxhXNwXgINCMTLLCSJDqt+E=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-cKQmmjDFMte8mJClID85Wg-1; Tue, 17 Aug 2021 05:59:34 -0400
X-MC-Unique: cKQmmjDFMte8mJClID85Wg-1
Received: by mail-pj1-f72.google.com with SMTP id
 s9-20020a17090aa10900b001797c5272b4so2102715pjp.7
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 02:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=06sDEfDGYI4RclQ6lnAvTOfqcUI3llYjbvUURVw7524=;
 b=Qs77HCddOLLFr/v+fWEIUPlLBLodEd0r9ghlN4rTGUJgHhLZSDjwDdT4nzTpScSNul
 z0/vy7uAQ+w/XN9G1kCPx6aXvgsxKLxd2QuRcCZRbyRgtv8PZV9hN64lyhaX5BVkq1rn
 R6K3Eg9AgDf+3pdOaSVFsjfDtodmLwZZHUsNEk7RGvw0JSHEPkEuSmPI/YejCR3um+il
 dkpGZar0f9ptdYmWt61CZYez4YY7FHfbtTJMRcKAykg7bZL+Ndl6FsZz8rddLqlhyHRG
 lnnS+gfRBkuBpRvgiQnbx1RSG7axvYpPDHtYowL7Fs3mGvGqAyG4WYrdNwvCP470AeXv
 dS6Q==
X-Gm-Message-State: AOAM533HJcZGKc0tFsPJEKc2ZAaIQ3QTtckuYNVh0AgGfovPBBO8SQwP
 IBFLZFyeV2Vp3NamvPmt8YYVySd/CPk+DBv/5j03qXrX5Hu45XuZqUCVHaCwQf8OxBk/U3O+Dn4
 4SSyy7jYU65oprXqRDUB228hmExBnE5U=
X-Received: by 2002:a17:902:7087:b0:12d:c875:376b with SMTP id
 z7-20020a170902708700b0012dc875376bmr2358944plk.27.1629194373414; 
 Tue, 17 Aug 2021 02:59:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1vCHgxZQ3rSgB7xxJJL/J/3a1JvuqxuKBsjK3VB7B/W5PGlBGwa7deCKBC1yWZCTqEMI4sGEpmCBx+oSp0Y4=
X-Received: by 2002:a17:902:7087:b0:12d:c875:376b with SMTP id
 z7-20020a170902708700b0012dc875376bmr2358936plk.27.1629194373214; Tue, 17 Aug
 2021 02:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629190206.git.mprivozn@redhat.com>
 <c0fa7920817020ae2744313ab631e7d76f4c1898.1629190206.git.mprivozn@redhat.com>
In-Reply-To: <c0fa7920817020ae2744313ab631e7d76f4c1898.1629190206.git.mprivozn@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 17 Aug 2021 13:59:22 +0400
Message-ID: <CAMxuvaxeHOrexy6sTBU=1PBBUThi60A2aJ7CWvE+DytR9q_Cuw@mail.gmail.com>
Subject: Re: [PATCH 2/2] monitor: Report EBADFD if fdset contains invalid FD
To: Michal Privoznik <mprivozn@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e2ca7505c9be5fc8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e2ca7505c9be5fc8
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, Aug 17, 2021 at 12:56 PM Michal Privoznik <mprivozn@redhat.com>
wrote:

> When opening a path that starts with "/dev/fdset/" the control
> jumps into qemu_parse_fdset() and then into
> monitor_fdset_dup_fd_add(). In here, corresponding fdset is found
> and then all FDs from the set are iterated over trying to find an
> FD that matches expected access mode. For instance, if caller
> wants O_WRONLY then the FD set has to contain an O_WRONLY FD.
>
> If no such FD is found then errno is set to EACCES which results
> in very misleading error messages, for instance:
>
>   Could not dup FD for /dev/fdset/3 flags 441: Permission denied
>
> There is no permission issue, the problem is that there was no FD
> within given fdset that was in expected access mode. Therefore,
> let's set errno to EBADFD, which gives us somewhat better
> error messages:
>
>   Could not dup FD for /dev/fdset/3 flags 441: File descriptor in bad state
>
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
>

I am not sure this is any better. If you try to open a read-only file, the
system also reports EACCES (Permission denied). This is what the current
code models, I believe.


> ---
>  monitor/misc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/monitor/misc.c b/monitor/misc.c
> index ffe7966870..a0eda0d574 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -1347,7 +1347,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int
> flags)
>          }
>
>          if (fd == -1) {
> -            errno = EACCES;
> +            errno = EBADFD;
>              return -1;
>          }
>
> --
> 2.31.1
>
>

--000000000000e2ca7505c9be5fc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Aug 17, 2021 at 12:56 PM Michal Privo=
znik &lt;<a href=3D"mailto:mprivozn@redhat.com">mprivozn@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When ope=
ning a path that starts with &quot;/dev/fdset/&quot; the control<br>
jumps into qemu_parse_fdset() and then into<br>
monitor_fdset_dup_fd_add(). In here, corresponding fdset is found<br>
and then all FDs from the set are iterated over trying to find an<br>
FD that matches expected access mode. For instance, if caller<br>
wants O_WRONLY then the FD set has to contain an O_WRONLY FD.<br>
<br>
If no such FD is found then errno is set to EACCES which results<br>
in very misleading error messages, for instance:<br>
<br>
=C2=A0 Could not dup FD for /dev/fdset/3 flags 441: Permission denied<br>
<br>
There is no permission issue, the problem is that there was no FD<br>
within given fdset that was in expected access mode. Therefore,<br>
let&#39;s set errno to EBADFD, which gives us somewhat better<br>
error messages:<br>
<br>
=C2=A0 Could not dup FD for /dev/fdset/3 flags 441: File descriptor in bad =
state<br>
<br>
Signed-off-by: Michal Privoznik &lt;<a href=3D"mailto:mprivozn@redhat.com" =
target=3D"_blank">mprivozn@redhat.com</a>&gt;<br></blockquote><div><br></di=
v><div>I am not sure this is any better. If you try to open a read-only fil=
e, the system also reports EACCES (Permission denied). This is what the cur=
rent code models, I believe.<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
---<br>
=C2=A0monitor/misc.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/monitor/misc.c b/monitor/misc.c<br>
index ffe7966870..a0eda0d574 100644<br>
--- a/monitor/misc.c<br>
+++ b/monitor/misc.c<br>
@@ -1347,7 +1347,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int fl=
ags)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fd =3D=3D -1) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EACCES;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EBADFD;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000e2ca7505c9be5fc8--


