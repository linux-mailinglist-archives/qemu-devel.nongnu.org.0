Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9223BE24
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Aug 2020 18:29:39 +0200 (CEST)
Received: from localhost ([::1]:48442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k2zoo-00051E-KQ
	for lists+qemu-devel@lfdr.de; Tue, 04 Aug 2020 12:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k2znr-0004L8-FF
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 12:28:39 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25377
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1k2znp-0000r7-GX
 for qemu-devel@nongnu.org; Tue, 04 Aug 2020 12:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596558516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EnH3iKHWvN1sRNcI6eWUsjQK/S7wesDrTm+WkeKOK9I=;
 b=J4IzHcXlWIWSKyKk9bq/yMwzG+lbF8MLfNYAc62VH34R+DB7hVYIfDFxVdOYcc/Z0En/gn
 85RVYru//hIdclBqAMvZKrbbGzWAEQqjKlq+/aBYe7zXihUYR5DxLsHnQYMrFHBEfjL9PU
 Ts5MceJ0p6aHHQuZZ2QwNdibIgvpJPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-VRO3V13tMvKK6nlDvjEcAA-1; Tue, 04 Aug 2020 12:28:34 -0400
X-MC-Unique: VRO3V13tMvKK6nlDvjEcAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A17680183C;
 Tue,  4 Aug 2020 16:28:33 +0000 (UTC)
Received: from work-vm (ovpn-114-108.ams2.redhat.com [10.36.114.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 921A97B91A;
 Tue,  4 Aug 2020 16:28:31 +0000 (UTC)
Date: Tue, 4 Aug 2020 17:28:29 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Chuan Zheng <zhengchuan@huawei.com>
Subject: Re: [RFC PATCH 2/8] migration/dirtyrate: Add block_dirty_info to
 store dirtypage info
Message-ID: <20200804162829.GE2659@work-vm>
References: <1595646669-109310-1-git-send-email-zhengchuan@huawei.com>
 <1595646669-109310-3-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1595646669-109310-3-git-send-email-zhengchuan@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/04 01:01:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
> From: Zheng Chuan <zhengchuan@huawei.com>
> 
> Add block_dirty_info to store dirtypage info for each ramblock
> 
> Signed-off-by: Zheng Chuan <zhengchuan@huawei.com>
> Signed-off-by: YanYing Zhang <ann.zhuangyanying@huawei.com>
> ---
>  migration/dirtyrate.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/migration/dirtyrate.h b/migration/dirtyrate.h
> index 9a5c228..342b89f 100644
> --- a/migration/dirtyrate.h
> +++ b/migration/dirtyrate.h
> @@ -33,6 +33,19 @@ typedef enum {
>      CAL_DIRTY_RATE_END   = 2,
>  } CalculatingDirtyRateStage;
>  
> +/* 
> + * Store dirtypage info for each block.
> + */
> +struct block_dirty_info {

Please call this ramblock_dirty_info; we use 'block' a lot to mean
disk block and it gets confusing.

> +    char idstr[BLOCK_INFO_MAX_LEN];

Is there a reason you don't just use a RAMBlock *  here?

> +    uint8_t *block_addr;
> +    unsigned long block_pages;
> +    unsigned long *sample_page_vfn;

Please comment these; if I understand correctly, that's an array
of page indexes into the block generated from the random numbers

> +    unsigned int sample_pages_count;
> +    unsigned int sample_dirty_count;
> +    uint8_t *hash_result;

If I understand, this is an array of hashes end-to-end for
all the pages in this RAMBlock?

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


