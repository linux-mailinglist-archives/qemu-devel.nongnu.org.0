Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA8F34995B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 19:19:08 +0100 (CET)
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPUZX-0001xX-Tt
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 14:19:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lPUPf-0006XP-HQ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:08:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lPUPW-0005SR-Hz
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 14:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616695724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iW6MPiiLc2VeEXd6tDVO4b4SiIk/uzIGtu10p3pVSMQ=;
 b=HAaZfxd2TP8lJxL4bE/3wGDfciYbzNKQXNCpDYshnH/e/f9Dbr+vfXYE4iTvrEOKfda69e
 JZERCXXj6+YXWoGb5YYfw4WJf4zmgznHpo9hXmXBo/sT/dRxAKIJ1Ou+fImXOuys11vc4d
 KUjwrzaoCFpYYqXmCJlXtAQdlpsLUTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-VXhnSyvfNKOWYcN2gfpLQg-1; Thu, 25 Mar 2021 14:08:42 -0400
X-MC-Unique: VXhnSyvfNKOWYcN2gfpLQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76E1E180FCAD;
 Thu, 25 Mar 2021 18:07:47 +0000 (UTC)
Received: from work-vm (ovpn-112-89.ams2.redhat.com [10.36.112.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0E6719C59;
 Thu, 25 Mar 2021 18:07:45 +0000 (UTC)
Date: Thu, 25 Mar 2021 18:07:42 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH v4 09/10] Add the function of colo_bitmap_clear_diry.
Message-ID: <YFzRbpcUyLOOYlj8@work-vm>
References: <1616639091-28279-1-git-send-email-lei.rao@intel.com>
 <1616639091-28279-10-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
In-Reply-To: <1616639091-28279-10-git-send-email-lei.rao@intel.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lukasstraub2@web.de, lizhijian@cn.fujitsu.com, quintela@redhat.com,
 jasowang@redhat.com, qemu-devel@nongnu.org, chen.zhang@intel.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* leirao (lei.rao@intel.com) wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
> 
> When we use continuous dirty memory copy for flushing ram cache on
> secondary VM, we can also clean up the bitmap of contiguous dirty
> page memory. This also can reduce the VM stop time during checkpoint.
> 
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  migration/ram.c | 29 +++++++++++++++++++++++++----
>  1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index a258466..ae1e659 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -855,6 +855,30 @@ unsigned long colo_bitmap_find_dirty(RAMState *rs, RAMBlock *rb,
>      return first;
>  }
>  
> +/**
> + * colo_bitmap_clear_dirty:when we flush ram cache to ram, we will use
> + * continuous memory copy, so we can also clean up the bitmap of contiguous
> + * dirty memory.
> + */
> +static inline bool colo_bitmap_clear_dirty(RAMState *rs,
> +                                           RAMBlock *rb,
> +                                           unsigned long start,
> +                                           unsigned long num)
> +{
> +    bool ret;
> +    unsigned long i = 0;
> +
> +    qemu_mutex_lock(&rs->bitmap_mutex);

Please use QEMU_LOCK_GUARD(&rs->bitmap_mutex);

> +    for (i = 0; i < num; i++) {
> +        ret = test_and_clear_bit(start + i, rb->bmap);
> +        if (ret) {
> +            rs->migration_dirty_pages--;
> +        }
> +    }
> +    qemu_mutex_unlock(&rs->bitmap_mutex);
> +    return ret;

This implementation is missing the clear_bmap code that
migration_bitmap_clear_dirty has.
I think that's necessary now.

Are we sure there's any benefit in this?

Dave

> +}
> +
>  static inline bool migration_bitmap_clear_dirty(RAMState *rs,
>                                                  RAMBlock *rb,
>                                                  unsigned long page)
> @@ -3700,7 +3724,6 @@ void colo_flush_ram_cache(void)
>      void *src_host;
>      unsigned long offset = 0;
>      unsigned long num = 0;
> -    unsigned long i = 0;
>  
>      memory_global_dirty_log_sync();
>      WITH_RCU_READ_LOCK_GUARD() {
> @@ -3722,9 +3745,7 @@ void colo_flush_ram_cache(void)
>                  num = 0;
>                  block = QLIST_NEXT_RCU(block, next);
>              } else {
> -                for (i = 0; i < num; i++) {
> -                    migration_bitmap_clear_dirty(ram_state, block, offset + i);
> -                }
> +                colo_bitmap_clear_dirty(ram_state, block, offset, num);
>                  dst_host = block->host
>                           + (((ram_addr_t)offset) << TARGET_PAGE_BITS);
>                  src_host = block->colo_cache
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


