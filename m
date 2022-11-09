Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1326231EB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 18:52:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ospE9-0008BD-RL; Wed, 09 Nov 2022 12:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ospE7-0008As-93
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:51:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ospDu-0006Dy-0Q
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 12:51:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668016231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GHYU0JIm2iHxzs+XgGB1gIOgEP7otH5jvvoCxzNRhTk=;
 b=Kea3ezphoMe/ReRLUgP1ZoTFRwL7Hq6ws6as9KU5koWNh32czHpvJCooeU56OY4uLxbx1F
 X5oHkeSiyUARHDtJkoU99MC86PNMu7nCdoWjWjw1sNw+XR0AwdptAuCkmkEfy1L3amDbkd
 Uo1VbtEVTNj45X4cEMk6l2jfMpi1UFs=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-Ba53a0IdMwCVbbsC-VJpTg-1; Wed, 09 Nov 2022 12:50:27 -0500
X-MC-Unique: Ba53a0IdMwCVbbsC-VJpTg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-131f323c158so8871097fac.5
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 09:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GHYU0JIm2iHxzs+XgGB1gIOgEP7otH5jvvoCxzNRhTk=;
 b=78I63KGsT5iJeQy2gYOcTaDed4mK4jsitG5ZApe/nhnWMzj5/vHR7ueX676/UpDhEG
 KIlohO99VAOZaWqwgsZz+JnKuE8LrMHlZeVd1Oyu2dVrZkrEGv2pnBmfh/NiZAfoZg0X
 04w/njxyWkwBpclUYvJ6NZJB9nbuBPU3pu1AM74Yy7GM17Lq9uslMVgOWvB3qbXMRrIq
 QOHZ3qbxJnGJ9a8lpuxlPzFSiPqeSPJrj85E69Lob6/UEyvvTXp7RnPsDj6QRQJ+9POe
 6S0UFuw8V3wnhGyB5Sx2npZlWVX/YLHEqZH9byYeAJvnOQfh5XNvjEJYu2D99MgpGl+m
 ikTg==
X-Gm-Message-State: ACrzQf3Gtr6GZBxxYXyAsqcfywxce7d7IzXIMFqDnGV5fH8R7TucGio/
 DdZ0PeoI/IED829zoAnR7pySkxlK3tMTh2YhWSkNzekncrpWm7wNeCg9I6pjPzdDN8WLcOXCxLw
 ZAOdtNwj+YVd6FwLyT7PcY0DcC0BC/VY=
X-Received: by 2002:a05:6870:15d1:b0:12b:91ce:e419 with SMTP id
 k17-20020a05687015d100b0012b91cee419mr43823898oad.14.1668016227150; 
 Wed, 09 Nov 2022 09:50:27 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5yv+ccsubs/PGj8bItbK6/MSIaa3LR/PkyminxqhFdew8Gc1OCVAkR6/x2KAY3WRZgTPoTqsQRhEFA/s2DnD8=
X-Received: by 2002:a05:6870:15d1:b0:12b:91ce:e419 with SMTP id
 k17-20020a05687015d100b0012b91cee419mr43823887oad.14.1668016226917; Wed, 09
 Nov 2022 09:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20221109173750.201615-1-thuth@redhat.com>
In-Reply-To: <20221109173750.201615-1-thuth@redhat.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Wed, 9 Nov 2022 19:50:14 +0200
Message-ID: <CAPMcbCqngW+KsXWWKx1tUdLiDZCc44OPBP2AsJubqwOtnLE9CQ@mail.gmail.com>
Subject: Re: [PATCH] qga: Allow building of the guest agent without system
 emulators or tools
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000af768205ed0d4aa3"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--000000000000af768205ed0d4aa3
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Wed, Nov 9, 2022 at 7:37 PM Thomas Huth <thuth@redhat.com> wrote:

> If configuring with "--disable-system --disable-user --enable-guest-agent"
> the linking currently fails with:
>
> qga/qemu-ga.p/commands.c.o: In function `qmp_command_info':
> build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined reference
> to `qmp_command_name'
> build/../../home/thuth/devel/qemu/qga/commands.c:71: undefined reference
> to `qmp_command_is_enabled'
> build/../../home/thuth/devel/qemu/qga/commands.c:72: undefined reference
> to `qmp_has_success_response'
> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_info':
> build/../../home/thuth/devel/qemu/qga/commands.c:82: undefined reference
> to `qmp_for_each_command'
> qga/qemu-ga.p/commands.c.o: In function `qmp_guest_exec':
> build/../../home/thuth/devel/qemu/qga/commands.c:410: undefined reference
> to `qbase64_decode'
> qga/qemu-ga.p/channel-posix.c.o: In function `ga_channel_open':
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:214: undefined
> reference to `unix_listen'
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:228: undefined
> reference to `socket_parse'
> build/../../home/thuth/devel/qemu/qga/channel-posix.c:234: undefined
> reference to `socket_listen'
> qga/qemu-ga.p/commands-posix.c.o: In function `qmp_guest_file_write':
> build/../../home/thuth/devel/qemu/qga/commands-posix.c:527: undefined
> reference to `qbase64_decode'
>
> Let's make sure that we also compile and link the required files if
> the system emulators have not been enabled.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  qapi/meson.build  | 2 +-
>  stubs/meson.build | 2 +-
>  util/meson.build  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 9a36c15c04..fbdb442fdf 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -13,7 +13,7 @@ util_ss.add(files(
>  if have_system
>    util_ss.add(files('qapi-type-helpers.c'))
>  endif
> -if have_system or have_tools
> +if have_system or have_tools or have_ga
>    util_ss.add(files(
>      'qmp-dispatch.c',
>      'qmp-event.c',
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 4314161f5f..c96a74f095 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -49,7 +49,7 @@ stub_ss.add(files('vmstate.c'))
>  stub_ss.add(files('vm-stop.c'))
>  stub_ss.add(files('win32-kbd-hook.c'))
>  stub_ss.add(files('cpu-synchronize-state.c'))
> -if have_block
> +if have_block or have_ga
>    stub_ss.add(files('replay-tools.c'))
>  endif
>  if have_system
> diff --git a/util/meson.build b/util/meson.build
> index 59c1f467bb..b260539bd5 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -68,7 +68,7 @@ if have_system
>    util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
>  endif
>
> -if have_block
> +if have_block or have_ga
>    util_ss.add(files('aiocb.c', 'async.c', 'aio-wait.c'))
>    util_ss.add(files('base64.c'))
>    util_ss.add(files('buffer.c'))
> --
> 2.31.1
>
>

--000000000000af768205ed0d4aa3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;</div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 9=
, 2022 at 7:37 PM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">If configuring with &quot;--disable-system --disable-user --enab=
le-guest-agent&quot;<br>
the linking currently fails with:<br>
<br>
qga/qemu-ga.p/commands.c.o: In function `qmp_command_info&#39;:<br>
build/../../home/thuth/devel/qemu/qga/commands.c:70: undefined reference to=
 `qmp_command_name&#39;<br>
build/../../home/thuth/devel/qemu/qga/commands.c:71: undefined reference to=
 `qmp_command_is_enabled&#39;<br>
build/../../home/thuth/devel/qemu/qga/commands.c:72: undefined reference to=
 `qmp_has_success_response&#39;<br>
qga/qemu-ga.p/commands.c.o: In function `qmp_guest_info&#39;:<br>
build/../../home/thuth/devel/qemu/qga/commands.c:82: undefined reference to=
 `qmp_for_each_command&#39;<br>
qga/qemu-ga.p/commands.c.o: In function `qmp_guest_exec&#39;:<br>
build/../../home/thuth/devel/qemu/qga/commands.c:410: undefined reference t=
o `qbase64_decode&#39;<br>
qga/qemu-ga.p/channel-posix.c.o: In function `ga_channel_open&#39;:<br>
build/../../home/thuth/devel/qemu/qga/channel-posix.c:214: undefined refere=
nce to `unix_listen&#39;<br>
build/../../home/thuth/devel/qemu/qga/channel-posix.c:228: undefined refere=
nce to `socket_parse&#39;<br>
build/../../home/thuth/devel/qemu/qga/channel-posix.c:234: undefined refere=
nce to `socket_listen&#39;<br>
qga/qemu-ga.p/commands-posix.c.o: In function `qmp_guest_file_write&#39;:<b=
r>
build/../../home/thuth/devel/qemu/qga/commands-posix.c:527: undefined refer=
ence to `qbase64_decode&#39;<br>
<br>
Let&#39;s make sure that we also compile and link the required files if<br>
the system emulators have not been enabled.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0qapi/meson.build=C2=A0 | 2 +-<br>
=C2=A0stubs/meson.build | 2 +-<br>
=C2=A0util/meson.build=C2=A0 | 2 +-<br>
=C2=A03 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/qapi/meson.build b/qapi/meson.build<br>
index 9a36c15c04..fbdb442fdf 100644<br>
--- a/qapi/meson.build<br>
+++ b/qapi/meson.build<br>
@@ -13,7 +13,7 @@ util_ss.add(files(<br>
=C2=A0if have_system<br>
=C2=A0 =C2=A0util_ss.add(files(&#39;qapi-type-helpers.c&#39;))<br>
=C2=A0endif<br>
-if have_system or have_tools<br>
+if have_system or have_tools or have_ga<br>
=C2=A0 =C2=A0util_ss.add(files(<br>
=C2=A0 =C2=A0 =C2=A0&#39;qmp-dispatch.c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;qmp-event.c&#39;,<br>
diff --git a/stubs/meson.build b/stubs/meson.build<br>
index 4314161f5f..c96a74f095 100644<br>
--- a/stubs/meson.build<br>
+++ b/stubs/meson.build<br>
@@ -49,7 +49,7 @@ stub_ss.add(files(&#39;vmstate.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;vm-stop.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;win32-kbd-hook.c&#39;))<br>
=C2=A0stub_ss.add(files(&#39;cpu-synchronize-state.c&#39;))<br>
-if have_block<br>
+if have_block or have_ga<br>
=C2=A0 =C2=A0stub_ss.add(files(&#39;replay-tools.c&#39;))<br>
=C2=A0endif<br>
=C2=A0if have_system<br>
diff --git a/util/meson.build b/util/meson.build<br>
index 59c1f467bb..b260539bd5 100644<br>
--- a/util/meson.build<br>
+++ b/util/meson.build<br>
@@ -68,7 +68,7 @@ if have_system<br>
=C2=A0 =C2=A0util_ss.add(when: &#39;CONFIG_LINUX&#39;, if_true: files(&#39;=
userfaultfd.c&#39;))<br>
=C2=A0endif<br>
<br>
-if have_block<br>
+if have_block or have_ga<br>
=C2=A0 =C2=A0util_ss.add(files(&#39;aiocb.c&#39;, &#39;async.c&#39;, &#39;a=
io-wait.c&#39;))<br>
=C2=A0 =C2=A0util_ss.add(files(&#39;base64.c&#39;))<br>
=C2=A0 =C2=A0util_ss.add(files(&#39;buffer.c&#39;))<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div>

--000000000000af768205ed0d4aa3--


