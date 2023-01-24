Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E42E67A4C8
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 22:17:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKQe2-0002FS-1M; Tue, 24 Jan 2023 16:15:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKQdt-0002E3-B0
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:15:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pKQdq-00064H-Sa
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:15:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674594941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EnF2zHCl/g77u7ZKJHlVYcKODRXwTueyyyQ5FzVNhGM=;
 b=SSiFSvYnQqC1cgg7IvSEdk71d/7ORbSx991/F3X0qBPOB6AjxiCWFOAIYx3Uxt2l0UrIrT
 9S2zlc9fhXQtgSUBY6iQlTA2qAJD3TyCvjLr+CsvaK//k8e5EM8J5wGYVSTuedHSgNdzD7
 j2BYly6SXu5pq7cBa+/Ero84udf6/bs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-9XWqGbJLNcmUtAw1PTD4Og-1; Tue, 24 Jan 2023 16:15:39 -0500
X-MC-Unique: 9XWqGbJLNcmUtAw1PTD4Og-1
Received: by mail-qv1-f70.google.com with SMTP id
 jh2-20020a0562141fc200b004c74bbb0affso8261750qvb.21
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 13:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EnF2zHCl/g77u7ZKJHlVYcKODRXwTueyyyQ5FzVNhGM=;
 b=YIIZLPsPUVue8rHQoOVfSKidt/j/bZctSokYKlw1f0mmjuCniEycW9mWLLEmqYdG6J
 bH1xUnx21DSStxJJNbkQ9pzkfimvNVigWHiPWB8ua9AN8xQyAizM6YNbSo6uJcT3NjUj
 aQkDKo5AJ+9cd8th630+C8tu4iIjTckTJTtxOFlIah9IU2FYdYiI93Gjxy7VSXbIR4yg
 d47gAoICMvUosKjTL21HLilpSEwG/cH08Z4PNQk6eGgetB79dPFvjo/EQYtIhNnCaHED
 kK6ajJvy9EmyUtaigKAYiKBve1KHmjAEw/ep7+0vs/vIW3qXRrmkVWpwtlgp9hvSCxhh
 ACsQ==
X-Gm-Message-State: AO0yUKVoATWhdLYvR5/Y1fFSHTNdLXFsUVJlMgcEna1NHk9DMxTbmXAI
 FYFK1Hu2aTRnaYOSxHHZOfSOW2zPdn7AQMkFkEUf7F+H2+O6U1/+13BneczmxjVwE5kIiKePehr
 QX3B75ArlCrMhF1k=
X-Received: by 2002:a05:622a:180d:b0:3b7:fb43:e740 with SMTP id
 t13-20020a05622a180d00b003b7fb43e740mr1308852qtc.67.1674594939261; 
 Tue, 24 Jan 2023 13:15:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/cP1Lt55yPXvCvHpJbbzwXAeA5Xlfld9e560I44bJovAs9Ek6WAgs4MW03L8Ljke8T3IfK/A==
X-Received: by 2002:a05:622a:180d:b0:3b7:fb43:e740 with SMTP id
 t13-20020a05622a180d00b003b7fb43e740mr1308820qtc.67.1674594939001; 
 Tue, 24 Jan 2023 13:15:39 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 t4-20020ae9df04000000b00705cef9b84asm2051554qkf.131.2023.01.24.13.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 13:15:38 -0800 (PST)
Date: Tue, 24 Jan 2023 16:15:37 -0500
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>, Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH RFC 11/21] migration: Add hugetlb-doublemap cap
Message-ID: <Y9BKeZjQG53X5kZb@x1n>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-12-peterx@redhat.com>
 <Y8/S8g4s42RCBTEV@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8/S8g4s42RCBTEV@work-vm>
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

On Tue, Jan 24, 2023 at 12:45:38PM +0000, Dr. David Alan Gilbert wrote:
> * Peter Xu (peterx@redhat.com) wrote:
> > Add a new cap to allow mapping hugetlbfs backed RAMs in small page sizes.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Thanks.

> 
> although, I'm curious if the protocol actually changes

Yes it does.

It differs not in the form of a changed header or any frame definitions,
but in the format of how huge pages are sent.  The old binary can only send
a huge page by sending all the small pages sequentially starting from index
0 to index N_HUGE-1; while the new binary can send the huge page out of
order.  For the latter it's the same as when huge page is not used.

> or whether a doublepage enabled destination would work with an unmodified
> source?

This is an interesting question.

I would expect old -> new work as usual, because the page frames are not
modified so the dest node will just see pages being migrated in a
sequential manner.  The latency of page request will be the same as old
binary though because even if dest host can handle small pages it won't be
able to get asap on the pages it wants - src host decides which page to
send.

Meanwhile new -> old shouldn't work I think as described above, because the
dest host should see weird things happening, e.g., a huge page was sent not
starting fron index 0 but index X (0<X<N_HUGE-1).  It should quickly bail
out assuming there's something wrong.

> I guess potentially you can get away without the dirty clearing
> of the partially sent hugepages that the source normally does.

Good point. It's actually more relevant to the other patch later on
reworking the discard logic.  I kept it as-is for majorly two reasons:

 1) It is still not 100% confirmed on how MADV_DONTNEED should behave on
    HGM enabled memory ranges where huge pages used to be mapped.  It's
    part of the discussion upstream on the kernel patchset.  I think it's
    settling, but in the current series I kept it in a form so it'll work
    in all cases.

 2) Not dirtying the partially sent huge pages can always reduce small
    pages being migrated, but it can also change the content of discard
    messages due to the frame format of MIG_CMD_POSTCOPY_RAM_DISCARD, in
    that we can have a lot more scattered ranges, so a lot more messaging
    can be needed.  While when with the existing logic, since we'll always
    re-dirty the partial sent pages, the ranges are more likely to be
    efficient.
    
        * CMD_POSTCOPY_RAM_DISCARD consist of:
        *      byte   version (0)
        *      byte   Length of name field (not including 0)
        *  n x byte   RAM block name
        *      byte   0 terminator (just for safety)
        *  n x        Byte ranges within the named RAMBlock
        *      be64   Start of the range
        *      be64   Length

I think 1) may not hold as the kernel series evolves, so it may not be true
anymore.  2) may still be true, but I think worth some testing (especially
on 1G pages) to see how it could interfere the discard procedure.  Maybe it
won't be as bad as I think.  Even if it could, we can evaluate the tradeoff
between "slower discard sync" and "less page need to send".  E.g., we can
consider changing the frame layout by boosting postcopy_ram_discard_version.

I'll take a note on this one and provide more update in the next version.

-- 
Peter Xu


