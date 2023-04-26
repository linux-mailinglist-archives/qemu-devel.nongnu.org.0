Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA46EFA54
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:52:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkF8-0001ux-Va; Wed, 26 Apr 2023 14:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prkF6-0001uI-KD; Wed, 26 Apr 2023 14:51:52 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prkF4-0007bs-Hf; Wed, 26 Apr 2023 14:51:52 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id A651F5F8EB;
 Wed, 26 Apr 2023 21:51:41 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6525::1:35] (unknown
 [2a02:6b8:b081:6525::1:35])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id epMnN50OrSw0-rcGHlY85; Wed, 26 Apr 2023 21:51:41 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682535101; bh=8Mkk68JDw5gnSvsQgi5A9WBMVMagEUPU1lrNqF/ewkk=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=j2y6AN1DgT99a3/Ih5826Dufb0AmBjOUh5SRg8HfSLAtuJIZOGFBpiF6pNiRwJ2dD
 0Rfs93bL6ptvKBjawP3yx5nqE556vrQ69tiLsiZjvjAPzhQjOEyQG7myZvJdufD2LJ
 dIwdRv8hl8Iuix/+1NldIMTohIZkXDnze14tU6P8=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <6fe2c00c-d651-19f1-316b-eda65c5c2c7a@yandex-team.ru>
Date: Wed, 26 Apr 2023 21:51:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 08/13] migration: Remove MigrationState from
 block_cleanup_parameters()
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20230424183236.74561-1-quintela@redhat.com>
 <20230424183236.74561-9-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230424183236.74561-9-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24.04.23 21:32, Juan Quintela wrote:
> This makes the function more regular with everything else.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
>   migration/migration.c | 4 ++--
>   migration/options.c   | 4 +++-
>   migration/options.h   | 2 +-
>   3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index cefe6da2b8..ef8caa79b9 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1218,7 +1218,7 @@ static void migrate_fd_cleanup(MigrationState *s)
>           error_report_err(error_copy(s->error));
>       }
>       notifier_list_notify(&migration_state_notifiers, s);
> -    block_cleanup_parameters(s);
> +    block_cleanup_parameters();
>       yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>   }
>   
> @@ -1712,7 +1712,7 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>                      "a valid migration protocol");
>           migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>                             MIGRATION_STATUS_FAILED);
> -        block_cleanup_parameters(s);
> +        block_cleanup_parameters();
>           return;
>       }
>   
> diff --git a/migration/options.c b/migration/options.c
> index 26fe00799b..f65b7babef 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -597,8 +597,10 @@ void migrate_set_block_incremental(bool value)
>   
>   /* parameters helpers */
>   
> -void block_cleanup_parameters(MigrationState *s)
> +void block_cleanup_parameters(void)
>   {
> +    MigrationState *s = migrate_get_current();
> +
>       if (s->must_remove_block_options) {
>           /* setting to false can never fail */
>           migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, false, &error_abort);
> diff --git a/migration/options.h b/migration/options.h
> index 1fc8d341dd..3948218dbe 100644
> --- a/migration/options.h
> +++ b/migration/options.h
> @@ -90,6 +90,6 @@ void migrate_set_block_incremental(bool value);
>   
>   bool migrate_params_check(MigrationParameters *params, Error **errp);
>   void migrate_params_init(MigrationParameters *params);
> -void block_cleanup_parameters(MigrationState *s);
> +void block_cleanup_parameters(void);

Don't you want to rename it to migrate_* ?

-- 
Best regards,
Vladimir


