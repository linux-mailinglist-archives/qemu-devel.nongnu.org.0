Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8158210095F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Nov 2019 17:43:02 +0100 (CET)
Received: from localhost ([::1]:36742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iWk7B-0000gT-7f
	for lists+qemu-devel@lfdr.de; Mon, 18 Nov 2019 11:43:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iWk65-0000DP-0p
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:41:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iWk62-0007e7-E9
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:41:52 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37353)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iWk62-0007dt-3H
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 11:41:50 -0500
Received: by mail-wm1-x343.google.com with SMTP id b17so19695358wmj.2
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 08:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=jhnCefh9mpzSPdPoZc8N0MgsbbnL59NAIeXfh2OslV4=;
 b=Wxxi7KaVXAEn/8m6PiHats8QQuH42NViesylooq5mXzun5awVpcWIeymW9HEAr9Lk4
 VzObswDk1z65MQQd5GdHJOkCDUxTUpsv7Cuh9IUsilAfuv71ZWloGuK9T4WZceFRickA
 qa4DxIJdQj8n4cvSsarBcNav+xi0OjQEgd3epBh+tTOzrLT0RX4ysezD/51vCyxNPKUC
 7VC5lsDgg8bQ89Tbr3Wex6WswPcaXTsOzMCEO5ahdlQpOdtEhJc7/RJDT027D+repDjh
 MHgLaqNG2DEA/oMmUMkG0Yrs7sod55ua4NsiSYB409HJW9EJ+oCGgPGLePRKC0ONzs2t
 UtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=jhnCefh9mpzSPdPoZc8N0MgsbbnL59NAIeXfh2OslV4=;
 b=llF/cQikeY8TfqHHAaAWHBjmyejvysVdQh7iL1lvtJX3XoLG5RIcvn0rQipJ1W8jup
 /s/wuMXSwoGthFmMDz8T2bvdKqyB1w4h1l1KgkcxyoMylR0RanBWh5+i4MrEm/P3qeFl
 bs9hwEICLw1/5YhcXGZti9EQl4BlrMRTaPTq3Z+/06neTUCGLAidXvSVn3FHOKVPD6Kb
 RsZb9fKdJA8Icm5q7knAIDt5qu/X3OT+ibptVNblXgHIDaWOZB+GSjTwWFOAwFSDSsds
 tsFMDmhmo3ul//nbP3qWk72UhH2rV/ZT8YqLGfJJ3xEdOvKGYwjEa5295ftnT/S0NJzU
 1Gow==
X-Gm-Message-State: APjAAAVI9M94D4SdzWzOBPaFsffla7cxm9mddVVARxZRW6PbVCyIHuu0
 OLnNdmZmL86XGuSaICuUiH6/pw==
X-Google-Smtp-Source: APXvYqxIZ2NWNRfL64UalMxAgWWmRsE0xpO8dHQzqTgLAa+LgJRWhprq75LEg51B7txA+cUGPy/ZeA==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr31884590wmc.9.1574095308567;
 Mon, 18 Nov 2019 08:41:48 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n65sm22076104wmf.28.2019.11.18.08.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 08:41:47 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 794751FF87;
 Mon, 18 Nov 2019 16:41:46 +0000 (GMT)
References: <20191115131040.2834-1-robert.foley@linaro.org>
 <20191115131040.2834-6-robert.foley@linaro.org>
 <87a78tgyr1.fsf@linaro.org>
 <CAEyhzFtAnUATVLGRfG_RkCzfjacw5m9TK4HCjvUg5YWpiV+Ajw@mail.gmail.com>
 <877e3xgvxx.fsf@linaro.org>
 <CAEyhzFtzWgREKr1tq=-myQQ_Esv15Go7UA=0MC6Ko4-9Zgnbqw@mail.gmail.com>
User-agent: mu4e 1.3.5; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Robert Foley <robert.foley@linaro.org>
Subject: Re: [PATCH v2 5/6] Add use of RCU for qemu_logfile.
In-reply-to: <CAEyhzFtzWgREKr1tq=-myQQ_Esv15Go7UA=0MC6Ko4-9Zgnbqw@mail.gmail.com>
Date: Mon, 18 Nov 2019 16:41:46 +0000
Message-ID: <874kz1gmr9.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: Peter Puhov <peter.puhov@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Robert Foley <robert.foley@linaro.org> writes:

> On Mon, 18 Nov 2019 at 08:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Robert Foley <robert.foley@linaro.org> writes:
>>
>> > On Mon, 18 Nov 2019 at 07:22, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >>
>> >> > +    if (logfile) {
>> >> > +        qemu_flockfile(logfile->fd);
>> >> > +        return logfile->fd;
>> >> > +    } else {
>> >> > +        rcu_read_unlock();
>> >>
>> >> As qemu_log_lock() and unlock should be paired we can drop the unlock
>> >> here and do an unconditional unlock bellow even if a null fd is passe=
d.
>> >>
>> >> Otherwise:
>> >>
>> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >>
>> > Sounds reasonable.  It sounds like we should change it to be something
>> > like this.
>> >
>> > static inline FILE *qemu_log_lock(void)
>> > {
>> >     QemuLogFile *logfile;
>> >     rcu_read_lock();
>> >     logfile =3D atomic_rcu_read(&qemu_logfile);
>> >     if (logfile) {
>> >         qemu_flockfile(logfile->fd);
>> >         return logfile->fd;
>> >     }
>> >     rcu_read_unlock();
>> >     return NULL;
>> > }
>> > I will make the changes.
>>
>> No I mean as you have to call qemu_log_unlock() you can to the unlock
>> there. You have to hold the lock over the usage of the resource:
>>
> OK, got it.
> We will need to make one other change to target/tilegx/translate.c
> since it conditionally unlocks depending on what qemu_log_lock()
> returns.

Hmm I'd be tempted to drop the locking all together and drop the final
log("\n") statement. The reason being the translator can longjmp out of
the loop if it attempts to translate an instruction in an inaccessible
page.

>
> It seems like the right thing to do since it makes all uses of
> qemu_log_lock() homogeneous in that they will always unconditionally
> call qemu_log_unlock().
>
> I will make the changes.
>
> Thanks,
> -Rob
>
> On Mon, 18 Nov 2019 at 08:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>>
>> Robert Foley <robert.foley@linaro.org> writes:
>>
>> > On Mon, 18 Nov 2019 at 07:22, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >>
>> >> > +    if (logfile) {
>> >> > +        qemu_flockfile(logfile->fd);
>> >> > +        return logfile->fd;
>> >> > +    } else {
>> >> > +        rcu_read_unlock();
>> >>
>> >> As qemu_log_lock() and unlock should be paired we can drop the unlock
>> >> here and do an unconditional unlock bellow even if a null fd is passe=
d.
>> >>
>> >> Otherwise:
>> >>
>> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >>
>> > Sounds reasonable.  It sounds like we should change it to be something
>> > like this.
>> >
>> > static inline FILE *qemu_log_lock(void)
>> > {
>> >     QemuLogFile *logfile;
>> >     rcu_read_lock();
>> >     logfile =3D atomic_rcu_read(&qemu_logfile);
>> >     if (logfile) {
>> >         qemu_flockfile(logfile->fd);
>> >         return logfile->fd;
>> >     }
>> >     rcu_read_unlock();
>> >     return NULL;
>> > }
>> > I will make the changes.
>>
>> No I mean as you have to call qemu_log_unlock() you can to the unlock
>> there. You have to hold the lock over the usage of the resource:
>>
>>   static inline FILE *qemu_log_lock(void)
>>   {
>>       QemuLogFile *logfile;
>>       rcu_read_lock();
>>       logfile =3D atomic_rcu_read(&qemu_logfile);
>>       if (logfile) {
>>           qemu_flockfile(logfile->fd);
>>           return logfile->fd;
>>       } else {
>>           return NULL;
>>       }
>>   }
>>
>>   static inline void qemu_log_unlock(FILE *fd)
>>   {
>>       if (fd) {
>>           qemu_funlockfile(fd);
>>       }
>>       rcu_read_unlock();
>>   }
>>
>>
>> >
>> > Thanks,
>> > -Rob
>> > On Mon, 18 Nov 2019 at 07:22, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >>
>> >> Robert Foley <robert.foley@linaro.org> writes:
>> >>
>> >> > This now allows changing the logfile while logging is active,
>> >> > and also solves the issue of a seg fault while changing the logfile.
>> >> >
>> >> > Any read access to the qemu_logfile handle will use
>> >> > the rcu_read_lock()/unlock() around the use of the handle.
>> >> > To fetch the handle we will use atomic_rcu_read().
>> >> > We also in many cases do a check for validity of the
>> >> > logfile handle before using it to deal with the case where the
>> >> > file is closed and set to NULL.
>> >> >
>> >> > The cases where we write to the qemu_logfile will use atomic_rcu_se=
t().
>> >> > Writers will also use call_rcu() with a newly added qemu_logfile_fr=
ee
>> >> > function for freeing/closing when readers have finished.
>> >> >
>> >> > Signed-off-by: Robert Foley <robert.foley@linaro.org>
>> >> > ---
>> >> > v2
>> >> >     - No specific changes, just merging in cleanup changes in qemu_=
set_log().
>> >> > ---
>> >> > v1
>> >> >     - Changes for review comments.
>> >> >     - Minor changes to definition of QemuLogFile.
>> >> >     - Changed qemu_log_separate() to fix unbalanced and
>> >> >       remove qemu_log_enabled() check.
>> >> >     - changed qemu_log_lock() to include else.
>> >> >     - make qemu_logfile_free static.
>> >> >     - use g_assert(logfile) in qemu_logfile_free.
>> >> >     - Relocated unlock out of if/else in qemu_log_close(), and
>> >> >       in qemu_set_log().
>> >> > ---
>> >> >  include/qemu/log.h | 42 +++++++++++++++++++++++----
>> >> >  util/log.c         | 72 ++++++++++++++++++++++++++++++++----------=
----
>> >> >  include/exec/log.h | 33 ++++++++++++++++++---
>> >> >  tcg/tcg.c          | 12 ++++++--
>> >> >  4 files changed, 126 insertions(+), 33 deletions(-)
>> >> >
>> >> > diff --git a/include/qemu/log.h b/include/qemu/log.h
>> >> > index a7c5b01571..528e1f9dd7 100644
>> >> > --- a/include/qemu/log.h
>> >> > +++ b/include/qemu/log.h
>> >> > @@ -3,9 +3,16 @@
>> >> >
>> >> >  /* A small part of this API is split into its own header */
>> >> >  #include "qemu/log-for-trace.h"
>> >> > +#include "qemu/rcu.h"
>> >> > +
>> >> > +typedef struct QemuLogFile {
>> >> > +    struct rcu_head rcu;
>> >> > +    FILE *fd;
>> >> > +} QemuLogFile;
>> >> >
>> >> >  /* Private global variable, don't use */
>> >> > -extern FILE *qemu_logfile;
>> >> > +extern QemuLogFile *qemu_logfile;
>> >> > +
>> >> >
>> >> >  /*
>> >> >   * The new API:
>> >> > @@ -25,7 +32,16 @@ static inline bool qemu_log_enabled(void)
>> >> >   */
>> >> >  static inline bool qemu_log_separate(void)
>> >> >  {
>> >> > -    return qemu_logfile !=3D NULL && qemu_logfile !=3D stderr;
>> >> > +    QemuLogFile *logfile;
>> >> > +    bool res =3D false;
>> >> > +
>> >> > +    rcu_read_lock();
>> >> > +    logfile =3D atomic_rcu_read(&qemu_logfile);
>> >> > +    if (logfile && logfile->fd !=3D stderr) {
>> >> > +        res =3D true;
>> >> > +    }
>> >> > +    rcu_read_unlock();
>> >> > +    return res;
>> >> >  }
>> >> >
>> >> >  #define CPU_LOG_TB_OUT_ASM (1 << 0)
>> >> > @@ -55,14 +71,23 @@ static inline bool qemu_log_separate(void)
>> >> >
>> >> >  static inline FILE *qemu_log_lock(void)
>> >> >  {
>> >> > -    qemu_flockfile(qemu_logfile);
>> >> > -    return logfile->fd;
>> >> > +    QemuLogFile *logfile;
>> >> > +    rcu_read_lock();
>> >> > +    logfile =3D atomic_rcu_read(&qemu_logfile);
>> >> > +    if (logfile) {
>> >> > +        qemu_flockfile(logfile->fd);
>> >> > +        return logfile->fd;
>> >> > +    } else {
>> >> > +        rcu_read_unlock();
>> >>
>> >> As qemu_log_lock() and unlock should be paired we can drop the unlock
>> >> here and do an unconditional unlock bellow even if a null fd is passe=
d.
>> >>
>> >> Otherwise:
>> >>
>> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >>
>> >> > +        return NULL;
>> >> > +    }
>> >> >  }
>> >> >
>> >> >  static inline void qemu_log_unlock(FILE *fd)
>> >> >  {
>> >> >      if (fd) {
>> >> >          qemu_funlockfile(fd);
>> >> > +        rcu_read_unlock();
>> >> >      }
>> >> >  }
>> >> >
>> >> > @@ -73,9 +98,14 @@ static inline void qemu_log_unlock(FILE *fd)
>> >> >  static inline void GCC_FMT_ATTR(1, 0)
>> >> >  qemu_log_vprintf(const char *fmt, va_list va)
>> >> >  {
>> >> > -    if (qemu_logfile) {
>> >> > -        vfprintf(qemu_logfile, fmt, va);
>> >> > +    QemuLogFile *logfile;
>> >> > +
>> >> > +    rcu_read_lock();
>> >> > +    logfile =3D atomic_rcu_read(&qemu_logfile);
>> >> > +    if (logfile) {
>> >> > +        vfprintf(logfile->fd, fmt, va);
>> >> >      }
>> >> > +    rcu_read_unlock();
>> >> >  }
>> >> >
>> >> >  /* log only if a bit is set on the current loglevel mask:
>> >> > diff --git a/util/log.c b/util/log.c
>> >> > index 91ebb5c924..9f9b6b74b7 100644
>> >> > --- a/util/log.c
>> >> > +++ b/util/log.c
>> >> > @@ -28,7 +28,7 @@
>> >> >
>> >> >  static char *logfilename;
>> >> >  static QemuMutex qemu_logfile_mutex;
>> >> > -FILE *qemu_logfile;
>> >> > +QemuLogFile *qemu_logfile;
>> >> >  int qemu_loglevel;
>> >> >  static int log_append =3D 0;
>> >> >  static GArray *debug_regions;
>> >> > @@ -37,10 +37,14 @@ static GArray *debug_regions;
>> >> >  int qemu_log(const char *fmt, ...)
>> >> >  {
>> >> >      int ret =3D 0;
>> >> > -    if (qemu_logfile) {
>> >> > +    QemuLogFile *logfile;
>> >> > +
>> >> > +    rcu_read_lock();
>> >> > +    logfile =3D atomic_rcu_read(&qemu_logfile);
>> >> > +    if (logfile) {
>> >> >          va_list ap;
>> >> >          va_start(ap, fmt);
>> >> > -        ret =3D vfprintf(qemu_logfile, fmt, ap);
>> >> > +        ret =3D vfprintf(logfile->fd, fmt, ap);
>> >> >          va_end(ap);
>> >> >
>> >> >          /* Don't pass back error results.  */
>> >> > @@ -48,6 +52,7 @@ int qemu_log(const char *fmt, ...)
>> >> >              ret =3D 0;
>> >> >          }
>> >> >      }
>> >> > +    rcu_read_unlock();
>> >> >      return ret;
>> >> >  }
>> >> >
>> >> > @@ -56,12 +61,24 @@ static void __attribute__((__constructor__)) qe=
mu_logfile_init(void)
>> >> >      qemu_mutex_init(&qemu_logfile_mutex);
>> >> >  }
>> >> >
>> >> > +static void qemu_logfile_free(QemuLogFile *logfile)
>> >> > +{
>> >> > +    g_assert(logfile);
>> >> > +
>> >> > +    if (logfile->fd !=3D stderr) {
>> >> > +        fclose(logfile->fd);
>> >> > +    }
>> >> > +    g_free(logfile);
>> >> > +}
>> >> > +
>> >> >  static bool log_uses_own_buffers;
>> >> >
>> >> >  /* enable or disable low levels log */
>> >> >  void qemu_set_log(int log_flags)
>> >> >  {
>> >> >      bool need_to_open_file =3D false;
>> >> > +    QemuLogFile *logfile;
>> >> > +
>> >> >      qemu_loglevel =3D log_flags;
>> >> >  #ifdef CONFIG_TRACE_LOG
>> >> >      qemu_loglevel |=3D LOG_TRACE;
>> >> > @@ -80,43 +97,47 @@ void qemu_set_log(int log_flags)
>> >> >      g_assert(qemu_logfile_mutex.initialized);
>> >> >      qemu_mutex_lock(&qemu_logfile_mutex);
>> >> >      if (qemu_logfile && !need_to_open_file) {
>> >> > -        qemu_mutex_unlock(&qemu_logfile_mutex);
>> >> > -        qemu_log_close();
>> >> > +        logfile =3D qemu_logfile;
>> >> > +        atomic_rcu_set(&qemu_logfile, NULL);
>> >> > +        call_rcu(logfile, qemu_logfile_free, rcu);
>> >> >      } else if (!qemu_logfile && need_to_open_file) {
>> >> > +        logfile =3D g_new0(QemuLogFile, 1);
>> >> >          if (logfilename) {
>> >> > -            qemu_logfile =3D fopen(logfilename, log_append ? "a" :=
 "w");
>> >> > -            if (!qemu_logfile) {
>> >> > +            logfile->fd =3D fopen(logfilename, log_append ? "a" : =
"w");
>> >> > +            if (!logfile->fd) {
>> >> > +                g_free(logfile);
>> >> >                  perror(logfilename);
>> >> >                  _exit(1);
>> >> >              }
>> >> >              /* In case we are a daemon redirect stderr to logfile =
*/
>> >> >              if (is_daemonized()) {
>> >> > -                dup2(fileno(qemu_logfile), STDERR_FILENO);
>> >> > -                fclose(qemu_logfile);
>> >> > +                dup2(fileno(logfile->fd), STDERR_FILENO);
>> >> > +                fclose(logfile->fd);
>> >> >                  /* This will skip closing logfile in qemu_log_clos=
e() */
>> >> > -                qemu_logfile =3D stderr;
>> >> > +                logfile->fd =3D stderr;
>> >> >              }
>> >> >          } else {
>> >> >              /* Default to stderr if no log file specified */
>> >> >              assert(!is_daemonized());
>> >> > -            qemu_logfile =3D stderr;
>> >> > +            logfile->fd =3D stderr;
>> >> >          }
>> >> >          /* must avoid mmap() usage of glibc by setting a buffer "b=
y hand" */
>> >> >          if (log_uses_own_buffers) {
>> >> >              static char logfile_buf[4096];
>> >> >
>> >> > -            setvbuf(qemu_logfile, logfile_buf, _IOLBF, sizeof(logf=
ile_buf));
>> >> > +            setvbuf(logfile->fd, logfile_buf, _IOLBF, sizeof(logfi=
le_buf));
>> >> >          } else {
>> >> >  #if defined(_WIN32)
>> >> >              /* Win32 doesn't support line-buffering, so use unbuff=
ered output. */
>> >> > -            setvbuf(qemu_logfile, NULL, _IONBF, 0);
>> >> > +            setvbuf(logfile->fd, NULL, _IONBF, 0);
>> >> >  #else
>> >> > -            setvbuf(qemu_logfile, NULL, _IOLBF, 0);
>> >> > +            setvbuf(logfile->fd, NULL, _IOLBF, 0);
>> >> >  #endif
>> >> >              log_append =3D 1;
>> >> >          }
>> >> > -        qemu_mutex_unlock(&qemu_logfile_mutex);
>> >> > +        atomic_rcu_set(&qemu_logfile, logfile);
>> >> >      }
>> >> > +    qemu_mutex_unlock(&qemu_logfile_mutex);
>> >> >  }
>> >> >
>> >> >  void qemu_log_needs_buffers(void)
>> >> > @@ -245,19 +266,28 @@ out:
>> >> >  /* fflush() the log file */
>> >> >  void qemu_log_flush(void)
>> >> >  {
>> >> > -    fflush(qemu_logfile);
>> >> > +    QemuLogFile *logfile;
>> >> > +
>> >> > +    rcu_read_lock();
>> >> > +    logfile =3D atomic_rcu_read(&qemu_logfile);
>> >> > +    if (logfile) {
>> >> > +        fflush(logfile->fd);
>> >> > +    }
>> >> > +    rcu_read_unlock();
>> >> >  }
>> >> >
>> >> >  /* Close the log file */
>> >> >  void qemu_log_close(void)
>> >> >  {
>> >> > +    QemuLogFile *logfile;
>> >> > +
>> >> >      g_assert(qemu_logfile_mutex.initialized);
>> >> >      qemu_mutex_lock(&qemu_logfile_mutex);
>> >> > -    if (qemu_logfile) {
>> >> > -        if (qemu_logfile !=3D stderr) {
>> >> > -            fclose(qemu_logfile);
>> >> > -        }
>> >> > -        qemu_logfile =3D NULL;
>> >> > +    logfile =3D qemu_logfile;
>> >> > +
>> >> > +    if (logfile) {
>> >> > +        atomic_rcu_set(&qemu_logfile, NULL);
>> >> > +        call_rcu(logfile, qemu_logfile_free, rcu);
>> >> >      }
>> >> >      qemu_mutex_unlock(&qemu_logfile_mutex);
>> >> >  }
>> >> >  diff --git a/include/exec/log.h b/include/exec/log.h
>> >> > index e2cfd436e6..9bd1e4aa20 100644
>> >> > --- a/include/exec/log.h
>> >> > +++ b/include/exec/log.h
>> >> > @@ -15,8 +15,15 @@
>> >> >   */
>> >> >  static inline void log_cpu_state(CPUState *cpu, int flags)
>> >> >  {
>> >> > +    QemuLogFile *logfile;
>> >> > +
>> >> >      if (qemu_log_enabled()) {
>> >> > -        cpu_dump_state(cpu, qemu_logfile, flags);
>> >> > +        rcu_read_lock();
>> >> > +        logfile =3D atomic_rcu_read(&qemu_logfile);
>> >> > +        if (logfile) {
>> >> > +            cpu_dump_state(cpu, logfile->fd, flags);
>> >> > +        }
>> >> > +        rcu_read_unlock();
>> >> >      }
>> >> >  }
>> >> >
>> >> > @@ -40,19 +47,37 @@ static inline void log_cpu_state_mask(int mask,=
 CPUState *cpu, int flags)
>> >> >  static inline void log_target_disas(CPUState *cpu, target_ulong st=
art,
>> >> >                                      target_ulong len)
>> >> >  {
>> >> > -    target_disas(qemu_logfile, cpu, start, len);
>> >> > +    QemuLogFile *logfile;
>> >> > +    rcu_read_lock();
>> >> > +    logfile =3D atomic_rcu_read(&qemu_logfile);
>> >> > +    if (logfile) {
>> >> > +        target_disas(logfile->fd, cpu, start, len);
>> >> > +    }
>> >> > +    rcu_read_unlock();
>> >> >  }
>> >> >
>> >> >  static inline void log_disas(void *code, unsigned long size)
>> >> >  {
>> >> > -    disas(qemu_logfile, code, size);
>> >> > +    QemuLogFile *logfile;
>> >> > +    rcu_read_lock();
>> >> > +    logfile =3D atomic_rcu_read(&qemu_logfile);
>> >> > +    if (logfile) {
>> >> > +        disas(logfile->fd, code, size);
>> >> > +    }
>> >> > +    rcu_read_unlock();
>> >> >  }
>> >> >
>> >> >  #if defined(CONFIG_USER_ONLY)
>> >> >  /* page_dump() output to the log file: */
>> >> >  static inline void log_page_dump(void)
>> >> >  {
>> >> > -    page_dump(qemu_logfile);
>> >> > +    QemuLogFile *logfile;
>> >> > +    rcu_read_lock();
>> >> > +    logfile =3D atomic_rcu_read(&qemu_logfile);
>> >> > +    if (logfile) {
>> >> > +        page_dump(logfile->fd);
>> >> > +    }
>> >> > +    rcu_read_unlock();
>> >> >  }
>> >> >  #endif
>> >> >  #endif
>> >> > diff --git a/tcg/tcg.c b/tcg/tcg.c
>> >> > index 0511266d85..4f616ba38b 100644
>> >> > --- a/tcg/tcg.c
>> >> > +++ b/tcg/tcg.c
>> >> > @@ -2114,9 +2114,17 @@ static void tcg_dump_ops(TCGContext *s, bool=
 have_prefs)
>> >> >          }
>> >> >
>> >> >          if (have_prefs || op->life) {
>> >> > -            for (; col < 40; ++col) {
>> >> > -                putc(' ', qemu_logfile);
>> >> > +
>> >> > +            QemuLogFile *logfile;
>> >> > +
>> >> > +            rcu_read_lock();
>> >> > +            logfile =3D atomic_rcu_read(&qemu_logfile);
>> >> > +            if (logfile) {
>> >> > +                for (; col < 40; ++col) {
>> >> > +                    putc(' ', logfile->fd);
>> >> > +                }
>> >> >              }
>> >> > +            rcu_read_unlock();
>> >> >          }
>> >> >
>> >> >          if (op->life) {
>> >>
>> >>
>> >> --
>> >> Alex Benn=C3=A9e
>>
>>
>> --
>> Alex Benn=C3=A9e


--
Alex Benn=C3=A9e

