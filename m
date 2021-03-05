Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2968B32ED07
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 15:24:19 +0100 (CET)
Received: from localhost ([::1]:55042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIBNK-0001at-7w
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 09:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lIBM4-0000fo-Ng
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:23:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lIBM1-0003Hi-AG
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 09:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614954175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CBKOVk7CdWykf5pamVWFYDc3r9zYvO0LdQiKc5+oakI=;
 b=BWRxgX8O8eyb413bf3ajIGwit67A86ZcgjH0C6N5RhBLvcafVt0QHnB75BcmLxSgennBKm
 oRdeGTaP/4B29oJRe5Ms63nEP1wrdbA0yE4JoOnBMJB8OmxVR7ffyRwJtlP8Grz0EoEjVf
 oJk7mXtwzgAwFWgcc34WNQGRBS9no0I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-0maRBmktOhiNDmpZ0U60aA-1; Fri, 05 Mar 2021 09:22:53 -0500
X-MC-Unique: 0maRBmktOhiNDmpZ0U60aA-1
Received: by mail-qk1-f199.google.com with SMTP id o8so1865267qkl.3
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 06:22:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CBKOVk7CdWykf5pamVWFYDc3r9zYvO0LdQiKc5+oakI=;
 b=UDwCRxVvDbCVHFUyszWQNsh+uCCqivX1gbqscSZwq76ITdJa/3KuJNUumZdlzuCXD8
 WdcVOG0hMIPwUTFM1WJRyaZbNmMJs+eWdNDX904z/ptiwZEGr5BPte5EaHx9c3LeGoo+
 67cPtQ9Lzfz77Ru+hQUPwgSvhcEJlpDfwMvkDpRIRuzFeLZL/yqToi3clX47t9O1SyHA
 49SP+78sADEzRoxpj+a78ZTe5HT20i1pceEGpHAEWRBYZqees9A+z4sa4Q132WqojE6y
 VLYLy2ljEMIOHz48unBZePC5WhM9hFFzlGH3jb5Z1VfStSj6HfPbnHUK28TnA32NlHRR
 tqUw==
X-Gm-Message-State: AOAM533ZsSPivtCcFjEW6XSciETxq2eLnyf7MKe8r7ffswUaNq/ConZ9
 P0il/P2YAYk3yOlEaAGwVH7ThwMc8BAbpkPQxGuqLKJgmzG9AFYeeaDLmKOjhf/jbQZ2CGVIkgN
 oZTolD11BQUyHxyI=
X-Received: by 2002:a37:6191:: with SMTP id v139mr9271719qkb.32.1614954172992; 
 Fri, 05 Mar 2021 06:22:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlK566vRkUN7w23kLb6WMuY6vVPjk/VXLU+obZCnYGLpKq+Jg9iRjc4lJaGML4pRge7aBJ2A==
X-Received: by 2002:a37:6191:: with SMTP id v139mr9271693qkb.32.1614954172691; 
 Fri, 05 Mar 2021 06:22:52 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id h11sm1774385qkj.135.2021.03.05.06.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 06:22:52 -0800 (PST)
Date: Fri, 5 Mar 2021 09:22:50 -0500
From: Peter Xu <peterx@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH v3 2/3] migration/ram: Reduce unnecessary rate limiting
Message-ID: <20210305142250.GE397383@xz-x1>
References: <20210305075035.1852-1-jiangkunkun@huawei.com>
 <20210305075035.1852-3-jiangkunkun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210305075035.1852-3-jiangkunkun@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, David Edmondson <dme@dme.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Alexey Romko <nevilad@yahoo.com>, Zenghui Yu <yuzenghui@huawei.com>,
 wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kunkun,

On Fri, Mar 05, 2021 at 03:50:34PM +0800, Kunkun Jiang wrote:
> When the host page is a huge page and something is sent in the
> current iteration, the migration_rate_limit() should be executed.
> If not, this function can be omitted to save time.
> 
> Rename tmppages to pages_this_iteration to express its meaning
> more clearly.
> 
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  migration/ram.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index a168da5cdd..9fc5b2997c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1988,7 +1988,7 @@ static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss,
>  static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>                                bool last_stage)
>  {
> -    int tmppages, pages = 0;
> +    int pages = 0;
>      size_t pagesize_bits =
>          qemu_ram_pagesize(pss->block) >> TARGET_PAGE_BITS;
>      unsigned long start_page = pss->page;
> @@ -2000,21 +2000,28 @@ static int ram_save_host_page(RAMState *rs, PageSearchStatus *pss,
>      }
>  
>      do {
> +        int pages_this_iteration = 0;
> +
>          /* Check if the page is dirty and send it if it is */
>          if (!migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>              pss->page++;
>              continue;
>          }
>  
> -        tmppages = ram_save_target_page(rs, pss, last_stage);
> -        if (tmppages < 0) {
> -            return tmppages;
> +        pages_this_iteration = ram_save_target_page(rs, pss, last_stage);
> +        if (pages_this_iteration < 0) {
> +            return pages_this_iteration;
>          }
>  
> -        pages += tmppages;
> +        pages += pages_this_iteration;

To me, both names are okay, it's just that the new name doesn't really provide
a lot more new information, while it's even longer...

Since you seem to prefer cleaning up tmppages, I'm actually thinking whether
it should be called as "pages" at all since ram_save_target_page() majorly only
returns either 1 if succeeded or <0 if error.  There's only one very corner
case of xbzrle where it can return 0 in save_xbzrle_page():

    if (encoded_len == 0) {
        trace_save_xbzrle_page_skipping();
        return 0;
    }

I think it means the page didn't change at all, then I'm also wondering maybe
it can also return 1 showing one page migrated (though actually skipped!) which
should still be fine for the callers, e.g., ram_find_and_save_block() who will
finally check this "pages" value.

So I think _maybe_ that's a nicer cleanup to change that "return 0" to "return
1", then another patch to make the return value to be (1) return 0 if page
saved, or (2) return <0 if error.  Then here in ram_save_host_page() tmppages
can be renamed to "ret" or "succeed".

>          pss->page++;
> -        /* Allow rate limiting to happen in the middle of huge pages */
> -        migration_rate_limit();
> +        /*
> +         * Allow rate limiting to happen in the middle of huge pages if
> +         * something is sent in the current iteration.
> +         */
> +        if (pagesize_bits > 1 && pages_this_iteration > 0) {
> +            migration_rate_limit();
> +        }

I don't know whether this matters either..  Two calls in there:

    migration_update_counters(s, now);
    qemu_file_rate_limit(s->to_dst_file);

migration_update_counters() is mostly a noop for 99.9% cases. Looks still okay...

Thanks,

>      } while ((pss->page & (pagesize_bits - 1)) &&
>               offset_in_ramblock(pss->block,
>                                  ((ram_addr_t)pss->page) << TARGET_PAGE_BITS));
> -- 
> 2.23.0
> 

-- 
Peter Xu


