Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CCB24C4A6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 19:37:36 +0200 (CEST)
Received: from localhost ([::1]:60816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8oVK-0000ee-St
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 13:37:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k8oUe-0000Cv-Sy
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 13:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k8oUc-0002k2-37
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 13:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597945007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y9ybRFffbZ3OcxoWJZP+Q0AflVzleeoh/wBebVuJDSo=;
 b=LjNgy3IER1CHwmC+Ucr45C5MB3Tch3u4PvJFTDWcxI/cqEp9jvLqIQ/M6buD2nGKubIlhJ
 9dzw+rrubRZbWjajmmTRUh9w+Y1tcQbeSFbRlUakgOZ2A1haY+LiuUjf9lD1o+ZFbRJBsc
 G/uMJCbYBmKTujLIqV0HhCZ0qJMdxJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-riwiH27sPFuzo6L39Az6Ww-1; Thu, 20 Aug 2020 13:36:46 -0400
X-MC-Unique: riwiH27sPFuzo6L39Az6Ww-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 857711006711;
 Thu, 20 Aug 2020 17:36:44 +0000 (UTC)
Received: from work-vm (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C85371780;
 Thu, 20 Aug 2020 17:36:42 +0000 (UTC)
Date: Thu, 20 Aug 2020 18:36:40 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v3 06/10] migration/dirtyrate: Compare page hash results
 for recorded sampled page
Message-ID: <20200820173640.GN2664@work-vm>
References: <1597634433-18809-1-git-send-email-zhengchuan@huawei.com>
 <1597634433-18809-7-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1597634433-18809-7-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 09:00:23
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
> Compare page hash results for recorded sampled page.
> 
> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> Signed-off-by: YanYing Zhuang <ann.zhuangyanying@huawei.com>
> ---
>  migration/dirtyrate.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> index 62b6f69..3ce25f5 100644
> --- a/migration/dirtyrate.c
> +++ b/migration/dirtyrate.c
> @@ -215,6 +215,82 @@ static int record_ramblock_hash_info(struct RamblockDirtyInfo **block_dinfo,
>      return 0;
>  }
>  
> +static int calc_page_dirty_rate(struct RamblockDirtyInfo *info)
> +{
> +    uint8_t *md = NULL;
> +    int i;
> +    int ret = 0;
> +
> +    md = g_try_new0(uint8_t, qcrypto_hash_len);
> +    if (!md) {
> +        return -1;
> +    }

As previously asked; isn't this a nice small simple fixed length - no
need to allocate it?

> +
> +    for (i = 0; i < info->sample_pages_count; i++) {
> +        ret = get_ramblock_vfn_hash(info, info->sample_page_vfn[i], &md);
> +        if (ret < 0) {
> +            goto out;
> +        }
> +
> +        if (memcmp(md, info->hash_result + i * qcrypto_hash_len,
> +                   qcrypto_hash_len) != 0) {
> +            info->sample_dirty_count++;
> +        }
> +    }
> +
> +out:
> +    g_free(md);
> +    return ret;
> +}
> +
> +static bool find_page_matched(RAMBlock *block, struct RamblockDirtyInfo *infos,
> +                              int count, struct RamblockDirtyInfo **matched)
> +{
> +    int i;
> +
> +    for (i = 0; i < count; i++) {
> +        if (!strcmp(infos[i].idstr, qemu_ram_get_idstr(block))) {
> +            break;
> +        }
> +    }
> +
> +    if (i == count) {
> +        return false;
> +    }
> +
> +    if (infos[i].ramblock_addr != qemu_ram_get_host_addr(block) ||
> +        infos[i].ramblock_pages !=
> +            (qemu_ram_get_used_length(block) >> 12)) {
> +        return false;

I previously asked how this happens.
Also this was DIRTYRATE_PAGE_SIZE_SHIFT

> +    }
> +
> +    *matched = &infos[i];
> +    return true;
> +}
> +
> +static int compare_page_hash_info(struct RamblockDirtyInfo *info,
> +                                  int block_index)
> +{
> +    struct RamblockDirtyInfo *block_dinfo = NULL;
> +    RAMBlock *block = NULL;
> +
> +    RAMBLOCK_FOREACH_MIGRATABLE(block) {
> +        block_dinfo = NULL;

So you've removed the selction of only some RAMBlocks now?

> +        if (!find_page_matched(block, info, block_index + 1, &block_dinfo)) {
> +            continue;
> +        }
> +        if (calc_page_dirty_rate(block_dinfo) < 0) {
> +            return -1;
> +        }
> +        update_dirtyrate_stat(block_dinfo);
> +    }
> +    if (!dirty_stat.total_sample_count) {
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
>  static void calculate_dirtyrate(struct DirtyRateConfig config)
>  {
>      /* todo */
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


