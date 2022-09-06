Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2B85AF328
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 19:53:41 +0200 (CEST)
Received: from localhost ([::1]:59616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVclY-000353-9L
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 13:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVckY-0001MN-Ca; Tue, 06 Sep 2022 13:52:38 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:33280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVckW-00070O-UK; Tue, 06 Sep 2022 13:52:38 -0400
Received: by mail-vk1-f175.google.com with SMTP id s19so1275436vkf.0;
 Tue, 06 Sep 2022 10:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=v5h3ZRkfptYNgZq8+rqobMX0+xjF4tAFSKtyg6iteug=;
 b=0h3E/iBpd/Y7zOULhplkdsMNoBeyGJqBPTLEg72Xduy3XiGS4oRrLkewNwhnav36d+
 G6EdRpwzRFXrEHUlas7ROAx1KtWEjmNRP9mh8ErPnC8Ss8DCo5i0BOaCaU5fciC0PhIs
 A5R4Cavrfl+/9F3tqim7+jh0G2bL1XjqD+5u9JC5HhtcR/gCSHlwmUHmQ59axXZ89FfU
 UuiTQozv3ce3/qJyJn+3+1zSi9C7iKg1Iyg9PLmuJrYFG87U3fbw9eXBFpuivft/71l/
 jPjx4WVpZUfcSqLvsPMISMSET+mSSw635TcF8RkLSkmsY0jvnq/gtdN3Mh31r/d8oaEP
 lFAw==
X-Gm-Message-State: ACgBeo1/hm6MSi908zygayW6GE+CQG/yPqXuHqR/p1boAQcwrYdX1rFX
 Q40hcGLD+TRn2RKNAIoIlYwrOJH6SBaMF5KC1G8=
X-Google-Smtp-Source: AA6agR75bEsGZ8CmIIXYN8hqIhhVoKdg5WU3hR4spAPzyjuBVEK/H2YC5Fknl47ODQACUFS1ghzWDCEB7rHqCiBRFs0=
X-Received: by 2002:a1f:acd2:0:b0:37b:531:9988 with SMTP id
 v201-20020a1facd2000000b0037b05319988mr15446742vke.19.1662486755387; Tue, 06
 Sep 2022 10:52:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220906171114.14839-1-shentey@gmail.com>
In-Reply-To: <20220906171114.14839-1-shentey@gmail.com>
Date: Tue, 6 Sep 2022 19:52:24 +0200
Message-ID: <CAAdtpL49zYJUum+Q79iWHbffy2ZCf8095WSUjvwAnnAX-j_raQ@mail.gmail.com>
Subject: Re: [PATCH] hw/virtio/vhost-shadow-virtqueue: Silence GCC error
 "maybe-uninitialized"
To: Bernhard Beschow <shentey@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.221.175;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-vk1-f175.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= via <qemu-devel@nongnu.org>

On Tue, Sep 6, 2022 at 7:12 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> GCC issues a false positive warning, resulting in build failure with -Wer=
ror:
>
>   In file included from /usr/include/glib-2.0/glib.h:114,
>                    from /home/zcone-pisint/Projects/qemu/src/include/glib=
-compat.h:32,
>                    from /home/zcone-pisint/Projects/qemu/src/include/qemu=
/osdep.h:144,
>                    from ../src/hw/virtio/vhost-shadow-virtqueue.c:10:
>   In function =E2=80=98g_autoptr_cleanup_generic_gfree=E2=80=99,
>       inlined from =E2=80=98vhost_handle_guest_kick=E2=80=99 at ../src/hw=
/virtio/vhost-shadow-virtqueue.c:292:42:
>   /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: =E2=80=98el=
em=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-uninitialized]
>      28 |   g_free (*pp);
>         |   ^~~~~~~~~~~~
>   ../src/hw/virtio/vhost-shadow-virtqueue.c: In function =E2=80=98vhost_h=
andle_guest_kick=E2=80=99:
>   ../src/hw/virtio/vhost-shadow-virtqueue.c:292:42: note: =E2=80=98elem=
=E2=80=99 was declared here
>     292 |             g_autofree VirtQueueElement *elem;
>         |                                          ^~~~
>   cc1: all warnings being treated as errors
>
> There is actually no problem since "elem" is initialized in both branches=
.
> Silence the warning by initializig it with "NULL".

Could you amend the first line of `gcc --version`?

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> Fixes: 9c2ab2f1ec333be8614cc12272d4b91960704dbe ("vhost: stop transfer el=
em ownership in vhost_handle_guest_kick")
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/virtio/vhost-shadow-virtqueue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-=
virtqueue.c
> index e8e5bbc368..596d4434d2 100644
> --- a/hw/virtio/vhost-shadow-virtqueue.c
> +++ b/hw/virtio/vhost-shadow-virtqueue.c
> @@ -289,7 +289,7 @@ static void vhost_handle_guest_kick(VhostShadowVirtqu=
eue *svq)
>          virtio_queue_set_notification(svq->vq, false);
>
>          while (true) {
> -            g_autofree VirtQueueElement *elem;
> +            g_autofree VirtQueueElement *elem =3D NULL;
>              int r;
>
>              if (svq->next_guest_avail_elem) {
> --
> 2.37.3
>
>

