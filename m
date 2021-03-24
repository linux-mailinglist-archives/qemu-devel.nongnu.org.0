Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB1E347DED
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 17:43:05 +0100 (CET)
Received: from localhost ([::1]:41432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP6b2-0004Be-98
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 12:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP6YQ-0002nD-J7
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lP6YM-00084d-Jc
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 12:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616604016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8KnOghWrI9s4AxloHvrppxQUlIUs2ymoP+YEUcXhxDk=;
 b=MSOg8fG+bNj3qK0YIDBJjYi6uVgIPbRrdPfb2gQXoGS32PbdugldwXYNFH3lsFu85F6167
 IfKDztXeIXEzzS4Rc93tOZnfBAZA2ZdrYJssSOxHCC7rYfXAGkzadOfE45Gz3gSEkKic10
 6Oy12i0gQvXSC50tQctoPqOAk4Becmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-Zgdtp-zTOyyNzz9X4ZdwVw-1; Wed, 24 Mar 2021 12:40:15 -0400
X-MC-Unique: Zgdtp-zTOyyNzz9X4ZdwVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD228CC628;
 Wed, 24 Mar 2021 16:40:13 +0000 (UTC)
Received: from work-vm (ovpn-115-64.ams2.redhat.com [10.36.115.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE3A76086F;
 Wed, 24 Mar 2021 16:40:11 +0000 (UTC)
Date: Wed, 24 Mar 2021 16:40:09 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: leirao <lei.rao@intel.com>
Subject: Re: [PATCH v3 07/10] Reset the auto-converge counter at every
 checkpoint.
Message-ID: <YFtraQXvrrEXwZvQ@work-vm>
References: <1616123268-89517-1-git-send-email-lei.rao@intel.com>
 <1616123268-89517-8-git-send-email-lei.rao@intel.com>
MIME-Version: 1.0
In-Reply-To: <1616123268-89517-8-git-send-email-lei.rao@intel.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
> if we don't reset the auto-converge counter,
> it will continue to run with COLO running,
> and eventually the system will hang due to the
> CPU throttle reaching DEFAULT_MIGRATE_MAX_CPU_THROTTLE.
> 
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  migration/colo.c |  4 ++++
>  migration/ram.c  | 10 ++++++++++
>  migration/ram.h  |  1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/migration/colo.c b/migration/colo.c
> index 1aaf316..723ffb8 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -459,6 +459,10 @@ static int colo_do_checkpoint_transaction(MigrationState *s,
>      if (ret < 0) {
>          goto out;
>      }
> +
> +    if (migrate_auto_converge()) {
> +        mig_throttle_counter_reset();
> +    }
>      /*
>       * Only save VM's live state, which not including device state.
>       * TODO: We may need a timeout mechanism to prevent COLO process
> diff --git a/migration/ram.c b/migration/ram.c
> index 72143da..e795a8d 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -652,6 +652,16 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
>      }
>  }
>  
> +void mig_throttle_counter_reset(void)
> +{
> +    RAMState *rs = ram_state;
> +
> +    rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    rs->num_dirty_pages_period = 0;
> +    rs->bytes_xfer_prev = ram_counters.transferred;
> +    cpu_throttle_stop();

I think this is right, so:

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

however, do you really need the cpu_throttle_stop?  Shouldn't the
previous iteration have called that in migration_iteration_finish() ?

Dave

> +}
> +
>  /**
>   * xbzrle_cache_zero_page: insert a zero page in the XBZRLE cache
>   *
> diff --git a/migration/ram.h b/migration/ram.h
> index 6378bb3..3f78175 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -50,6 +50,7 @@ bool ramblock_is_ignored(RAMBlock *block);
>  int xbzrle_cache_resize(uint64_t new_size, Error **errp);
>  uint64_t ram_bytes_remaining(void);
>  uint64_t ram_bytes_total(void);
> +void mig_throttle_counter_reset(void);
>  
>  uint64_t ram_pagesize_summary(void);
>  int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
> -- 
> 1.8.3.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


