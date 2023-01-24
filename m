Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA39B67984C
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 13:47:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKIh1-0000bJ-Qn; Tue, 24 Jan 2023 07:46:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pKIgO-0000Qw-Nb
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pKIgL-00045g-FW
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 07:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674564344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dH4pcDvmC1r7sjaozowsLfKQKyjEjg6VSX792ITjZSs=;
 b=VHMCiCDx1hpGHr8OD0QeRJH7X5XqJF9Q9/55Q0vD1FWDa8dOVkv5/pX+t70Rb2vw2ytoYh
 8J5+IaIKM0w1QIbRgjUAWm13yQcHEux6Rpf85q1zs58sQBJIUr0VCJqpzljvBAj4YQZUoJ
 V7gsI0VWCiEaT2kk4VuJlX36NGqOMiU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-180-n1OG_igtNPqHCuBN6RzFCg-1; Tue, 24 Jan 2023 07:45:42 -0500
X-MC-Unique: n1OG_igtNPqHCuBN6RzFCg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg24-20020a05600c3c9800b003db0ddddb6fso9170588wmb.0
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 04:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dH4pcDvmC1r7sjaozowsLfKQKyjEjg6VSX792ITjZSs=;
 b=Q68nSne/zoKbWp4OW7qHd39dXJtCgBHQGuceIJvQgnWrpQKoAicL83jJWRcseTM9gb
 9w2uOAtY+qFxlEeIgPWy4AqKSOD3MrNtTl5aTmPVS+yXW6f6ptZ4E+mTnWXTRttKpmLp
 pMd5f4eBBpgCQFRINAfRAIFemwOgJ49haxzLswgLpVQ/dJULMjhysxl4mcwOTYeg6mCm
 cXlID4DT3tbcnaO2IlhpzKrxceGMsb2vOyiiWDTzgVFIlTxv6naRedGlKh+PY5eLwKv3
 fgu3qO2WBeg5TzRudrIlsvZZUyOjZjo1MtcziQ1ukTGjcJAbC8bMVklEVke5ZJk4VXwE
 rAPg==
X-Gm-Message-State: AFqh2kqmKemg5GkN7EkPIwBMOHEe+j3DOibe0dxJITL3OX4kbPz2FmcZ
 Q13KFJfjQ7k6oqQAiNgZDTNv40p+OkwRuw4C+CA6hEPDgvLLesXglXNABDjyBSIYB/xDuwuPI/M
 vaRtnPWn9KQtlvk4=
X-Received: by 2002:a5d:6b48:0:b0:2bd:d34e:5355 with SMTP id
 x8-20020a5d6b48000000b002bdd34e5355mr24090083wrw.20.1674564341514; 
 Tue, 24 Jan 2023 04:45:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsIJPLBOINbjNZbPtESzEPIA5U1aFleUebC6ffVMTbb67SK4fF8zHO4b0jhuehH07gKTh0eLQ==
X-Received: by 2002:a5d:6b48:0:b0:2bd:d34e:5355 with SMTP id
 x8-20020a5d6b48000000b002bdd34e5355mr24090074wrw.20.1674564341275; 
 Tue, 24 Jan 2023 04:45:41 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b002bdf3809f59sm1819224wra.38.2023.01.24.04.45.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 04:45:40 -0800 (PST)
Date: Tue, 24 Jan 2023 12:45:38 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 11/21] migration: Add hugetlb-doublemap cap
Message-ID: <Y8/S8g4s42RCBTEV@work-vm>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-12-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117220914.2062125-12-peterx@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Peter Xu (peterx@redhat.com) wrote:
> Add a new cap to allow mapping hugetlbfs backed RAMs in small page sizes.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

although, I'm curious if the protocol actually changes - or whether
a doublepage enabled destination would work with an unmodified source?
I guess potentially you can get away without the dirty clearing of the
partially sent hugepages that the source normally does.

Dave

> ---
>  migration/migration.c | 48 ++++++++++++++++++++++++++++++++++++++++++-
>  migration/migration.h |  1 +
>  qapi/migration.json   |  7 ++++++-
>  3 files changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 64f74534e2..b174f2af92 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -17,6 +17,7 @@
>  #include "qemu/cutils.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
> +#include "qemu/madvise.h"
>  #include "migration/blocker.h"
>  #include "exec.h"
>  #include "fd.h"
> @@ -62,6 +63,7 @@
>  #include "sysemu/cpus.h"
>  #include "yank_functions.h"
>  #include "sysemu/qtest.h"
> +#include "exec/ramblock.h"
>  
>  #define MAX_THROTTLE  (128 << 20)      /* Migration transfer speed throttling */
>  
> @@ -1363,12 +1365,47 @@ static bool migrate_caps_check(bool *cap_list,
>                     "Zero copy only available for non-compressed non-TLS multifd migration");
>          return false;
>      }
> +
> +    if (cap_list[MIGRATION_CAPABILITY_HUGETLB_DOUBLEMAP]) {
> +        RAMBlock *rb;
> +
> +        /* Check whether the platform/binary supports the new madvise()s */
> +
> +#if QEMU_MADV_SPLIT == QEMU_MADV_INVALID
> +        error_setg(errp, "MADV_SPLIT is not supported by the QEMU binary");
> +        return false;
> +#endif
> +
> +#if QEMU_MADV_COLLAPSE == QEMU_MADV_INVALID
> +        error_setg(errp, "MADV_COLLAPSE is not supported by the QEMU binary");
> +        return false;
> +#endif
> +
> +        /*
> +         * Check against kernel support of MADV_SPLIT is not easy, delay
> +         * that until we have all the hugetlb mappings ready on dest node,
> +         * meanwhile do the best effort check here because doublemap
> +         * requires the hugetlb ramblocks to be shared first.
> +         */
> +        RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
> +            if (qemu_ram_is_hugetlb(rb) && !qemu_ram_is_shared(rb)) {
> +                error_setg(errp, "RAMBlock '%s' needs to be shared for doublemap",
> +                           rb->idstr);
> +                return false;
> +            }
> +        }
> +    }
>  #else
>      if (cap_list[MIGRATION_CAPABILITY_ZERO_COPY_SEND]) {
>          error_setg(errp,
>                     "Zero copy currently only available on Linux");
>          return false;
>      }
> +
> +    if (cap_list[MIGRATION_CAPABILITY_HUGETLB_DOUBLEMAP]) {
> +        error_setg(errp, "Hugetlb doublemap is only supported on Linux");
> +        return false;
> +    }
>  #endif
>  
>      if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
> @@ -2792,6 +2829,13 @@ bool migrate_postcopy_preempt(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
>  }
>  
> +bool migrate_hugetlb_doublemap(void)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_HUGETLB_DOUBLEMAP];
> +}
> +
>  /* migration thread support */
>  /*
>   * Something bad happened to the RP stream, mark an error
> @@ -4472,7 +4516,9 @@ static Property migration_properties[] = {
>      DEFINE_PROP_MIG_CAP("x-return-path", MIGRATION_CAPABILITY_RETURN_PATH),
>      DEFINE_PROP_MIG_CAP("x-multifd", MIGRATION_CAPABILITY_MULTIFD),
>      DEFINE_PROP_MIG_CAP("x-background-snapshot",
> -            MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT),
> +                        MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT),
> +    DEFINE_PROP_MIG_CAP("hugetlb-doublemap",
> +                        MIGRATION_CAPABILITY_HUGETLB_DOUBLEMAP),
>  #ifdef CONFIG_LINUX
>      DEFINE_PROP_MIG_CAP("x-zero-copy-send",
>              MIGRATION_CAPABILITY_ZERO_COPY_SEND),
> diff --git a/migration/migration.h b/migration/migration.h
> index 5674a13876..bbd610a2d5 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -447,6 +447,7 @@ bool migrate_use_events(void);
>  bool migrate_postcopy_blocktime(void);
>  bool migrate_background_snapshot(void);
>  bool migrate_postcopy_preempt(void);
> +bool migrate_hugetlb_doublemap(void);
>  
>  /* Sending on the return path - generic and then for each message type */
>  void migrate_send_rp_shut(MigrationIncomingState *mis,
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88ecf86ac8..b23516e75e 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -477,6 +477,11 @@
>  #                    will be handled faster.  This is a performance feature and
>  #                    should not affect the correctness of postcopy migration.
>  #                    (since 7.1)
> +# @hugetlb-doublemap: If enabled, the migration process will allow postcopy
> +#                     to handle page faults based on small pages even if
> +#                     hugetlb is used.  This will drastically reduce page
> +#                     fault latencies when hugetlb is used as the guest RAM
> +#                     backends. (since 7.3)
>  #
>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
> @@ -492,7 +497,7 @@
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>             'validate-uuid', 'background-snapshot',
> -           'zero-copy-send', 'postcopy-preempt'] }
> +           'zero-copy-send', 'postcopy-preempt', 'hugetlb-doublemap'] }
>  
>  ##
>  # @MigrationCapabilityStatus:
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


