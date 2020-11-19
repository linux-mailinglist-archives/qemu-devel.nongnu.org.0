Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC92B9AEE
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:53:31 +0100 (CET)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfp3i-0006F1-RA
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfp2G-0005ki-CH
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:52:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfp2E-0004JP-DB
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605811917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dyr7o0DkjJt9/8zQffDXdHEhDOPJuVLz7nfU2zrjkXE=;
 b=ApvoAmLbAuoGv5pjsMamN393WR52p3JKR6TLYAxzRX5u15LFSQSCyh939zFMrxpVOlWFCN
 9jfHBtf2ueOtWEpayLdNOk1Jq5LKNMzDBD1XRP6/MSwZWxERMW39cXFbARcHfDQIG7UmdI
 GgyWbYu+fmdyUBckRSvr3whuHoa8pSE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-vhtHBX7wPM6uC0E8Wx7Gsg-1; Thu, 19 Nov 2020 13:51:53 -0500
X-MC-Unique: vhtHBX7wPM6uC0E8Wx7Gsg-1
Received: by mail-qk1-f199.google.com with SMTP id q21so5814453qkq.11
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:51:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dyr7o0DkjJt9/8zQffDXdHEhDOPJuVLz7nfU2zrjkXE=;
 b=p1618PyYXCddfizRS2S+FtnBFAlaxv3perZu0uI830j+QFewWdteVu28gPJYLb+sA7
 IUZuMP7dcBwS+9wmQbG10DKJ+OH1p3LMaILDOq+O1qSO137NkuIAcDMbgC52yZPQUcix
 vPbBQitfpzBuFImaMdxhr819Z2QnqG6SOkobcAj6p+diH+RSWA75bE4ae913kaBpsNCZ
 eMPg2UfHb57iG6wwX8i0VRXoq4MLU10R/+NtHtEnd6+RTk2/9UeqYp18LsD1sSl3b5bS
 F+MjsURgvri+i0GJwHGL+In3YWLIx1AaC9AsN79T28CZRHl+xHRN7UNyBdHsYPYKMN3y
 eGjA==
X-Gm-Message-State: AOAM5328f+7Q746ywiESPdKSGRRXSK7vlrN2tnjyX7Mv4IvFvLfYMzid
 HISgrJpTsooWIhJVTBcbjregjcGw94LrL0XkBC3VHoIgsmf4Vc6KOcaA/CvnoAKpT2vY1JGd0jA
 c36p7qeC7xfCFKAU=
X-Received: by 2002:a37:a943:: with SMTP id s64mr12214208qke.15.1605811913218; 
 Thu, 19 Nov 2020 10:51:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkgVaVRJF0yVJknUPqDmmFzxUcIIyfEir/esgFd32AdDQIq1QHvhb28pvZY6bjB495RKs7AQ==
X-Received: by 2002:a37:a943:: with SMTP id s64mr12214186qke.15.1605811912867; 
 Thu, 19 Nov 2020 10:51:52 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id o35sm488091qtd.84.2020.11.19.10.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 10:51:51 -0800 (PST)
Date: Thu, 19 Nov 2020 13:51:50 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 1/7] introduce 'track-writes-ram' migration capability
Message-ID: <20201119185150.GF6538@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-2-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201119125940.20017-2-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 03:59:34PM +0300, Andrey Gruzdev via wrote:
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> ---
>  migration/migration.c | 96 +++++++++++++++++++++++++++++++++++++++++++
>  migration/migration.h |  1 +
>  qapi/migration.json   |  7 +++-
>  3 files changed, 103 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 87a9b59f83..ff0364dde0 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -56,6 +56,7 @@
>  #include "net/announce.h"
>  #include "qemu/queue.h"
>  #include "multifd.h"
> +#include "sysemu/cpus.h"
>  
>  #ifdef CONFIG_VFIO
>  #include "hw/vfio/vfio-common.h"
> @@ -1165,6 +1166,91 @@ static bool migrate_caps_check(bool *cap_list,
>          }
>      }
>  
> +    if (cap_list[MIGRATION_CAPABILITY_TRACK_WRITES_RAM]) {
> +        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with postcopy-ram");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_DIRTY_BITMAPS]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with dirty-bitmaps");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_BLOCKTIME]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with postcopy-blocktime");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_LATE_BLOCK_ACTIVATE]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with late-block-activate");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_RETURN_PATH]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with return-path");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
> +            error_setg(errp, "Track-writes is not compatible with multifd");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_PAUSE_BEFORE_SWITCHOVER]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with pause-before-switchover");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_AUTO_CONVERGE]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with auto-converge");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_RELEASE_RAM]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with release-ram");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_RDMA_PIN_ALL]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with rdma-pin-all");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with compression");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_XBZRLE]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with XBZLRE");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_X_COLO]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with x-colo");
> +            return false;
> +        }
> +
> +        if (cap_list[MIGRATION_CAPABILITY_VALIDATE_UUID]) {
> +            error_setg(errp,
> +                    "Track-writes is not compatible with validate-uuid");
> +            return false;
> +        }
> +    }
> +
>      return true;
>  }
>  
> @@ -2490,6 +2576,15 @@ bool migrate_use_block_incremental(void)
>      return s->parameters.block_incremental;
>  }
>  
> +bool migrate_track_writes_ram(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_TRACK_WRITES_RAM];
> +}
> +
>  /* migration thread support */
>  /*
>   * Something bad happened to the RP stream, mark an error
> @@ -3783,6 +3878,7 @@ static Property migration_properties[] = {
>      DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
>      DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
>      DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
> +    DEFINE_PROP_MIG_CAP("x-track-writes-ram", MIGRATION_CAPABILITY_TRACK_WRITES_RAM),
>  
>      DEFINE_PROP_END_OF_LIST(),
>  };
> diff --git a/migration/migration.h b/migration/migration.h
> index d096b77f74..339ae720e0 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -341,6 +341,7 @@ int migrate_compress_wait_thread(void);
>  int migrate_decompress_threads(void);
>  bool migrate_use_events(void);
>  bool migrate_postcopy_blocktime(void);
> +bool migrate_track_writes_ram(void);
>  
>  /* Sending on the return path - generic and then for each message type */
>  void migrate_send_rp_shut(MigrationIncomingState *mis,
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 3c75820527..a28d8b7ee8 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -442,6 +442,11 @@
>  # @validate-uuid: Send the UUID of the source to allow the destination
>  #                 to ensure it is the same. (since 4.2)
>  #
> +# @track-writes-ram: If enabled, the migration stream will be a snapshot
> +#                    of the VM exactly at the point when the migration
> +#                    procedure starts. The VM RAM is saved with running VM.
> +#                    (since 6.0)
> +#

The name is slightly confusing to me.  Could I ask why changed from previous
one?  "snapshot" sounds a very necessary keyword to me here and tells exactly
on what we do...  Because we can do quite a few things with "trace-writes-ram"
but not snapshotting, e.g., to calculate per-vm dirty rates.

-- 
Peter Xu


