Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE50467A50F
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 22:37:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKQxx-0001cg-OG; Tue, 24 Jan 2023 16:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKQxv-0001cT-Tn
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:36:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKQxt-0000py-Sd
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674596184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9xPUreewe4mEGL2qIkmgoT680b+Yjac8dRoxOR9j+F8=;
 b=APD0UwnLW7x/g811YG7gEbAqDBybR3NwNPi58C+J9e5ueLZzKCPrPDBTDi42csfB3pWZNM
 voYbO/aWb9PhIUOiDr97S/Yk9KkTQPxMHKaf+NlMR6QprYan25EaBTlO/cqJHWlUSxxLL7
 +egIPhLvi3GWsvvpJxp60xesn4kiOxI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-90-wz2G7mF2OpWmKqhp3U5_MQ-1; Tue, 24 Jan 2023 16:36:23 -0500
X-MC-Unique: wz2G7mF2OpWmKqhp3U5_MQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 bq15-20020a05620a468f00b00706ae242abcso11850041qkb.7
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 13:36:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9xPUreewe4mEGL2qIkmgoT680b+Yjac8dRoxOR9j+F8=;
 b=o5Kir3tdSBGESTrJr7QWJrUB6eIgPAtvqkI4jFw2xYKAYYDwUszsIa+305sRUz6Xxz
 JBupoVeBL/470JG1IbYgOMJENI+aAraLCOQvq64+05UudAKUoX0KeWF+FLKm4U9wQzDD
 k8xKq+USpd8zpO9USnsSlDn2EX85Lt0iN3RGO2HbL3DGkmeSchZwYO2FVQZedcsj8kmt
 8g+IhqJys9n8ZkAlfIpzVWPl4J8XCNtL657kmcfhMPgzufBo7YQNAjPLfKV/A/GLn/CD
 YzQuN0hYa6YQgGNzDbOvavUixtY01+OMWMM4lsZ+Oz44OthHeMvMzfGgyjuwmx0WqEgE
 0Jew==
X-Gm-Message-State: AFqh2kp8Wo9qX1u86dq6I2oVhiudmNb7uZksQSrIJWQWZAOEeiohKXiP
 LBqS9mO1qbS+CsSKD+4B6mLSLl+s3PjZFbdq71dSbANi3K3VU6QaoVreQYXjBF9HNzoB6C9D18y
 8rN5NWSYwaUyY9+8=
X-Received: by 2002:ac8:70da:0:b0:39c:da21:6bb3 with SMTP id
 g26-20020ac870da000000b0039cda216bb3mr43412110qtp.56.1674596182866; 
 Tue, 24 Jan 2023 13:36:22 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsO1oLruEtKbS7YBQkdLMsl8TUbf20gk/Cl8jSc1+pxGDQ0ZXgNFInAY5ZD5jIrSWmqQXlsng==
X-Received: by 2002:ac8:70da:0:b0:39c:da21:6bb3 with SMTP id
 g26-20020ac870da000000b0039cda216bb3mr43412087qtp.56.1674596182598; 
 Tue, 24 Jan 2023 13:36:22 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 84-20020a370457000000b006fbbdc6c68fsm2183046qke.68.2023.01.24.13.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 13:36:21 -0800 (PST)
Date: Tue, 24 Jan 2023 16:36:20 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 12/21] migration: Introduce page size
 for-migration-only
Message-ID: <Y9BPVDBpR25kRpoc@x1n>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-13-peterx@redhat.com>
 <Y8/bJQncX3pdWYQr@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8/bJQncX3pdWYQr@work-vm>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Tue, Jan 24, 2023 at 01:20:37PM +0000, Dr. David Alan Gilbert wrote:
> > @@ -3970,7 +3984,8 @@ int ram_load_postcopy(QEMUFile *f, int channel)
> >                  break;
> >              }
> >              tmp_page->target_pages++;
> > -            matches_target_page_size = block->page_size == TARGET_PAGE_SIZE;
> > +            matches_target_page_size =
> > +                migration_ram_pagesize(block) == TARGET_PAGE_SIZE;
> >              /*
> >               * Postcopy requires that we place whole host pages atomically;
> >               * these may be huge pages for RAMBlocks that are backed by
> 
> Hmm do you really want this change?

Yes that's intended.  I want to reuse the same logic here when receiving
small pages from huge pages, just like when we're receiving small pages on
non-hugetlb mappings.

matches_target_page_size majorly affects two things:

  1) For a small zero page, whether we want to pre-set the page_buffer, or
     simply use postcopy_place_page_zero():
  
        case RAM_SAVE_FLAG_ZERO:
            ch = qemu_get_byte(f);
            /*
             * Can skip to set page_buffer when
             * this is a zero page and (block->page_size == TARGET_PAGE_SIZE).
             */
            if (ch || !matches_target_page_size) {
                memset(page_buffer, ch, TARGET_PAGE_SIZE);
            }

  2) For normal page, whether we need to use a page buffer or we can
     directly reuse the page buffer in QEMUFile:

            if (!matches_target_page_size) {
                /* For huge pages, we always use temporary buffer */
                qemu_get_buffer(f, page_buffer, TARGET_PAGE_SIZE);
            } else {
                /*
                 * For small pages that matches target page size, we
                 * avoid the qemu_file copy.  Instead we directly use
                 * the buffer of QEMUFile to place the page.  Note: we
                 * cannot do any QEMUFile operation before using that
                 * buffer to make sure the buffer is valid when
                 * placing the page.
                 */
                qemu_get_buffer_in_place(f, (uint8_t **)&place_source,
                                         TARGET_PAGE_SIZE);
            }

Here:

I want 1) to reuse postcopy_place_page_zero().  For the doublemap case,
it'll reuse postcopy_tmp_zero_page() (because qemu_ram_is_uf_zeroable()
will return false for such a ramblock).

I want 2) to reuse qemu_get_buffer_in_place(), so we avoid a copy process
for the small page which is faster (even if it's hugetlb backed, now we can
reuse the qemufile buffer safely).

Thanks,

-- 
Peter Xu


