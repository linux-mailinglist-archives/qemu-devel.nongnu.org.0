Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECD4261078
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 13:08:32 +0200 (CEST)
Received: from localhost ([::1]:56094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFbUF-0007Y3-MO
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 07:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kFbPJ-0004ZG-ST
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 07:03:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39027
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kFbPH-0005CF-SY
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 07:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599563002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qlUPMaOH7G1Mje4/U7vZ01SN+6BCQTtB2J8EPDv+K/U=;
 b=AHQr0cshMt9PthtMF1+xcIyYgmWAcWhi0UwXcBKneLjoYoWm7QhWrMP+UXgBxcb2oP0K6p
 TNpij7T+q4l58hsW538OW3Syc2PujhbOHvT3QtayBcGruSxx7F8G5J3KHgDLwcqxBLhe8z
 2XRAxseKXQUwJJclsAeLcYy5ALmPOQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-mofroOCrMMOCnRU4Pn705A-1; Tue, 08 Sep 2020 07:03:20 -0400
X-MC-Unique: mofroOCrMMOCnRU4Pn705A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C64718B9F8A
 for <qemu-devel@nongnu.org>; Tue,  8 Sep 2020 11:03:19 +0000 (UTC)
Received: from work-vm (ovpn-114-204.ams2.redhat.com [10.36.114.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 277675C1BB;
 Tue,  8 Sep 2020 11:03:15 +0000 (UTC)
Date: Tue, 8 Sep 2020 12:03:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 5/5] migration: Sync requested pages after postcopy
 recovery
Message-ID: <20200908110312.GH3295@work-vm>
References: <20200903152646.93336-1-peterx@redhat.com>
 <20200903152646.93336-6-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200903152646.93336-6-peterx@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.004
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 01:08:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Xiaohui Li <xiaohli@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> We synchronize the requested pages right after a postcopy recovery happens.
> This helps to synchronize the prioritized pages on source so that the faulted
> threads can be served faster.
> 
> Reported-by: Xiaohui Li <xiaohli@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/savevm.c     | 56 ++++++++++++++++++++++++++++++++++++++++++
>  migration/trace-events |  1 +
>  2 files changed, 57 insertions(+)
> 
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 304d98ff78..f998dd230d 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -2011,6 +2011,48 @@ static int loadvm_postcopy_handle_run(MigrationIncomingState *mis)
>      return LOADVM_QUIT;
>  }
>  
> +/* We must be with page_request_mutex held */
> +static gboolean postcopy_sync_page_req(gpointer key, gpointer value,
> +                                       gpointer data)
> +{
> +    MigrationIncomingState *mis = data;
> +    void *host_addr = (void *) key;
> +    ram_addr_t rb_offset;
> +    RAMBlock *rb;
> +    int ret;
> +
> +    rb = qemu_ram_block_from_host(host_addr, true, &rb_offset);
> +    if (!rb) {
> +        /*
> +         * This should _never_ happen.  However be nice for a migrating VM to
> +         * not crash/assert.  Post an error (note: intended to not use *_once
> +         * because we do want to see all the illegal addresses; and this can
> +         * never be triggered by the guest so we're safe) and move on next.
> +         */
> +        error_report("%s: illegal host addr %p", __func__, host_addr);
> +        /* Try the next entry */
> +        return FALSE;
> +    }
> +
> +    ret = migrate_send_rp_message_req_pages(mis, rb, rb_offset);
> +    if (ret) {
> +        /* Refer to above comment - just try our best to continue */
> +        error_report("%s: send rp message failed for addr %p",
> +                     __func__, host_addr);
> +    }
> +
> +    trace_postcopy_page_req_sync((uint64_t)host_addr);
> +
> +    return FALSE;
> +}

OK,

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

but...

> +static void migrate_send_rp_req_pages_pending(MigrationIncomingState *mis)
> +{
> +    qemu_mutex_lock(&mis->page_request_mutex);
> +    g_tree_foreach(mis->page_requested, postcopy_sync_page_req, mis);
> +    qemu_mutex_unlock(&mis->page_request_mutex);

could have used the lock macro there.

Dave

> +}
> +
>  static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
>  {
>      if (mis->state != MIGRATION_STATUS_POSTCOPY_RECOVER) {
> @@ -2033,6 +2075,20 @@ static int loadvm_postcopy_handle_resume(MigrationIncomingState *mis)
>      /* Tell source that "we are ready" */
>      migrate_send_rp_resume_ack(mis, MIGRATION_RESUME_ACK_VALUE);
>  
> +    /*
> +     * After a postcopy recovery, the source should have lost the postcopy
> +     * queue, or potentially the requested pages could have been lost during
> +     * the network down phase.  Let's re-sync with the source VM by re-sending
> +     * all the pending pages that we eagerly need, so these threads won't get
> +     * blocked too long due to the recovery.
> +     *
> +     * Without this procedure, the faulted destination VM threads (waiting for
> +     * page requests right before the postcopy is interrupted) can keep hanging
> +     * until the pages are sent by the source during the background copying of
> +     * pages, or another thread faulted on the same address accidentally.
> +     */
> +    migrate_send_rp_req_pages_pending(mis);
> +
>      return 0;
>  }
>  
> diff --git a/migration/trace-events b/migration/trace-events
> index b89ce02cb0..54a6dd2761 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -49,6 +49,7 @@ vmstate_save(const char *idstr, const char *vmsd_name) "%s, %s"
>  vmstate_load(const char *idstr, const char *vmsd_name) "%s, %s"
>  postcopy_pause_incoming(void) ""
>  postcopy_pause_incoming_continued(void) ""
> +postcopy_page_req_sync(uint64_t host_addr) "sync page req 0x%"PRIx64
>  
>  # vmstate.c
>  vmstate_load_field_error(const char *field, int ret) "field \"%s\" load failed, ret = %d"
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


