Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FA760E6EF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 20:03:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkhj-00082H-7E; Wed, 26 Oct 2022 14:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkhZ-0007oU-1C
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkhX-0006G1-2R
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 14:00:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666807217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UqtrKzgZUj9ZvBeT8ltxatSYQyX+1yzOso0CNAUr6b8=;
 b=SpzR9cU5sN2I4KUGtuSXG+eROxor6rjOGZjvCWriom70sXeZXd4Ez699Cofgko87wDNfVH
 3/gT4Hh3Xmb/VtJiDfGkc7Rdlk66+W9vvQ/OwbNH/8dybMjgnZMlbmJboJdSC/8KZDM+S0
 3LzTqYGAfGXlRHMvP7zm+tLUHVQMBGk=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-hlTPvwC7O8a9mZ0-Mjxxkw-1; Wed, 26 Oct 2022 14:00:15 -0400
X-MC-Unique: hlTPvwC7O8a9mZ0-Mjxxkw-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-13af11be44dso9146703fac.21
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 11:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UqtrKzgZUj9ZvBeT8ltxatSYQyX+1yzOso0CNAUr6b8=;
 b=DKiMMu6x2OOfZjK6uc2EuOIU28RByWKxH0FkHAwMi+BNbE4ClkbDLos+HjzxliH4DU
 x8gaSHggPRo0HQOSbIghRxOiI6C6/TQ+SwW4eAJOJH8N7qfG5UZv1bS9N3wGQua2znoE
 7QPQ3qp4uPOpBaFcjMCUzSnOnwhuGCzMjTEjelzbukOTpRuw19850KSSp5xcNgMXdFyR
 1YCtPUglCw46iIL45lH6H/8CnOk0R/K3jIZ14IhMfWFyhJbMf95DiptFH7T8TeYTxqgM
 DLQfy/3XRiXnfefz0G0SzTa/7ZZnTnWGtgrX30VOe+QxcKfwaCk/GO8QzzKeWURtKm0s
 6x4A==
X-Gm-Message-State: ACrzQf2reiAS14mgXhgHJDBS7SLEH8oDKWRcGjq8Zc36czgW9uWOrs/p
 7h68diw5nLmjAbSu88cu8XMkMlqEx9pLkYhLatVWoX4GSQtmX5dhHi6etgzTruR05m40s0rYfqi
 LYwSADceqCAE8SV5M+8aDPgUqyylGxPo=
X-Received: by 2002:a4a:980c:0:b0:476:20e:25ed with SMTP id
 y12-20020a4a980c000000b00476020e25edmr19271845ooi.21.1666807214591; 
 Wed, 26 Oct 2022 11:00:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49w1Z9oG7oXad0skaZPanPq9qKvrsTsZ+PQGiKlbIjxv8B2hJllN2rNzaS05764eqzMilWocsaRo3R0Rq7PMQ=
X-Received: by 2002:a4a:980c:0:b0:476:20e:25ed with SMTP id
 y12-20020a4a980c000000b00476020e25edmr19271833ooi.21.1666807214244; Wed, 26
 Oct 2022 11:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20221017072825.72867-1-alexander.ivanov@virtuozzo.com>
 <0e38476c-0066-e90e-c100-9c23412df108@virtuozzo.com>
In-Reply-To: <0e38476c-0066-e90e-c100-9c23412df108@virtuozzo.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 26 Oct 2022 21:00:03 +0300
Message-ID: <CAPMcbCoamQBb1k-34gQNNxfUaxL7y21r0PbaL1KWnMhN5LWz8Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] qga: Add FreeBSD support
To: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com, michael.roth@amd.com, 
 marcandre.lureau@gmail.com
Content-Type: multipart/alternative; boundary="000000000000ea1b5105ebf3cbef"
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

--000000000000ea1b5105ebf3cbef
Content-Type: text/plain; charset="UTF-8"

Thanks for the reminder. PR was sent
https://patchew.org/QEMU/20221026175518.2636846-1-kkostiuk@redhat.com/

Best Regards,
Konstantin Kostiuk.


On Wed, Oct 26, 2022 at 4:25 PM Alexander Ivanov <
alexander.ivanov@virtuozzo.com> wrote:

> Could you please clarify the status of the patchset?
>
> Thank you.
>
> On 17.10.2022 09:28, Alexander Ivanov wrote:
> > Add freeze/thaw, shutdown/halt/reboot, password setting and
> > guest-network-get-interfaces command support for FreeBSD.
> >
> > v5:
> > 2: Left ga_wait_child() static in commands-posix.c.
> >
> > v4:
> > 6,7: Return bool instead int in guest_get_hw_addr().
> >
> > v3:
> > 1: Add a comment about echo suppressing.
> > 5: Replace code moving by splitting the code into a few blocks under
> >     architecture conditions.
> > 5,6: Move actions with dumb qmp_guest_set_user_password() to
> >       the appropriate patch.
> > 6: Fix error/obtained return.
> >
> > v2:
> > 1: Reject the idea to move all the Linux-specific code to a separate
> file.
> >     First commit now adds initial support of FreeBSD. Fixed device paths
> >     and fixed virtio device initialization (disable echo). Add comment
> why
> >     we should disable the code under HAVE_GETIFADDRS in FreeBSD.
> > 2: Replace the second commit (which now is the first) by moving
> >     Linux-specific freeze/thaw code to a separate file commands-linux.c.
> > 3: Add error raising if stat() returns error. Replaced strcmp() calls by
> >     g_str_equal(). Add a comment explaining why UFSRESUME isn't
> necessary.
> > 4: Replace #elifdef by #elif defined().
> > 5: Now the code doesn't move from one file to aanother but still is
> >     moving inside file so the patch doesn't become easier to review. =(
> >     Fixed typos.
> > 6,7: New patches. Add guest-network-get-interfaces command support.
> >
> > Alexander Ivanov (7):
> >    qga: Add initial FreeBSD support
> >    qga: Move Linux-specific FS freeze/thaw code to a separate file
> >    qga: Add UFS freeze/thaw support for FreeBSD
> >    qga: Add shutdown/halt/reboot support for FreeBSD
> >    qga: Add support for user password setting in FreeBSD
> >    qga: Move HW address getting to a separate function
> >    qga: Add HW address getting for FreeBSD
> >
> >   meson.build           |   2 +-
> >   qga/channel-posix.c   |  19 ++
> >   qga/commands-bsd.c    | 200 +++++++++++++
> >   qga/commands-common.h |  51 ++++
> >   qga/commands-linux.c  | 286 +++++++++++++++++++
> >   qga/commands-posix.c  | 639 ++++++++++++++----------------------------
> >   qga/main.c            |  13 +-
> >   qga/meson.build       |   6 +
> >   8 files changed, 778 insertions(+), 438 deletions(-)
> >   create mode 100644 qga/commands-bsd.c
> >   create mode 100644 qga/commands-linux.c
> >
>
>

--000000000000ea1b5105ebf3cbef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the reminder. PR was sent <a href=3D"https=
://patchew.org/QEMU/20221026175518.2636846-1-kkostiuk@redhat.com/">https://=
patchew.org/QEMU/20221026175518.2636846-1-kkostiuk@redhat.com/</a></div><di=
v><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr"><div>Best Regards,</div><div>Kons=
tantin Kostiuk.</div></div></div></div><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 26, 2022 at 4:=
25 PM Alexander Ivanov &lt;<a href=3D"mailto:alexander.ivanov@virtuozzo.com=
">alexander.ivanov@virtuozzo.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Could you please clarify the status of the=
 patchset?<br>
<br>
Thank you.<br>
<br>
On 17.10.2022 09:28, Alexander Ivanov wrote:<br>
&gt; Add freeze/thaw, shutdown/halt/reboot, password setting and<br>
&gt; guest-network-get-interfaces command support for FreeBSD.<br>
&gt;<br>
&gt; v5:<br>
&gt; 2: Left ga_wait_child() static in commands-posix.c.<br>
&gt;<br>
&gt; v4:<br>
&gt; 6,7: Return bool instead int in guest_get_hw_addr().<br>
&gt;<br>
&gt; v3:<br>
&gt; 1: Add a comment about echo suppressing.<br>
&gt; 5: Replace code moving by splitting the code into a few blocks under<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0architecture conditions.<br>
&gt; 5,6: Move actions with dumb qmp_guest_set_user_password() to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0the appropriate patch.<br>
&gt; 6: Fix error/obtained return.<br>
&gt;<br>
&gt; v2:<br>
&gt; 1: Reject the idea to move all the Linux-specific code to a separate f=
ile.<br>
&gt;=C2=A0 =C2=A0 =C2=A0First commit now adds initial support of FreeBSD. F=
ixed device paths<br>
&gt;=C2=A0 =C2=A0 =C2=A0and fixed virtio device initialization (disable ech=
o). Add comment why<br>
&gt;=C2=A0 =C2=A0 =C2=A0we should disable the code under HAVE_GETIFADDRS in=
 FreeBSD.<br>
&gt; 2: Replace the second commit (which now is the first) by moving<br>
&gt;=C2=A0 =C2=A0 =C2=A0Linux-specific freeze/thaw code to a separate file =
commands-linux.c.<br>
&gt; 3: Add error raising if stat() returns error. Replaced strcmp() calls =
by<br>
&gt;=C2=A0 =C2=A0 =C2=A0g_str_equal(). Add a comment explaining why UFSRESU=
ME isn&#39;t necessary.<br>
&gt; 4: Replace #elifdef by #elif defined().<br>
&gt; 5: Now the code doesn&#39;t move from one file to aanother but still i=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0moving inside file so the patch doesn&#39;t become =
easier to review. =3D(<br>
&gt;=C2=A0 =C2=A0 =C2=A0Fixed typos.<br>
&gt; 6,7: New patches. Add guest-network-get-interfaces command support.<br=
>
&gt;<br>
&gt; Alexander Ivanov (7):<br>
&gt;=C2=A0 =C2=A0 qga: Add initial FreeBSD support<br>
&gt;=C2=A0 =C2=A0 qga: Move Linux-specific FS freeze/thaw code to a separat=
e file<br>
&gt;=C2=A0 =C2=A0 qga: Add UFS freeze/thaw support for FreeBSD<br>
&gt;=C2=A0 =C2=A0 qga: Add shutdown/halt/reboot support for FreeBSD<br>
&gt;=C2=A0 =C2=A0 qga: Add support for user password setting in FreeBSD<br>
&gt;=C2=A0 =C2=A0 qga: Move HW address getting to a separate function<br>
&gt;=C2=A0 =C2=A0 qga: Add HW address getting for FreeBSD<br>
&gt;<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0qga/channel-posix.c=C2=A0 =C2=A0|=C2=A0 19 ++<br>
&gt;=C2=A0 =C2=A0qga/commands-bsd.c=C2=A0 =C2=A0 | 200 +++++++++++++<br>
&gt;=C2=A0 =C2=A0qga/commands-common.h |=C2=A0 51 ++++<br>
&gt;=C2=A0 =C2=A0qga/commands-linux.c=C2=A0 | 286 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0qga/commands-posix.c=C2=A0 | 639 ++++++++++++++-----------=
-----------------<br>
&gt;=C2=A0 =C2=A0qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 13 +-<br>
&gt;=C2=A0 =C2=A0qga/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 =
+<br>
&gt;=C2=A0 =C2=A08 files changed, 778 insertions(+), 438 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 qga/commands-bsd.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 qga/commands-linux.c<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000ea1b5105ebf3cbef--


