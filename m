Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF476EFA97
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:05:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkQr-00075l-1N; Wed, 26 Apr 2023 15:04:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prkQk-00075A-Co; Wed, 26 Apr 2023 15:03:54 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prkQi-0001p7-3h; Wed, 26 Apr 2023 15:03:54 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id F29095F060;
 Wed, 26 Apr 2023 22:03:42 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6525::1:35] (unknown
 [2a02:6b8:b081:6525::1:35])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id g3NmS50OfOs0-tuReb1o0; Wed, 26 Apr 2023 22:03:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682535822; bh=xM2NYLcPaUKRRz9ndPKzj4sGXBQNyo6gwFMZWPDcFTI=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=H72NVD6g0vdthti1UQPOGbB5Llf8ypJayueG0U2qrrWfWzjoNWNWdHK8whlHAN1J/
 smrYW7CsHpcsmFvU8FjREAfnOt8MJydilcJs4DtMjKq8d+DAzH8ypwzN7QAvtnpauv
 fOfPk8rpw0bsiNdSfiWVYqtCDAyK6hSjhYMoeKIo=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <2b8a3b58-78a7-08d1-e029-f4a87cdc3cfb@yandex-team.ru>
Date: Wed, 26 Apr 2023 22:03:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 12/13] migration: Create migrate_block_bitmap_mapping()
 function
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20230424183236.74561-1-quintela@redhat.com>
 <20230424183236.74561-13-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230424183236.74561-13-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
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
> Notice that we changed the test of ->has_block_bitmap_mapping
> for the test that block_bitmap_mapping is not NULL.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> ---
>   migration/block-dirty-bitmap.c | 14 ++++++++------
>   migration/options.c            |  7 +++++++
>   migration/options.h            |  1 +
>   3 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
> index a6ffae0002..62b2352bbb 100644
> --- a/migration/block-dirty-bitmap.c
> +++ b/migration/block-dirty-bitmap.c
> @@ -605,11 +605,12 @@ static int init_dirty_bitmap_migration(DBMSaveState *s)
>       SaveBitmapState *dbms;
>       GHashTable *handled_by_blk = g_hash_table_new(NULL, NULL);
>       BlockBackend *blk;
> -    const MigrationParameters *mig_params = &migrate_get_current()->parameters;
>       GHashTable *alias_map = NULL;
> +    BitmapMigrationNodeAliasList *block_bitmap_mapping =
> +        migrate_block_bitmap_mapping();
>   
> -    if (mig_params->has_block_bitmap_mapping) {
> -        alias_map = construct_alias_map(mig_params->block_bitmap_mapping, true,
> +    if (block_bitmap_mapping) {
> +        alias_map = construct_alias_map(block_bitmap_mapping, true,
>                                           &error_abort);
>       }
>   
> @@ -1158,7 +1159,8 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
>   static int dirty_bitmap_load(QEMUFile *f, void *opaque, int version_id)
>   {
>       GHashTable *alias_map = NULL;
> -    const MigrationParameters *mig_params = &migrate_get_current()->parameters;
> +    BitmapMigrationNodeAliasList *block_bitmap_mapping =
> +        migrate_block_bitmap_mapping();
>       DBMLoadState *s = &((DBMState *)opaque)->load;
>       int ret = 0;
>   
> @@ -1170,8 +1172,8 @@ static int dirty_bitmap_load(QEMUFile *f, void *opaque, int version_id)
>           return -EINVAL;
>       }
>   
> -    if (mig_params->has_block_bitmap_mapping) {
> -        alias_map = construct_alias_map(mig_params->block_bitmap_mapping,
> +    if (block_bitmap_mapping) {
> +        alias_map = construct_alias_map(block_bitmap_mapping,
>                                           false, &error_abort);
>       }
>   
> diff --git a/migration/options.c b/migration/options.c
> index 9fbba84b9a..ec234bf3ff 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -452,6 +452,13 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
>   
>   /* parameters */
>   
> +BitmapMigrationNodeAliasList *migrate_block_bitmap_mapping(void)

as well, this could return constant pointer. Even construct_alias_map() is already prepared for this.

> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return s->parameters.block_bitmap_mapping;
> +}
> +
>   bool migrate_block_incremental(void)
>   {
>       MigrationState *s = migrate_get_current();
> diff --git a/migration/options.h b/migration/options.h
> index 9123fdb5f4..43e8e9cd8f 100644
> --- a/migration/options.h
> +++ b/migration/options.h
> @@ -62,6 +62,7 @@ bool migrate_cap_set(int cap, bool value, Error **errp);
>   
>   /* parameters */
>   
> +BitmapMigrationNodeAliasList *migrate_block_bitmap_mapping(void);
>   bool migrate_block_incremental(void);
>   uint32_t migrate_checkpoint_delay(void);
>   int migrate_compress_level(void);

-- 
Best regards,
Vladimir


