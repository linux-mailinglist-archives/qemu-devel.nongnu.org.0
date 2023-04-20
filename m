Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164866E8ED1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:04:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppR8h-000788-91; Thu, 20 Apr 2023 06:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppR8a-00077o-Dr
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:03:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppR8Y-0003Jt-8X
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985012;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CayHr2whlw9n+hZr/FOjSLSEd8DtQsqpdSZVGh8awZg=;
 b=iRh/ckA7mpjuNHvj5lwfLfg0I8hBUNgFe2v5QKscVEwC9cYHkYcDr0Yo+TqtUpqbqE8Wvc
 I52lws+lH600GcHd6x1W/NSqdYcAaSHRTKUkh6ejnFxwEje0wCTD8ILpbdko97dAshJM00
 40nBiXYmnPJpjYOgQU9WpUz2b+2GOQA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-ORzOtzr-MHiMxJYWtaF22g-1; Thu, 20 Apr 2023 06:03:31 -0400
X-MC-Unique: ORzOtzr-MHiMxJYWtaF22g-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb2easo145090f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985010; x=1684577010;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CayHr2whlw9n+hZr/FOjSLSEd8DtQsqpdSZVGh8awZg=;
 b=KBq1+9fs9UDWoEh4AQOQnGmu9l3rCQxh2ReIhK3lFchPVFVCPzO+yfSsf7p/dOnrde
 8FlmpfwRkyHz8RXJ9HNRlz6HYmiDcTmgiqnlbQkoNR40EVqEWwo4Z/3+tnPUDulMkd1u
 RJlFc4GwR2wfUzs6te9h8PAJEgJpDP6ulKGaiTvNQIQCIecwzd7ug4apPCFVeWYe5eGF
 HJXvsaDDqEyHjAgkd8FudmbvJReUQ2dTPfsvA6ZXmH+TFjx1RWNfzr6mMfQAGEyDx24P
 4QbGlxSx0t33VXBHmF34VkHcOIPiW6fd1dDaK0tWBHUTSc7K5SWWEFXM7+m0Dn0mHHY1
 thGw==
X-Gm-Message-State: AAQBX9cArJm3logH3rsKcyTDy0NWdytKhwIlOm82ula0RZvd7e7QwkyB
 9480ljH12q594PfUKcVl6CicOcgX/zdcT5VfmnXrC8ytOPegkiTrVRbs7T5I59FYGCtmBmD66mm
 8KfT/9JK082Ko2NM=
X-Received: by 2002:a5d:6591:0:b0:2fb:1a68:1d96 with SMTP id
 q17-20020a5d6591000000b002fb1a681d96mr813303wru.15.1681985010208; 
 Thu, 20 Apr 2023 03:03:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350afmBsCyCUQdVg3wMDKbN3RZQnpFb2O2Js/yPAtpKx+XWR0hHMB100EblQwX1nOOqV3HxQljw==
X-Received: by 2002:a5d:6591:0:b0:2fb:1a68:1d96 with SMTP id
 q17-20020a5d6591000000b002fb1a681d96mr813275wru.15.1681985009874; 
 Thu, 20 Apr 2023 03:03:29 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6291000000b002c561805a4csm1541641wru.45.2023.04.20.03.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:03:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  michael.roth@amd.com,
 armbru@redhat.com,  eblake@redhat.com,  jasowang@redhat.com,
 zhanghailiang@xfusion.com,  philmd@linaro.org,  thuth@redhat.com,
 berrange@redhat.com,  marcandre.lureau@redhat.com,  pbonzini@redhat.com,
 dave@treblig.org,  hreitz@redhat.com,  kwolf@redhat.com,
 chen.zhang@intel.com,  lizhijian@fujitsu.com
Subject: Re: [PATCH v2 3/4] build: move COLO under CONFIG_REPLICATION
In-Reply-To: <20230419225232.508121-4-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Thu, 20 Apr 2023 01:52:31 +0300")
References: <20230419225232.508121-1-vsementsov@yandex-team.ru>
 <20230419225232.508121-4-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 12:03:28 +0200
Message-ID: <87h6tazx8v.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> We don't allow to use x-colo capability when replication is not
> configured. So, no reason to build COLO when replication is disabled,
> it's unusable in this case.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

> +bool migrate_colo_enabled(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_X_COLO];
> +}

I consolidated all the capabilities check on my series on the list on
options.c, so this will go there.

> diff --git a/migration/migration.c b/migration/migration.c
> index bda4789193..2382958364 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -165,7 +165,9 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_snapshot,
>      MIGRATION_CAPABILITY_RDMA_PIN_ALL,
>      MIGRATION_CAPABILITY_COMPRESS,
>      MIGRATION_CAPABILITY_XBZRLE,
> +#ifdef CONFIG_REPLICATION
>      MIGRATION_CAPABILITY_X_COLO,
> +#endif

Why?

I very much preffer the capability to be there and just fail when we try
to enable it.  That way we only need the #ifdef in one place and not all
over the place.

>      MIGRATION_CAPABILITY_VALIDATE_UUID,
>      MIGRATION_CAPABILITY_ZERO_COPY_SEND);
>  
> @@ -1329,15 +1331,6 @@ static bool migrate_caps_check(bool *cap_list,
>      }
>  #endif
>  
> -#ifndef CONFIG_REPLICATION
> -    if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
> -        error_setg(errp, "QEMU compiled without replication module"
> -                   " can't enable COLO");
> -        error_append_hint(errp, "Please enable replication before COLO.\n");
> -        return false;
> -    }
> -#endif
> -

See, like this O:-)

> diff --git a/qapi/migration.json b/qapi/migration.json
> index c84fa10e86..93863fa88c 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -486,7 +486,8 @@
>  { 'enum': 'MigrationCapability',
>    'data': ['xbzrle', 'rdma-pin-all', 'auto-converge', 'zero-blocks',
>             'compress', 'events', 'postcopy-ram',
> -           { 'name': 'x-colo', 'features': [ 'unstable' ] },
> +           { 'name': 'x-colo', 'features': [ 'unstable' ],
> +             'if': 'CONFIG_REPLICATION' },
>             'release-ram',
>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',


Aha, It is for this that you changed the black magic on the previous
patch. Looks ok from my ignorance.  As said before, I would not remove
the capability, left it the way it was.

You have less code (less #ifdefs that you just had to add), and
enabling/disabling checking capabilities don't need anything from replication.

>  #
>  ##
>  { 'command': 'x-colo-lost-heartbeat',
> -  'features': [ 'unstable' ] }
> +  'features': [ 'unstable' ],
> +  'if': 'CONFIG_REPLICATION' }
>  
>  ##
>  # @migrate_cancel:
> @@ -1685,7 +1687,8 @@
>  ##
>  { 'struct': 'COLOStatus',
>    'data': { 'mode': 'COLOMode', 'last-mode': 'COLOMode',
> -            'reason': 'COLOExitReason' } }
> +            'reason': 'COLOExitReason' },
> +  'if': 'CONFIG_REPLICATION' }
>  
>  ##
>  # @query-colo-status:
> @@ -1702,7 +1705,8 @@
>  # Since: 3.1
>  ##
>  { 'command': 'query-colo-status',
> -  'returns': 'COLOStatus' }
> +  'returns': 'COLOStatus',
> +  'if': 'CONFIG_REPLICATION' }
>  
>  ##
>  # @migrate-recover:

Disabling the command is ok for me.

> diff --git a/stubs/colo.c b/stubs/colo.c
> new file mode 100644
> index 0000000000..45c8ac0cc6

...

> +bool migrate_colo_enabled(void)
> +{
> +    return false;
> +}

You don't need this one if you follow my idea.


Notice that I fully agree with being able to disable colo O:-)

Later, Juan.


