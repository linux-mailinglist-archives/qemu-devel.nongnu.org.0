Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E5B252D34
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 14:00:01 +0200 (CEST)
Received: from localhost ([::1]:37258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAu5w-00064J-9B
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 08:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kAu5A-0005bj-00
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:59:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kAu57-0001mi-T2
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598443148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/0X1qzHFmz9PL4G4pWkjOysudUwVC54hJzkNatmE5wE=;
 b=BjSptl1bakp+Vwb4XAmMi7iIgA6QvrPRCJAzRO0BaD0zw785UHPprRicczNTzccKX1aLEB
 +LoGmWsAtcCkodOGoM+jXgeDtRWSKuddUjaDIYjsNuofDS+Lz842wIc1lI0f+XEoKm/zFU
 xeZ2hfEBIO8Uue0yK06vAO3c1TdurVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-kXwptcLmMr-s4QfMb8vFwg-1; Wed, 26 Aug 2020 07:59:07 -0400
X-MC-Unique: kXwptcLmMr-s4QfMb8vFwg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BFEC1007460;
 Wed, 26 Aug 2020 11:59:05 +0000 (UTC)
Received: from work-vm (ovpn-114-48.ams2.redhat.com [10.36.114.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2862760BFA;
 Wed, 26 Aug 2020 11:59:02 +0000 (UTC)
Date: Wed, 26 Aug 2020 12:59:00 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [PATCH v5 03/12] migration/dirtyrate: Add RamlockDirtyInfo to
 store sampled page info
Message-ID: <20200826115900.GE2726@work-vm>
References: <1598319650-36762-1-git-send-email-zhengchuan@huawei.com>
 <1598319650-36762-4-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1598319650-36762-4-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 23:30:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 dme@dme.org, qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 alex.chen@huawei.com, ann.zhuangyanying@huawei.com, fangying1@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Chuan Zheng (zhengchuan@huawei.com) wrote:
> Add RamlockDirtyInfo to store sampled page info of each ramblock.

Note typo 'RAM*B*lockDirtyInfo' (and in the title.

> Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
> ---
>  migration/dirtyrate.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
> index 33669b7..dc45419 100644
> --- a/migration/dirtyrate.h
> +++ b/migration/dirtyrate.h
> @@ -19,6 +19,11 @@
>   */
>  #define DIRTYRATE_DEFAULT_SAMPLE_PAGES            512
>  
> +/*
> + * Record ramblock idstr
> + */
> +#define RAMBLOCK_INFO_MAX_LEN                     256
> +
>  /* Take 1s as default for calculation duration */
>  #define DEFAULT_FETCH_DIRTYRATE_TIME_SEC          1
>  
> @@ -27,6 +32,19 @@ struct DirtyRateConfig {
>      int64_t sample_period_seconds; /* time duration between two sampling */
>  };
>  
> +/*
> + * Store dirtypage info for each ramblock.
> + */
> +struct RamblockDirtyInfo {
> +    char idstr[RAMBLOCK_INFO_MAX_LEN]; /* idstr for each ramblock */
> +    uint8_t *ramblock_addr; /* base address of ramblock we measure */
> +    uint64_t ramblock_pages; /* ramblock size in 4K-page */
> +    uint64_t *sample_page_vfn; /* relative offset address for sampled page */
> +    uint64_t sample_pages_count; /* count of sampled pages */
> +    uint64_t sample_dirty_count; /* count of dirty pages we measure */

I see you've already fixed that one that David Edmondson commented on; I
thin you actually posted this as a second v5.

Since it's fixed, with the RAM*B*lock typo fixed;


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> +    uint32_t *hash_result; /* array of hash result for sampled pages */
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


