Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365DC3D2BB1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:06:18 +0200 (CEST)
Received: from localhost ([::1]:41548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6d5N-0001OQ-6w
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m6cu1-0001rH-Jx
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:54:33 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:41958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1m6ctz-0003Dw-QB
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:54:33 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so429913pjd.0
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ABg6sxjB41yOqC18gC8nhZ0JmS9ZOitjUJPX2NO9wWY=;
 b=gmxphB+iaDdC80Oay3lQmuHiZCRHjOIQOzJDwQ/wKn9A2BvD6oYyEaqyB16or3TRvu
 0PdtTirBK1Fxz89FW+ygWEjZP8EEFARckClBDD0d5ycgo6NUfqnsltDWU3/+CXdOsTDt
 YW4EwYahi18VLWHZG0veA5MkCEb73dAUtJZR0cWT9IRRfCD3cGEYQUvOcLYOVWY1j8kV
 zsgAHve7IEK0aZbqEsj/VIIVtMcuPyfZ7M7pjXP/+tODb4laBuTe0L0ges5j5hblQXPg
 4oH8kI8hGmKzTECeFvujr4HefnSUmN76MsQoStCzMEG6KKsD++wf9HHLN2dgtEZjGIKo
 db6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ABg6sxjB41yOqC18gC8nhZ0JmS9ZOitjUJPX2NO9wWY=;
 b=cZH7lEAzp6a6hfScRfjDgfN1UMfjDiLbOiNU0RA66ddQox5X0ZVo52JObWljYmCZ6y
 3KTsokWQPVDxdUoHom4V79Pn7OIvRO1E8FyAeg36uoIfjhQ+7zB6uCCEmVKVZodfd+gl
 wGyL21h8qZQG+OEIYpiPXwng2VJwnOagAkd+bUOalnI4dzHKU+3RmdL0ek2g+PoeSYB4
 HI/8l+m1ZKpSw1uJTJocxQhscF1iKnojwgAVQQgGmGoqSxxWRz/XAGz/N2mPZUC7RvGc
 ABexKwSKlRlXOONi2RltffKhyPb7KwWDSooxd3RRzVXF7Akzanq7dDb8nLoh3Gf5cy5i
 IiQA==
X-Gm-Message-State: AOAM5326WNCq7XhjQrqqfOEA30C5bpxIK2PcOQFeqHa6p1w2+OwsDdlH
 rmCU40F+2/UEr54GDG3vbc1kgA==
X-Google-Smtp-Source: ABdhPJwUnBn/32a0s2+Kxy2hlVReYrtiSnmRz82edxjpL5eG3tssFDFhPXtJR+hQk2kqDD38XYSdfw==
X-Received: by 2002:a63:1309:: with SMTP id i9mr1093575pgl.216.1626976470098; 
 Thu, 22 Jul 2021 10:54:30 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id t3sm6369452pfd.153.2021.07.22.10.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:54:26 -0700 (PDT)
Date: Thu, 22 Jul 2021 11:54:24 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 3/4] vhost-user-rng: backend: Add RNG vhost-user
 daemon implementation
Message-ID: <20210722175424.GB2446676@p14s>
References: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
 <20210710005929.1702431-4-mathieu.poirier@linaro.org>
 <87fsw7xw2s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsw7xw2s.fsf@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102d.google.com
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

On Wed, Jul 21, 2021 at 09:14:31PM +0100, Alex Bennée wrote:
> 
> Mathieu Poirier <mathieu.poirier@linaro.org> writes:
> 
> > This patch provides the vhost-user backend implementation to work
> > in tandem with the vhost-user-rng implementation of the QEMU VMM.
> >
> > It uses the vhost-user API so that other VMM can re-use the interface
> > without having to write the driver again.
> >
> > Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> 
> Try the following patch which creates a nested main loop and runs it
> until the g_timeout_add fires again.
> 
> --8<---------------cut here---------------start------------->8---
> tools/virtio/vhost-user-rng: avoid mutex by using nested main loop
> 
> As we are blocking anyway all we really need to do is run a main loop
> until the timer fires and the data is consumed.
> 

Right, I made the implemenation blocking to be as close as possible to what
virtio-rng does.

I took a look at your patch below and it should do the trick.  Testing yielded
the same results as my solution so this is good.  To me the nested loop is a
little unorthodox to solve this kind of problem but it has less lines of code
and avoids spinning a new thread to deal with the timer.

I'll send another revision.

Thanks for the review,
Mathieu

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> 1 file changed, 30 insertions(+), 76 deletions(-)
> tools/vhost-user-rng/main.c | 106 +++++++++++++-------------------------------
> 
> modified   tools/vhost-user-rng/main.c
> @@ -42,13 +42,10 @@
>  
>  typedef struct {
>      VugDev dev;
> -    struct itimerspec ts;
> -    timer_t rate_limit_timer;
> -    pthread_mutex_t rng_mutex;
> -    pthread_cond_t rng_cond;
>      int64_t quota_remaining;
> -    bool activate_timer;
> +    guint timer;
>      GMainLoop *loop;
> +    GMainLoop *blocked;
>  } VuRNG;
>  
>  static gboolean print_cap, verbose;
> @@ -59,66 +56,26 @@ static gint source_fd, socket_fd = -1;
>  static uint32_t period_ms = 1 << 16;
>  static uint64_t max_bytes = INT64_MAX;
>  
> -static void check_rate_limit(union sigval sv)
> +static gboolean check_rate_limit(gpointer user_data)
>  {
> -    VuRNG *rng = sv.sival_ptr;
> -    bool wakeup = false;
> +    VuRNG *rng = (VuRNG *) user_data;
>  
> -    pthread_mutex_lock(&rng->rng_mutex);
> -    /*
> -     * The timer has expired and the guest has used all available
> -     * entropy, which means function vu_rng_handle_request() is waiting
> -     * on us.  As such wake it up once we're done here.
> -     */
> -    if (rng->quota_remaining == 0) {
> -        wakeup = true;
> +    if (rng->blocked) {
> +        g_info("%s: called while blocked", __func__);
> +        g_main_loop_quit(rng->blocked);
>      }
> -
>      /*
>       * Reset the entropy available to the guest and tell function
>       * vu_rng_handle_requests() to start the timer before using it.
>       */
>      rng->quota_remaining = max_bytes;
> -    rng->activate_timer = true;
> -    pthread_mutex_unlock(&rng->rng_mutex);
> -
> -    if (wakeup) {
> -        pthread_cond_signal(&rng->rng_cond);
> -    }
> -}
> -
> -static void setup_timer(VuRNG *rng)
> -{
> -    struct sigevent sev;
> -    int ret;
> -
> -    memset(&rng->ts, 0, sizeof(struct itimerspec));
> -    rng->ts.it_value.tv_sec = period_ms / 1000;
> -    rng->ts.it_value.tv_nsec = (period_ms % 1000) * 1000000;
> -
> -    /*
> -     * Call function check_rate_limit() as if it was the start of
> -     * a new thread when the timer expires.
> -     */
> -    sev.sigev_notify = SIGEV_THREAD;
> -    sev.sigev_notify_function = check_rate_limit;
> -    sev.sigev_value.sival_ptr = rng;
> -    /* Needs to be NULL if defaults attributes are to be used. */
> -    sev.sigev_notify_attributes = NULL;
> -    ret = timer_create(CLOCK_MONOTONIC, &sev, &rng->rate_limit_timer);
> -    if (ret < 0) {
> -        fprintf(stderr, "timer_create() failed\n");
> -    }
> -
> +    return true;
>  }
>  
> -
>  /* Virtio helpers */
>  static uint64_t rng_get_features(VuDev *dev)
>  {
> -    if (verbose) {
> -        g_info("%s: replying", __func__);
> -    }
> +    g_info("%s: replying", __func__);
>      return 0;
>  }
>  
> @@ -137,7 +94,7 @@ static void vu_rng_handle_requests(VuDev *dev, int qidx)
>      VuVirtq *vq = vu_get_queue(dev, qidx);
>      VuVirtqElement *elem;
>      size_t to_read;
> -    int len, ret;
> +    int len;
>  
>      for (;;) {
>          /* Get element in the vhost virtqueue */
> @@ -149,24 +106,21 @@ static void vu_rng_handle_requests(VuDev *dev, int qidx)
>          /* Get the amount of entropy to read from the vhost server */
>          to_read = elem->in_sg[0].iov_len;
>  
> -        pthread_mutex_lock(&rng->rng_mutex);
> -
>          /*
>           * We have consumed all entropy available for this time slice.
>           * Wait for the timer (check_rate_limit()) to tell us about the
>           * start of a new time slice.
>           */
>          if (rng->quota_remaining == 0) {
> -            pthread_cond_wait(&rng->rng_cond, &rng->rng_mutex);
> -        }
> -
> -        /* Start the timer if the last time slice has expired */
> -        if (rng->activate_timer == true) {
> -            rng->activate_timer = false;
> -            ret = timer_settime(rng->rate_limit_timer, 0, &rng->ts, NULL);
> -            if (ret < 0) {
> -                fprintf(stderr, "timer_settime() failed\n");
> -            }
> +            g_assert(!rng->blocked);
> +            rng->blocked = g_main_loop_new(g_main_loop_get_context(rng->loop), false);
> +            g_info("attempting to consume %ld bytes but no quota left (%s)",
> +                   to_read,
> +                   g_main_loop_is_running(rng->loop) ? "running" : "not running");
> +            g_main_loop_run(rng->blocked);
> +            g_info("return from blocked loop: %ld", rng->quota_remaining);
> +            g_main_loop_unref(rng->blocked);
> +            rng->blocked = false;
>          }
>  
>          /* Make sure we don't read more than it's available */
> @@ -183,8 +137,6 @@ static void vu_rng_handle_requests(VuDev *dev, int qidx)
>  
>          rng->quota_remaining -= len;
>  
> -        pthread_mutex_unlock(&rng->rng_mutex);
> -
>          vu_queue_push(dev, vq, elem, len);
>          free(elem);
>      }
> @@ -373,6 +325,7 @@ int main(int argc, char *argv[])
>       * can add it's GSource watches.
>       */
>      rng.loop = g_main_loop_new(NULL, FALSE);
> +    rng.blocked = NULL;
>  
>      if (!vug_init(&rng.dev, 1, g_socket_get_fd(socket),
>                    panic, &vuiface)) {
> @@ -380,24 +333,25 @@ int main(int argc, char *argv[])
>          exit(EXIT_FAILURE);
>      }
>  
> -    rng.quota_remaining = max_bytes;
> -    rng.activate_timer = true;
> -    pthread_mutex_init(&rng.rng_mutex, NULL);
> -    pthread_cond_init(&rng.rng_cond, NULL);
> -    setup_timer(&rng);
> -
>      if (verbose) {
> -        g_info("period_ms: %d tv_sec: %ld tv_nsec: %lu\n",
> -               period_ms, rng.ts.it_value.tv_sec, rng.ts.it_value.tv_nsec);
> +        g_log_set_handler(NULL, G_LOG_LEVEL_MASK, g_log_default_handler, NULL);
> +        g_setenv("G_MESSAGES_DEBUG", "all", true);
> +    } else {
> +        g_log_set_handler(NULL,
> +                          G_LOG_LEVEL_WARNING | G_LOG_LEVEL_CRITICAL | G_LOG_LEVEL_ERROR,
> +                          g_log_default_handler, NULL);
>      }
>  
> +    rng.quota_remaining = max_bytes;
> +    rng.timer = g_timeout_add(period_ms, check_rate_limit, &rng);
> +    g_info("period_ms: %"PRId32", timer %d\n", period_ms, rng.timer);
> +
>      g_message("entering main loop, awaiting messages");
>      g_main_loop_run(rng.loop);
>      g_message("finished main loop, cleaning up");
>  
>      g_main_loop_unref(rng.loop);
>      vug_deinit(&rng.dev);
> -    timer_delete(rng.rate_limit_timer);
>      close(source_fd);
>      unlink(socket_path);
>  }
> --8<---------------cut here---------------end--------------->8---
> 
> -- 
> Alex Bennée

