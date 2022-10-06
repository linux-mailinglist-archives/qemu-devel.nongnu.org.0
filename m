Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA05F6D71
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:21:54 +0200 (CEST)
Received: from localhost ([::1]:37980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVVJ-0007RF-EO
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogV24-0000oP-7P
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:51:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogV20-0004fg-Tg
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:51:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665078696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WYBEm4AnLCPaQ8ims7LcO46YyGGcb4tJyfuvKXBzVyQ=;
 b=gGo7jNTWeTMJ8QBxVIMcNPwqSmdqasrtMrtH+iv+5MMCm7m0XyvEU/a/x4Gm53g/E4Em20
 Grr9716Ha5lcsVpgbwIBwsoqFCv1n1e/ywkncihrXrwEtRj1v1nlwPNYBndUsJDRN3sPoo
 niYsh81dVx6aCm9FxJVYsXfu6OvSzLs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-414-9pOPaVeMNN2eAwKvSvsj9A-1; Thu, 06 Oct 2022 13:51:34 -0400
X-MC-Unique: 9pOPaVeMNN2eAwKvSvsj9A-1
Received: by mail-wm1-f70.google.com with SMTP id
 k21-20020a7bc415000000b003b4fac53006so823149wmi.3
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 10:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WYBEm4AnLCPaQ8ims7LcO46YyGGcb4tJyfuvKXBzVyQ=;
 b=KlenyxHcz21biFnllCa2Cr/EvPmTIxkufBwXVIzGBLPWQkTGuTKFz3HltYKC0lkhrx
 r1/cD1gyhjbGqaVyBTtaUrxQiX9XWRSI6Xa5HuOs2gZRQSoeJhGSnp71r0JDzqqWAPHU
 4WRTJX1pZd3BcQLdgutSTjTmbw6HbKTb5phbmuaxIjOkHOjDLl7Ll3nwD48Ra8LyxEFW
 LaWVsfJgBmfOUCZjTtKIWW+nmbnMiQjnM2NFKzARvww3txFXso+rgASpT5FWd7E0w92M
 riy80Ur3I4Gb4tBGNu+GBFS5toZGUonS3Jwu/0qTTuad4y7HNVhOoFYFCO8am9GE6C7N
 DRKw==
X-Gm-Message-State: ACrzQf26aUZKLafef1O/S4DcOliIG+t56PMyQfHVrPpgVkyVLlJ6Ws4+
 L0zye7LHamYdAY78oddfFhhLaI97jZAE/Z8BsA2j24Id1jDYiLnUbjffIdn/8Wa22dVz/xNzbHA
 jx0RME3XL2cHyiao=
X-Received: by 2002:a05:6000:15c5:b0:22e:44c5:4973 with SMTP id
 y5-20020a05600015c500b0022e44c54973mr763520wry.513.1665078693690; 
 Thu, 06 Oct 2022 10:51:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5PsUyzsDIg2bpO0KY+ba/Mj8gPPqouIZrEAw9DWXcv2eagwh/ZJyQ+5j1lr6soSynpzmKJtQ==
X-Received: by 2002:a05:6000:15c5:b0:22e:44c5:4973 with SMTP id
 y5-20020a05600015c500b0022e44c54973mr763510wry.513.1665078693426; 
 Thu, 06 Oct 2022 10:51:33 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 n3-20020adffe03000000b0022cd539ce5esm2270wrr.50.2022.10.06.10.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 10:51:32 -0700 (PDT)
Date: Thu, 6 Oct 2022 18:51:30 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 12/14] migration: Send requested page directly in
 rp-return thread
Message-ID: <Yz8VoviZmNeSAgWu@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225225.49105-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225225.49105-1-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> With all the facilities ready, send the requested page directly in the
> rp-return thread rather than queuing it in the request queue, if and only
> if postcopy preempt is enabled.  It can achieve so because it uses separate
> channel for sending urgent pages.  The only shared data is bitmap and it's
> protected by the bitmap_mutex.
> 
> Note that since we're moving the ownership of the urgent channel from the
> migration thread to rp thread it also means the rp thread is responsible
> for managing the qemufile, e.g. properly close it when pausing migration
> happens.  For this, let migration_release_from_dst_file to cover shutdown
> of the urgent channel too, renaming it as migration_release_dst_files() to
> better show what it does.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Yes, getting a bit complex, but I think OK.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/migration.c |  35 +++++++------
>  migration/ram.c       | 112 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 131 insertions(+), 16 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 0eacc0c99b..fae8fd378b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2845,8 +2845,11 @@ static int migrate_handle_rp_resume_ack(MigrationState *s, uint32_t value)
>      return 0;
>  }
>  
> -/* Release ms->rp_state.from_dst_file in a safe way */
> -static void migration_release_from_dst_file(MigrationState *ms)
> +/*
> + * Release ms->rp_state.from_dst_file (and postcopy_qemufile_src if
> + * existed) in a safe way.
> + */
> +static void migration_release_dst_files(MigrationState *ms)
>  {
>      QEMUFile *file;
>  
> @@ -2859,6 +2862,18 @@ static void migration_release_from_dst_file(MigrationState *ms)
>          ms->rp_state.from_dst_file = NULL;
>      }
>  
> +    /*
> +     * Do the same to postcopy fast path socket too if there is.  No
> +     * locking needed because this qemufile should only be managed by
> +     * return path thread.
> +     */
> +    if (ms->postcopy_qemufile_src) {
> +        migration_ioc_unregister_yank_from_file(ms->postcopy_qemufile_src);
> +        qemu_file_shutdown(ms->postcopy_qemufile_src);
> +        qemu_fclose(ms->postcopy_qemufile_src);
> +        ms->postcopy_qemufile_src = NULL;
> +    }
> +
>      qemu_fclose(file);
>  }
>  
> @@ -3003,7 +3018,7 @@ out:
>               * Maybe there is something we can do: it looks like a
>               * network down issue, and we pause for a recovery.
>               */
> -            migration_release_from_dst_file(ms);
> +            migration_release_dst_files(ms);
>              rp = NULL;
>              if (postcopy_pause_return_path_thread(ms)) {
>                  /*
> @@ -3021,7 +3036,7 @@ out:
>      }
>  
>      trace_source_return_path_thread_end();
> -    migration_release_from_dst_file(ms);
> +    migration_release_dst_files(ms);
>      rcu_unregister_thread();
>      return NULL;
>  }
> @@ -3544,18 +3559,6 @@ static MigThrError postcopy_pause(MigrationState *s)
>          qemu_file_shutdown(file);
>          qemu_fclose(file);
>  
> -        /*
> -         * Do the same to postcopy fast path socket too if there is.  No
> -         * locking needed because no racer as long as we do this before setting
> -         * status to paused.
> -         */
> -        if (s->postcopy_qemufile_src) {
> -            migration_ioc_unregister_yank_from_file(s->postcopy_qemufile_src);
> -            qemu_file_shutdown(s->postcopy_qemufile_src);
> -            qemu_fclose(s->postcopy_qemufile_src);
> -            s->postcopy_qemufile_src = NULL;
> -        }
> -
>          migrate_set_state(&s->state, s->state,
>                            MIGRATION_STATUS_POSTCOPY_PAUSED);
>  
> diff --git a/migration/ram.c b/migration/ram.c
> index fdcb61a2c8..fd301d793c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -539,6 +539,8 @@ static QemuThread *decompress_threads;
>  static QemuMutex decomp_done_lock;
>  static QemuCond decomp_done_cond;
>  
> +static int ram_save_host_page_urgent(PageSearchStatus *pss);
> +
>  static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
>                                   ram_addr_t offset, uint8_t *source_buf);
>  
> @@ -553,6 +555,16 @@ static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
>      pss->complete_round = false;
>  }
>  
> +/*
> + * Check whether two PSSs are actively sending the same page.  Return true
> + * if it is, false otherwise.
> + */
> +static bool pss_overlap(PageSearchStatus *pss1, PageSearchStatus *pss2)
> +{
> +    return pss1->host_page_sending && pss2->host_page_sending &&
> +        (pss1->host_page_start == pss2->host_page_start);
> +}
> +
>  static void *do_data_compress(void *opaque)
>  {
>      CompressParam *param = opaque;
> @@ -2253,6 +2265,57 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
>          return -1;
>      }
>  
> +    /*
> +     * When with postcopy preempt, we send back the page directly in the
> +     * rp-return thread.
> +     */
> +    if (postcopy_preempt_active()) {
> +        ram_addr_t page_start = start >> TARGET_PAGE_BITS;
> +        size_t page_size = qemu_ram_pagesize(ramblock);
> +        PageSearchStatus *pss = &ram_state->pss[RAM_CHANNEL_POSTCOPY];
> +        int ret = 0;
> +
> +        qemu_mutex_lock(&rs->bitmap_mutex);
> +
> +        pss_init(pss, ramblock, page_start);
> +        /*
> +         * Always use the preempt channel, and make sure it's there.  It's
> +         * safe to access without lock, because when rp-thread is running
> +         * we should be the only one who operates on the qemufile
> +         */
> +        pss->pss_channel = migrate_get_current()->postcopy_qemufile_src;
> +        pss->postcopy_requested = true;
> +        assert(pss->pss_channel);
> +
> +        /*
> +         * It must be either one or multiple of host page size.  Just
> +         * assert; if something wrong we're mostly split brain anyway.
> +         */
> +        assert(len % page_size == 0);
> +        while (len) {
> +            if (ram_save_host_page_urgent(pss)) {
> +                error_report("%s: ram_save_host_page_urgent() failed: "
> +                             "ramblock=%s, start_addr=0x"RAM_ADDR_FMT,
> +                             __func__, ramblock->idstr, start);
> +                ret = -1;
> +                break;
> +            }
> +            /*
> +             * NOTE: after ram_save_host_page_urgent() succeeded, pss->page
> +             * will automatically be moved and point to the next host page
> +             * we're going to send, so no need to update here.
> +             *
> +             * Normally QEMU never sends >1 host page in requests, so
> +             * logically we don't even need that as the loop should only
> +             * run once, but just to be consistent.
> +             */
> +            len -= page_size;
> +        };
> +        qemu_mutex_unlock(&rs->bitmap_mutex);
> +
> +        return ret;
> +    }
> +
>      struct RAMSrcPageRequest *new_entry =
>          g_new0(struct RAMSrcPageRequest, 1);
>      new_entry->rb = ramblock;
> @@ -2531,6 +2594,55 @@ static void pss_host_page_finish(PageSearchStatus *pss)
>      pss->host_page_start = pss->host_page_end = 0;
>  }
>  
> +/*
> + * Send an urgent host page specified by `pss'.  Need to be called with
> + * bitmap_mutex held.
> + *
> + * Returns 0 if save host page succeeded, false otherwise.
> + */
> +static int ram_save_host_page_urgent(PageSearchStatus *pss)
> +{
> +    bool page_dirty, sent = false;
> +    RAMState *rs = ram_state;
> +    int ret = 0;
> +
> +    trace_postcopy_preempt_send_host_page(pss->block->idstr, pss->page);
> +    pss_host_page_prepare(pss);
> +
> +    /*
> +     * If precopy is sending the same page, let it be done in precopy, or
> +     * we could send the same page in two channels and none of them will
> +     * receive the whole page.
> +     */
> +    if (pss_overlap(pss, &ram_state->pss[RAM_CHANNEL_PRECOPY])) {
> +        trace_postcopy_preempt_hit(pss->block->idstr,
> +                                   pss->page << TARGET_PAGE_BITS);
> +        return 0;
> +    }
> +
> +    do {
> +        page_dirty = migration_bitmap_clear_dirty(rs, pss->block, pss->page);
> +
> +        if (page_dirty) {
> +            /* Be strict to return code; it must be 1, or what else? */
> +            if (ram_save_target_page(rs, pss) != 1) {
> +                error_report_once("%s: ram_save_target_page failed", __func__);
> +                ret = -1;
> +                goto out;
> +            }
> +            sent = true;
> +        }
> +        pss_find_next_dirty(pss);
> +    } while (pss_within_range(pss));
> +out:
> +    pss_host_page_finish(pss);
> +    /* For urgent requests, flush immediately if sent */
> +    if (sent) {
> +        qemu_fflush(pss->pss_channel);
> +    }
> +    return ret;
> +}
> +
>  /**
>   * ram_save_host_page: save a whole host page
>   *
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


