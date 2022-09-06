Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF0E5AF637
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 22:39:10 +0200 (CEST)
Received: from localhost ([::1]:57790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVfLg-0002xs-Ub
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 16:39:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oVfKc-0001J6-LH
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 16:38:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oVfKY-0007vS-UX
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 16:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662496676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y8h5EFLv/B5lioxDB595X//f4CXI1+g9GPZgem5hT78=;
 b=enVoJ8KmBahnbCZBiGBF3dSKxbwA2OLVxJ7NmqnPmfW+upJWcdpY7A4lu1L5LJGvjgZdps
 fxpTvSVkCm4XfVz7lpb9TIKogAQkaSM3kWd4RgzvzFJiu4w3vn0kVGgwntoWYiobt9rCM3
 mdkDu/dNmSYQDSUUX5SleLEs1zMp/0c=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-l-IUwl6SPrO1iHwSSd_-8g-1; Tue, 06 Sep 2022 16:37:55 -0400
X-MC-Unique: l-IUwl6SPrO1iHwSSd_-8g-1
Received: by mail-qv1-f72.google.com with SMTP id
 o6-20020ad443c6000000b00495d04028a6so8654652qvs.18
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 13:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=y8h5EFLv/B5lioxDB595X//f4CXI1+g9GPZgem5hT78=;
 b=naD0gPSkKzK41m2A/c2kOWSFUIvlQZS9AtItygye/DHC4Cm/27Tr2OEPLriPWACaZH
 auyutE8Ub2wYouIuyufUHRdW5jdMgrBZFf4xz/ZZ3oqcoV4wG5Ditixq0Dhycq/zde04
 cTU5cpddhn+S0DBkZjZdxcTnCiGWWWJpV9wFS2aWoJfxhdXNPKCsTFCKB6xL3dZWX4Od
 jBRTnkEQ+Av0jc3oEdj5PlfQSeRVfuHzJRCU62dxg3iv0Bv2q8eO5y1/RelN8TLHrwBb
 xJL/RBxqfyor2D+Rpw81Ji7LyZTrcaBn6FlH71PfgQsKcTnrnO/H0FTscc0OuKlN1e0s
 xpFg==
X-Gm-Message-State: ACgBeo0qMNrHTP8P68OfrPdc0qarD7aZ7xC0/2GQilJ32ag/VxiSZPDE
 HZh2id1WX1MSk1mDS5N8yAzuQ6Yi/lJOe+JP99UAont9aG8GyXdWQcfIWfLdec0FQKd7kcIsAyy
 DcfI/vmNooa86HiM=
X-Received: by 2002:a05:6214:20eb:b0:499:1d9d:6342 with SMTP id
 11-20020a05621420eb00b004991d9d6342mr161213qvk.83.1662496674614; 
 Tue, 06 Sep 2022 13:37:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR419JiD1RAeQjDhzyN7GJdOlmhBnorEBMF8yQW4PKD+cA8krEMpBtr7h+HUZWDdyXot9QLAMw==
X-Received: by 2002:a05:6214:20eb:b0:499:1d9d:6342 with SMTP id
 11-20020a05621420eb00b004991d9d6342mr161195qvk.83.1662496674306; 
 Tue, 06 Sep 2022 13:37:54 -0700 (PDT)
Received: from xz-m1.local
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 az7-20020a05620a170700b006c61999caffsm9287170qkb.116.2022.09.06.13.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 13:37:53 -0700 (PDT)
Date: Tue, 6 Sep 2022 16:37:51 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Cc: qemu-devel <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v1 4/8] migration: Implement dirty-limit convergence algo
Message-ID: <Yxevn7rSCKaPHQfd@xz-m1.local>
References: <cover.1662052189.git.huangy81@chinatelecom.cn>
 <4b42dedc0d1ed336ef39c604f3aa1611745a3917.1662052189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b42dedc0d1ed336ef39c604f3aa1611745a3917.1662052189.git.huangy81@chinatelecom.cn>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 02, 2022 at 01:22:32AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Implement dirty-limit convergence algo for live migration,
> which is kind of like auto-converge algo but using dirty-limit
> instead of cpu throttle to make migration convergent.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> ---
>  migration/migration.c  |  1 +
>  migration/ram.c        | 53 +++++++++++++++++++++++++++++++++++++-------------
>  migration/trace-events |  1 +
>  3 files changed, 42 insertions(+), 13 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index d117bb4..64696de 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -239,6 +239,7 @@ void migration_cancel(const Error *error)
>      if (error) {
>          migrate_set_error(current_migration, error);
>      }
> +    qmp_cancel_vcpu_dirty_limit(false, -1, NULL);
>      migrate_fd_cancel(current_migration);
>  }
>  
> diff --git a/migration/ram.c b/migration/ram.c
> index dc1de9d..cc19c5e 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -45,6 +45,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-types-migration.h"
>  #include "qapi/qapi-events-migration.h"
> +#include "qapi/qapi-commands-migration.h"
>  #include "qapi/qmp/qerror.h"
>  #include "trace.h"
>  #include "exec/ram_addr.h"
> @@ -57,6 +58,8 @@
>  #include "qemu/iov.h"
>  #include "multifd.h"
>  #include "sysemu/runstate.h"
> +#include "sysemu/dirtylimit.h"
> +#include "sysemu/kvm.h"
>  
>  #include "hw/boards.h" /* for machine_dump_guest_core() */
>  
> @@ -1139,6 +1142,21 @@ static void migration_update_rates(RAMState *rs, int64_t end_time)
>      }
>  }
>  
> +/*
> + * Enable dirty-limit to throttle down the guest
> + */
> +static void migration_dirty_limit_guest(void)
> +{
> +    if (!dirtylimit_in_service()) {
> +        MigrationState *s = migrate_get_current();
> +        int64_t quota_dirtyrate = s->parameters.x_vcpu_dirty_limit;
> +
> +        /* Set quota dirtyrate if dirty limit not in service */
> +        qmp_set_vcpu_dirty_limit(false, -1, quota_dirtyrate, NULL);
> +        trace_migration_dirty_limit_guest(quota_dirtyrate);
> +    }
> +}
> +
>  static void migration_trigger_throttle(RAMState *rs)
>  {
>      MigrationState *s = migrate_get_current();
> @@ -1148,22 +1166,31 @@ static void migration_trigger_throttle(RAMState *rs)
>      uint64_t bytes_dirty_period = rs->num_dirty_pages_period * TARGET_PAGE_SIZE;
>      uint64_t bytes_dirty_threshold = bytes_xfer_period * threshold / 100;
>  
> -    /* During block migration the auto-converge logic incorrectly detects
> -     * that ram migration makes no progress. Avoid this by disabling the
> -     * throttling logic during the bulk phase of block migration. */
> -    if (migrate_auto_converge() && !blk_mig_bulk_active()) {
> -        /* The following detection logic can be refined later. For now:
> -           Check to see if the ratio between dirtied bytes and the approx.
> -           amount of bytes that just got transferred since the last time
> -           we were in this routine reaches the threshold. If that happens
> -           twice, start or increase throttling. */
> -
> -        if ((bytes_dirty_period > bytes_dirty_threshold) &&
> -            (++rs->dirty_rate_high_cnt >= 2)) {
> +    /*
> +     * The following detection logic can be refined later. For now:
> +     * Check to see if the ratio between dirtied bytes and the approx.
> +     * amount of bytes that just got transferred since the last time
> +     * we were in this routine reaches the threshold. If that happens
> +     * twice, start or increase throttling.
> +     */
> +
> +    if ((bytes_dirty_period > bytes_dirty_threshold) &&
> +        (++rs->dirty_rate_high_cnt >= 2)) {
> +        rs->dirty_rate_high_cnt = 0;
> +        /*
> +         * During block migration the auto-converge logic incorrectly detects
> +         * that ram migration makes no progress. Avoid this by disabling the
> +         * throttling logic during the bulk phase of block migration
> +         */
> +
> +        if (migrate_auto_converge() && !blk_mig_bulk_active()) {
>              trace_migration_throttle();
> -            rs->dirty_rate_high_cnt = 0;
>              mig_throttle_guest_down(bytes_dirty_period,
>                                      bytes_dirty_threshold);
> +        } else if (migrate_dirty_limit() &&
> +                   kvm_dirty_ring_enabled() &&
> +                   migration_is_active(s)) {
> +            migration_dirty_limit_guest();

We'll call this multiple time, but only the 1st call will make sense, right?

Can we call it once somewhere?  E.g. at the start of migration?

Thanks,

-- 
Peter Xu


