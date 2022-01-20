Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F824945D1
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 03:26:22 +0100 (CET)
Received: from localhost ([::1]:51984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAN9Y-0006OL-Fi
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 21:26:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAN7U-0005TC-HV
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 21:24:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nAN7Q-0003it-NR
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 21:24:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642645446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZxHRUz/yCGcerzc90f5G9EtGnk7xs2go/dwwqxn2HBs=;
 b=CJVH1si4b5okb3RsQdh6nxJCt401KtWYpZ0p0Guy8c3BPbc6u/kcIDNJXH0X8BOTBPKxin
 +zyJR3WyPTTUNH9f+THxolt5Rw6oWAdr9r7H05HCf2aP73FuMUEibdM8nnQYUHUC7UsRwZ
 KSywqjTxMc+Ln1oZel2uVHiiEnNErYc=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-7sjeo1naPXCUCexOmYYzBQ-1; Wed, 19 Jan 2022 21:24:05 -0500
X-MC-Unique: 7sjeo1naPXCUCexOmYYzBQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 v6-20020aa799c6000000b004bd635ff848so2771886pfi.6
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 18:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZxHRUz/yCGcerzc90f5G9EtGnk7xs2go/dwwqxn2HBs=;
 b=7QKfw+OejuQxfhtDocdKnFhs5yzNZxLvUtP5/W9WPWbSEzymbqyb9zUUS/SMJnQ297
 cDFxPxPl+qd760MwD/bxiJWxdr5B9zp2X5BDcqug8/7Rd1iMi9dOhegud9fwUTmfSwxr
 qqacAGoUc6+rGKuQfNZxVXFBDI63un3uhA1Hp3yOQfpSnpJZKPQPNgoLRUOwWtTY5lQ9
 VUDX3DwxVUxXhifOfHRsns1TLiNs9Wj6AXZdC47P6+Fdl5fUA3uf2UoK8F1txIycXmPu
 2C82UzKR9eLY5un51JujxB3oA6c72yus0LLCJQOpDHxhg2uPv0A6Np8BnmE5r3S+L6RB
 nh/A==
X-Gm-Message-State: AOAM530fRZTkFV62IxltkzsYwTXSY0uRwt+s9D5ejPCJ3bVsAXax7qO1
 qkDUtX4Cz5JHsS/5B/DGPXEyC17/f5kADl0WPlbh7WAkS7NLsT1jNf/J2tzGsJmGDoppppsiKtd
 HCjLMsnRyb/xysPs=
X-Received: by 2002:a17:903:22c3:b0:14a:8cf0:63b2 with SMTP id
 y3-20020a17090322c300b0014a8cf063b2mr30981051plg.148.1642645444236; 
 Wed, 19 Jan 2022 18:24:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy54QMluHAiyvjvaxmWfFzKnKOPqpX2bJx/3cxtZ0fREeMzQwY8Q9ERe+twsQ4D/IGU+kcU/g==
X-Received: by 2002:a17:903:22c3:b0:14a:8cf0:63b2 with SMTP id
 y3-20020a17090322c300b0014a8cf063b2mr30981026plg.148.1642645443948; 
 Wed, 19 Jan 2022 18:24:03 -0800 (PST)
Received: from xz-m1.local ([94.177.118.77])
 by smtp.gmail.com with ESMTPSA id 14sm7102375pjh.45.2022.01.19.18.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 18:24:03 -0800 (PST)
Date: Thu, 20 Jan 2022 10:23:57 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 05/15] migration: Simplify unqueue_page()
Message-ID: <YejHvSYRUj5lAS3I@xz-m1.local>
References: <20220119080929.39485-1-peterx@redhat.com>
 <20220119080929.39485-6-peterx@redhat.com>
 <Yeg+IjgX2JG7ok8u@work-vm>
MIME-Version: 1.0
In-Reply-To: <Yeg+IjgX2JG7ok8u@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

On Wed, Jan 19, 2022 at 04:36:50PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > This patch simplifies unqueue_page() on both sides of it (itself, and caller).
> > 
> > Firstly, due to the fact that right after unqueue_page() returned true, we'll
> > definitely send a huge page (see ram_save_huge_page() call - it will _never_
> > exit before finish sending that huge page), so unqueue_page() does not need to
> > jump in small page size if huge page is enabled on the ramblock.  IOW, it's
> > destined that only the 1st 4K page will be valid, when unqueue the 2nd+ time
> > we'll notice the whole huge page has already been sent anyway.  Switching to
> > operating on huge page reduces a lot of the loops of redundant unqueue_page().
> > 
> > Meanwhile, drop the dirty check.  It's not helpful to call test_bit() every
> > time to jump over clean pages, as ram_save_host_page() has already done so,
> > while in a faster way (see commit ba1b7c812c ("migration/ram: Optimize
> > ram_save_host_page()", 2021-05-13)).  So that's not necessary too.
> > 
> > Drop the two tracepoints along the way - based on above analysis it's very
> > possible that no one is really using it..
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Yes, OK
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Although:
>   a) You might like to keep a trace in get_queued_page just to see
> what's getting unqueued
>   b) I think originally it was a useful diagnostic to find out when we
> were getting a lot of queue requests for pages that were already sent.

Ah, that makes sense.  How about I keep the test_bit but remove the loop?  I
can make both a) and b) into one tracepoint:

========
diff --git a/migration/ram.c b/migration/ram.c
index 0df15ff663..02f36fa6d5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1572,6 +1572,9 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
         migration_consume_urgent_request();
     }
 
+    trace_unqueue_page(block->idstr, *offset,
+                       test_bit((*offset >> TARGET_PAGE_BITS), block->bmap));
+
     return block;
 }
 
diff --git a/migration/trace-events b/migration/trace-events
index 3a9b3567ae..efa3a95f81 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -110,6 +110,7 @@ ram_save_iterate_big_wait(uint64_t milliconds, int iterations) "big wait: %" PRI
 ram_load_complete(int ret, uint64_t seq_iter) "exit_code %d seq iteration %" PRIu64
 ram_write_tracking_ramblock_start(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
 ram_write_tracking_ramblock_stop(const char *block_id, size_t page_size, void *addr, size_t length) "%s: page_size: %zu addr: %p length: %zu"
+unqueue_page(char *block, uint64_t offset, bool dirty) "ramblock '%s' offset 0x%"PRIx64" dirty %d"
 
 # multifd.c
 multifd_new_send_channel_async(uint8_t id) "channel %d"
========

Thanks,

-- 
Peter Xu


