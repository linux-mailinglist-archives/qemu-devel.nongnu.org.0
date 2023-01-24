Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0167A55A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 23:05:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKROb-0007KD-9D; Tue, 24 Jan 2023 17:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKROV-0007G6-5O
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 17:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKROT-00071A-Am
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 17:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674597832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ebMw7dg7NK9iuAenf4sY6avUGZZGO/lzufrYeqS/wfk=;
 b=ap2yjkp8OjsmsUVNly1Bafkb8jK2kaE5ajalbz4NcYjuH1Ut1kOEf3vXAGB3L0TnwIE57W
 S2deThTwha3F8sTkXKVXmwu5ZyiiMHW7Wvg1oXArwRbxEYrUIhRtwvstuaJR2jfOr2R1Gc
 3h2qaU6QrbI7r3DTc7ahoZge9MVg2QM=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-g1fjGXJ3NRut6nAladC6HQ-1; Tue, 24 Jan 2023 17:03:50 -0500
X-MC-Unique: g1fjGXJ3NRut6nAladC6HQ-1
Received: by mail-yb1-f197.google.com with SMTP id
 n194-20020a2540cb000000b008038647d9ebso12200625yba.5
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 14:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ebMw7dg7NK9iuAenf4sY6avUGZZGO/lzufrYeqS/wfk=;
 b=1VizUCGbCjwKQ/OFnsyC7Omme5ocJyb8K2JjqopNSi1r7V/hwfpdA2m1Je61fRxDLQ
 S0y0Q++7JuotVR1351AqvhVYFTbWKZlQgyuXyuD/Z/G9eME87oDTIkpJNIOmx41rKz+H
 Sxbvpx5bqZeNyuZCWIscCOXPwgrOAa0gsrF73xfDFWQxQetwTjRILf5QR7EcraYUIG1Y
 12j8j37n2JDJ4Jw9lWHnYr8lSjE1Qx+7iVt/Uo6L8RJA00hvA1IMZ8DcYoKBogMEg7Y0
 +lO9gsRbDZfdCFfrClkiMecESc0EgGjVZUKayolggzRdWtHq/WjTZvtz58yrfqtDYbZ/
 /hiA==
X-Gm-Message-State: AFqh2krD2hb7kZb+hkwXhN+IcmZVocBj0BFKQjVxfLIe9zNm2iewmTjR
 3g2hfxZId29E03A5Z9tGPkKVZ9maoNeKNc0kkQu/49xhD2WCIs4ulPU/9EalcmLYJCRKlgraswN
 TDkUoLDDAYrhxwt0=
X-Received: by 2002:a81:1904:0:b0:501:235d:4dcc with SMTP id
 4-20020a811904000000b00501235d4dccmr10073819ywz.37.1674597830187; 
 Tue, 24 Jan 2023 14:03:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuhRn4yYUy6WIqtpVkeBNCGHDFkXsZKIBz8TuMOveFy90mJRvXW4tikGw0ZEAdqGwKrppc9Tw==
X-Received: by 2002:a81:1904:0:b0:501:235d:4dcc with SMTP id
 4-20020a811904000000b00501235d4dccmr10073792ywz.37.1674597829909; 
 Tue, 24 Jan 2023 14:03:49 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 d199-20020ae9efd0000000b0070383f1b6f1sm2201273qkg.31.2023.01.24.14.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 14:03:49 -0800 (PST)
Date: Tue, 24 Jan 2023 17:03:48 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 12/21] migration: Introduce page size
 for-migration-only
Message-ID: <Y9BVxKj1O0MKHlTl@x1n>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-13-peterx@redhat.com>
 <Y8/bJQncX3pdWYQr@work-vm> <Y9BPVDBpR25kRpoc@x1n>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y9BPVDBpR25kRpoc@x1n>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Jan 24, 2023 at 04:36:20PM -0500, Peter Xu wrote:
> On Tue, Jan 24, 2023 at 01:20:37PM +0000, Dr. David Alan Gilbert wrote:
> > > @@ -3970,7 +3984,8 @@ int ram_load_postcopy(QEMUFile *f, int channel)
> > >                  break;
> > >              }
> > >              tmp_page->target_pages++;
> > > -            matches_target_page_size = block->page_size == TARGET_PAGE_SIZE;
> > > +            matches_target_page_size =
> > > +                migration_ram_pagesize(block) == TARGET_PAGE_SIZE;
> > >              /*
> > >               * Postcopy requires that we place whole host pages atomically;
> > >               * these may be huge pages for RAMBlocks that are backed by
> > 
> > Hmm do you really want this change?
> 
> Yes that's intended.  I want to reuse the same logic here when receiving
> small pages from huge pages, just like when we're receiving small pages on
> non-hugetlb mappings.
> 
> matches_target_page_size majorly affects two things:
> 
>   1) For a small zero page, whether we want to pre-set the page_buffer, or
>      simply use postcopy_place_page_zero():
>   
>         case RAM_SAVE_FLAG_ZERO:
>             ch = qemu_get_byte(f);
>             /*
>              * Can skip to set page_buffer when
>              * this is a zero page and (block->page_size == TARGET_PAGE_SIZE).
>              */
>             if (ch || !matches_target_page_size) {
>                 memset(page_buffer, ch, TARGET_PAGE_SIZE);
>             }
> 
>   2) For normal page, whether we need to use a page buffer or we can
>      directly reuse the page buffer in QEMUFile:
> 
>             if (!matches_target_page_size) {
>                 /* For huge pages, we always use temporary buffer */
>                 qemu_get_buffer(f, page_buffer, TARGET_PAGE_SIZE);
>             } else {
>                 /*
>                  * For small pages that matches target page size, we
>                  * avoid the qemu_file copy.  Instead we directly use
>                  * the buffer of QEMUFile to place the page.  Note: we
>                  * cannot do any QEMUFile operation before using that
>                  * buffer to make sure the buffer is valid when
>                  * placing the page.
>                  */
>                 qemu_get_buffer_in_place(f, (uint8_t **)&place_source,
>                                          TARGET_PAGE_SIZE);
>             }
> 
> Here:
> 
> I want 1) to reuse postcopy_place_page_zero().  For the doublemap case,
> it'll reuse postcopy_tmp_zero_page() (because qemu_ram_is_uf_zeroable()
> will return false for such a ramblock).
> 
> I want 2) to reuse qemu_get_buffer_in_place(), so we avoid a copy process
> for the small page which is faster (even if it's hugetlb backed, now we can
> reuse the qemufile buffer safely).

Since at it, one more thing worth mentioning is I didn't actually know
whether the original code is always correct when target and host small
psizes don't match..  This is the original line:

  matches_target_page_size = block->page_size == TARGET_PAGE_SIZE;

The problem is we're comparing block page size against target page size,
however block page size should be in host page size granule:

  RAMBlock *qemu_ram_alloc_internal()
  {
    new_block->page_size = qemu_real_host_page_size();

IOW, I am not sure whether postcopy will run at all in that case.  For
example, when we run an Alpha emulator upon x86_64, we can have target
psize 8K while host psize 4K.

The migration protocol should be TARGET_PAGE_SIZE based.  It means, for
postcopy when receiving a single page for Alpha VM being migrated, maybe we
should call UFFDIO_COPY (or UFFDIO_CONTINUE; doesn't matter here) twice
because one guest page contains two host pages.

I'm not sure whether I get all these right.. if so, we have two options:

  a) Forbid postcopy as a whole when detecting qemu_real_host_page_size()
     != TARGET_PAGE_SIZE.

  b) Implement postcopy for that case

I'd go with a) even if it's an issue because it means no one is migrating
that thing in postcopy way in the past N years, so it justifies that maybe
b) doesn't worth it.

-- 
Peter Xu


