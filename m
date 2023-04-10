Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDEB6DC79F
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 16:05:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pls7e-0007GY-5f; Mon, 10 Apr 2023 10:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pls7b-0007G3-Pp; Mon, 10 Apr 2023 10:03:51 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pls7a-000706-3O; Mon, 10 Apr 2023 10:03:51 -0400
Received: by mail-ej1-x630.google.com with SMTP id sh8so12654663ejc.10;
 Mon, 10 Apr 2023 07:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681135428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8hgBVeahqvBLV5ViG+HU7KHlwQMo/H6mIRC2Z1Z+Ck=;
 b=RqHjT8N13PPvEkF/gFAV7oSQHfQ+UyaaNZjHt8WK8GZLzUXhmw5q0kZtZ5wLnP/MTZ
 UyXnI2sXYKuJt8dcnE/1nLhbW+0D2H+GSpp8b1eMVxqnjUVZZfajixeaYeynS1DBxfat
 hErs8aWxVSBJDOlImEITrBmn6tU4jaHHcAc/JANwnsLXQc+1g8TLbBaWQiJMo0OwJm/9
 v0Yh+XGwOptnL8ZCCaMsfaPhRPANxJY5ElgN6XE6YRcjwqiZ3Q3EKQSx9Ggn4St/O92B
 yl8Vaaf+YvxBsp5qbKDqVjaAqg9SbNLrL8seGj+gC9vzSpC+Ab4j+NHmeX3xLnydE83z
 V0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681135428;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F8hgBVeahqvBLV5ViG+HU7KHlwQMo/H6mIRC2Z1Z+Ck=;
 b=nA1kAZJ4pVZV+arrDKAN9LSgoUJjLxU2OnH/FvXrQPiXxLdW+ZMoMHzKlven5JyjU3
 Tj+8Uu5MjF0E2/WjKgccSmn5nQoeH7MoZtL94Mhz9mRXRTwhqmujLLY/YEF9ypvS/F5a
 9p+b++U16lMrXyprm9Cg++P0nQq0OSItBcbV4+fAtpQrVyyLECeRhY6oUfGJ59Z87STT
 RNtY03PSL4+FZZAUMLD3lU2gXFpb4ceP8dAb9brJPklUnYhmKytTK3hspYaSCJ+gu8YL
 Tlx6OBVoMFPzKHWtOtFL6gCHsv988+vk/WkEYhe1VufxWjDK6372nEK6LzDqTbrdVPEo
 nKcw==
X-Gm-Message-State: AAQBX9fL74qRT10aZ3p6RkPHlraB9IjaB+gwA9LDOYicpXwwQ1FxTLY1
 3i00zpdVfez40mtpZKr7NP6pxmd7UhyMlKbfKvE=
X-Google-Smtp-Source: AKy350Z1ZDCsAFd3zlxc0Iq7nfrIoLAxgl56RVDFisHYAhZJ3SDueVoYOBWpvsbHL17ebSN1zxSez7if8Q3I1NFU2mI=
X-Received: by 2002:a17:907:94cc:b0:8e3:da0f:f3ea with SMTP id
 dn12-20020a17090794cc00b008e3da0ff3eamr2949624ejc.7.1681135427581; Mon, 10
 Apr 2023 07:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230410134938.907457-1-stefanha@redhat.com>
In-Reply-To: <20230410134938.907457-1-stefanha@redhat.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Mon, 10 Apr 2023 22:03:21 +0800
Message-ID: <CAAAx-8JW0yHdRTxx9RHch+bS_J-OfDKCBrpDgfw78i7GLYATsw@mail.gmail.com>
Subject: Re: [PATCH] block/file-posix: use unsigned int for zones consistently
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=faithilikerun@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Stefan Hajnoczi <stefanha@redhat.com> =E4=BA=8E2023=E5=B9=B44=E6=9C=8810=E6=
=97=A5=E5=91=A8=E4=B8=80 21:49=E5=86=99=E9=81=93=EF=BC=9A
>
> Avoid mixing int and unsigned int for zone index and count values. This
> eliminates the possibility of accidental negative write pointer array
> indices. It also makes code review easier because we don't need to worry
> about signed/unsigned comparisons.
>
> In practice I don't think zoned devices are likely to exceed MAX_INT
> zones any time soon, so this is mostly a code cleanup.
>
> Cc: Sam Li <faithilikerun@gmail.com>
> Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/file-posix.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> This is a cleanup on top of "[PATCH v9 0/4] Add zone append write for
> zoned device".
>
> Based-on: <20230407081657.17947-1-faithilikerun@gmail.com>

Reviewed-by: Sam Li <faithilikerun@gmail.com>

>
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 32b16bc4fb..77fbf9e33e 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1338,8 +1338,9 @@ static int get_zones_wp(BlockDriverState *bs, int f=
d, int64_t offset,
>      size_t rep_size;
>      uint64_t sector =3D offset >> BDRV_SECTOR_BITS;
>      BlockZoneWps *wps =3D bs->wps;
> -    int j =3D offset / bs->bl.zone_size;
> -    int ret, n =3D 0, i =3D 0;
> +    unsigned int j =3D offset / bs->bl.zone_size;
> +    int ret;
> +    unsigned int n =3D 0, i =3D 0;
>      rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct bl=
k_zone);
>      g_autofree struct blk_zone_report *rep =3D NULL;
>
> @@ -2092,7 +2093,8 @@ static int handle_aiocb_zone_report(void *opaque)
>      struct blk_zone *blkz;
>      size_t rep_size;
>      unsigned int nrz;
> -    int ret, n =3D 0, i =3D 0;
> +    int ret;
> +    unsigned int n =3D 0, i =3D 0;
>
>      nrz =3D *nr_zones;
>      rep_size =3D sizeof(struct blk_zone_report) + nrz * sizeof(struct bl=
k_zone);
> @@ -3507,11 +3509,11 @@ static int coroutine_fn raw_co_zone_mgmt(BlockDri=
verState *bs, BlockZoneOp op,
>              return ret;
>          }
>      } else if (zo =3D=3D BLKRESETZONE) {
> -        for (int j =3D 0; j < nrz; ++j) {
> +        for (unsigned int j =3D 0; j < nrz; ++j) {
>              wp[j] =3D offset + j * zone_size;
>          }
>      } else if (zo =3D=3D BLKFINISHZONE) {
> -        for (int j =3D 0; j < nrz; ++j) {
> +        for (unsigned int j =3D 0; j < nrz; ++j) {
>              /* The zoned device allows the last zone smaller that the
>               * zone size. */
>              wp[j] =3D MIN(offset + (j + 1) * zone_size, offset + len);
> --
> 2.39.2
>

