Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6486EFA80
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:56:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prkIh-0003aH-Gb; Wed, 26 Apr 2023 14:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prkIc-0003W9-E1; Wed, 26 Apr 2023 14:55:31 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1prkIW-00088s-Nn; Wed, 26 Apr 2023 14:55:29 -0400
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:369a:0:640:c31a:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id E4C105F861;
 Wed, 26 Apr 2023 21:55:15 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:6525::1:35] (unknown
 [2a02:6b8:b081:6525::1:35])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id EtM9P50OoSw0-P7ZMbGv4; Wed, 26 Apr 2023 21:55:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682535315; bh=USIXhhnke10ZnCJN+neWjWHIUwv1mFJ5YUe1YrUlgiw=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Mzk6jdicaRGnBwdUFLobpMHjD6jn60SVM7iQiPNU/BDUTbMxrpMEuIw7ljGt1aME+
 fWAsLgxR/KwBym6Rz9BAJc6ZoWzGo34cVJfdpaBqxAy2sDKioA5CAr4vwJeHnIC/Bm
 wG5DLxB2TlG1yAuWpwc3gtiRsJBYNx0HhBnG25r4=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <75f595ed-39a2-446f-d1d1-83fba1e294ca@yandex-team.ru>
Date: Wed, 26 Apr 2023 21:55:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 09/13] migration: Create migrate_tls_creds() function
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras <leobras@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20230424183236.74561-1-quintela@redhat.com>
 <20230424183236.74561-10-quintela@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230424183236.74561-10-quintela@redhat.com>
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
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


> ---
>   migration/options.c | 7 +++++++
>   migration/options.h | 1 +
>   migration/tls.c     | 9 ++++-----
>   3 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/migration/options.c b/migration/options.c
> index f65b7babef..9eabb4c25d 100644
> --- a/migration/options.c
> +++ b/migration/options.c
> @@ -579,6 +579,13 @@ uint8_t migrate_throttle_trigger_threshold(void)
>       return s->parameters.throttle_trigger_threshold;
>   }
>   
> +char *migrate_tls_creds(void)

could be stricter "const char *"

> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return s->parameters.tls_creds;
> +}
> +
>   uint64_t migrate_xbzrle_cache_size(void)
>   {
>       MigrationState *s = migrate_get_current();
> diff --git a/migration/options.h b/migration/options.h
> index 3948218dbe..47cc24585b 100644
> --- a/migration/options.h
> +++ b/migration/options.h
> @@ -80,6 +80,7 @@ MultiFDCompression migrate_multifd_compression(void);
>   int migrate_multifd_zlib_level(void);
>   int migrate_multifd_zstd_level(void);
>   uint8_t migrate_throttle_trigger_threshold(void);
> +char *migrate_tls_creds(void);
>   uint64_t migrate_xbzrle_cache_size(void);
>   
>   /* parameters setters */
> diff --git a/migration/tls.c b/migration/tls.c
> index acd38e0b62..0d318516de 100644
> --- a/migration/tls.c
> +++ b/migration/tls.c
> @@ -34,20 +34,19 @@ migration_tls_get_creds(MigrationState *s,
>                           Error **errp)

"s" argument becomes unused, may be dropped.

>   {
>       Object *creds;
> +    char *tls_creds = migrate_tls_creds();
>       QCryptoTLSCreds *ret;
>   
> -    creds = object_resolve_path_component(
> -        object_get_objects_root(), s->parameters.tls_creds);
> +    creds = object_resolve_path_component(object_get_objects_root(), tls_creds);
>       if (!creds) {
> -        error_setg(errp, "No TLS credentials with id '%s'",
> -                   s->parameters.tls_creds);
> +        error_setg(errp, "No TLS credentials with id '%s'", tls_creds);
>           return NULL;
>       }
>       ret = (QCryptoTLSCreds *)object_dynamic_cast(
>           creds, TYPE_QCRYPTO_TLS_CREDS);
>       if (!ret) {
>           error_setg(errp, "Object with id '%s' is not TLS credentials",
> -                   s->parameters.tls_creds);
> +                   tls_creds);
>           return NULL;
>       }
>       if (!qcrypto_tls_creds_check_endpoint(ret, endpoint, errp)) {

-- 
Best regards,
Vladimir


