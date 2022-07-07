Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCC256A1C6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 14:14:18 +0200 (CEST)
Received: from localhost ([::1]:47126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9QOe-0004hp-IU
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 08:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9QMD-00035m-4R
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:11:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o9QM9-00009B-OZ
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 08:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657195899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m/NJ1ZBvyO6qcQwURtEtzCS6L/4ZH2q5TmA+erlzQrE=;
 b=K4tO4W/eZQ8rxXrd9kKcGJIzimguCbFpnqTuIaV2qEwL9i2ZFXoo/3hahiiJbaxxiMtPXZ
 hBS7Np0x/9Tx5uW66eL/1MuJ/EBvjJTlM0UH9wFUV5+04D5j7Rf86nzQQq/qVlo0J65rTf
 NMmmAtVQ7J0gdyWOaHxwA36R7EdPIZ0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-mT6oWIjmNn6CdXKOxH7Y_Q-1; Thu, 07 Jul 2022 08:11:35 -0400
X-MC-Unique: mT6oWIjmNn6CdXKOxH7Y_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DCBA3C2F760;
 Thu,  7 Jul 2022 12:11:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E6301121315;
 Thu,  7 Jul 2022 12:11:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 36C6B21E690D; Thu,  7 Jul 2022 14:11:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,  Michael Roth <michael.roth@amd.com>,  Kevin Wolf
 <kwolf@redhat.com>,  Laurent Vivier <laurent@vivier.eu>,  Warner Losh
 <imp@bsdimp.com>,  Kyle Evans <kevans@freebsd.org>,  Hanna Reitz
 <hreitz@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  Fam Zheng <fam@euphon.net>,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  qemu-block@nongnu.org
Subject: Re: [PATCH 5/9] error-report: introduce ErrorReportDetailedFunc
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-6-marcandre.lureau@redhat.com>
Date: Thu, 07 Jul 2022 14:11:33 +0200
In-Reply-To: <20220616124034.3381391-6-marcandre.lureau@redhat.com> (marcandre
 lureau's message of "Thu, 16 Jun 2022 16:40:30 +0400")
Message-ID: <87mtdldswa.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

marcandre.lureau@redhat.com writes:

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
> diff --git a/include/qemu/error-report.h b/include/qemu/error-report.h
> index 3ae2357fda54..e2e630f207f0 100644
> --- a/include/qemu/error-report.h
> +++ b/include/qemu/error-report.h
> @@ -13,6 +13,8 @@
>  #ifndef QEMU_ERROR_REPORT_H
>  #define QEMU_ERROR_REPORT_H
>=20=20
> +typedef bool (*ErrorReportDetailedFunc)(void);
> +
>  typedef struct Location {
>      /* all members are private to qemu-error.c */
>      enum { LOC_NONE, LOC_CMDLINE, LOC_FILE } kind;
> @@ -46,7 +48,7 @@ bool error_report_once_cond(bool *printed, const char *=
fmt, ...)
>  bool warn_report_once_cond(bool *printed, const char *fmt, ...)
>      G_GNUC_PRINTF(2, 3);
>=20=20
> -void error_init(const char *argv0);
> +void error_init(const char *argv0, ErrorReportDetailedFunc detailed_fn);
>=20=20
>  /*
>   * Similar to error_report(), except it prints the message just once.
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 6f09180d6541..d5f8fca863d7 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -292,7 +292,7 @@ int main(int argc, char **argv)
>=20=20
>      save_proc_pathname(argv[0]);
>=20=20
> -    error_init(argv[0]);
> +    error_init(argv[0], NULL);
>      module_call_init(MODULE_INIT_TRACE);
>      qemu_init_cpu_list();
>      module_call_init(MODULE_INIT_QOM);
[More such calls of error_init()...]
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 54e920ada1a1..3b46fc9c1fc5 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2590,6 +2590,11 @@ void qmp_x_exit_preconfig(Error **errp)
>      }
>  }
>=20=20
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
>=20=20
> -    error_init(argv[0]);
> +    error_init(argv[0], error_is_detailed);
>      qemu_init_exec_dir(argv[0]);
>=20=20
>      qemu_init_arch_modules();
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-s=
torage-daemon.c
> index c104817cdddc..7e4d5030a045 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -368,13 +368,18 @@ static void pid_file_init(void)
>      atexit(pid_file_cleanup);
>  }
>=20=20
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
>=20=20
> -    error_init(argv[0]);
> +    error_init(argv[0], error_is_detailed);
>      qemu_init_exec_dir(argv[0]);
>      os_setup_signal_handling();
>=20=20
> diff --git a/util/error-report.c b/util/error-report.c
> index c43227a975e2..c2181f80a83d 100644
> --- a/util/error-report.c
> +++ b/util/error-report.c
> @@ -11,7 +11,6 @@
>   */
>=20=20
>  #include "qemu/osdep.h"
> -#include "monitor/monitor.h"
>  #include "qemu/error-report.h"
>=20=20
>  /*
> @@ -28,6 +27,7 @@ typedef enum {
>  bool message_with_timestamp;
>  bool error_with_guestname;
>  const char *error_guest_name;
> +ErrorReportDetailedFunc detailed_fn =3D NULL;
>=20=20
>  int error_printf(const char *fmt, ...)
>  {
> @@ -195,7 +195,7 @@ real_time_iso8601(void)
>   */
>  static void vreport(report_type type, const char *fmt, va_list ap)
>  {
> -    bool detailed =3D !monitor_cur();
> +    bool detailed =3D detailed_fn ? detailed_fn() : TRUE;
>      gchar *timestr;
>=20=20
>      if (message_with_timestamp && detailed) {
> @@ -387,7 +387,7 @@ static void qemu_log_func(const gchar *log_domain,
>      }
>  }
>=20=20
> -void error_init(const char *argv0)
> +void error_init(const char *argv0, ErrorReportDetailedFunc detailed)
>  {
>      const char *p =3D strrchr(argv0, '/');
>=20=20
> @@ -401,4 +401,6 @@ void error_init(const char *argv0)
>      g_log_set_default_handler(qemu_log_func, NULL);
>      g_warn_if_fail(qemu_glog_domains =3D=3D NULL);
>      qemu_glog_domains =3D g_strdup(g_getenv("G_MESSAGES_DEBUG"));
> +
> +    detailed_fn =3D detailed;
>  }

A callback works, but note that each program's function is fixed.  Why
not use the linker to resolve it?  Have a .o in libqemuutil.a that
defines error_is_detailed() to return false always.  Have another
error_is_detailed() that returns !monitor_cur() in monitor.c.  A program
that links the monitor gets the latter, all the others the former.

What do you think?


