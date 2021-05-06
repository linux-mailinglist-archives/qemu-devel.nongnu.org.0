Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F2B374DDA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 05:17:01 +0200 (CEST)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leUVY-0001JC-O1
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 23:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1leUTV-0000A3-Il; Wed, 05 May 2021 23:14:53 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:26597
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>)
 id 1leUTT-0001Dq-Cf; Wed, 05 May 2021 23:14:53 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4FbJdz3d4Rz8PbN;
 Wed,  5 May 2021 23:16:55 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=ZHUukWhEv
 MmN0PAW4z+5itM7Vos=; b=USGS3VMd0aLLo9VH50n/oVYL6yEKN0oQ+2ZFYon7Y
 E8liHtjCydRuYII4tb9zMWY6tqySbEJ0GNHOeA7PbEIsWWEGWIlgRHciKP0YmjW6
 dA7lNay6ClgfjV/v4vCMYskt/bYJ2wJYxLuNQkzYyF3IuEMnlmpu5SKt5DlPHprL
 jI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=msa
 /sdR1nz29CEaiWQ+jnx250ryd0EIs9wG/cHS1FzXjf+i1FgoW8REhYZwjuN/qRv0
 1z1AZ8JfsjmaDQsPfNFQiSbIweO+w3uB2ej20UQohza9s5Ri0xxd4RuEtcx61lwt
 uytYb3RGZvi3uZ30qjBBhGpEhiN/ioEg5Vlqw9Ko=
Received: from [192.168.3.75]
 (bras-base-toroon2719w-grc-49-142-114-9-241.dsl.bell.ca [142.114.9.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4FbJdz2Yrdz8PbK;
 Wed,  5 May 2021 23:16:55 -0400 (EDT)
Message-ID: <c962e974-929e-9f96-7b80-93c49d71cf09@comstyle.com>
Date: Wed, 5 May 2021 23:14:42 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH 1/7] migration: use GDateTime for formatting timestamp in
 snapshot names
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Jiri Pirko <jiri@resnulli.us>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, virtio-fs@redhat.com
References: <20210505103702.521457-1-berrange@redhat.com>
 <20210505103702.521457-2-berrange@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <20210505103702.521457-2-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thank you.

On 5/5/2021 6:36 AM, Daniel P. Berrang=C3=A9 wrote:
> The GDateTime APIs provided by GLib avoid portability pitfalls, such
> as some platforms where 'struct timeval.tv_sec' field is still 'long'
> instead of 'time_t'. When combined with automatic cleanup, GDateTime
> often results in simpler code too.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>   migration/savevm.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 52e2d72e4b..72848b946c 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2775,8 +2775,7 @@ bool save_snapshot(const char *name, bool overwri=
te, const char *vmstate,
>       QEMUFile *f;
>       int saved_vm_running;
>       uint64_t vm_state_size;
> -    qemu_timeval tv;
> -    struct tm tm;
> +    g_autoptr(GDateTime) now =3D g_date_time_new_now_local();
>       AioContext *aio_context;
>  =20
>       if (migration_is_blocked(errp)) {
> @@ -2836,9 +2835,8 @@ bool save_snapshot(const char *name, bool overwri=
te, const char *vmstate,
>       memset(sn, 0, sizeof(*sn));
>  =20
>       /* fill auxiliary fields */
> -    qemu_gettimeofday(&tv);
> -    sn->date_sec =3D tv.tv_sec;
> -    sn->date_nsec =3D tv.tv_usec * 1000;
> +    sn->date_sec =3D g_date_time_to_unix(now);
> +    sn->date_nsec =3D g_date_time_get_microsecond(now) * 1000;
>       sn->vm_clock_nsec =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>       if (replay_mode !=3D REPLAY_MODE_NONE) {
>           sn->icount =3D replay_get_current_icount();
> @@ -2849,9 +2847,8 @@ bool save_snapshot(const char *name, bool overwri=
te, const char *vmstate,
>       if (name) {
>           pstrcpy(sn->name, sizeof(sn->name), name);
>       } else {
> -        /* cast below needed for OpenBSD where tv_sec is still 'long' =
*/
> -        localtime_r((const time_t *)&tv.tv_sec, &tm);
> -        strftime(sn->name, sizeof(sn->name), "vm-%Y%m%d%H%M%S", &tm);
> +        g_autofree char *autoname =3D g_date_time_format(now,  "vm-%Y%=
m%d%H%M%S");
> +        pstrcpy(sn->name, sizeof(sn->name), autoname);
>       }
>  =20
>       /* save the VM state */

