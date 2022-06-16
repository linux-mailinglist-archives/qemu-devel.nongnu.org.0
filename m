Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54854E961
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 20:31:05 +0200 (CEST)
Received: from localhost ([::1]:47544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1uGl-0001En-Ph
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 14:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o1uE7-0000O5-NH
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 14:28:19 -0400
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33]:36717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o1uE5-0006aE-95
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 14:28:19 -0400
Received: by mail-vs1-xe33.google.com with SMTP id j16so2011750vso.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D2noFZQasDO+RKyXecbkWpu+N93SmY9/tKulsgrQ6ts=;
 b=O2gj7GhM50ZR4xW0w8KzsmxjwqCoj19aFWuId2fO10m4lndNwfDLbS+aNQZTsxe6m6
 82aSudqOTqNrgW7ynRAj+aB7Jk7uHhCRwYJMH08O0geK8mTARl2uo/4ML+afnwS676Zg
 YAdbPP58t2pAvrRN3SRWtx7rzpOOiCYrDkuXLIc3p9S2aQTIcGkfFi1k5lsPeiTk6xxc
 p7pR6H/cdSqyisTjeZ+6gSmahkOyq61pYahrugez+le24Rgb8ZPyiqQbGwBeSlil1mDA
 SqoPe64Qx6wF0kHX25h0DtkgUG6uQDnAPl/5pbFE3zQzZYFZubtXvtIHUzWvndNVtmSd
 TNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D2noFZQasDO+RKyXecbkWpu+N93SmY9/tKulsgrQ6ts=;
 b=jQUtRMjCzDYJozrZZjJ5DjTghF1DAEVGGaMorZZSzQCZPqmrBcf9+ZXUXOtx1Q4HJt
 Ch0YxewNj1+hKsSW00tbpymRRRvFsGi1jZ6hXqvhpB/ZLOKchFTMg7QzFlulP46xgZwu
 CYrvX+ST8RFV3G6hdXUAsTSxfqyGRQIkzcdTVz99QhI4uPg4zFSzzbrHxicIcoZbjzQJ
 uCyDYD4j6TqBOF1S/6P7iaAwfrTTOoWjKNw+vgOiRB9985qDAgWikshy3G9ekX/srz9J
 nKT/Vyu0FJ3ylDwSszLFvmgoXdWph7WQRjtSWyGgsrQ11+BB6GZsMdBzyxhfRRrVbHZs
 CjUQ==
X-Gm-Message-State: AJIora8ziyzDc7WuUhLTmdlXHgjxVONI9you0pEZjsBpCmWbJQDk1YJm
 be1yv43wYz9USDHrY/5qQa77aCZnvjPpDqzcStpNdw==
X-Google-Smtp-Source: AGRyM1uwjeOx4cUu8ClrzyrYJCXRrp8YN5PSn+vunKZi+REfwOXbD/EMFo6zZw1MLYv1IRsvrt7lckcrIbQTQp/RJI4=
X-Received: by 2002:a67:f3d0:0:b0:34b:b52d:d676 with SMTP id
 j16-20020a67f3d0000000b0034bb52dd676mr2973574vsn.6.1655404095587; Thu, 16 Jun
 2022 11:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220616124034.3381391-6-marcandre.lureau@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 16 Jun 2022 12:28:04 -0600
Message-ID: <CANCZdfpL-b4NwPA1U-4m04x36_2e0i9LpxiNGpEpdRMpRf==8A@mail.gmail.com>
Subject: Re: [PATCH 5/9] error-report: introduce ErrorReportDetailedFunc
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Kevin Wolf <kwolf@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Kyle Evans <kevans@freebsd.org>,
 Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000013dad205e194cd74"
Received-SPF: none client-ip=2607:f8b0:4864:20::e33;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000013dad205e194cd74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2022 at 6:41 AM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Remove monitor dependency from error printing code, by allowing programs
> to set a callback for when to use "detailed" reporting or not.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/error-report.h          | 4 +++-
>  bsd-user/main.c                      | 2 +-
>  linux-user/main.c                    | 2 +-
>  qemu-img.c                           | 2 +-
>  qemu-io.c                            | 2 +-
>  qemu-nbd.c                           | 2 +-
>  scsi/qemu-pr-helper.c                | 2 +-
>  softmmu/vl.c                         | 7 ++++++-
>  storage-daemon/qemu-storage-daemon.c | 7 ++++++-
>  util/error-report.c                  | 8 +++++---
>  10 files changed, 26 insertions(+), 12 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

While all the changes look good, I'm only confident about the *-user
changes if that matters.

Warner


> diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
> index 3ae2357fda54..e2e630f207f0 100644
> --- a/include/qemu/error-report.h
> +++ b/include/qemu/error-report.h
> @@ -13,6 +13,8 @@
>  #ifndef QEMU_ERROR_REPORT_H
>  #define QEMU_ERROR_REPORT_H
>
> +typedef bool (*ErrorReportDetailedFunc)(void);
> +
>  typedef struct Location {
>      /* all members are private to qemu-error.c */
>      enum { LOC_NONE, LOC_CMDLINE, LOC_FILE } kind;
> @@ -46,7 +48,7 @@ bool error_report_once_cond(bool *printed, const char
> *fmt, ...)
>  bool warn_report_once_cond(bool *printed, const char *fmt, ...)
>      G_GNUC_PRINTF(2, 3);
>
> -void error_init(const char *argv0);
> +void error_init(const char *argv0, ErrorReportDetailedFunc detailed_fn);
>
>  /*
>   * Similar to error_report(), except it prints the message just once.
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 6f09180d6541..d5f8fca863d7 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -292,7 +292,7 @@ int main(int argc, char **argv)
>
>      save_proc_pathname(argv[0]);
>
> -    error_init(argv[0]);
> +    error_init(argv[0], NULL);
>      module_call_init(MODULE_INIT_TRACE);
>      qemu_init_cpu_list();
>      module_call_init(MODULE_INIT_QOM);
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 651e32f5f248..84f380bd366d 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -646,7 +646,7 @@ int main(int argc, char **argv, char **envp)
>      unsigned long max_reserved_va;
>      bool preserve_argv0;
>
> -    error_init(argv[0]);
> +    error_init(argv[0], NULL);
>      module_call_init(MODULE_INIT_TRACE);
>      qemu_init_cpu_list();
>      module_call_init(MODULE_INIT_QOM);
> diff --git a/qemu-img.c b/qemu-img.c
> index 4cf4d2423df8..1f27a9fc70f6 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -5396,7 +5396,7 @@ int main(int argc, char **argv)
>  #endif
>
>      socket_init();
> -    error_init(argv[0]);
> +    error_init(argv[0], NULL);
>      module_call_init(MODULE_INIT_TRACE);
>      qemu_init_exec_dir(argv[0]);
>
> diff --git a/qemu-io.c b/qemu-io.c
> index 2bd7bfb65073..b5cdc7c922a7 100644
> --- a/qemu-io.c
> +++ b/qemu-io.c
> @@ -539,7 +539,7 @@ int main(int argc, char **argv)
>  #endif
>
>      socket_init();
> -    error_init(argv[0]);
> +    error_init(argv[0], NULL);
>      module_call_init(MODULE_INIT_TRACE);
>      qemu_init_exec_dir(argv[0]);
>
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 0cd5aa6f02bc..6bc632c93611 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -587,7 +587,7 @@ int main(int argc, char **argv)
>  #endif
>
>      socket_init();
> -    error_init(argv[0]);
> +    error_init(argv[0], NULL);
>      module_call_init(MODULE_INIT_TRACE);
>      qcrypto_init(&error_fatal);
>
> diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
> index 196b78c00df5..8d80e58d4498 100644
> --- a/scsi/qemu-pr-helper.c
> +++ b/scsi/qemu-pr-helper.c
> @@ -910,7 +910,7 @@ int main(int argc, char **argv)
>
>      signal(SIGPIPE, SIG_IGN);
>
> -    error_init(argv[0]);
> +    error_init(argv[0], NULL);
>      module_call_init(MODULE_INIT_TRACE);
>      module_call_init(MODULE_INIT_QOM);
>      qemu_add_opts(&qemu_trace_opts);
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 54e920ada1a1..3b46fc9c1fc5 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2590,6 +2590,11 @@ void qmp_x_exit_preconfig(Error **errp)
>      }
>  }
>
> +static bool error_is_detailed(void)
> +{
> +    return !monitor_cur();
> +}
> +
>  void qemu_init(int argc, char **argv, char **envp)
>  {
>      QemuOpts *opts;
> @@ -2634,7 +2639,7 @@ void qemu_init(int argc, char **argv, char **envp)
>      qemu_add_opts(&qemu_action_opts);
>      module_call_init(MODULE_INIT_OPTS);
>
> -    error_init(argv[0]);
> +    error_init(argv[0], error_is_detailed);
>      qemu_init_exec_dir(argv[0]);
>
>      qemu_init_arch_modules();
> diff --git a/storage-daemon/qemu-storage-daemon.c
> b/storage-daemon/qemu-storage-daemon.c
> index c104817cdddc..7e4d5030a045 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -368,13 +368,18 @@ static void pid_file_init(void)
>      atexit(pid_file_cleanup);
>  }
>
> +static bool error_is_detailed(void)
> +{
> +    return !monitor_cur();
> +}
> +
>  int main(int argc, char *argv[])
>  {
>  #ifdef CONFIG_POSIX
>      signal(SIGPIPE, SIG_IGN);
>  #endif
>
> -    error_init(argv[0]);
> +    error_init(argv[0], error_is_detailed);
>      qemu_init_exec_dir(argv[0]);
>      os_setup_signal_handling();
>
> diff --git a/util/error-report.c b/util/error-report.c
> index c43227a975e2..c2181f80a83d 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -11,7 +11,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "monitor/monitor.h"
>  #include "qemu/error-report.h"
>
>  /*
> @@ -28,6 +27,7 @@ typedef enum {
>  bool message_with_timestamp;
>  bool error_with_guestname;
>  const char *error_guest_name;
> +ErrorReportDetailedFunc detailed_fn =3D NULL;
>
>  int error_printf(const char *fmt, ...)
>  {
> @@ -195,7 +195,7 @@ real_time_iso8601(void)
>   */
>  static void vreport(report_type type, const char *fmt, va_list ap)
>  {
> -    bool detailed =3D !monitor_cur();
> +    bool detailed =3D detailed_fn ? detailed_fn() : TRUE;
>      gchar *timestr;
>
>      if (message_with_timestamp && detailed) {
> @@ -387,7 +387,7 @@ static void qemu_log_func(const gchar *log_domain,
>      }
>  }
>
> -void error_init(const char *argv0)
> +void error_init(const char *argv0, ErrorReportDetailedFunc detailed)
>  {
>      const char *p =3D strrchr(argv0, '/');
>
> @@ -401,4 +401,6 @@ void error_init(const char *argv0)
>      g_log_set_default_handler(qemu_log_func, NULL);
>      g_warn_if_fail(qemu_glog_domains =3D=3D NULL);
>      qemu_glog_domains =3D g_strdup(g_getenv("G_MESSAGES_DEBUG"));
> +
> +    detailed_fn =3D detailed;
>  }
> --
> 2.37.0.rc0
>
>

--00000000000013dad205e194cd74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 16, 2022 at 6:41 AM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
Remove monitor dependency from error printing code, by allowing programs<br=
>
to set a callback for when to use &quot;detailed&quot; reporting or not.<br=
>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qemu/error-report.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +++=
-<br>
=C2=A0bsd-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0linux-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0qemu-img.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0qemu-io.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0qemu-nbd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0scsi/qemu-pr-helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 2 +-<br>
=C2=A0softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 ++++++-<br>
=C2=A0storage-daemon/qemu-storage-daemon.c | 7 ++++++-<br>
=C2=A0util/error-report.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 8 +++++---<br>
=C2=A010 files changed, 26 insertions(+), 12 deletions(-)<br></blockquote><=
div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdim=
p.com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>While all the change=
s look good, I&#39;m only confident about the *-user changes if that matter=
s.</div><div><br></div><div>Warner</div><div>=C2=A0<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h<br>
index 3ae2357fda54..e2e630f207f0 100644<br>
--- a/include/qemu/error-report.h<br>
+++ b/include/qemu/error-report.h<br>
@@ -13,6 +13,8 @@<br>
=C2=A0#ifndef QEMU_ERROR_REPORT_H<br>
=C2=A0#define QEMU_ERROR_REPORT_H<br>
<br>
+typedef bool (*ErrorReportDetailedFunc)(void);<br>
+<br>
=C2=A0typedef struct Location {<br>
=C2=A0 =C2=A0 =C2=A0/* all members are private to qemu-error.c */<br>
=C2=A0 =C2=A0 =C2=A0enum { LOC_NONE, LOC_CMDLINE, LOC_FILE } kind;<br>
@@ -46,7 +48,7 @@ bool error_report_once_cond(bool *printed, const char *fm=
t, ...)<br>
=C2=A0bool warn_report_once_cond(bool *printed, const char *fmt, ...)<br>
=C2=A0 =C2=A0 =C2=A0G_GNUC_PRINTF(2, 3);<br>
<br>
-void error_init(const char *argv0);<br>
+void error_init(const char *argv0, ErrorReportDetailedFunc detailed_fn);<b=
r>
<br>
=C2=A0/*<br>
=C2=A0 * Similar to error_report(), except it prints the message just once.=
<br>
diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
index 6f09180d6541..d5f8fca863d7 100644<br>
--- a/bsd-user/main.c<br>
+++ b/bsd-user/main.c<br>
@@ -292,7 +292,7 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0save_proc_pathname(argv[0]);<br>
<br>
-=C2=A0 =C2=A0 error_init(argv[0]);<br>
+=C2=A0 =C2=A0 error_init(argv[0], NULL);<br>
=C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_TRACE);<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_cpu_list();<br>
=C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_QOM);<br>
diff --git a/linux-user/main.c b/linux-user/main.c<br>
index 651e32f5f248..84f380bd366d 100644<br>
--- a/linux-user/main.c<br>
+++ b/linux-user/main.c<br>
@@ -646,7 +646,7 @@ int main(int argc, char **argv, char **envp)<br>
=C2=A0 =C2=A0 =C2=A0unsigned long max_reserved_va;<br>
=C2=A0 =C2=A0 =C2=A0bool preserve_argv0;<br>
<br>
-=C2=A0 =C2=A0 error_init(argv[0]);<br>
+=C2=A0 =C2=A0 error_init(argv[0], NULL);<br>
=C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_TRACE);<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_cpu_list();<br>
=C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_QOM);<br>
diff --git a/qemu-img.c b/qemu-img.c<br>
index 4cf4d2423df8..1f27a9fc70f6 100644<br>
--- a/qemu-img.c<br>
+++ b/qemu-img.c<br>
@@ -5396,7 +5396,7 @@ int main(int argc, char **argv)<br>
=C2=A0#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0socket_init();<br>
-=C2=A0 =C2=A0 error_init(argv[0]);<br>
+=C2=A0 =C2=A0 error_init(argv[0], NULL);<br>
=C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_TRACE);<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_exec_dir(argv[0]);<br>
<br>
diff --git a/qemu-io.c b/qemu-io.c<br>
index 2bd7bfb65073..b5cdc7c922a7 100644<br>
--- a/qemu-io.c<br>
+++ b/qemu-io.c<br>
@@ -539,7 +539,7 @@ int main(int argc, char **argv)<br>
=C2=A0#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0socket_init();<br>
-=C2=A0 =C2=A0 error_init(argv[0]);<br>
+=C2=A0 =C2=A0 error_init(argv[0], NULL);<br>
=C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_TRACE);<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_exec_dir(argv[0]);<br>
<br>
diff --git a/qemu-nbd.c b/qemu-nbd.c<br>
index 0cd5aa6f02bc..6bc632c93611 100644<br>
--- a/qemu-nbd.c<br>
+++ b/qemu-nbd.c<br>
@@ -587,7 +587,7 @@ int main(int argc, char **argv)<br>
=C2=A0#endif<br>
<br>
=C2=A0 =C2=A0 =C2=A0socket_init();<br>
-=C2=A0 =C2=A0 error_init(argv[0]);<br>
+=C2=A0 =C2=A0 error_init(argv[0], NULL);<br>
=C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_TRACE);<br>
=C2=A0 =C2=A0 =C2=A0qcrypto_init(&amp;error_fatal);<br>
<br>
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c<br>
index 196b78c00df5..8d80e58d4498 100644<br>
--- a/scsi/qemu-pr-helper.c<br>
+++ b/scsi/qemu-pr-helper.c<br>
@@ -910,7 +910,7 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0signal(SIGPIPE, SIG_IGN);<br>
<br>
-=C2=A0 =C2=A0 error_init(argv[0]);<br>
+=C2=A0 =C2=A0 error_init(argv[0], NULL);<br>
=C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_TRACE);<br>
=C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_QOM);<br>
=C2=A0 =C2=A0 =C2=A0qemu_add_opts(&amp;qemu_trace_opts);<br>
diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
index 54e920ada1a1..3b46fc9c1fc5 100644<br>
--- a/softmmu/vl.c<br>
+++ b/softmmu/vl.c<br>
@@ -2590,6 +2590,11 @@ void qmp_x_exit_preconfig(Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static bool error_is_detailed(void)<br>
+{<br>
+=C2=A0 =C2=A0 return !monitor_cur();<br>
+}<br>
+<br>
=C2=A0void qemu_init(int argc, char **argv, char **envp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0QemuOpts *opts;<br>
@@ -2634,7 +2639,7 @@ void qemu_init(int argc, char **argv, char **envp)<br=
>
=C2=A0 =C2=A0 =C2=A0qemu_add_opts(&amp;qemu_action_opts);<br>
=C2=A0 =C2=A0 =C2=A0module_call_init(MODULE_INIT_OPTS);<br>
<br>
-=C2=A0 =C2=A0 error_init(argv[0]);<br>
+=C2=A0 =C2=A0 error_init(argv[0], error_is_detailed);<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_exec_dir(argv[0]);<br>
<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_arch_modules();<br>
diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-sto=
rage-daemon.c<br>
index c104817cdddc..7e4d5030a045 100644<br>
--- a/storage-daemon/qemu-storage-daemon.c<br>
+++ b/storage-daemon/qemu-storage-daemon.c<br>
@@ -368,13 +368,18 @@ static void pid_file_init(void)<br>
=C2=A0 =C2=A0 =C2=A0atexit(pid_file_cleanup);<br>
=C2=A0}<br>
<br>
+static bool error_is_detailed(void)<br>
+{<br>
+=C2=A0 =C2=A0 return !monitor_cur();<br>
+}<br>
+<br>
=C2=A0int main(int argc, char *argv[])<br>
=C2=A0{<br>
=C2=A0#ifdef CONFIG_POSIX<br>
=C2=A0 =C2=A0 =C2=A0signal(SIGPIPE, SIG_IGN);<br>
=C2=A0#endif<br>
<br>
-=C2=A0 =C2=A0 error_init(argv[0]);<br>
+=C2=A0 =C2=A0 error_init(argv[0], error_is_detailed);<br>
=C2=A0 =C2=A0 =C2=A0qemu_init_exec_dir(argv[0]);<br>
=C2=A0 =C2=A0 =C2=A0os_setup_signal_handling();<br>
<br>
diff --git a/util/error-report.c b/util/error-report.c<br>
index c43227a975e2..c2181f80a83d 100644<br>
--- a/util/error-report.c<br>
+++ b/util/error-report.c<br>
@@ -11,7 +11,6 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
-#include &quot;monitor/monitor.h&quot;<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
<br>
=C2=A0/*<br>
@@ -28,6 +27,7 @@ typedef enum {<br>
=C2=A0bool message_with_timestamp;<br>
=C2=A0bool error_with_guestname;<br>
=C2=A0const char *error_guest_name;<br>
+ErrorReportDetailedFunc detailed_fn =3D NULL;<br>
<br>
=C2=A0int error_printf(const char *fmt, ...)<br>
=C2=A0{<br>
@@ -195,7 +195,7 @@ real_time_iso8601(void)<br>
=C2=A0 */<br>
=C2=A0static void vreport(report_type type, const char *fmt, va_list ap)<br=
>
=C2=A0{<br>
-=C2=A0 =C2=A0 bool detailed =3D !monitor_cur();<br>
+=C2=A0 =C2=A0 bool detailed =3D detailed_fn ? detailed_fn() : TRUE;<br>
=C2=A0 =C2=A0 =C2=A0gchar *timestr;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (message_with_timestamp &amp;&amp; detailed) {<br>
@@ -387,7 +387,7 @@ static void qemu_log_func(const gchar *log_domain,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-void error_init(const char *argv0)<br>
+void error_init(const char *argv0, ErrorReportDetailedFunc detailed)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char *p =3D strrchr(argv0, &#39;/&#39;);<br>
<br>
@@ -401,4 +401,6 @@ void error_init(const char *argv0)<br>
=C2=A0 =C2=A0 =C2=A0g_log_set_default_handler(qemu_log_func, NULL);<br>
=C2=A0 =C2=A0 =C2=A0g_warn_if_fail(qemu_glog_domains =3D=3D NULL);<br>
=C2=A0 =C2=A0 =C2=A0qemu_glog_domains =3D g_strdup(g_getenv(&quot;G_MESSAGE=
S_DEBUG&quot;));<br>
+<br>
+=C2=A0 =C2=A0 detailed_fn =3D detailed;<br>
=C2=A0}<br>
-- <br>
2.37.0.rc0<br>
<br>
</blockquote></div></div>

--00000000000013dad205e194cd74--

