Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403F524C4EB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 19:58:23 +0200 (CEST)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8opS-0000UR-AI
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 13:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k8oog-0008I6-20
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 13:57:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22797
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k8ood-0005qR-5a
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 13:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597946250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N2EWIjQBjYOHp76UE/GS5LRI6dmDv1Mn0jWL/gdJYNQ=;
 b=Fu9gT4umfT+PhFga+rv4OXkae+OGGmW73cC2ysHs+POc5xVxGyz3ZwuxtDrRbwwvd5Pf/8
 yv+rR5jcKAfGR18DZ6piuWjEl/2JhQKJ8NlB+JQNt+x8eoiJ13UzT3wHs7TBZBWNOcaNEn
 +XM8oFCAe7OfgSWxrhe8rkSnmfsSG8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-6NPzILW_OEWLjhM5fgPg1g-1; Thu, 20 Aug 2020 13:57:28 -0400
X-MC-Unique: 6NPzILW_OEWLjhM5fgPg1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C3771DE05;
 Thu, 20 Aug 2020 17:57:27 +0000 (UTC)
Received: from work-vm (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 299F35C1CF;
 Thu, 20 Aug 2020 17:57:25 +0000 (UTC)
Date: Thu, 20 Aug 2020 18:57:22 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v3 09/10] migration/dirtyrate: Implement
 calculate_dirtyrate() function
Message-ID: <20200820175722.GR2664@work-vm>
References: <1597634433-18809-1-git-send-email-zhengchuan@huawei.com>
 <1597634433-18809-10-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1597634433-18809-10-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 08:28:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: zhang.zhanghailiang@huawei.com, quintela@redhat.com, linyilu@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, ann.zhuangyanying@huawei.com,
 fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Implement calculate_dirtyrate() function.
> 
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
> ---
>  migration/dirtyrate.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index 4bbfcc3..041d0c6 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -184,6 +184,21 @@ static void get_ramblock_dirty_info(RAMBlock *block,
>      strcpy(info->idstr, qemu_ram_get_idstr(block));
>  }
>  
> +static void free_ramblock_dirty_info(struct RamblockDirtyInfo *infos, int count)
> +{
> +    int i;
> +
> +    if (!infos) {
> +        return;
> +    }
> +
> +    for (i = 0; i < count; i++) {
> +        g_free(infos[i].sample_page_vfn);
> +        g_free(infos[i].hash_result);
> +    }
> +    g_free(infos);
> +}
> +
>  static struct RamblockDirtyInfo *
>  alloc_ramblock_dirty_info(int *block_index,
>                            struct RamblockDirtyInfo *block_dinfo)
> @@ -341,8 +356,35 @@ static int compare_page_hash_info(struct RamblockDirtyInfo *info,
>  
>  static void calculate_dirtyrate(struct DirtyRateConfig config)
>  {
> -    /* todo */
> -    return;
> +    struct RamblockDirtyInfo *block_dinfo = NULL;
> +    int block_index = 0;
> +    int64_t msec = 0;
> +    int64_t initial_time;
> +
> +    rcu_register_thread();
> +    reset_dirtyrate_stat();
> +    initial_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    rcu_read_lock();
> +    if (record_ramblock_hash_info(&block_dinfo, config, &block_index) < 0) {
> +        goto out;
> +    }
> +    rcu_read_unlock();
> +
> +    msec = config.sample_period_seconds * 1000;
> +    msec = set_sample_page_period(msec, initial_time);
> +
> +    rcu_read_lock();
> +    if (compare_page_hash_info(block_dinfo, block_index) < 0) {
> +        goto out;
> +    }
> +
> +    update_dirtyrate(msec);

I think this is OK, so:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

However, please try the following test,  set it to 60 seconds,
start the dirty rate check, and in that time, shut the guest down
(e.g. shutdown -h now in the guest) - what happens?

Dave

> +
> +out:
> +    rcu_read_unlock();
> +    free_ramblock_dirty_info(block_dinfo, block_index + 1);
> +    rcu_unregister_thread();
> +
>  }
>  
>  void *get_dirtyrate_thread(void *arg)
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


