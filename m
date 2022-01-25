Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C1549B2AD
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:08:57 +0100 (CET)
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJh2-0006cM-8T
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:08:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCJaS-0008FE-Ph
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:02:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCJaK-0003pP-Rh
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 06:02:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643108506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X/8kYaJMS9mRBqZ9wE7c7j+NWXaRZTdr4By/ewldyrw=;
 b=E/6COLL9QfcZwHyWfCzoPC1WBgkTCcuuJLEGv28M67qUk8YgBBAP3sYJ//0+s8gEzCATXG
 K4iGfjoMwZKnRoNJkDWRKRA2O3j6TzBihjgnRPgBkWxNMQ/xFYtUOIwJD/4yk2HIDAAzxD
 TOnxioIPVi60K8qrIqwSly23h/ghzaM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-n4a5w4nvP3ehl8vM55JfJg-1; Tue, 25 Jan 2022 06:01:45 -0500
X-MC-Unique: n4a5w4nvP3ehl8vM55JfJg-1
Received: by mail-wm1-f70.google.com with SMTP id
 w5-20020a1cf605000000b0034b8cb1f55eso1084537wmc.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 03:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=X/8kYaJMS9mRBqZ9wE7c7j+NWXaRZTdr4By/ewldyrw=;
 b=u4GjuWu7JWjDam5HWe2izOlStScNooNAwN9eMNC4BujCW+BrrVk3PNB9r++0/uR+Aw
 7VMq/Nhp2dMLc8fv8tGpxLPG9d30zFPaBf+9FuaslinVW1nJ1uF+CwD0gEY/rif7LOUX
 VTr5F1Zed8X/WlSVoNpF/2XV2IFNZ/V+oyIzG3Yz8kHZfjCzZQVjEf73tbptsf82ATtd
 QtANz4liUHqRhT+zuzY53G5WGec2xGSnNbAZc17By0ydnTryonkGWrrfZ5isQ/4Q7yk4
 t7plS/Xm/wFia/EoRsgyfUNwZfTwz9WHQVvRNQAPVJIC7lGb+y9bDX1GN6QejBbhVNEf
 2f7g==
X-Gm-Message-State: AOAM531wuGhycrQul7HX0bxnG3v3mLcUcosKud+aZ/k+NROPZwT+6Sa2
 VSxc6WcPwLZVGYo6vtwM5YW3c6MtqqgRsNDhjHM1Z8yNicft7sWD59iMdJv+g4x0hjeyG7K51aC
 BKb9I60HYRh8ri54=
X-Received: by 2002:a5d:47c9:: with SMTP id o9mr5082326wrc.566.1643108504283; 
 Tue, 25 Jan 2022 03:01:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpPkG8xOzcdUWbhJaL4Scg8XukGUh8qh5aypQkrKvUigYxk2qtzo3Z1XV92xMmibDfefJ55w==
X-Received: by 2002:a5d:47c9:: with SMTP id o9mr5082303wrc.566.1643108504068; 
 Tue, 25 Jan 2022 03:01:44 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id 8sm39633wmg.0.2022.01.25.03.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 03:01:43 -0800 (PST)
Date: Tue, 25 Jan 2022 11:01:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH RFC 05/15] migration: Simplify unqueue_page()
Message-ID: <Ye/YlVwkP8wx5N86@work-vm>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-6-peterx@redhat.com>
 <Yeg+IjgX2JG7ok8u@work-vm> <YejHvSYRUj5lAS3I@xz-m1.local>
MIME-Version: 1.0
In-Reply-To: <YejHvSYRUj5lAS3I@xz-m1.local>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URG_BIZ=0.573 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> On Wed, Jan 19, 2022 at 04:36:50PM +0000, Dr. David Alan Gilbert wrote:
> > * Peter Xu (peterx@redhat.com) wrote:
> > > This patch simplifies unqueue_page() on both sides of it (itself, and caller).
> > > 
> > > Firstly, due to the fact that right after unqueue_page() returned true, we'll
> > > definitely send a huge page (see ram_save_huge_page() call - it will _never_
> > > exit before finish sending that huge page), so unqueue_page() does not need to
> > > jump in small page size if huge page is enabled on the ramblock.  IOW, it's
> > > destined that only the 1st 4K page will be valid, when unqueue the 2nd+ time
> > > we'll notice the whole huge page has already been sent anyway.  Switching to
> > > operating on huge page reduces a lot of the loops of redundant unqueue_page().
> > > 
> > > Meanwhile, drop the dirty check.  It's not helpful to call test_bit() every
> > > time to jump over clean pages, as ram_save_host_page() has already done so,
> > > while in a faster way (see commit ba1b7c812c ("migration/ram: Optimize
> > > ram_save_host_page()", 2021-05-13)).  So that's not necessary too.
> > > 
> > > Drop the two tracepoints along the way - based on above analysis it's very
> > > possible that no one is really using it..
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > 
> > Yes, OK
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > Although:
> >   a) You might like to keep a trace in get_queued_page just to see
> > what's getting unqueued
> >   b) I think originally it was a useful diagnostic to find out when we
> > were getting a lot of queue requests for pages that were already sent.
> 
> Ah, that makes sense.  How about I keep the test_bit but remove the loop?  I
> can make both a) and b) into one tracepoint:

Yes, i think that's fine.


> ========
> diff --git a/migration/ram.c b/migration/ram.c
> index 0df15ff663..02f36fa6d5 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -1572,6 +1572,9 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
>          migration_consume_urgent_request();
>      }
>  
> +    trace_unqueue_page(block->idstr, *offset,
> +                       test_bit((*offset >> TARGET_PAGE_BITS), block->bmap));
> +
>      return block;
>  }
>  
> diff --git a/migration/trace-events b/migration/trace-events
> index 3a9b3567ae..efa3a95f81 100644
> --- a/migration/trace-events
> +++ b/migration/trace-events
> @@ -110,6 +110,7 @@ ram_save_iterate_big_wait(uint64_t milliconds, int iterations) "big wait: %" PRI
>  ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteration %" PRIu64
>  ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
>  ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
> +unqueue_page(char *block, uint64_t offset, bool dirty) "ramblock '%s' offset 0x%"PRIx64" dirty %d"
>  
>  # multifd.c
>  multifd_new_send_channel_async(uint8_t id) "channel %d"
> ========
> 
> Thanks,
> 
> -- 
> Peter Xu
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


