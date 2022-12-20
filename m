Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BFE65265C
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 19:37:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7fmF-00075z-PE; Tue, 20 Dec 2022 11:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1p7fmB-00075q-HI
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:47:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1p7fm9-0007JH-BC
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 11:47:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671554778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+TM/l/c6PzB4g9trieAgQJLU/+1+bsdasOnlKYKzIo0=;
 b=JFBw8XGnGggF6G3aFniroO/D2ZD6NPVfGRTqTL1yXGn7Nun+QVJYJr5b1k+Do2dW1YiWIl
 Cxg3OhSo4hVrkoPL0WOeERFaFsUwjjUrapoYqy1qKbi3ACc4OrQiqcSfPDQd/ti56yHREy
 /HN2kIJuG0UZ4JT0F62ZfKi9B4+f/lQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-544-hOk3SlNnPRmzt6RRxgb7oA-1; Tue, 20 Dec 2022 11:43:04 -0500
X-MC-Unique: hOk3SlNnPRmzt6RRxgb7oA-1
Received: by mail-qt1-f197.google.com with SMTP id
 hg24-20020a05622a611800b003a66175d924so5750150qtb.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 08:43:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+TM/l/c6PzB4g9trieAgQJLU/+1+bsdasOnlKYKzIo0=;
 b=M4/efZqw6wDJduTARDjyr/qYg1OXNEaDefrzLyVUS4V53ZFDgw8vi75GDp5GRNcmJF
 9PdpcYM3pNG0IiVBGMhWKH0mn4BTjJxsaevXCG2kGygUfCrnspTKypu38lLsb8Ej67yM
 HYMv/QpQnQgXW+elWZqp/FfLcjclkujmPao7YKpnR1FNgPPPb6q9C5+9NMB/G339qqyo
 2lJ55UEP67TTHPmoLWoTgzJu5AO9JdiWD/vpz5On/8XQ1QRKkdE2RmArrsqwPrzNTW7G
 BMKpS5o4GqB+WCacdVOCRm74ycnRMhsEoP5tGbrGvUSw7ojxgWWSssTUVJAix2edpIXY
 iN7Q==
X-Gm-Message-State: ANoB5pmlZKkxg0wa/cQ5Ki/1NASBLM6Lbk00+E82uQccWrIozzgc/17r
 jcBJN3aTmJvcgWdEe62QqlHWqjNjZcv1PbCv9yBDBdW0ZLSMam/Ghy4SC06xPYivuPIeZc/fw3c
 V+oGw1flhYCE/CxkJgu1K1IIpGmNWeXA=
X-Received: by 2002:a37:444b:0:b0:6e1:b888:bbf9 with SMTP id
 r72-20020a37444b000000b006e1b888bbf9mr82254290qka.680.1671554583644; 
 Tue, 20 Dec 2022 08:43:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5hmBquS5g31ZcOKOrekuuuvn5amt332MNM+Y10hs7XPBTOwomwwGOoczHZurHOtaf8yd8Up9mRWdRTXUCBfjE=
X-Received: by 2002:a37:444b:0:b0:6e1:b888:bbf9 with SMTP id
 r72-20020a37444b000000b006e1b888bbf9mr82254270qka.680.1671554578512; Tue, 20
 Dec 2022 08:42:58 -0800 (PST)
MIME-Version: 1.0
References: <20221215222448.1893656-1-peterx@redhat.com>
In-Reply-To: <20221215222448.1893656-1-peterx@redhat.com>
From: Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Date: Tue, 20 Dec 2022 13:42:48 -0300
Message-ID: <CAJ6HWG4kBnrMdSnQgAmt7VvR=hmzkNebCx_CC0YPpm=eVG-BMg@mail.gmail.com>
Subject: Re: [PATCH] migration: Show downtime during postcopy phase
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>, 
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Thu, Dec 15, 2022 at 7:24 PM Peter Xu <peterx@redhat.com> wrote:
>
> The downtime should be displayed during postcopy phase because the
> switchover phase is done.  OTOH it's weird to show "expected downtime"
> which can confuse what does that mean if the switchover has already
> happened anyway.
>
> This is a slight ABI change on QMP, but I assume it shouldn't affect
> anyone.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/migration/migration.c b/migration/migration.c
> index 64f74534e2..993782598f 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1077,20 +1077,30 @@ bool migration_is_running(int state)
>      }
>  }
>
> +static bool migrate_show_downtime(MigrationState *s)
> +{
> +    return (s->state == MIGRATION_STATUS_COMPLETED) || migration_in_postcopy();
> +}
> +
>  static void populate_time_info(MigrationInfo *info, MigrationState *s)
>  {
>      info->has_status = true;
>      info->has_setup_time = true;
>      info->setup_time = s->setup_time;
> +
>      if (s->state == MIGRATION_STATUS_COMPLETED) {
>          info->has_total_time = true;
>          info->total_time = s->total_time;
> -        info->has_downtime = true;
> -        info->downtime = s->downtime;
>      } else {
>          info->has_total_time = true;
>          info->total_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) -
>                             s->start_time;
> +    }
> +
> +    if (migrate_show_downtime(s)) {
> +        info->has_downtime = true;
> +        info->downtime = s->downtime;
> +    } else {
>          info->has_expected_downtime = true;
>          info->expected_downtime = s->expected_downtime;
>      }
> --
> 2.37.3
>

FWIW:
Reviewed-by: Leonardo Bras <leobras@redhat.com>


