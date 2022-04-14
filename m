Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED47E5011E9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 17:04:13 +0200 (CEST)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf112-0002AU-Qx
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 11:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0zC-00019A-4n
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:02:18 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0zA-0000iZ-52
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 11:02:17 -0400
Received: by mail-ej1-x62f.google.com with SMTP id u15so10542203ejf.11
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 08:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=roslBwHhbyewfyNLV1S4UAXYJI8r4WLLbz8+4o7A+0A=;
 b=Qp6pd6IGwaiz8ZfcFPkMHAlQVftKVv7jrnxMd/+yZ1vbKpD1/SbK6qrigB8c3Iv4n6
 +M5vMV2ngsp5qmguO7wRyyKCSVGoou4HebLHEp5jnXR/nRiwFHl6qSiV/1qdhBBEnMne
 uHiUCfP5GltV5mCB8ZaPHJU1ivxtg5t5iTvYIUkeLvQ7kwOpJ5cTXosLJ/cKKdfyT5qo
 xL54wKAsW/HipAeFYV1viPxEZJDs9+Md2gGRPBjPlSQl4FhuZkN2UoDsd9XLL//IjVS0
 FlbC3M1voBvdU9BBy88+3CoT+D5IYY45XEgWbGCamgnW7jgGTI32PpXdbHSlLsDnlSXD
 goEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=roslBwHhbyewfyNLV1S4UAXYJI8r4WLLbz8+4o7A+0A=;
 b=S4JDY40x5drmZ/+CkBPihMuSBN+9c9tehxwANqiNs7qzdPVBOhQFtGoxGA4IDAoTAp
 f/mw1d6AbzMH7RWpFET6vZ+Nqg1emgWn4A4Kt0uYE8o83XadZt5KiO1coCsUmoEyYZSX
 UW22ZYnnJInYK07z13CAjUb1VuRBv+vKrNSAd7M/3V3Qa6vglchNKG3pk6uTRxBZTQak
 jYERgBEp9XwJm/LOLRfAOTYqDk9ZCitJsqSo6BBRWgKvuN/33ZM9ddTJMbBVkl1pBcn7
 6hHYcH98dDsamNkuQs8O3phFNaE9JDuSqG3GO0qaNgQMGvFWjYU4eHuf1FNDoMDYupG+
 Pw1A==
X-Gm-Message-State: AOAM532+ZaXu5qg/X4dW30z1PsOUiiRoYXv3KJ3ZJbtlHmFGBfvUQ0Ez
 iD5o4NV+Xt+IcwFDZ6+1TOPuhQ==
X-Google-Smtp-Source: ABdhPJwUB4fcFsiTW5YnIcwQe/KFLXvO3I12mY8y0VvsVhNKvh7XrGVEIFl5HDUFXpbpZEyxSwiwwg==
X-Received: by 2002:a17:907:7202:b0:6df:83a9:67d2 with SMTP id
 dr2-20020a170907720200b006df83a967d2mr2615872ejc.327.1649948534011; 
 Thu, 14 Apr 2022 08:02:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 27-20020a17090600db00b006df6b34d9b8sm697600eji.211.2022.04.14.08.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 08:02:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE9F81FFB7;
 Thu, 14 Apr 2022 16:02:11 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-36-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 27/39] util/log: Introduce qemu_set_log_filename_flags
Date: Thu, 14 Apr 2022 15:56:39 +0100
In-reply-to: <20220326132534.543738-36-richard.henderson@linaro.org>
Message-ID: <87h76vvhcc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Provide a function to set both filename and flags at
> the same time.  This is the common case at startup.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Return bool, per recommendations in qapi/error.h (phil).
> ---
>  include/qemu/log.h |   1 +
>  util/log.c         | 122 ++++++++++++++++++++++++++++-----------------
>  2 files changed, 77 insertions(+), 46 deletions(-)
>
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index 42d545f77a..b6c73376b5 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -82,6 +82,7 @@ extern const QEMULogItem qemu_log_items[];
>=20=20
>  bool qemu_set_log(int log_flags, Error **errp);
>  bool qemu_set_log_filename(const char *filename, Error **errp);
> +bool qemu_set_log_filename_flags(const char *name, int flags, Error **er=
rp);
>  void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
>  bool qemu_log_in_addr_range(uint64_t addr);
>  int qemu_str_to_log_mask(const char *str);
> diff --git a/util/log.c b/util/log.c
> index 8b8b6a5d83..2152d5591e 100644
> --- a/util/log.c
> +++ b/util/log.c
> @@ -117,15 +117,58 @@ static void qemu_logfile_free(QemuLogFile *logfile)
>  }
>=20=20
>  /* enable or disable low levels log */
> -bool qemu_set_log(int log_flags, Error **errp)
> +static bool qemu_set_log_internal(const char *filename, bool changed_nam=
e,
> +                                  int log_flags, Error **errp)
>  {
> -    bool need_to_open_file =3D false;
> +    bool need_to_open_file;
>      QemuLogFile *logfile;
>=20=20
> -    qemu_loglevel =3D log_flags;
> +    QEMU_LOCK_GUARD(&qemu_logfile_mutex);
> +    logfile =3D qemu_logfile;
> +
> +    if (changed_name) {
> +        char *newname =3D NULL;
> +
> +        /*
> +         * Allow the user to include %d in their logfile which will be
> +         * substituted with the current PID. This is useful for debuggin=
g many
> +         * nested linux-user tasks but will result in lots of logs.
> +         *
> +         * filename may be NULL. In that case, log output is sent to std=
err
> +         */
> +        if (filename) {
> +            char *pidstr =3D strstr(filename, "%");
> +
> +            if (pidstr) {
> +                /* We only accept one %d, no other format strings */
> +                if (pidstr[1] !=3D 'd' || strchr(pidstr + 2, '%')) {
> +                    error_setg(errp, "Bad logfile format: %s", filename);
> +                    return false;
> +                }
> +                newname =3D g_strdup_printf(filename, getpid());
> +            } else {
> +                newname =3D g_strdup(filename);
> +            }
> +        }
> +
> +        g_free(logfilename);
> +        logfilename =3D newname;
> +        filename =3D newname;
> +
> +        if (logfile) {
> +            qatomic_rcu_set(&qemu_logfile, NULL);
> +            call_rcu(logfile, qemu_logfile_free, rcu);
> +            logfile =3D NULL;
> +        }
> +    } else {
> +        filename =3D logfilename;
> +    }
> +
>  #ifdef CONFIG_TRACE_LOG
> -    qemu_loglevel |=3D LOG_TRACE;
> +    log_flags |=3D LOG_TRACE;
>  #endif
> +    qemu_loglevel =3D log_flags;
> +

This looked weird - so should we consider a qatomic_set here to avoid an
inconsistent set of flags being read non-atomically elsewhere?

>      /*
>       * In all cases we only log if qemu_loglevel is set.
>       * Also:
> @@ -134,71 +177,58 @@ bool qemu_set_log(int log_flags, Error **errp)
>       *   If we are daemonized,
>       *     we will only log if there is a logfilename.
>       */
> -    if (qemu_loglevel && (!is_daemonized() || logfilename)) {
> -        need_to_open_file =3D true;
> -    }
> -    QEMU_LOCK_GUARD(&qemu_logfile_mutex);
> -    if (qemu_logfile && !need_to_open_file) {
> -        logfile =3D qemu_logfile;
> +    need_to_open_file =3D log_flags && (!is_daemonized() || filename);
> +
> +    if (logfile && !need_to_open_file) {
>          qatomic_rcu_set(&qemu_logfile, NULL);
>          call_rcu(logfile, qemu_logfile_free, rcu);
> -    } else if (!qemu_logfile && need_to_open_file) {
> -        logfile =3D g_new0(QemuLogFile, 1);
> -        if (logfilename) {
> -            logfile->fd =3D fopen(logfilename, log_append ? "a" : "w");
> -            if (!logfile->fd) {
> +        return true;
> +    }
> +    if (!logfile && need_to_open_file) {
> +        FILE *fd;
> +
> +        if (filename) {
> +            fd =3D fopen(filename, log_append ? "a" : "w");
> +            if (!fd) {
>                  error_setg_errno(errp, errno, "Error opening logfile %s",
> -                                 logfilename);
> +                                 filename);
>                  return false;
>              }
>              /* In case we are a daemon redirect stderr to logfile */
>              if (is_daemonized()) {
> -                dup2(fileno(logfile->fd), STDERR_FILENO);
> -                fclose(logfile->fd);
> +                dup2(fileno(fd), STDERR_FILENO);
> +                fclose(fd);
>                  /* This will skip closing logfile in qemu_log_close() */
> -                logfile->fd =3D stderr;
> +                fd =3D stderr;
>              }
>          } else {
>              /* Default to stderr if no log file specified */
>              assert(!is_daemonized());
> -            logfile->fd =3D stderr;
> +            fd =3D stderr;
>          }
>=20=20
>          log_append =3D 1;
> +
> +        logfile =3D g_new0(QemuLogFile, 1);
> +        logfile->fd =3D fd;
>          qatomic_rcu_set(&qemu_logfile, logfile);

I was also pondering if flags should be part of the QemuLogFile
structure so it's consistent with each opened file. However I see it
gets repurposed just for clean-up later...

>      }
>      return true;
>  }
>=20=20
> -/*
> - * Allow the user to include %d in their logfile which will be
> - * substituted with the current PID. This is useful for debugging many
> - * nested linux-user tasks but will result in lots of logs.
> - *
> - * filename may be NULL. In that case, log output is sent to stderr
> - */
> +bool qemu_set_log(int log_flags, Error **errp)
> +{
> +    return qemu_set_log_internal(NULL, false, log_flags, errp);
> +}
> +
>  bool qemu_set_log_filename(const char *filename, Error **errp)
>  {
> -    g_free(logfilename);
> -    logfilename =3D NULL;
> +    return qemu_set_log_internal(filename, true, qemu_loglevel, errp);
> +}
>=20=20
> -    if (filename) {
> -            char *pidstr =3D strstr(filename, "%");
> -            if (pidstr) {
> -                /* We only accept one %d, no other format strings */
> -                if (pidstr[1] !=3D 'd' || strchr(pidstr + 2, '%')) {
> -                    error_setg(errp, "Bad logfile format: %s", filename);
> -                    return false;
> -                } else {
> -                    logfilename =3D g_strdup_printf(filename, getpid());
> -                }
> -            } else {
> -                logfilename =3D g_strdup(filename);
> -            }
> -    }
> -
> -    qemu_log_close();
> -    return qemu_set_log(qemu_loglevel, errp);
> +bool qemu_set_log_filename_flags(const char *name, int flags, Error **er=
rp)
> +{
> +    return qemu_set_log_internal(name, true, flags, errp);
>  }
>=20=20
>  /* Returns true if addr is in our debug filter or no filter defined


--=20
Alex Benn=C3=A9e

