Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F23E6CB07D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 23:17:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pguCj-0002h4-Pv; Mon, 27 Mar 2023 17:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pguCh-0002gn-L4
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:16:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pguCe-0005Gc-Sc
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 17:16:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679951791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0LEJrDTAcfCM9VkfiAJb+npuCFsUcZV6BGDNB5KSPBk=;
 b=WJZyk7hMHDyZPIxZX8qNlltDOPUMK+jf+ROUGfy32S+VoTOQdfZFCsTdrxYYhmrPeGv7no
 BfjUHI6lOI7By48wTmtQWdmcROqBPEBH0MFBKyB2xqAlE9LF/q2R4zXxsQi/z5fOI+4e6k
 tLofNd9O79xlYpyMHzC5cUgJtCr/I1o=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-uDB8nvaKPW2V1jnBcS5iqA-1; Mon, 27 Mar 2023 17:16:29 -0400
X-MC-Unique: uDB8nvaKPW2V1jnBcS5iqA-1
Received: by mail-ua1-f71.google.com with SMTP id
 p6-20020ab01ec6000000b00764be254863so4676094uak.8
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 14:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679951788;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0LEJrDTAcfCM9VkfiAJb+npuCFsUcZV6BGDNB5KSPBk=;
 b=e3l1t4quJA5W8FP+e0s++vsjhsTJVQwDr9DHsYTv5yOcuGe/bRVhBEgoEXkRunh02O
 YnHfLrNNqer+IKrdizCF8m0T5hxyIexTverD5Zys+MrI6wey3ZJbsuN6nHtGuPx2XY1j
 ycbvMxYMVmqZKmAHX9cZ1eMOXJDvGrZ5l52Od4vtT6MCWpNYIk9tgeAn+BSssD/MCVv1
 H9M/EKPeOt+bz6aJYbNz0CSrGNQbL9pTLK8Rh1Gj+ffseLEtzYN3Grp07htT2c7npzma
 VLTLKBWoIslOiwH+t8XDKK4/lojsgRcgpnrYMWggyZ1MIu7s7Pbxzq0Ij1b+pW9XjNhz
 LhlQ==
X-Gm-Message-State: AAQBX9cxo6gawDH6Fv4XCZPKKQ/z0t2Vm3TJm8y2jJAwWyjzD9mBn8T7
 3H6skqfNBUptH60K96WHQft1Yzn38tZYj5Q5MZjPunyi6wYFUU2Eust+QPv7lBrVvNQmVc4wFWw
 EqRe666gSuincKKTKmYI74amggI4tbEo=
X-Received: by 2002:a67:d88f:0:b0:420:10e:14e8 with SMTP id
 f15-20020a67d88f000000b00420010e14e8mr8065118vsj.1.1679951788705; 
 Mon, 27 Mar 2023 14:16:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350bak9kTyxywCC/LDXbJ67PzWy6xxqCf1htpVf+TmsKvbK/69CRUwPeb4hc/IQDBfPaTjBtdIMJvqbcPCRktq2o=
X-Received: by 2002:a67:d88f:0:b0:420:10e:14e8 with SMTP id
 f15-20020a67d88f000000b00420010e14e8mr8065103vsj.1.1679951788446; Mon, 27 Mar
 2023 14:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230327133525.50318-1-imbrenda@linux.ibm.com>
 <20230327133525.50318-2-imbrenda@linux.ibm.com>
In-Reply-To: <20230327133525.50318-2-imbrenda@linux.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 27 Mar 2023 23:16:19 +0200
Message-ID: <CABgObfYK_cVCS5x-JYY78KTdrhTnPU+fiK5QRnRTrd+EWMn3bw@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] util/async-teardown: wire up
 query-command-line-options
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, David Hildenbrand <david@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, "Borntraeger,
 Christian" <borntraeger@de.ibm.com>, 
 Janosch Frank <frankja@linux.ibm.com>, fiuczy@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, nsg@linux.ibm.com, 
 "P. Berrange, Daniel" <berrange@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Armbruster, Markus" <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009728c405f7e84178"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

--0000000000009728c405f7e84178
Content-Type: text/plain; charset="UTF-8"

I am honestly not a fan of adding a more complex option,.just because
query-command-line-options only returns the square holes whereas here we
got a round one.

Can we imagine another functionality that would be added to -teardown? If
not, it's not a good design. If it works, I would add a completely dummy
(no suboptions) group "async-teardown" and not modify the parsing at all.

Paolo

Il lun 27 mar 2023, 15:35 Claudio Imbrenda <imbrenda@linux.ibm.com> ha
scritto:

> Add new -teardown option with an async=on|off parameter. It is visible
> in the output of query-command-line-options QMP command, so it can be
> discovered and used by libvirt.
>
> The option -async-teardown is now redundant. We'd normally deprecate it
> and remove it after a grace period, but it was introduced only in the
> previous version and it had no users, since it was not visible in the
> query-command-line-options QMP command. Drop it.
>
> Reported-by: Boris Fiuczynski <fiuczy@linux.ibm.com>
> Fixes: c891c24b1a ("os-posix: asynchronous teardown for shutdown on Linux")
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>  docs/about/removed-features.rst |  5 +++++
>  os-posix.c                      | 15 +++++++++++++--
>  qemu-options.hx                 | 33 +++++++++++++++++++--------------
>  util/async-teardown.c           | 21 +++++++++++++++++++++
>  4 files changed, 58 insertions(+), 16 deletions(-)
>
> diff --git a/docs/about/removed-features.rst
> b/docs/about/removed-features.rst
> index 5b258b446b..6d89f69be9 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -416,6 +416,11 @@ Input parameters that take a size value should only
> use a size suffix
>  the value is hexadecimal.  That is, '0x20M' should be written either as
>  '32M' or as '0x2000000'.
>
> +``-async-teardown`` (removed in 8.0)
> +,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
> +
> +Use ``-teardown async=on`` instead.
> +
>  ``-chardev`` backend aliases ``tty`` and ``parport`` (removed in 8.0)
>  '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>
> diff --git a/os-posix.c b/os-posix.c
> index 5adc69f560..c1ca7b1cb3 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -36,6 +36,8 @@
>  #include "qemu/log.h"
>  #include "sysemu/runstate.h"
>  #include "qemu/cutils.h"
> +#include "qemu/config-file.h"
> +#include "qemu/option.h"
>
>  #ifdef CONFIG_LINUX
>  #include <sys/prctl.h>
> @@ -132,6 +134,8 @@ static bool os_parse_runas_uid_gid(const char *optarg)
>   */
>  int os_parse_cmd_args(int index, const char *optarg)
>  {
> +    QemuOpts *opts;
> +
>      switch (index) {
>      case QEMU_OPTION_runas:
>          user_pwd = getpwnam(optarg);
> @@ -152,8 +156,15 @@ int os_parse_cmd_args(int index, const char *optarg)
>          daemonize = 1;
>          break;
>  #if defined(CONFIG_LINUX)
> -    case QEMU_OPTION_asyncteardown:
> -        init_async_teardown();
> +    case QEMU_OPTION_teardown:
> +        opts = qemu_opts_parse_noisily(qemu_find_opts("teardown"),
> +                                       optarg, false);
> +        if (!opts) {
> +            exit(1);
> +        }
> +        if (qemu_opt_get_bool(opts, "async", false)) {
> +            init_async_teardown();
> +        }
>          break;
>  #endif
>      default:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index d42f60fb91..6a69b84f3c 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4763,23 +4763,28 @@ DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "",
> QEMU_ARCH_ALL)
>  DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
>
>  #ifdef __linux__
> -DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
> -    "-async-teardown enable asynchronous teardown\n",
> +DEF("teardown", HAS_ARG, QEMU_OPTION_teardown,
> +    "-teardown async[=on|off]\n"
> +    "                process teardown options\n"
> +    "                async=on enables asynchronous teardown\n"
> +   ,
>      QEMU_ARCH_ALL)
> -#endif
>  SRST
> -``-async-teardown``
> -    Enable asynchronous teardown. A new process called
> "cleanup/<QEMU_PID>"
> -    will be created at startup sharing the address space with the main
> qemu
> -    process, using clone. It will wait for the main qemu process to
> -    terminate completely, and then exit.
> -    This allows qemu to terminate very quickly even if the guest was
> -    huge, leaving the teardown of the address space to the cleanup
> -    process. Since the cleanup process shares the same cgroups as the
> -    main qemu process, accounting is performed correctly. This only
> -    works if the cleanup process is not forcefully killed with SIGKILL
> -    before the main qemu process has terminated completely.
> +``-teardown``
> +    Set process teardown options.
> +
> +    ``async=on`` enables asynchronous teardown. A new process called
> +    "cleanup/<QEMU_PID>" will be created at startup sharing the address
> +    space with the main QEMU process, using clone. It will wait for the
> +    main QEMU process to terminate completely, and then exit. This allows
> +    QEMU to terminate very quickly even if the guest was huge, leaving the
> +    teardown of the address space to the cleanup process. Since the
> cleanup
> +    process shares the same cgroups as the main QEMU process, accounting
> is
> +    performed correctly. This only works if the cleanup process is not
> +    forcefully killed with SIGKILL before the main QEMU process has
> +    terminated completely.
>  ERST
> +#endif
>
>  DEF("msg", HAS_ARG, QEMU_OPTION_msg,
>      "-msg [timestamp[=on|off]][,guest-name=[on|off]]\n"
> diff --git a/util/async-teardown.c b/util/async-teardown.c
> index 62cdeb0f20..4a5dbce958 100644
> --- a/util/async-teardown.c
> +++ b/util/async-teardown.c
> @@ -12,6 +12,9 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/config-file.h"
> +#include "qemu/option.h"
> +#include "qemu/module.h"
>  #include <dirent.h>
>  #include <sys/prctl.h>
>  #include <sched.h>
> @@ -144,3 +147,21 @@ void init_async_teardown(void)
>      clone(async_teardown_fn, new_stack_for_clone(), CLONE_VM, NULL);
>      sigprocmask(SIG_SETMASK, &old_signals, NULL);
>  }
> +
> +static QemuOptsList qemu_teardown_opts = {
> +    .name = "teardown",
> +    .head = QTAILQ_HEAD_INITIALIZER(qemu_teardown_opts.head),
> +    .desc = {
> +        {
> +            .name = "async",
> +            .type = QEMU_OPT_BOOL,
> +        },
> +        { /* end of list */ }
> +    },
> +};
> +
> +static void register_teardown(void)
> +{
> +    qemu_add_opts(&qemu_teardown_opts);
> +}
> +opts_init(register_teardown);
> --
> 2.39.2
>
>

--0000000000009728c405f7e84178
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I am honestly not a fan of adding a more complex option,.=
just because query-command-line-options only returns the square holes where=
as here we got a round one.<div dir=3D"auto"><br></div><div dir=3D"auto">Ca=
n we imagine another functionality that would be added to -teardown? If not=
, it&#39;s not a good design. If it works, I would add a completely dummy (=
no suboptions) group &quot;async-teardown&quot; and not modify the parsing =
at all.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il lu=
n 27 mar 2023, 15:35 Claudio Imbrenda &lt;<a href=3D"mailto:imbrenda@linux.=
ibm.com">imbrenda@linux.ibm.com</a>&gt; ha scritto:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Add new -teardown option with an async=3Don|off parameter.=
 It is visible<br>
in the output of query-command-line-options QMP command, so it can be<br>
discovered and used by libvirt.<br>
<br>
The option -async-teardown is now redundant. We&#39;d normally deprecate it=
<br>
and remove it after a grace period, but it was introduced only in the<br>
previous version and it had no users, since it was not visible in the<br>
query-command-line-options QMP command. Drop it.<br>
<br>
Reported-by: Boris Fiuczynski &lt;<a href=3D"mailto:fiuczy@linux.ibm.com" t=
arget=3D"_blank" rel=3D"noreferrer">fiuczy@linux.ibm.com</a>&gt;<br>
Fixes: c891c24b1a (&quot;os-posix: asynchronous teardown for shutdown on Li=
nux&quot;)<br>
Signed-off-by: Claudio Imbrenda &lt;<a href=3D"mailto:imbrenda@linux.ibm.co=
m" target=3D"_blank" rel=3D"noreferrer">imbrenda@linux.ibm.com</a>&gt;<br>
---<br>
=C2=A0docs/about/removed-features.rst |=C2=A0 5 +++++<br>
=C2=A0os-posix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 15 +++++++++++++--<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 33 +++++++++++++++++++--------------<br>
=C2=A0util/async-teardown.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 ++=
+++++++++++++++++++<br>
=C2=A04 files changed, 58 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.=
rst<br>
index 5b258b446b..6d89f69be9 100644<br>
--- a/docs/about/removed-features.rst<br>
+++ b/docs/about/removed-features.rst<br>
@@ -416,6 +416,11 @@ Input parameters that take a size value should only us=
e a size suffix<br>
=C2=A0the value is hexadecimal.=C2=A0 That is, &#39;0x20M&#39; should be wr=
itten either as<br>
=C2=A0&#39;32M&#39; or as &#39;0x2000000&#39;.<br>
<br>
+``-async-teardown`` (removed in 8.0)<br>
+,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,<br>
+<br>
+Use ``-teardown async=3Don`` instead.<br>
+<br>
=C2=A0``-chardev`` backend aliases ``tty`` and ``parport`` (removed in 8.0)=
<br>
=C2=A0&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39=
;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;&#39;<br>
<br>
diff --git a/os-posix.c b/os-posix.c<br>
index 5adc69f560..c1ca7b1cb3 100644<br>
--- a/os-posix.c<br>
+++ b/os-posix.c<br>
@@ -36,6 +36,8 @@<br>
=C2=A0#include &quot;qemu/log.h&quot;<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
=C2=A0#include &quot;qemu/cutils.h&quot;<br>
+#include &quot;qemu/config-file.h&quot;<br>
+#include &quot;qemu/option.h&quot;<br>
<br>
=C2=A0#ifdef CONFIG_LINUX<br>
=C2=A0#include &lt;sys/prctl.h&gt;<br>
@@ -132,6 +134,8 @@ static bool os_parse_runas_uid_gid(const char *optarg)<=
br>
=C2=A0 */<br>
=C2=A0int os_parse_cmd_args(int index, const char *optarg)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 QemuOpts *opts;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0switch (index) {<br>
=C2=A0 =C2=A0 =C2=A0case QEMU_OPTION_runas:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0user_pwd =3D getpwnam(optarg);<br>
@@ -152,8 +156,15 @@ int os_parse_cmd_args(int index, const char *optarg)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0daemonize =3D 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0#if defined(CONFIG_LINUX)<br>
-=C2=A0 =C2=A0 case QEMU_OPTION_asyncteardown:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 init_async_teardown();<br>
+=C2=A0 =C2=A0 case QEMU_OPTION_teardown:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 opts =3D qemu_opts_parse_noisily(qemu_find_opt=
s(&quot;teardown&quot;),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0optarg, f=
alse);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!opts) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qemu_opt_get_bool(opts, &quot;async&quot;,=
 false)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 init_async_teardown();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0#endif<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
diff --git a/qemu-options.hx b/qemu-options.hx<br>
index d42f60fb91..6a69b84f3c 100644<br>
--- a/qemu-options.hx<br>
+++ b/qemu-options.hx<br>
@@ -4763,23 +4763,28 @@ DEF(&quot;qtest&quot;, HAS_ARG, QEMU_OPTION_qtest, =
&quot;&quot;, QEMU_ARCH_ALL)<br>
=C2=A0DEF(&quot;qtest-log&quot;, HAS_ARG, QEMU_OPTION_qtest_log, &quot;&quo=
t;, QEMU_ARCH_ALL)<br>
<br>
=C2=A0#ifdef __linux__<br>
-DEF(&quot;async-teardown&quot;, 0, QEMU_OPTION_asyncteardown,<br>
-=C2=A0 =C2=A0 &quot;-async-teardown enable asynchronous teardown\n&quot;,<=
br>
+DEF(&quot;teardown&quot;, HAS_ARG, QEMU_OPTION_teardown,<br>
+=C2=A0 =C2=A0 &quot;-teardown async[=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 process teardown options\n&quot;<br>
+=C2=A0 =C2=A0 &quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 async=3Don enables asynchronous teardown\n&quot;<br>
+=C2=A0 =C2=A0,<br>
=C2=A0 =C2=A0 =C2=A0QEMU_ARCH_ALL)<br>
-#endif<br>
=C2=A0SRST<br>
-``-async-teardown``<br>
-=C2=A0 =C2=A0 Enable asynchronous teardown. A new process called &quot;cle=
anup/&lt;QEMU_PID&gt;&quot;<br>
-=C2=A0 =C2=A0 will be created at startup sharing the address space with th=
e main qemu<br>
-=C2=A0 =C2=A0 process, using clone. It will wait for the main qemu process=
 to<br>
-=C2=A0 =C2=A0 terminate completely, and then exit.<br>
-=C2=A0 =C2=A0 This allows qemu to terminate very quickly even if the guest=
 was<br>
-=C2=A0 =C2=A0 huge, leaving the teardown of the address space to the clean=
up<br>
-=C2=A0 =C2=A0 process. Since the cleanup process shares the same cgroups a=
s the<br>
-=C2=A0 =C2=A0 main qemu process, accounting is performed correctly. This o=
nly<br>
-=C2=A0 =C2=A0 works if the cleanup process is not forcefully killed with S=
IGKILL<br>
-=C2=A0 =C2=A0 before the main qemu process has terminated completely.<br>
+``-teardown``<br>
+=C2=A0 =C2=A0 Set process teardown options.<br>
+<br>
+=C2=A0 =C2=A0 ``async=3Don`` enables asynchronous teardown. A new process =
called<br>
+=C2=A0 =C2=A0 &quot;cleanup/&lt;QEMU_PID&gt;&quot; will be created at star=
tup sharing the address<br>
+=C2=A0 =C2=A0 space with the main QEMU process, using clone. It will wait =
for the<br>
+=C2=A0 =C2=A0 main QEMU process to terminate completely, and then exit. Th=
is allows<br>
+=C2=A0 =C2=A0 QEMU to terminate very quickly even if the guest was huge, l=
eaving the<br>
+=C2=A0 =C2=A0 teardown of the address space to the cleanup process. Since =
the cleanup<br>
+=C2=A0 =C2=A0 process shares the same cgroups as the main QEMU process, ac=
counting is<br>
+=C2=A0 =C2=A0 performed correctly. This only works if the cleanup process =
is not<br>
+=C2=A0 =C2=A0 forcefully killed with SIGKILL before the main QEMU process =
has<br>
+=C2=A0 =C2=A0 terminated completely.<br>
=C2=A0ERST<br>
+#endif<br>
<br>
=C2=A0DEF(&quot;msg&quot;, HAS_ARG, QEMU_OPTION_msg,<br>
=C2=A0 =C2=A0 =C2=A0&quot;-msg [timestamp[=3Don|off]][,guest-name=3D[on|off=
]]\n&quot;<br>
diff --git a/util/async-teardown.c b/util/async-teardown.c<br>
index 62cdeb0f20..4a5dbce958 100644<br>
--- a/util/async-teardown.c<br>
+++ b/util/async-teardown.c<br>
@@ -12,6 +12,9 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu/config-file.h&quot;<br>
+#include &quot;qemu/option.h&quot;<br>
+#include &quot;qemu/module.h&quot;<br>
=C2=A0#include &lt;dirent.h&gt;<br>
=C2=A0#include &lt;sys/prctl.h&gt;<br>
=C2=A0#include &lt;sched.h&gt;<br>
@@ -144,3 +147,21 @@ void init_async_teardown(void)<br>
=C2=A0 =C2=A0 =C2=A0clone(async_teardown_fn, new_stack_for_clone(), CLONE_V=
M, NULL);<br>
=C2=A0 =C2=A0 =C2=A0sigprocmask(SIG_SETMASK, &amp;old_signals, NULL);<br>
=C2=A0}<br>
+<br>
+static QemuOptsList qemu_teardown_opts =3D {<br>
+=C2=A0 =C2=A0 .name =3D &quot;teardown&quot;,<br>
+=C2=A0 =C2=A0 .head =3D QTAILQ_HEAD_INITIALIZER(qemu_teardown_opts.head),<=
br>
+=C2=A0 =C2=A0 .desc =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D &quot;async&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .type =3D QEMU_OPT_BOOL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 { /* end of list */ }<br>
+=C2=A0 =C2=A0 },<br>
+};<br>
+<br>
+static void register_teardown(void)<br>
+{<br>
+=C2=A0 =C2=A0 qemu_add_opts(&amp;qemu_teardown_opts);<br>
+}<br>
+opts_init(register_teardown);<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div>

--0000000000009728c405f7e84178--


