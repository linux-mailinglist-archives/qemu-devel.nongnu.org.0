Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90363D37B4
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 11:30:25 +0200 (CEST)
Received: from localhost ([::1]:41596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6rVg-0005A4-QJ
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 05:30:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6rUW-0004TX-Jq
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:29:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6rUU-0001A7-9z
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 05:29:12 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 k14-20020a05600c1c8eb02901f13dd1672aso3871650wms.0
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=P0hDcbf1v+K0iyK2xaUGAQvE4efogcSXn19PvRIgwnw=;
 b=LbYmRoLpzTJ3zwLtprwPXvn6tLvcVVXDjbpdRbaY5I0F/16vmHeYO8xb/CNJfVLDkO
 v8SJmPcHc2UKpqvYKiqfj0yLZdBEf+sgz6C7NZHQW4vAPAnyNIG0KcOvhCUIxnuZhTOz
 XrRZeheL8YbycoLHC++TJrmSdQMOr2OKZnDPFSqSHnbOaTaS9Xl6tnepRam/EKg5COJO
 w9qedq1kVmeRU8DXQv5FfHzQBkpnbqq4vuaZcJRFZqOOnF/zH2AZFM2wX8uvXT6tKkmE
 R9mXohI3PZBAE0iIjDkdjZ6vwsnOwAUJNwTbjeOmbD+xJty6pft2pr+WfdbxR4MRgmbx
 bd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=P0hDcbf1v+K0iyK2xaUGAQvE4efogcSXn19PvRIgwnw=;
 b=mu7ibW7vBPbuIgHKqBRNfX+ZtCP0VQw9PELECQZrIo5ms4Q3An9k7btepdHPljvxJa
 U8y0mXX4/ITpoDV9+HxtY6QrrIDF3BKpvoTlZrl1V/npQzqw5ACjF6HXpsQcQMHOU7hj
 gMCk3CpYoPeVHQaKEKkGxx0TuYjLIYXn+vK3vwEQIyaTkz5+2axNiidauYxpO8p++4Z/
 kB7t0Gy7ZILWboUclhUXjs5SNUvrRqp8Ihu4XmdIOjFvMbCef0UUjRFIYSEiuB2tHbjQ
 vx3uO+BbO+c0v53UAyoqCMshavHMigw/xDTTe6SNAwLGthi72mBmSzbuJjW2b1YxZnDv
 /viQ==
X-Gm-Message-State: AOAM532K7loKk/R24HEqPg19uYv6FMC7gSk1STf9u5ZhUYTnRolbktg5
 dNJzyDVDdljVoO10J2+NHAaq1A==
X-Google-Smtp-Source: ABdhPJx02QXuwiKpXrXbck0TaX2HrBtDE/1VP0x0OEtoS10ZkYrY4P8dcYEUQR36tNx2xL9puHwTGQ==
X-Received: by 2002:a1c:3505:: with SMTP id c5mr12949680wma.53.1627032547481; 
 Fri, 23 Jul 2021 02:29:07 -0700 (PDT)
Received: from zen.linaroharston ([213.205.198.234])
 by smtp.gmail.com with ESMTPSA id o18sm32337782wrx.21.2021.07.23.02.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 02:29:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 915861FF7E;
 Fri, 23 Jul 2021 10:29:03 +0100 (BST)
References: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
 <20210710005929.1702431-4-mathieu.poirier@linaro.org>
 <87fsw7xw2s.fsf@linaro.org> <20210722175424.GB2446676@p14s>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 3/4] vhost-user-rng: backend: Add RNG vhost-user
 daemon implementation
Date: Fri, 23 Jul 2021 10:01:48 +0100
In-reply-to: <20210722175424.GB2446676@p14s>
Message-ID: <87eebpfkf4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mathieu Poirier <mathieu.poirier@linaro.org> writes:

> On Wed, Jul 21, 2021 at 09:14:31PM +0100, Alex Benn=C3=A9e wrote:
>>=20
>> Mathieu Poirier <mathieu.poirier@linaro.org> writes:
>>=20
>> > This patch provides the vhost-user backend implementation to work
>> > in tandem with the vhost-user-rng implementation of the QEMU VMM.
>> >
>> > It uses the vhost-user API so that other VMM can re-use the interface
>> > without having to write the driver again.
>> >
>> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>=20
>> Try the following patch which creates a nested main loop and runs it
>> until the g_timeout_add fires again.
>>=20
>> --8<---------------cut here---------------start------------->8---
>> tools/virtio/vhost-user-rng: avoid mutex by using nested main loop
>>=20
>> As we are blocking anyway all we really need to do is run a main loop
>> until the timer fires and the data is consumed.
>>=20
>
> Right, I made the implemenation blocking to be as close as possible to wh=
at
> virtio-rng does.
>
> I took a look at your patch below and it should do the trick.  Testing yi=
elded
> the same results as my solution so this is good.  To me the nested loop i=
s a
> little unorthodox to solve this kind of problem but it has less lines of =
code
> and avoids spinning a new thread to deal with the timer.

It might be worth considering just running a g_main_context_iteration()
of the main loop:

  https://developer.gnome.org/glib/stable/glib-The-Main-Event-Loop.html#g-m=
ain-context-iteration

and then you could avoid the hassle of having a special blocking loop
(and having to special case the quit). However you can't be sure the
quota has filled up so you need to test on the loop. My hack up (on top
of this patch):

--8<---------------cut here---------------start------------->8---
modified   tools/vhost-user-rng/main.c
@@ -45,7 +45,6 @@ typedef struct {
     int64_t quota_remaining;
     guint timer;
     GMainLoop *loop;
-    GMainLoop *blocked;
 } VuRNG;
=20
 static gboolean print_cap, verbose;
@@ -59,10 +58,8 @@ static uint64_t max_bytes =3D INT64_MAX;
 static gboolean check_rate_limit(gpointer user_data)
 {
     VuRNG *rng =3D (VuRNG *) user_data;
-
-    if (rng->blocked) {
-        g_info("%s: called while blocked", __func__);
-        g_main_loop_quit(rng->blocked);
+    if (!rng->quota_remaining) {
+        g_info("%s: replenishing empty quota", __func__);
     }
     /*
      * Reset the entropy available to the guest and tell function
@@ -112,15 +109,12 @@ static void vu_rng_handle_requests(VuDev *dev, int qi=
dx)
          * start of a new time slice.
          */
         if (rng->quota_remaining =3D=3D 0) {
-            g_assert(!rng->blocked);
-            rng->blocked =3D g_main_loop_new(g_main_loop_get_context(rng->=
loop), false);
-            g_info("attempting to consume %ld bytes but no quota left (%s)=
",
-                   to_read,
-                   g_main_loop_is_running(rng->loop) ? "running" : "not ru=
nning");
-            g_main_loop_run(rng->blocked);
-            g_info("return from blocked loop: %ld", rng->quota_remaining);
-            g_main_loop_unref(rng->blocked);
-            rng->blocked =3D false;
+            g_info("blocking on consuming %ld bytes as no quota", to_read);
+            do {
+                g_main_context_iteration(g_main_loop_get_context(rng->loop=
),
+                                         true);
+                g_info("return from blocked loop: %ld", rng->quota_remaini=
ng);
+            } while (!rng->quota_remaining);
         }
=20
         /* Make sure we don't read more than it's available */
@@ -325,7 +319,6 @@ int main(int argc, char *argv[])
      * can add it's GSource watches.
      */
     rng.loop =3D g_main_loop_new(NULL, FALSE);
-    rng.blocked =3D NULL;
=20
     if (!vug_init(&rng.dev, 1, g_socket_get_fd(socket),
                   panic, &vuiface)) {
--8<---------------cut here---------------end--------------->8---

And then with:

  10:24 root@buster/aarch64  [~] >dd if=3D/dev/hwrng of=3D/dev/null status=
=3Dprogress
  77312 bytes (77 kB, 76 KiB) copied, 150 s, 0.5 kB/s

and:

  ./tools/vhost-user-rng/vhost-user-rng --socket-path vrng.sock -v -m 512 -=
p 1000

I was seeing:

  vhost-user-rng-INFO: 10:27:14.453: blocking on consuming 64 bytes as no q=
uota
  vhost-user-rng-INFO: 10:27:14.453: return from blocked loop: 0
  vhost-user-rng-INFO: 10:27:15.451: check_rate_limit: replenishing empty q=
uota
  vhost-user-rng-INFO: 10:27:15.451: return from blocked loop: 512
  vhost-user-rng-INFO: 10:27:15.457: blocking on consuming 64 bytes as no q=
uota
  vhost-user-rng-INFO: 10:27:15.457: return from blocked loop: 0
  vhost-user-rng-INFO: 10:27:16.453: check_rate_limit: replenishing empty q=
uota
  vhost-user-rng-INFO: 10:27:16.453: return from blocked loop: 512
  vhost-user-rng-INFO: 10:27:16.456: blocking on consuming 64 bytes as no q=
uota
  vhost-user-rng-INFO: 10:27:16.456: return from blocked loop: 0
  vhost-user-rng-INFO: 10:27:17.454: check_rate_limit: replenishing empty q=
uota
  vhost-user-rng-INFO: 10:27:17.454: return from blocked loop: 512
  vhost-user-rng-INFO: 10:27:17.456: blocking on consuming 64 bytes as no q=
uota
  vhost-user-rng-INFO: 10:27:17.456: return from blocked loop: 0

which seemed reasonable enough...

>
> I'll send another revision.
>
> Thanks for the review,
> Mathieu
>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>> 1 file changed, 30 insertions(+), 76 deletions(-)
>> tools/vhost-user-rng/main.c | 106 +++++++++++++-------------------------=
------
>>=20
>> modified   tools/vhost-user-rng/main.c
>> @@ -42,13 +42,10 @@
>>=20=20
>>  typedef struct {
>>      VugDev dev;
>> -    struct itimerspec ts;
>> -    timer_t rate_limit_timer;
>> -    pthread_mutex_t rng_mutex;
>> -    pthread_cond_t rng_cond;
>>      int64_t quota_remaining;
>> -    bool activate_timer;
>> +    guint timer;
>>      GMainLoop *loop;
>> +    GMainLoop *blocked;
>>  } VuRNG;
>>=20=20
>>  static gboolean print_cap, verbose;
>> @@ -59,66 +56,26 @@ static gint source_fd, socket_fd =3D -1;
>>  static uint32_t period_ms =3D 1 << 16;
>>  static uint64_t max_bytes =3D INT64_MAX;
>>=20=20
>> -static void check_rate_limit(union sigval sv)
>> +static gboolean check_rate_limit(gpointer user_data)
>>  {
>> -    VuRNG *rng =3D sv.sival_ptr;
>> -    bool wakeup =3D false;
>> +    VuRNG *rng =3D (VuRNG *) user_data;
>>=20=20
>> -    pthread_mutex_lock(&rng->rng_mutex);
>> -    /*
>> -     * The timer has expired and the guest has used all available
>> -     * entropy, which means function vu_rng_handle_request() is waiting
>> -     * on us.  As such wake it up once we're done here.
>> -     */
>> -    if (rng->quota_remaining =3D=3D 0) {
>> -        wakeup =3D true;
>> +    if (rng->blocked) {
>> +        g_info("%s: called while blocked", __func__);
>> +        g_main_loop_quit(rng->blocked);
>>      }
>> -
>>      /*
>>       * Reset the entropy available to the guest and tell function
>>       * vu_rng_handle_requests() to start the timer before using it.
>>       */
>>      rng->quota_remaining =3D max_bytes;
>> -    rng->activate_timer =3D true;
>> -    pthread_mutex_unlock(&rng->rng_mutex);
>> -
>> -    if (wakeup) {
>> -        pthread_cond_signal(&rng->rng_cond);
>> -    }
>> -}
>> -
>> -static void setup_timer(VuRNG *rng)
>> -{
>> -    struct sigevent sev;
>> -    int ret;
>> -
>> -    memset(&rng->ts, 0, sizeof(struct itimerspec));
>> -    rng->ts.it_value.tv_sec =3D period_ms / 1000;
>> -    rng->ts.it_value.tv_nsec =3D (period_ms % 1000) * 1000000;
>> -
>> -    /*
>> -     * Call function check_rate_limit() as if it was the start of
>> -     * a new thread when the timer expires.
>> -     */
>> -    sev.sigev_notify =3D SIGEV_THREAD;
>> -    sev.sigev_notify_function =3D check_rate_limit;
>> -    sev.sigev_value.sival_ptr =3D rng;
>> -    /* Needs to be NULL if defaults attributes are to be used. */
>> -    sev.sigev_notify_attributes =3D NULL;
>> -    ret =3D timer_create(CLOCK_MONOTONIC, &sev, &rng->rate_limit_timer);
>> -    if (ret < 0) {
>> -        fprintf(stderr, "timer_create() failed\n");
>> -    }
>> -
>> +    return true;
>>  }
>>=20=20
>> -
>>  /* Virtio helpers */
>>  static uint64_t rng_get_features(VuDev *dev)
>>  {
>> -    if (verbose) {
>> -        g_info("%s: replying", __func__);
>> -    }
>> +    g_info("%s: replying", __func__);
>>      return 0;
>>  }
>>=20=20
>> @@ -137,7 +94,7 @@ static void vu_rng_handle_requests(VuDev *dev, int qi=
dx)
>>      VuVirtq *vq =3D vu_get_queue(dev, qidx);
>>      VuVirtqElement *elem;
>>      size_t to_read;
>> -    int len, ret;
>> +    int len;
>>=20=20
>>      for (;;) {
>>          /* Get element in the vhost virtqueue */
>> @@ -149,24 +106,21 @@ static void vu_rng_handle_requests(VuDev *dev, int=
 qidx)
>>          /* Get the amount of entropy to read from the vhost server */
>>          to_read =3D elem->in_sg[0].iov_len;
>>=20=20
>> -        pthread_mutex_lock(&rng->rng_mutex);
>> -
>>          /*
>>           * We have consumed all entropy available for this time slice.
>>           * Wait for the timer (check_rate_limit()) to tell us about the
>>           * start of a new time slice.
>>           */
>>          if (rng->quota_remaining =3D=3D 0) {
>> -            pthread_cond_wait(&rng->rng_cond, &rng->rng_mutex);
>> -        }
>> -
>> -        /* Start the timer if the last time slice has expired */
>> -        if (rng->activate_timer =3D=3D true) {
>> -            rng->activate_timer =3D false;
>> -            ret =3D timer_settime(rng->rate_limit_timer, 0, &rng->ts, N=
ULL);
>> -            if (ret < 0) {
>> -                fprintf(stderr, "timer_settime() failed\n");
>> -            }
>> +            g_assert(!rng->blocked);
>> +            rng->blocked =3D g_main_loop_new(g_main_loop_get_context(rn=
g->loop), false);
>> +            g_info("attempting to consume %ld bytes but no quota left (=
%s)",
>> +                   to_read,
>> +                   g_main_loop_is_running(rng->loop) ? "running" : "not=
 running");
>> +            g_main_loop_run(rng->blocked);
>> +            g_info("return from blocked loop: %ld", rng->quota_remainin=
g);
>> +            g_main_loop_unref(rng->blocked);
>> +            rng->blocked =3D false;
>>          }
>>=20=20
>>          /* Make sure we don't read more than it's available */
>> @@ -183,8 +137,6 @@ static void vu_rng_handle_requests(VuDev *dev, int q=
idx)
>>=20=20
>>          rng->quota_remaining -=3D len;
>>=20=20
>> -        pthread_mutex_unlock(&rng->rng_mutex);
>> -
>>          vu_queue_push(dev, vq, elem, len);
>>          free(elem);
>>      }
>> @@ -373,6 +325,7 @@ int main(int argc, char *argv[])
>>       * can add it's GSource watches.
>>       */
>>      rng.loop =3D g_main_loop_new(NULL, FALSE);
>> +    rng.blocked =3D NULL;
>>=20=20
>>      if (!vug_init(&rng.dev, 1, g_socket_get_fd(socket),
>>                    panic, &vuiface)) {
>> @@ -380,24 +333,25 @@ int main(int argc, char *argv[])
>>          exit(EXIT_FAILURE);
>>      }
>>=20=20
>> -    rng.quota_remaining =3D max_bytes;
>> -    rng.activate_timer =3D true;
>> -    pthread_mutex_init(&rng.rng_mutex, NULL);
>> -    pthread_cond_init(&rng.rng_cond, NULL);
>> -    setup_timer(&rng);
>> -
>>      if (verbose) {
>> -        g_info("period_ms: %d tv_sec: %ld tv_nsec: %lu\n",
>> -               period_ms, rng.ts.it_value.tv_sec, rng.ts.it_value.tv_ns=
ec);
>> +        g_log_set_handler(NULL, G_LOG_LEVEL_MASK, g_log_default_handler=
, NULL);
>> +        g_setenv("G_MESSAGES_DEBUG", "all", true);
>> +    } else {
>> +        g_log_set_handler(NULL,
>> +                          G_LOG_LEVEL_WARNING | G_LOG_LEVEL_CRITICAL | =
G_LOG_LEVEL_ERROR,
>> +                          g_log_default_handler, NULL);
>>      }
>>=20=20
>> +    rng.quota_remaining =3D max_bytes;
>> +    rng.timer =3D g_timeout_add(period_ms, check_rate_limit, &rng);
>> +    g_info("period_ms: %"PRId32", timer %d\n", period_ms, rng.timer);
>> +
>>      g_message("entering main loop, awaiting messages");
>>      g_main_loop_run(rng.loop);
>>      g_message("finished main loop, cleaning up");
>>=20=20
>>      g_main_loop_unref(rng.loop);
>>      vug_deinit(&rng.dev);
>> -    timer_delete(rng.rate_limit_timer);
>>      close(source_fd);
>>      unlink(socket_path);
>>  }
>> --8<---------------cut here---------------end--------------->8---
>>=20
>> --=20
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

