Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3363CB2F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 23:50:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p09Pc-0002q1-Ig; Tue, 29 Nov 2022 17:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p09PZ-0002pA-En
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 17:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p09PX-0000f8-C0
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 17:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669762146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PZvDpJnnApPbyEZLaPlT6pME7vB+DB4r0nKQosRm/c=;
 b=NaQPvMyRHPVb3dyGeD9VLOo/1PAlcVVZ39pawoT6lLyVoE/7skfaSVSyHMx5fsVcPUHOO1
 EfFrSEbF4pKCNy2FBUbCJXqsexqgF6BTNNNofUoFALjNlr59sha97VpQ4tqji4avxwGbro
 pV5ufmggKwgg0nZ+DQUv1lUMqGk0uKs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-418-SOxeXhlBMkGpZ2BugCklmQ-1; Tue, 29 Nov 2022 17:49:04 -0500
X-MC-Unique: SOxeXhlBMkGpZ2BugCklmQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 d8-20020a0cfe88000000b004bb65193fdcso22190720qvs.12
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 14:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8PZvDpJnnApPbyEZLaPlT6pME7vB+DB4r0nKQosRm/c=;
 b=Is9CIdn/TLMN2YR5NoiN1YzILNAjA/Xt5HNS/H2gbRS/zeOmV60Gs+DJNfvKcDf2Za
 bB5qNTZA31NZ1fRebeZfRZsds4e9rr2NV6EJV43swklVuHBdQ/x+94Pp67rc/NXhzI0w
 srmfd2o5eQ0BPUVh7gJ2vrpJDhdSSKULfJbMxq1+7OqftD+8KSY1SfnMopZoELCSt9tG
 fdjTzsN++biiF816aeAUIWP+nMQaGo821yha1UbAsm+MMnZLYlksv+D7hXO5pEIZYU4V
 oSThFUtOK6yfCwZrc6MMeBK72C+xQf/kM2/HPGdSRo7d5Jlq0wXapKzF9Lz8dLgLxeSV
 BdDA==
X-Gm-Message-State: ANoB5pn4K848TrscSRg2pAycqw6N2UFQKBHIXyf0+uaoXOWQ7akqGjXR
 r3tJf2G63znBWLGvwqfKciZj+hbLm0MSHgZ8lY1fRjrocv/EzRGtEX1TjHVvFMHeZYJulU/X+kE
 vD5yGP40vxWMSJBY=
X-Received: by 2002:a37:b742:0:b0:6fc:9b4e:8c76 with SMTP id
 h63-20020a37b742000000b006fc9b4e8c76mr127651qkf.619.1669762143832; 
 Tue, 29 Nov 2022 14:49:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ltZdSWppaJxghzg4A46JHeOb5oQvvR6H8GBXRJ3PptUrE3fvlB4UtzDGfn2P5IFNOI7HGrA==
X-Received: by 2002:a37:b742:0:b0:6fc:9b4e:8c76 with SMTP id
 h63-20020a37b742000000b006fc9b4e8c76mr127621qkf.619.1669762143496; 
 Tue, 29 Nov 2022 14:49:03 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 dt31-20020a05620a479f00b006fbf88667bcsm11422007qkb.77.2022.11.29.14.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 14:49:03 -0800 (PST)
Date: Tue, 29 Nov 2022 17:49:02 -0500
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 04/11] qapi/migration: Introduce
 x-vcpu-dirty-limit-period parameter
Message-ID: <Y4aMXtnH2G8bz+Am@x1n>
References: <cover.1669047366.git.huangy81@chinatelecom.cn>
 <9e6d5e0ab54c82c8b42a3b318249320fb20e3a44.1669047366.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e6d5e0ab54c82c8b42a3b318249320fb20e3a44.1669047366.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Mon, Nov 21, 2022 at 11:26:36AM -0500, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Introduce "x-vcpu-dirty-limit-period" migration experimental
> parameter, which is in the range of 1 to 1000ms and used to
> make dirtyrate calculation period configurable.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  migration/migration.c | 26 ++++++++++++++++++++++++++
>  monitor/hmp-cmds.c    |  8 ++++++++
>  qapi/migration.json   | 34 +++++++++++++++++++++++++++-------
>  3 files changed, 61 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 739bb68..701267c 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -116,6 +116,8 @@
>  #define DEFAULT_MIGRATE_ANNOUNCE_ROUNDS    5
>  #define DEFAULT_MIGRATE_ANNOUNCE_STEP    100
>  
> +#define DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD     500     /* ms */
> +
>  static NotifierList migration_state_notifiers =
>      NOTIFIER_LIST_INITIALIZER(migration_state_notifiers);
>  
> @@ -963,6 +965,9 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
>                         s->parameters.block_bitmap_mapping);
>      }
>  
> +    params->has_x_vcpu_dirty_limit_period = true;
> +    params->x_vcpu_dirty_limit_period = s->parameters.x_vcpu_dirty_limit_period;
> +
>      return params;
>  }
>  
> @@ -1564,6 +1569,15 @@ static bool migrate_params_check(MigrationParameters *params, Error **errp)
>      }
>  #endif
>  
> +    if (params->has_x_vcpu_dirty_limit_period &&
> +        (params->x_vcpu_dirty_limit_period < 1 ||
> +         params->x_vcpu_dirty_limit_period > 1000)) {
> +        error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
> +                   "x_vcpu_dirty_limit_period",
> +                   "is invalid, it must be in the range of 1 to 1000 ms");
> +        return false;
> +    }
> +
>      return true;
>  }
>  
> @@ -1663,6 +1677,10 @@ static void migrate_params_test_apply(MigrateSetParameters *params,
>          dest->has_block_bitmap_mapping = true;
>          dest->block_bitmap_mapping = params->block_bitmap_mapping;
>      }
> +
> +    if (params->has_x_vcpu_dirty_limit_period) {
> +        dest->x_vcpu_dirty_limit_period = params->x_vcpu_dirty_limit_period;
> +    }
>  }
>  
>  static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
> @@ -1785,6 +1803,10 @@ static void migrate_params_apply(MigrateSetParameters *params, Error **errp)
>              QAPI_CLONE(BitmapMigrationNodeAliasList,
>                         params->block_bitmap_mapping);
>      }
> +    if (params->has_x_vcpu_dirty_limit_period) {
> +        s->parameters.x_vcpu_dirty_limit_period =
> +            params->x_vcpu_dirty_limit_period;
> +    }
>  }
>  
>  void qmp_migrate_set_parameters(MigrateSetParameters *params, Error **errp)
> @@ -4386,6 +4408,9 @@ static Property migration_properties[] = {
>      DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
>      DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
>      DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
> +    DEFINE_PROP_UINT64("x-vcpu-dirty-limit-period", MigrationState,
> +                       parameters.x_vcpu_dirty_limit_period,
> +                       DEFAULT_MIGRATE_VCPU_DIRTY_LIMIT_PERIOD),
>  
>      /* Migration capabilities */
>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> @@ -4477,6 +4502,7 @@ static void migration_instance_init(Object *obj)
>      params->has_tls_creds = true;
>      params->has_tls_hostname = true;
>      params->has_tls_authz = true;
> +    params->has_x_vcpu_dirty_limit_period = true;
>  
>      qemu_sem_init(&ms->postcopy_pause_sem, 0);
>      qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 01b789a..a3170ca 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -513,6 +513,10 @@ void hmp_info_migrate_parameters(Monitor *mon, const QDict *qdict)
>                  }
>              }
>          }
> +
> +        monitor_printf(mon, "%s: %" PRIu64 " ms\n",
> +        MigrationParameter_str(MIGRATION_PARAMETER_X_VCPU_DIRTY_LIMIT_PERIOD),
> +        params->x_vcpu_dirty_limit_period);
>      }
>  
>      qapi_free_MigrationParameters(params);
> @@ -1332,6 +1336,10 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          error_setg(&err, "The block-bitmap-mapping parameter can only be set "
>                     "through QMP");
>          break;
> +    case MIGRATION_PARAMETER_X_VCPU_DIRTY_LIMIT_PERIOD:
> +        p->has_x_vcpu_dirty_limit_period = true;
> +        visit_type_size(v, param, &p->x_vcpu_dirty_limit_period, &err);
> +        break;
>      default:
>          assert(0);
>      }
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88ecf86..5175779 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -776,8 +776,13 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
> +#                             Should be in the range 1 to 1000ms, defaults to 500ms.
> +#                             (Since 7.1)

Not 7.1 anymore but 7.3.  Yeah a bit sad.

> +#
>  # Features:
> -# @unstable: Member @x-checkpoint-delay is experimental.
> +# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
> +#            are experimental.
>  #
>  # Since: 2.4
>  ##
> @@ -795,8 +800,9 @@
>             'multifd-channels',
>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>             'max-cpu-throttle', 'multifd-compression',
> -           'multifd-zlib-level' ,'multifd-zstd-level',
> -           'block-bitmap-mapping' ] }
> +           'multifd-zlib-level', 'multifd-zstd-level',
> +           'block-bitmap-mapping',
> +           { 'name': 'x-vcpu-dirty-limit-period', 'features': ['unstable'] } ] }
>  
>  ##
>  # @MigrateSetParameters:
> @@ -941,8 +947,13 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
> +#                             Should be in the range 1 to 1000ms, defaults to 500ms.
> +#                             (Since 7.1)

Same here.

> +#
>  # Features:
> -# @unstable: Member @x-checkpoint-delay is experimental.
> +# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
> +#            are experimental.
>  #
>  # Since: 2.4
>  ##
> @@ -976,7 +987,9 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
> +                                            'features': [ 'unstable' ] } } }
>  
>  ##
>  # @migrate-set-parameters:
> @@ -1141,8 +1154,13 @@
>  #                        block device name if there is one, and to their node name
>  #                        otherwise. (Since 5.2)
>  #
> +# @x-vcpu-dirty-limit-period: Periodic time (ms) of dirty limit during live migration.
> +#                             Should be in the range 1 to 1000ms, defaults to 500ms.
> +#                             (Since 7.1)

Same here.

> +#
>  # Features:
> -# @unstable: Member @x-checkpoint-delay is experimental.
> +# @unstable: Member @x-checkpoint-delay and @x-vcpu-dirty-limit-period
> +#            are experimental.
>  #
>  # Since: 2.4
>  ##
> @@ -1174,7 +1192,9 @@
>              '*multifd-compression': 'MultiFDCompression',
>              '*multifd-zlib-level': 'uint8',
>              '*multifd-zstd-level': 'uint8',
> -            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
> +            '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ],
> +            '*x-vcpu-dirty-limit-period': { 'type': 'uint64',
> +                                            'features': [ 'unstable' ] } } }
>  
>  ##
>  # @query-migrate-parameters:
> -- 
> 1.8.3.1
> 
> 

-- 
Peter Xu


