Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D477453064
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:23:44 +0100 (CET)
Received: from localhost ([::1]:60356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwYw-0007Wg-SO
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:23:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1mmwXN-0006qN-7t
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:22:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1mmwXK-0007SB-O3
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637061721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gi3vPvRsEd33aU8Y75DpStFS3NY0h9me2E6EK8nMaw=;
 b=QZlLf+B8sKUVErI0IBohQXxa69oNFPNYUxf88j2VFUQmBAGlMCAdpRJs0tfj2FErxTBZKm
 d5G1vh+2qdaih6OTPd5JULvMW2XWG753cojRXKNTONAb+2N8ev5/UlRyCkKvvfQJm42qvM
 LrpHqnmOsXeDgkNWND5hxfFlr4Wc0kY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-Q7Q-14QuOXWVva3o3u4JCg-1; Tue, 16 Nov 2021 06:20:49 -0500
X-MC-Unique: Q7Q-14QuOXWVva3o3u4JCg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E2198799EC
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 11:20:48 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.195.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BF83660C81;
 Tue, 16 Nov 2021 11:20:38 +0000 (UTC)
Subject: Re: [PATCH] dump-guest-memory: Use BQL to protect dump finalize
 process
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20211116032234.1775-1-peterx@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <06f0282f-9e15-7854-5f5a-0884fd810da4@redhat.com>
Date: Tue, 16 Nov 2021 12:20:37 +0100
MIME-Version: 1.0
In-Reply-To: <20211116032234.1775-1-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 04:22, Peter Xu wrote:
> When finalizing the dump-guest-memory with detached mode, we'll first set dump
> status to either FAIL or COMPLETE before doing the cleanup, however right after
> the dump status change it's possible that another dump-guest-memory qmp command
> is sent so both the main thread and dump thread (which is during cleanup) could
> be accessing dump state in paralell.  That's racy.
> 
> Fix it by protecting the finalizing phase of dump-guest-memory using BQL as
> well.  To do that, we expand the BQL from dump_cleanup() into dump_process(),
> so we will take the BQL longer than before.  The critical section must cover
> the status switch from ACTIVE->{FAIL|COMPLETE} so as to make sure there's no
> race any more.
> 
> We can also just introduce a specific mutex to serialize the dump process, but
> BQL should be enough for now so far, not to mention vm_start() in dump_cleanup
> will need BQL anyway, so maybe easier to just use the same mutex.
> 
> Reported-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  dump/dump.c | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 662d0a62cd..196b7b8ab9 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -96,13 +96,7 @@ static int dump_cleanup(DumpState *s)
>      g_free(s->guest_note);
>      s->guest_note = NULL;
>      if (s->resume) {
> -        if (s->detached) {
> -            qemu_mutex_lock_iothread();
> -        }
>          vm_start();
> -        if (s->detached) {
> -            qemu_mutex_unlock_iothread();
> -        }
>      }
>      migrate_del_blocker(dump_migration_blocker);
>  
> @@ -1873,6 +1867,11 @@ static void dump_process(DumpState *s, Error **errp)
>      Error *local_err = NULL;
>      DumpQueryResult *result = NULL;
>  
> +    /*
> +     * When running with detached mode, these operations are not run with BQL.
> +     * It's still safe, because it's protected by setting s->state to ACTIVE,

I think this is a typo: it should be s->status.

> +     * so dump_in_progress() check will block yet another dump-guest-memory.
> +     */
>      if (s->has_format && s->format == DUMP_GUEST_MEMORY_FORMAT_WIN_DMP) {
>  #ifdef TARGET_X86_64
>          create_win_dump(s, &local_err);
> @@ -1883,6 +1882,15 @@ static void dump_process(DumpState *s, Error **errp)
>          create_vmcore(s, &local_err);
>      }
>  
> +    /*
> +     * Serialize the finalizing of dump process using BQL to make sure no
> +     * concurrent access to DumpState is allowed.  BQL is also required for
> +     * dump_cleanup as vm_start() needs it.
> +     */
> +    if (s->detached) {
> +        qemu_mutex_lock_iothread();
> +    }
> +
>      /* make sure status is written after written_size updates */
>      smp_wmb();
>      qatomic_set(&s->status,
> @@ -1898,6 +1906,10 @@ static void dump_process(DumpState *s, Error **errp)
>  
>      error_propagate(errp, local_err);
>      dump_cleanup(s);
> +
> +    if (s->detached) {
> +        qemu_mutex_unlock_iothread();
> +    }
>  }
>  
>  static void *dump_thread(void *data)
> 

The detached dumping thread now runs dump_cleanup() with the BQL held, so:

dump_thread()
  dump_process()
    [ dump status is now FAILED or COMPLETED ]
    dump_cleanup()
      vm_start()
      [ runstate is now "running" I guess? ]
      migrate_del_blocker()
        g_slist_remove(migration_blockers) <------ read-modify-write #1

is now called under the BQL's protection.

Assuming a new dump request is issued in parallel over QMP, we have (on
another thread -- the main thread I guess?):

qmp_dump_guest_memory()
  [ dumping *not* in progress ]
  migrate_add_blocker_internal()
    [ runstate is *not* RUN_STATE_SAVE_VM ]
    g_slist_prepend(migration_blockers) <------- RMW #2

and this is not protected by any *explicit* acquiral of the BQL.

I know very little of the BQL, unfortunately. *IF* your argument is that
qmp_dump_guest_memory() is entered with the BQL *already held*, then the
patch is fine, IMO. Because in that case, during the short while that
the detached dumping thread is cleaning up, the main thread (?) cannot
acquire the BQL, and so it cannot enter qmp_dump_guest_memory() at all.
If that's your point, then:

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

*Otherwise*, I don't understand how the patch helps protecting the
"migration_blockers" object. (Because, although RMW#1 is now protected,
RMW#2 is not.)

Thanks
Laszlo


