Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2429A24C357
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 18:29:21 +0200 (CEST)
Received: from localhost ([::1]:44184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8nRH-0004px-Vp
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 12:29:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k8nQX-0004N5-AE
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 12:28:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k8nQU-0001Wg-V5
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 12:28:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597940909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d1iMs+tDCa5aQj7lNsMVX1Ix4Eop4qAkyTdm88eIQ84=;
 b=fBJbT5Fh+k3HbFFNDeRW/FjfOLimerfgx4UFQVz+wHPuftzgiSD3bEH7JsylsG1u//Dah1
 Iy99In479Xq3SXxQJwYxwkdA30eu1kzcOPxZijXsBI4tFENFGDS70jWDXUiHVlcWOgCjcv
 83eqUtdBo1eVvX6jm8ZB0x9Me114bKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-gYGmFCUVOVuYHrx1FVaysA-1; Thu, 20 Aug 2020 12:28:28 -0400
X-MC-Unique: gYGmFCUVOVuYHrx1FVaysA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC9D0801AE7;
 Thu, 20 Aug 2020 16:28:26 +0000 (UTC)
Received: from work-vm (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C96D9614F5;
 Thu, 20 Aug 2020 16:28:24 +0000 (UTC)
Date: Thu, 20 Aug 2020 17:28:22 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v3 03/10] migration/dirtyrate: Add dirtyrate statistics
 series functions
Message-ID: <20200820162822.GK2664@work-vm>
References: <1597634433-18809-1-git-send-email-zhengchuan@huawei.com>
 <1597634433-18809-4-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1597634433-18809-4-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 06:28:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: zhang.zhanghailiang@huawei.com, quintela@redhat.com, linyilu@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Add dirtyrate statistics to record/update dirtyrate info.
> 
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
> ---
>  migration/dirtyrate.c | 30 ++++++++++++++++++++++++++++++
>  migration/dirtyrate.h | 10 ++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index bb0ebe9..8708090 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -24,6 +24,7 @@
>  #include "dirtyrate.h"
>  
>  CalculatingDirtyRateState CalculatingState = CAL_DIRTY_RATE_INIT;
> +static struct DirtyRateStat dirty_stat;
>  
>  static int dirty_rate_set_state(int new_state)
>  {
> @@ -40,6 +41,35 @@ static int dirty_rate_set_state(int new_state)
>      return 0;
>  }
>  
> +static void reset_dirtyrate_stat(void)
> +{
> +    dirty_stat.total_dirty_samples = 0;
> +    dirty_stat.total_sample_count = 0;
> +    dirty_stat.total_block_mem_MB = 0;
> +    dirty_stat.dirty_rate = 0;
> +}
> +
> +static void update_dirtyrate_stat(struct RamblockDirtyInfo *info)
> +{
> +    dirty_stat.total_dirty_samples += info->sample_dirty_count;
> +    dirty_stat.total_sample_count += info->sample_pages_count;
> +    /* size of 4K pages in MB */
> +    dirty_stat.total_block_mem_MB += info->ramblock_pages / 256;
> +}
> +
> +static void update_dirtyrate(uint64_t msec)
> +{
> +    uint64_t dirty_rate;
> +    unsigned int total_dirty_samples = dirty_stat.total_dirty_samples;
> +    unsigned int total_sample_count = dirty_stat.total_sample_count;
> +    size_t total_block_mem_MB = dirty_stat.total_block_mem_MB;
> +
> +    dirty_rate = total_dirty_samples * total_block_mem_MB *
> +                 1000 / (total_sample_count * msec);
> +
> +    dirty_stat.dirty_rate = dirty_rate;
> +}
> +
>  static void calculate_dirtyrate(struct DirtyRateConfig config)
>  {
>      /* todo */
> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
> index 9650566..af57c80 100644
> --- a/migration/dirtyrate.h
> +++ b/migration/dirtyrate.h
> @@ -57,6 +57,16 @@ struct RamblockDirtyInfo {
>      uint8_t *hash_result; /* array of hash result for sampled pages */
>  };
>  
> +/*
> + * Store calculate statistics for each measure.
> + */
> +struct DirtyRateStat {
> +    unsigned int total_dirty_samples; /* total dirty pages for this measure */
> +    unsigned int total_sample_count; /* total sampled pages for this measure */
> +    size_t total_block_mem_MB; /* size of sampled pages in MB */
> +    int64_t dirty_rate; /* dirty rate for this measure */

As I said in the previous review, please comment 'dirty_rate' with it's
units.

Dave

> +};
> +
>  void *get_dirtyrate_thread(void *arg);
>  #endif
>  
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


