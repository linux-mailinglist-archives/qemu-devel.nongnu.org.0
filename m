Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFF8251EAA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 19:55:39 +0200 (CEST)
Received: from localhost ([::1]:43330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAdAY-0006Tp-7n
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 13:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kAd9I-000636-C1
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 13:54:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44735
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kAd9D-0002jj-8u
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 13:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598378053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4xUvZqLaTCD9HABh6wfAsf2UndWFGBPmNy/EKhXLcco=;
 b=YKHsQSYCzdIe9rP186O9kDiKMBKyzcVu04V/GSN/g6J5VUYOW2vkrYlfR6NV//UL+6dNF0
 xzzF5CoqquuRXv+PYLsjbT+GE/G74AQ6GnK3FhxPNm/H9/C1VSiQUxsFpP1O+g10jVOpRj
 mhZuSJVFd04MD9f0sTH2s7RLOGuyN0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-eWDN3NpTNnWU31t5WmskqA-1; Tue, 25 Aug 2020 13:54:12 -0400
X-MC-Unique: eWDN3NpTNnWU31t5WmskqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00A85189E602;
 Tue, 25 Aug 2020 17:54:11 +0000 (UTC)
Received: from work-vm (ovpn-112-171.ams2.redhat.com [10.36.112.171])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 501EC60C0F;
 Tue, 25 Aug 2020 17:54:08 +0000 (UTC)
Date: Tue, 25 Aug 2020 18:54:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v5 01/12] migration/dirtyrate: setup up query-dirtyrate
 framwork
Message-ID: <20200825175405.GB3574@work-vm>
References: <1598319650-36762-1-git-send-email-zhengchuan@huawei.com>
 <1598319650-36762-2-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1598319650-36762-2-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 10:39:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 qemu-devel@nongnu.org, xiexiangyou@huawei.com, alex.chen@huawei.com,
 ann.zhuangyanying@huawei.com, fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Add get_dirtyrate_thread() functions to setup query-dirtyrate
> framework.
> 
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/dirtyrate.c | 39 +++++++++++++++++++++++++++++++++++++++
>  migration/dirtyrate.h | 32 ++++++++++++++++++++++++++++++++
>  migration/meson.build |  1 +
>  3 files changed, 72 insertions(+)
>  create mode 100644 migration/dirtyrate.c
>  create mode 100644 migration/dirtyrate.h
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> new file mode 100644
> index 0000000..366f4e9
> --- /dev/null
> +++ b/migration/dirtyrate.c
> @@ -0,0 +1,39 @@
> +/*
> + * Dirtyrate implement code
> + *
> + * Copyright (c) 2017-2020 HUAWEI TECHNOLOGIES CO.,LTD.
> + *
> + * Authors:
> + *  Chuan Zheng <zhengchuan@huawei.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "crypto/hash.h"
> +#include "crypto/random.h"
> +#include "qemu/config-file.h"
> +#include "exec/memory.h"
> +#include "exec/ramblock.h"
> +#include "exec/target_page.h"
> +#include "qemu/rcu_queue.h"
> +#include "qapi/qapi-commands-migration.h"
> +#include "migration.h"
> +#include "dirtyrate.h"
> +
> +static void calculate_dirtyrate(struct DirtyRateConfig config)
> +{
> +    /* todo */
> +    return;
> +}
> +
> +void *get_dirtyrate_thread(void *arg)
> +{
> +    struct DirtyRateConfig config = *(struct DirtyRateConfig *)arg;
> +
> +    calculate_dirtyrate(config);
> +
> +    return NULL;
> +}
> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
> new file mode 100644
> index 0000000..33669b7
> --- /dev/null
> +++ b/migration/dirtyrate.h
> @@ -0,0 +1,32 @@
> +/*
> + *  Dirtyrate common functions
> + *
> + *  Copyright (c) 2020 HUAWEI TECHNOLOGIES CO., LTD.
> + *
> + *  Authors:
> + *  Chuan Zheng <zhengchuan@huawei.com>
> + *
> + *  This work is licensed under the terms of the GNU GPL, version 2 or later.
> + *  See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef QEMU_MIGRATION_DIRTYRATE_H
> +#define QEMU_MIGRATION_DIRTYRATE_H
> +
> +/*
> + * Sample 512 pages per GB as default.
> + * TODO: Make it configurable.
> + */
> +#define DIRTYRATE_DEFAULT_SAMPLE_PAGES            512
> +
> +/* Take 1s as default for calculation duration */
> +#define DEFAULT_FETCH_DIRTYRATE_TIME_SEC          1
> +
> +struct DirtyRateConfig {
> +    uint64_t sample_pages_per_gigabytes; /* sample pages per GB */
> +    int64_t sample_period_seconds; /* time duration between two sampling */
> +};
> +
> +void *get_dirtyrate_thread(void *arg);
> +#endif
> +
> diff --git a/migration/meson.build b/migration/meson.build
> index ac8ff14..30cc6c3 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -21,6 +21,7 @@ softmmu_ss.add(files(
>    'channel.c',
>    'colo-failover.c',
>    'colo.c',
> +  'dirtyrate.c',
>    'exec.c',
>    'fd.c',
>    'global_state.c',
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


