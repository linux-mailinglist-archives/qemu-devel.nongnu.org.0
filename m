Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF1E6B04F0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 11:49:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZrLA-0001uF-8g; Wed, 08 Mar 2023 05:48:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZrL1-0001tQ-TB
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:48:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pZrL0-0008To-9y
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 05:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678272480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EkogizcpFuptu04g2KpyjJg0EhDUCAjDOyvm9hl2eNk=;
 b=ieefmw1Gtw1jWf1hDnn497wpcWzTn/MhGcQ48273ASJZqzmcnNhk2+KDIn85tWJY4Xpg0I
 hqoCB2uBSxjvZS/yJR1KDg8ciRHgOuLCk6UttzxulbWj25Maje5AsR4cjb7V0nfUG7Dgpp
 l1K05vTJhxk2hHlMNWUYRnO7gqLeEPc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-8jFpR9_eM667meBcmKcokg-1; Wed, 08 Mar 2023 05:47:58 -0500
X-MC-Unique: 8jFpR9_eM667meBcmKcokg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m31-20020a05600c3b1f00b003e9de8c95easo5722260wms.2
 for <qemu-devel@nongnu.org>; Wed, 08 Mar 2023 02:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678272477;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EkogizcpFuptu04g2KpyjJg0EhDUCAjDOyvm9hl2eNk=;
 b=QXXExJRskQJZ1zmmQKsdPf4iCbDM7OiJfED3eomHK3JCWg1eOtob/bRzlgNO8Lt9ZX
 d+UPNfVzUHI09nHtzQtXu9bOYJDWgbxDn5h8kKdpsJSqHHi/OvIa24NdFgMtcUM+kQWz
 fEpE/iguekrcGSnoivEz6w3EI/aJCTf+oYUmtaBsutKUT9fVFfghqTcqdOelY/++60WH
 4VbTMw/Q31vki/0u/iL7VCGbSpZhEHL0muy+6LMt6rrBUepxZoliygkqWZ/fBf5Qu0jE
 GYT/j7AQ9WBTEviwSEQ4XAZLa1NVfXjIyk+XstL+sfrdCHHYhkZ51Pmr0xllzOh4NDyX
 9rMA==
X-Gm-Message-State: AO0yUKXCpnkbZpdY6sm2c3WiBrwrY81pYbkeRnTJ7nREMnzCU1wA3Ken
 p35xVyoLiGlS8p2v3QTXSXSUH1+/DDnB8ghTAnSANlTc6fby2sOgUTsHAQfTdBBVyqzd2+PMq50
 TK6Wk3xIrqF48X9E=
X-Received: by 2002:adf:eccf:0:b0:2c7:65b:946f with SMTP id
 s15-20020adfeccf000000b002c7065b946fmr11228257wro.38.1678272477519; 
 Wed, 08 Mar 2023 02:47:57 -0800 (PST)
X-Google-Smtp-Source: AK7set9ttc8gIE9ecCKPSetJyWqV3Sz81XDmnnv/P+IU/uELE0DvQaHFWTooe7xvhTT/h3MuuweQ9Q==
X-Received: by 2002:adf:eccf:0:b0:2c7:65b:946f with SMTP id
 s15-20020adfeccf000000b002c7065b946fmr11228245wro.38.1678272477281; 
 Wed, 08 Mar 2023 02:47:57 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 e13-20020adff34d000000b002c53cc7504csm14802454wrp.78.2023.03.08.02.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 02:47:56 -0800 (PST)
Date: Wed, 8 Mar 2023 10:47:54 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Hailiang Zhang <zhanghailiang@xfusion.com>,
 Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 03/43] migration: Create migration_cap_set()
Message-ID: <ZAhn2k22hpqIW3i1@work-vm>
References: <20230302163410.11399-1-quintela@redhat.com>
 <20230302163410.11399-4-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302163410.11399-4-quintela@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

* Juan Quintela (quintela@redhat.com) wrote:
> And remove the convoluted use of qmp_migrate_set_capabilities() to
> enable disable MIGRATION_CAPABILITY_BLOCK.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>  migration/migration.c | 34 ++++++++++++++++------------------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 119027a656..e3062530f0 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1910,25 +1910,24 @@ void migrate_set_state(int *state, int old_state, int new_state)
>      }
>  }
>  
> -static MigrationCapabilityStatus *migrate_cap_add(MigrationCapability index,
> -                                                  bool state)
> +static bool migrate_cap_set(int cap, bool value, Error **errp)

Why int cap rather than MigrationCapability ?

Dave

>  {
> -    MigrationCapabilityStatus *cap;
> +    MigrationState *s = migrate_get_current();
> +    bool new_caps[MIGRATION_CAPABILITY__MAX];
>  
> -    cap = g_new0(MigrationCapabilityStatus, 1);
> -    cap->capability = index;
> -    cap->state = state;
> +    if (migration_is_running(s->state)) {
> +        error_setg(errp, QERR_MIGRATION_ACTIVE);
> +        return false;
> +    }
>  
> -    return cap;
> -}
> +    memcpy(new_caps, s->capabilities, sizeof(new_caps));
> +    new_caps[cap] = value;
>  
> -void migrate_set_block_enabled(bool value, Error **errp)
> -{
> -    MigrationCapabilityStatusList *cap = NULL;
> -
> -    QAPI_LIST_PREPEND(cap, migrate_cap_add(MIGRATION_CAPABILITY_BLOCK, value));
> -    qmp_migrate_set_capabilities(cap, errp);
> -    qapi_free_MigrationCapabilityStatusList(cap);
> +    if (!migrate_caps_check(s->capabilities, new_caps, errp)) {
> +        return false;
> +    }
> +    s->capabilities[cap] = value;
> +    return true;
>  }
>  
>  static void migrate_set_block_incremental(MigrationState *s, bool value)
> @@ -1940,7 +1939,7 @@ static void block_cleanup_parameters(MigrationState *s)
>  {
>      if (s->must_remove_block_options) {
>          /* setting to false can never fail */
> -        migrate_set_block_enabled(false, &error_abort);
> +        migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, false, &error_abort);
>          migrate_set_block_incremental(s, false);
>          s->must_remove_block_options = false;
>      }
> @@ -2427,8 +2426,7 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>                         "current migration capabilities");
>              return false;
>          }
> -        migrate_set_block_enabled(true, &local_err);
> -        if (local_err) {
> +        if (!migrate_cap_set(MIGRATION_CAPABILITY_BLOCK, true, &local_err)) {
>              error_propagate(errp, local_err);
>              return false;
>          }
> -- 
> 2.39.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


