Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EC42B1A50
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 12:51:23 +0100 (CET)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdXbu-0002YY-OM
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 06:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdXaE-0001hI-G7
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:49:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdXaA-0004KA-G6
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 06:49:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605268173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cq9vAlp9eBkBfLmmfWkTFiMvXysmFYX56Q8o54EkYV4=;
 b=eUg34CV9oy75d4QLpzBITmZ4A162VTUHvyCzILDELH3AF1fJ0Pbc2iKF8RbbW9ljy0pdtB
 KZYYIVjPnbQjthaMNA15afL9k08zKOWVoWuhjBi1mTnfJqIrvQeV1Zlzlu2LcN57Uhs5rJ
 T0lL77ZLmz/WnRSd8Vk1AEAlKB4oCHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-LUhwKCekNwavIzvKlbaEPg-1; Fri, 13 Nov 2020 06:49:31 -0500
X-MC-Unique: LUhwKCekNwavIzvKlbaEPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DD7D85C706
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 11:49:30 +0000 (UTC)
Received: from work-vm (ovpn-114-160.ams2.redhat.com [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31F1119C66;
 Fri, 13 Nov 2020 11:49:29 +0000 (UTC)
Date: Fri, 13 Nov 2020 11:49:26 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/6] migration: Fix migrate-set-parameters argument
 validation
Message-ID: <20201113114926.GF3251@work-vm>
References: <20201113065236.2644169-1-armbru@redhat.com>
 <20201113065236.2644169-3-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201113065236.2644169-3-armbru@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Markus Armbruster (armbru@redhat.com) wrote:
> Commit 741d4086c8 "migration: Use proper types in json" (v2.12.0)
> switched MigrationParameters to narrower integer types, and removed
> the simplified qmp_migrate_set_parameters()'s argument checking
> accordingly.
> 
> Good idea, except qmp_migrate_set_parameters() takes
> MigrateSetParameters, not MigrationParameters.  Its job is updating
> migrate_get_current()->parameters (which *is* of type
> MigrationParameters) according to its argument.  The integers now get
> truncated silently.  Reproducer:
> 
>     ---> {'execute': 'query-migrate-parameters'}
>     <--- {"return": {[...] "compress-threads": 8, [...]}}
>     ---> {"execute": "migrate-set-parameters", "arguments": {"compress-threads": 257}}
>     <--- {"return": {}}
>     ---> {'execute': 'query-migrate-parameters'}
>     <--- {"return": {[...] "compress-threads": 1, [...]}}
> 
> Fix by resynchronizing MigrateSetParameters with MigrationParameters.

Having those two separate types is a pain!

> Fixes: 741d4086c856320807a2575389d7c0505578270b
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  qapi/migration.json | 28 ++++++++++++++--------------
>  monitor/hmp-cmds.c  | 24 ++++++++++++------------
>  2 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 688e8da749..3ad3720cf0 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -885,28 +885,28 @@
>              '*announce-max': 'size',
>              '*announce-rounds': 'size',
>              '*announce-step': 'size',
> -            '*compress-level': 'int',
> -            '*compress-threads': 'int',
> +            '*compress-level': 'uint8',
> +            '*compress-threads': 'uint8',
>              '*compress-wait-thread': 'bool',
> -            '*decompress-threads': 'int',
> -            '*throttle-trigger-threshold': 'int',
> -            '*cpu-throttle-initial': 'int',
> -            '*cpu-throttle-increment': 'int',
> +            '*decompress-threads': 'uint8',
> +            '*throttle-trigger-threshold': 'uint8',
> +            '*cpu-throttle-initial': 'uint8',
> +            '*cpu-throttle-increment': 'uint8',
>              '*cpu-throttle-tailslow': 'bool',
>              '*tls-creds': 'StrOrNull',
>              '*tls-hostname': 'StrOrNull',
>              '*tls-authz': 'StrOrNull',
> -            '*max-bandwidth': 'int',
> -            '*downtime-limit': 'int',
> -            '*x-checkpoint-delay': 'int',
> +            '*max-bandwidth': 'size',
> +            '*downtime-limit': 'uint64',
> +            '*x-checkpoint-delay': 'uint32',
>              '*block-incremental': 'bool',
> -            '*multifd-channels': 'int',
> +            '*multifd-channels': 'uint8',
>              '*xbzrle-cache-size': 'size',
>              '*max-postcopy-bandwidth': 'size',
> -            '*max-cpu-throttle': 'int',
> +            '*max-cpu-throttle': 'uint8',
>              '*multifd-compression': 'MultiFDCompression',
> -            '*multifd-zlib-level': 'int',
> -            '*multifd-zstd-level': 'int',
> +            '*multifd-zlib-level': 'uint8',
> +            '*multifd-zstd-level': 'uint8',
>              '*block-bitmap-mapping': [ 'BitmapMigrationNodeAlias' ] } }
>  
>  ##
> @@ -1093,7 +1093,7 @@
>              '*max-bandwidth': 'size',
>              '*downtime-limit': 'uint64',
>              '*x-checkpoint-delay': 'uint32',
> -            '*block-incremental': 'bool' ,
> +            '*block-incremental': 'bool',
>              '*multifd-channels': 'uint8',
>              '*xbzrle-cache-size': 'size',
>              '*max-postcopy-bandwidth': 'size',
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 492789248f..f8ef061510 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1292,11 +1292,11 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>      switch (val) {
>      case MIGRATION_PARAMETER_COMPRESS_LEVEL:
>          p->has_compress_level = true;
> -        visit_type_int(v, param, &p->compress_level, &err);
> +        visit_type_uint8(v, param, &p->compress_level, &err);
>          break;
>      case MIGRATION_PARAMETER_COMPRESS_THREADS:
>          p->has_compress_threads = true;
> -        visit_type_int(v, param, &p->compress_threads, &err);
> +        visit_type_uint8(v, param, &p->compress_threads, &err);
>          break;
>      case MIGRATION_PARAMETER_COMPRESS_WAIT_THREAD:
>          p->has_compress_wait_thread = true;
> @@ -1304,19 +1304,19 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          break;
>      case MIGRATION_PARAMETER_DECOMPRESS_THREADS:
>          p->has_decompress_threads = true;
> -        visit_type_int(v, param, &p->decompress_threads, &err);
> +        visit_type_uint8(v, param, &p->decompress_threads, &err);
>          break;
>      case MIGRATION_PARAMETER_THROTTLE_TRIGGER_THRESHOLD:
>          p->has_throttle_trigger_threshold = true;
> -        visit_type_int(v, param, &p->throttle_trigger_threshold, &err);
> +        visit_type_uint8(v, param, &p->throttle_trigger_threshold, &err);
>          break;
>      case MIGRATION_PARAMETER_CPU_THROTTLE_INITIAL:
>          p->has_cpu_throttle_initial = true;
> -        visit_type_int(v, param, &p->cpu_throttle_initial, &err);
> +        visit_type_uint8(v, param, &p->cpu_throttle_initial, &err);
>          break;
>      case MIGRATION_PARAMETER_CPU_THROTTLE_INCREMENT:
>          p->has_cpu_throttle_increment = true;
> -        visit_type_int(v, param, &p->cpu_throttle_increment, &err);
> +        visit_type_uint8(v, param, &p->cpu_throttle_increment, &err);
>          break;
>      case MIGRATION_PARAMETER_CPU_THROTTLE_TAILSLOW:
>          p->has_cpu_throttle_tailslow = true;
> @@ -1324,7 +1324,7 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          break;
>      case MIGRATION_PARAMETER_MAX_CPU_THROTTLE:
>          p->has_max_cpu_throttle = true;
> -        visit_type_int(v, param, &p->max_cpu_throttle, &err);
> +        visit_type_uint8(v, param, &p->max_cpu_throttle, &err);
>          break;
>      case MIGRATION_PARAMETER_TLS_CREDS:
>          p->has_tls_creds = true;
> @@ -1360,11 +1360,11 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          break;
>      case MIGRATION_PARAMETER_DOWNTIME_LIMIT:
>          p->has_downtime_limit = true;
> -        visit_type_int(v, param, &p->downtime_limit, &err);
> +        visit_type_size(v, param, &p->downtime_limit, &err);
>          break;
>      case MIGRATION_PARAMETER_X_CHECKPOINT_DELAY:
>          p->has_x_checkpoint_delay = true;
> -        visit_type_int(v, param, &p->x_checkpoint_delay, &err);
> +        visit_type_uint32(v, param, &p->x_checkpoint_delay, &err);
>          break;
>      case MIGRATION_PARAMETER_BLOCK_INCREMENTAL:
>          p->has_block_incremental = true;
> @@ -1372,7 +1372,7 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          break;
>      case MIGRATION_PARAMETER_MULTIFD_CHANNELS:
>          p->has_multifd_channels = true;
> -        visit_type_int(v, param, &p->multifd_channels, &err);
> +        visit_type_uint8(v, param, &p->multifd_channels, &err);
>          break;
>      case MIGRATION_PARAMETER_MULTIFD_COMPRESSION:
>          p->has_multifd_compression = true;
> @@ -1381,11 +1381,11 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>          break;
>      case MIGRATION_PARAMETER_MULTIFD_ZLIB_LEVEL:
>          p->has_multifd_zlib_level = true;
> -        visit_type_int(v, param, &p->multifd_zlib_level, &err);
> +        visit_type_uint8(v, param, &p->multifd_zlib_level, &err);
>          break;
>      case MIGRATION_PARAMETER_MULTIFD_ZSTD_LEVEL:
>          p->has_multifd_zstd_level = true;
> -        visit_type_int(v, param, &p->multifd_zstd_level, &err);
> +        visit_type_uint8(v, param, &p->multifd_zstd_level, &err);
>          break;
>      case MIGRATION_PARAMETER_XBZRLE_CACHE_SIZE:
>          p->has_xbzrle_cache_size = true;
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


