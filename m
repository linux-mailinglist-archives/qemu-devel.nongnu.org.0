Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 583CB4CDEDD
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 21:41:07 +0100 (CET)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQEja-0000LS-6L
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 15:41:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nQEi7-00079d-0M; Fri, 04 Mar 2022 15:39:35 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:31680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nQEi3-0000ZF-SX; Fri, 04 Mar 2022 15:39:34 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 7BBE37462D3;
 Fri,  4 Mar 2022 21:39:26 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 408BE745708; Fri,  4 Mar 2022 21:39:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3D9C87456FE;
 Fri,  4 Mar 2022 21:39:26 +0100 (CET)
Date: Fri, 4 Mar 2022 21:39:26 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 3/4] Replace qemu_gettimeofday() with g_get_real_time()
In-Reply-To: <20220304152704.3466036-4-marcandre.lureau@redhat.com>
Message-ID: <6eedba39-6067-30ba-35b9-9d8cd4ad90c2@eik.bme.hu>
References: <20220304152704.3466036-1-marcandre.lureau@redhat.com>
 <20220304152704.3466036-4-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="3866299591-47423651-1646426366=:32272"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Marek Vasut <marex@denx.de>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Chris Wulff <crwulff@gmail.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-47423651-1646426366=:32272
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 4 Mar 2022, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>
> GLib g_get_real_time() is an alternative to gettimeofday().
>
> For semihosting, a few bits are lost on POSIX host, but this shouldn't
> be a big concern.
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
> blockdev.c                 |  8 ++++----
> hw/rtc/m41t80.c            |  6 +++---
> hw/virtio/virtio-balloon.c |  9 +--------
> qapi/qmp-event.c           | 12 +++++-------
> qemu-img.c                 |  8 ++++----
> qga/commands-posix.c       | 11 +----------
> target/m68k/m68k-semi.c    | 22 ++++++++++------------
> target/nios2/nios2-semi.c  | 24 +++++++++++-------------
> 8 files changed, 39 insertions(+), 61 deletions(-)
>
> diff --git a/blockdev.c b/blockdev.c
> index 42e098b458b1..4b07dbfbdefc 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -1235,7 +1235,7 @@ static void internal_snapshot_prepare(BlkActionState *common,
>     BlockDriverState *bs;
>     QEMUSnapshotInfo old_sn, *sn;
>     bool ret;
> -    qemu_timeval tv;
> +    int64_t rt;
>     BlockdevSnapshotInternal *internal;
>     InternalSnapshotState *state;
>     AioContext *aio_context;
> @@ -1305,9 +1305,9 @@ static void internal_snapshot_prepare(BlkActionState *common,
>     /* 3. take the snapshot */
>     sn = &state->sn;
>     pstrcpy(sn->name, sizeof(sn->name), name);
> -    qemu_gettimeofday(&tv);
> -    sn->date_sec = tv.tv_sec;
> -    sn->date_nsec = tv.tv_usec * 1000;
> +    rt = g_get_real_time();
> +    sn->date_sec = rt / G_USEC_PER_SEC;
> +    sn->date_nsec = (rt % G_USEC_PER_SEC) * 1000;
>     sn->vm_clock_nsec = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>     if (replay_mode != REPLAY_MODE_NONE) {
>         sn->icount = replay_get_current_icount();
> diff --git a/hw/rtc/m41t80.c b/hw/rtc/m41t80.c
> index a00971a67e1c..e045c864bb44 100644
> --- a/hw/rtc/m41t80.c
> +++ b/hw/rtc/m41t80.c

This part

Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

but why don't you use g_get_current_time() instead which seems to be a 
more direct replacement for gettimeofday, then you don't have to do maths 
with G_USEC_PER_SEC.

Regards.
BALATON Zoltan

> @@ -47,7 +47,7 @@ static uint8_t m41t80_recv(I2CSlave *i2c)
> {
>     M41t80State *s = M41T80(i2c);
>     struct tm now;
> -    qemu_timeval tv;
> +    int64_t rt;
>
>     if (s->addr < 0) {
>         s->addr = 0;
> @@ -57,8 +57,8 @@ static uint8_t m41t80_recv(I2CSlave *i2c)
>     }
>     switch (s->addr++) {
>     case 0:
> -        qemu_gettimeofday(&tv);
> -        return to_bcd(tv.tv_usec / 10000);
> +        rt = g_get_real_time();
> +        return to_bcd((rt % G_USEC_PER_SEC) / 10000);
>     case 1:
>         return to_bcd(now.tm_sec);
>     case 2:
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index e6c1b0aa46fe..b1bada84cecc 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -452,7 +452,6 @@ static void virtio_balloon_receive_stats(VirtIODevice *vdev, VirtQueue *vq)
>     VirtQueueElement *elem;
>     VirtIOBalloonStat stat;
>     size_t offset = 0;
> -    qemu_timeval tv;
>
>     elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
>     if (!elem) {
> @@ -484,13 +483,7 @@ static void virtio_balloon_receive_stats(VirtIODevice *vdev, VirtQueue *vq)
>             s->stats[tag] = val;
>     }
>     s->stats_vq_offset = offset;
> -
> -    if (qemu_gettimeofday(&tv) < 0) {
> -        warn_report("%s: failed to get time of day", __func__);
> -        goto out;
> -    }
> -
> -    s->stats_last_update = tv.tv_sec;
> +    s->stats_last_update = g_get_real_time() / G_USEC_PER_SEC;
>
> out:
>     if (balloon_stats_enabled(s)) {
> diff --git a/qapi/qmp-event.c b/qapi/qmp-event.c
> index 19d3cd003833..025716b3ec37 100644
> --- a/qapi/qmp-event.c
> +++ b/qapi/qmp-event.c
> @@ -20,15 +20,13 @@
>
> static void timestamp_put(QDict *qdict)
> {
> -    int err;
>     QDict *ts;
> -    qemu_timeval tv;
> +    int64_t rt = g_get_real_time();
>
> -    err = qemu_gettimeofday(&tv);
> -    /* Put -1 to indicate failure of getting host time */
> -    ts = qdict_from_jsonf_nofail("{ 'seconds': %lld, 'microseconds': %lld }",
> -                                 err < 0 ? -1LL : (long long)tv.tv_sec,
> -                                 err < 0 ? -1LL : (long long)tv.tv_usec);
> +    ts = qdict_from_jsonf_nofail("{ 'seconds': %" G_GINT64_FORMAT
> +                                 ", 'microseconds': %" G_GINT64_FORMAT "}",
> +                                 rt / G_USEC_PER_SEC,
> +                                 rt % G_USEC_PER_SEC);
>     qdict_put(qdict, "timestamp", ts);
> }
>
> diff --git a/qemu-img.c b/qemu-img.c
> index 6fe2466032f9..e26773909684 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -3304,11 +3304,11 @@ static int img_snapshot(int argc, char **argv)
>     char *filename, *snapshot_name = NULL;
>     int c, ret = 0, bdrv_oflags;
>     int action = 0;
> -    qemu_timeval tv;
>     bool quiet = false;
>     Error *err = NULL;
>     bool image_opts = false;
>     bool force_share = false;
> +    int64_t rt;
>
>     bdrv_oflags = BDRV_O_RDWR;
>     /* Parse commandline parameters */
> @@ -3405,9 +3405,9 @@ static int img_snapshot(int argc, char **argv)
>         memset(&sn, 0, sizeof(sn));
>         pstrcpy(sn.name, sizeof(sn.name), snapshot_name);
>
> -        qemu_gettimeofday(&tv);
> -        sn.date_sec = tv.tv_sec;
> -        sn.date_nsec = tv.tv_usec * 1000;
> +        rt = g_get_real_time();
> +        sn.date_sec = rt / G_USEC_PER_SEC;
> +        sn.date_nsec = (rt % G_USEC_PER_SEC) * 1000;
>
>         ret = bdrv_snapshot_create(bs, &sn);
>         if (ret) {
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 75dbaab68ea9..3311a4ca0167 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -138,16 +138,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **errp)
>
> int64_t qmp_guest_get_time(Error **errp)
> {
> -   int ret;
> -   qemu_timeval tq;
> -
> -   ret = qemu_gettimeofday(&tq);
> -   if (ret < 0) {
> -       error_setg_errno(errp, errno, "Failed to get time");
> -       return -1;
> -   }
> -
> -   return tq.tv_sec * 1000000000LL + tq.tv_usec * 1000;
> +    return g_get_real_time();
> }
>
> void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
> diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
> index c5c164e096c8..54f735743165 100644
> --- a/target/m68k/m68k-semi.c
> +++ b/target/m68k/m68k-semi.c
> @@ -378,19 +378,17 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
>                            arg0, arg1);
>             return;
>         } else {
> -            qemu_timeval tv;
>             struct gdb_timeval *p;
> -            result = qemu_gettimeofday(&tv);
> -            if (result == 0) {
> -                if (!(p = lock_user(VERIFY_WRITE,
> -                                    arg0, sizeof(struct gdb_timeval), 0))) {
> -                    /* FIXME - check error code? */
> -                    result = -1;
> -                } else {
> -                    p->tv_sec = cpu_to_be32(tv.tv_sec);
> -                    p->tv_usec = cpu_to_be64(tv.tv_usec);
> -                    unlock_user(p, arg0, sizeof(struct gdb_timeval));
> -                }
> +            int64_t rt = g_get_real_time();
> +            if (!(p = lock_user(VERIFY_WRITE,
> +                                arg0, sizeof(struct gdb_timeval), 0))) {
> +                /* FIXME - check error code? */
> +                result = -1;
> +            } else {
> +                result = 0;
> +                p->tv_sec = cpu_to_be32(rt / G_USEC_PER_SEC);
> +                p->tv_usec = cpu_to_be64(rt % G_USEC_PER_SEC);
> +                unlock_user(p, arg0, sizeof(struct gdb_timeval));
>             }
>         }
>         break;
> diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
> index 5a7ad0c7108d..4600bf0a39d9 100644
> --- a/target/nios2/nios2-semi.c
> +++ b/target/nios2/nios2-semi.c
> @@ -400,20 +400,18 @@ void do_nios2_semihosting(CPUNios2State *env)
>                            arg0, 0);
>             return;
>         } else {
> -            qemu_timeval tv;
>             struct gdb_timeval *p;
> -            result = qemu_gettimeofday(&tv);
> -            if (result == 0) {
> -                p = lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeval),
> -                              0);
> -                if (!p) {
> -                    result = -1;
> -                    errno = EFAULT;
> -                } else {
> -                    p->tv_sec = cpu_to_be32(tv.tv_sec);
> -                    p->tv_usec = cpu_to_be64(tv.tv_usec);
> -                    unlock_user(p, arg0, sizeof(struct gdb_timeval));
> -                }
> +            int64_t rt = g_get_real_time();
> +            p = lock_user(VERIFY_WRITE, arg0, sizeof(struct gdb_timeval),
> +                          0);
> +            if (!p) {
> +                result = -1;
> +                errno = EFAULT;
> +            } else {
> +                result = 0;
> +                p->tv_sec = cpu_to_be32(rt / G_USEC_PER_SEC);
> +                p->tv_usec = cpu_to_be64(rt % G_USEC_PER_SEC);
> +                unlock_user(p, arg0, sizeof(struct gdb_timeval));
>             }
>         }
>         break;
>
--3866299591-47423651-1646426366=:32272--

