Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E91F3D0E14
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 13:49:05 +0200 (CEST)
Received: from localhost ([::1]:53852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Aim-0002l0-8E
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 07:49:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6AeO-0006NA-3k
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:44:34 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6AeM-0008SL-4K
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 07:44:31 -0400
Received: by mail-wm1-x330.google.com with SMTP id l6so1167438wmq.0
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 04:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=tyoP5EpHHepJuZVE4pZdiQzhwpztUkR/a7t0lmxEcEM=;
 b=bC+OaHEv2HJvo21+u9tJWtc91YdQWgRCNwv/vXoYx74jCFpGxAV99KuH5zD2xjd1+t
 tJd/2FfKAupUvoEElNJCgBNpW5150taZT6WjSNJOQx6FDxMeM8k4HGWgysqgOwmjqegx
 fmoVkMaRyaw3H507xsE3DL/ZL8vcu1fhkKBhIOdZiCkqJMCJ9QVJsLQ0naX686gKOmqL
 y3qk4Zmjr1MfgqHxUQ43E13/w/IiKA0cAKYLUXJrS5B00h+RdNxkBSpjPrJ1xJ8g/8h5
 vzqUiG9qZsIpKHGjRz+LzLpm3SnYbK8dr1yPOfvfePkfK0GkdegeyCHKsrCrO+eNtL7C
 r30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=tyoP5EpHHepJuZVE4pZdiQzhwpztUkR/a7t0lmxEcEM=;
 b=lFtB4uaooIMnPBxSzu1EEaUV4nw/jmoTzvl2YaPW/OjoG95mLeCKLPyBNtjHk8bRa9
 4a/KaYClq3DM4RsErGKpKAeFWHJODrMGiSrXeKxhKEw5b6mXWnGIlNq83SUzlfhPdGi2
 4qUOnCMz1MRSsxAUYGzR0ZLT93bHRjQRPR4D1VVep1Vlb1iAQ0eSEsKs9g8+ymT0TzUG
 ds9VddH7GzsBvdoRXCdAP1Q2mtlVpEfkR2Z0GjI0hGLkgIuOuw1ONZSytbToaHAvDS6j
 Yv/NH2RwNQZssMjWQE5NTXrt4dvv2jgOekHc4GbqaxudQNXlE37+/LitPu0I50rbNks/
 kJ5w==
X-Gm-Message-State: AOAM530Mto+PiYm6Eb2UnIEAkC82bCOrU7WyN2uXMaHrSy1a/KDZwsrZ
 2SBfE38ifufFW1pgcu75pqTEEw==
X-Google-Smtp-Source: ABdhPJxEs27jYKXdesgIDEGIVkMt/I70SfqN3p+IYitK0OURPlHcSPcGcu35oppEdDDkdM0AXBqupQ==
X-Received: by 2002:a05:600c:364c:: with SMTP id
 y12mr3596362wmq.78.1626867867288; 
 Wed, 21 Jul 2021 04:44:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w15sm1414277wmi.3.2021.07.21.04.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 04:44:26 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D9B0E1FF7E;
 Wed, 21 Jul 2021 12:44:25 +0100 (BST)
References: <20210710005929.1702431-1-mathieu.poirier@linaro.org>
 <20210710005929.1702431-4-mathieu.poirier@linaro.org>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 3/4] vhost-user-rng: backend: Add RNG vhost-user
 daemon implementation
Date: Wed, 21 Jul 2021 12:30:40 +0100
In-reply-to: <20210710005929.1702431-4-mathieu.poirier@linaro.org>
Message-ID: <875yx3lwme.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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

> This patch provides the vhost-user backend implementation to work
> in tandem with the vhost-user-rng implementation of the QEMU VMM.
>
> It uses the vhost-user API so that other VMM can re-use the interface
> without having to write the driver again.
>
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  tools/meson.build                        |   8 +
>  tools/vhost-user-rng/50-qemu-rng.json.in |   5 +
>  tools/vhost-user-rng/main.c              | 403 +++++++++++++++++++++++
>  tools/vhost-user-rng/meson.build         |  10 +
>  4 files changed, 426 insertions(+)
>  create mode 100644 tools/vhost-user-rng/50-qemu-rng.json.in
>  create mode 100644 tools/vhost-user-rng/main.c
>  create mode 100644 tools/vhost-user-rng/meson.build
>
> diff --git a/tools/meson.build b/tools/meson.build
> index 3e5a0abfa29f..66b0a11fbb45 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -24,3 +24,11 @@ endif
>  if have_virtiofsd
>    subdir('virtiofsd')
>  endif
> +
> +have_virtiorng =3D (have_system and
> +    have_tools and
> +    'CONFIG_LINUX' in config_host)
> +
> +if have_virtiorng
> +  subdir('vhost-user-rng')
> +endif
> diff --git a/tools/vhost-user-rng/50-qemu-rng.json.in b/tools/vhost-user-=
rng/50-qemu-rng.json.in
> new file mode 100644
> index 000000000000..9186c3c6fe1d
> --- /dev/null
> +++ b/tools/vhost-user-rng/50-qemu-rng.json.in
> @@ -0,0 +1,5 @@
> +{
> +  "description": "QEMU vhost-user-rng",
> +  "type": "bridge",
> +  "binary": "@libexecdir@/vhost-user-rng"
> +}
> diff --git a/tools/vhost-user-rng/main.c b/tools/vhost-user-rng/main.c
> new file mode 100644
> index 000000000000..c3b8f6922757
> --- /dev/null
> +++ b/tools/vhost-user-rng/main.c
> @@ -0,0 +1,403 @@
> +/*
> + * VIRTIO RNG Emulation via vhost-user
> + *
> + * Copyright (c) 2021 Mathieu Poirier <mathieu.poirier@linaro.org>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#define G_LOG_DOMAIN "vhost-user-rng"
> +#define G_LOG_USE_STRUCTURED 1
> +
> +#include <glib.h>
> +#include <gio/gio.h>
> +#include <gio/gunixsocketaddress.h>
> +#include <glib-unix.h>
> +#include <glib/gstdio.h>
> +#include <pthread.h>
> +#include <signal.h>
> +#include <stdio.h>
> +#include <stdbool.h>
> +#include <string.h>
> +#include <inttypes.h>
> +#include <fcntl.h>
> +#include <sys/ioctl.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <sys/mman.h>
> +#include <time.h>
> +#include <unistd.h>
> +#include <endian.h>
> +#include <assert.h>
> +
> +#include "qemu/cutils.h"
> +#include "subprojects/libvhost-user/libvhost-user-glib.h"
> +#include "subprojects/libvhost-user/libvhost-user.h"
> +
> +#ifndef container_of
> +#define container_of(ptr, type, member) ({                      \
> +        const typeof(((type *) 0)->member) * __mptr =3D (ptr);     \
> +        (type *) ((char *) __mptr - offsetof(type, member)); })
> +#endif
> +
> +typedef struct {
> +    VugDev dev;
> +    struct itimerspec ts;
> +    timer_t rate_limit_timer;
> +    pthread_mutex_t rng_mutex;
> +    pthread_cond_t rng_cond;

I'm confused by the need for a mutex in a single-threaded application.

> +    int64_t quota_remaining;
> +    bool activate_timer;
> +    GMainLoop *loop;
> +} VuRNG;
> +
> +static gboolean print_cap, verbose;
> +static gchar *source_path, *socket_path;
> +static gint source_fd, socket_fd =3D -1;
> +
> +/* Defaults tailored on virtio-rng.c */
> +static uint32_t period_ms =3D 1 << 16;
> +static uint64_t max_bytes =3D INT64_MAX;
> +
> +static void check_rate_limit(union sigval sv)
> +{
> +    VuRNG *rng =3D sv.sival_ptr;
> +    bool wakeup =3D false;
> +
> +    pthread_mutex_lock(&rng->rng_mutex);
> +    /*
> +     * The timer has expired and the guest has used all available
> +     * entropy, which means function vu_rng_handle_request() is waiting
> +     * on us.  As such wake it up once we're done here.
> +     */
> +    if (rng->quota_remaining =3D=3D 0) {
> +        wakeup =3D true;
> +    }
> +
> +    /*
> +     * Reset the entropy available to the guest and tell function
> +     * vu_rng_handle_requests() to start the timer before using it.
> +     */
> +    rng->quota_remaining =3D max_bytes;
> +    rng->activate_timer =3D true;
> +    pthread_mutex_unlock(&rng->rng_mutex);
> +
> +    if (wakeup) {
> +        pthread_cond_signal(&rng->rng_cond);
> +    }
> +}
> +
> +static void setup_timer(VuRNG *rng)
> +{
> +    struct sigevent sev;
> +    int ret;
> +
> +    memset(&rng->ts, 0, sizeof(struct itimerspec));
> +    rng->ts.it_value.tv_sec =3D period_ms / 1000;
> +    rng->ts.it_value.tv_nsec =3D (period_ms % 1000) * 1000000;
> +
> +    /*
> +     * Call function check_rate_limit() as if it was the start of
> +     * a new thread when the timer expires.
> +     */
> +    sev.sigev_notify =3D SIGEV_THREAD;
> +    sev.sigev_notify_function =3D check_rate_limit;
> +    sev.sigev_value.sival_ptr =3D rng;
> +    /* Needs to be NULL if defaults attributes are to be used. */
> +    sev.sigev_notify_attributes =3D NULL;
> +    ret =3D timer_create(CLOCK_MONOTONIC, &sev, &rng->rate_limit_timer);
> +    if (ret < 0) {
> +        fprintf(stderr, "timer_create() failed\n");
> +    }

Ahh I see why now. I think you could avoid this by using glib's own
internal g_timeout_add() function. This would then create a timer which
would call it's callback periodically (if it returns true to persist the
GSource). As the whole execution is effectively event driven you would
avoid the need for locking.

> +
> +}
> +
> +
> +/* Virtio helpers */
> +static uint64_t rng_get_features(VuDev *dev)
> +{
> +    if (verbose) {
> +        g_info("%s: replying", __func__);
> +    }
> +    return 0;
> +}
> +
> +static void rng_set_features(VuDev *dev, uint64_t features)
> +{
> +    if (verbose && features) {
> +        g_autoptr(GString) s =3D g_string_new("Requested un-handled feat=
ure");
> +        g_string_append_printf(s, " 0x%" PRIx64 "", features);
> +        g_info("%s: %s", __func__, s->str);
> +    }
> +}
> +
> +static void vu_rng_handle_requests(VuDev *dev, int qidx)
> +{
> +    VuRNG *rng =3D container_of(dev, VuRNG, dev.parent);
> +    VuVirtq *vq =3D vu_get_queue(dev, qidx);
> +    VuVirtqElement *elem;
> +    size_t to_read;
> +    int len, ret;
> +
> +    for (;;) {
> +        /* Get element in the vhost virtqueue */
> +        elem =3D vu_queue_pop(dev, vq, sizeof(VuVirtqElement));
> +        if (!elem) {
> +            break;
> +        }
> +
> +        /* Get the amount of entropy to read from the vhost server */
> +        to_read =3D elem->in_sg[0].iov_len;
> +
> +        pthread_mutex_lock(&rng->rng_mutex);
> +
> +        /*
> +         * We have consumed all entropy available for this time slice.
> +         * Wait for the timer (check_rate_limit()) to tell us about the
> +         * start of a new time slice.
> +         */
> +        if (rng->quota_remaining =3D=3D 0) {
> +            pthread_cond_wait(&rng->rng_cond, &rng->rng_mutex);
> +        }

Hmm this complicates things. Ideally you wouldn't want to block here on
processing the virtqueue. This will end up block the guest. I'll need to
think about this.

--=20
Alex Benn=C3=A9e

