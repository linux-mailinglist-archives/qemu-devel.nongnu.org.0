Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A77443606
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:49:59 +0100 (CET)
Received: from localhost ([::1]:33144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyr8-0000we-Dd
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mhyg6-0003i1-Kw
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:38:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mhyg3-00011X-A7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635878309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r+cGHqNOUNlQOVrV+1QyYCozFhX6WOzOVzby3ROzsh4=;
 b=fQej0r8XLhpMeZPVryh87pn3huU85DUEEPTbBkyFIdJzLY38BfhmSW4ugwwKyxOw3y+Tl8
 PGvFvPBToAPTLO7r1SUG9MZ8wrm+E9rOUjkbEuiwT0fuLzOkvbGVqwK8TnyqP+FpZqyViM
 ITKOPA4YbPq7aWNmOHMw3U+vYKoTdtw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-CpetHPvAMRKP90LEf4sekw-1; Tue, 02 Nov 2021 14:38:26 -0400
X-MC-Unique: CpetHPvAMRKP90LEf4sekw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o18-20020a05600c511200b00332fa17a02eso41095wms.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r+cGHqNOUNlQOVrV+1QyYCozFhX6WOzOVzby3ROzsh4=;
 b=JBxvVepaMY1neFHiOQ3jJfZNkmIv/HHFrhttkMhfK8O5rhDvrDrpyw8PT9+39rBb4w
 aWnhcCXvNeeDx/zLy7ym7zkAjX4Z09TkjY4ob0d1ugmumJPHEIjAuJjg58I+RDuSm1Bp
 1tVGDfVTj9hrznsNFiuFncGWGZ6Zece8WoAu5fFp7dr1zm96Kiai73A9ThglBeZgbPyq
 XFAQDa45us15UiIX9/bZcqeqHB/p25B8ufduu4pX2sYqRnL9LcWNOI3bQJriiv81QupY
 cBTB6MTIR65PIc5rRRzBLgMGtR5xMsTrM8Y+/x7/doPnbECarOk1UNLdzZBkXmN4MPyY
 TeZQ==
X-Gm-Message-State: AOAM5322ORCMF7fRVVbPLYJHBmp/peQSIRC6Hcp7oVqtnszq6RWhVfWI
 B6WXzRW3vuyy/FS2IzBbvrYL4qLHJJBphgyTvj/c1mIKXjazut7ORl3gKlzr4N/cm7pjkukFXMm
 2S0rR7sN680cwGzg=
X-Received: by 2002:a5d:468f:: with SMTP id u15mr34990261wrq.171.1635878305258; 
 Tue, 02 Nov 2021 11:38:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjJsPJDQJgczMJ5UQmd73yrXBZ8nOor7Np7XHx1jzGFvdyOjLQKRl3G5dk/XohgEZIsUY6qA==
X-Received: by 2002:a5d:468f:: with SMTP id u15mr34990221wrq.171.1635878305022; 
 Tue, 02 Nov 2021 11:38:25 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id r1sm3776274wmr.36.2021.11.02.11.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 11:38:24 -0700 (PDT)
Date: Tue, 2 Nov 2021 18:38:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH 2/3] sev/i386: Warn if using -kernel with invalid OVMF
 hashes table area
Message-ID: <YYGFnsCAJ3lZ/h26@work-vm>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-3-dovmurik@linux.ibm.com>
 <YYEwwMsS2SsUzypl@work-vm>
 <83e91693-5e05-ad5a-4d42-75badb2036e0@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <83e91693-5e05-ad5a-4d42-75badb2036e0@linux.ibm.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dov Murik (dovmurik@linux.ibm.com) wrote:
> 
> 
> On 02/11/2021 14:36, Dr. David Alan Gilbert wrote:
> > * Dov Murik (dovmurik@linux.ibm.com) wrote:
> >> Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
> >> for measured linux boot", 2021-09-30) introduced measured direct boot
> >> with -kernel, using an OVMF-designated hashes table which QEMU fills.
> >>
> >> However, no checks are performed on the validity of the hashes area
> >> designated by OVMF.  Specifically, if OVMF publishes the
> >> SEV_HASH_TABLE_RV_GUID entry but it is filled with zeroes, this will
> >> cause QEMU to write the hashes entries over the first page of the
> >> guest's memory (GPA 0).
> >>
> >> Add validity checks to the published area.  If the hashes table area's
> >> base address is zero, or its size is too small to fit the aligned hashes
> >> table, warn and skip the hashes entries addition.  In such case, the
> >> following warning will be displayed:
> >>
> >>     qemu-system-x86_64: warning: SEV: OVMF's hashes table area is invalid (base=0x0 size=0x0)
> >>
> >> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> >> Reported-by: Brijesh Singh <brijesh.singh@amd.com>
> >> ---
> >>  target/i386/sev.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/target/i386/sev.c b/target/i386/sev.c
> >> index 682b8ccf6c..a20ddb545e 100644
> >> --- a/target/i386/sev.c
> >> +++ b/target/i386/sev.c
> >> @@ -1201,13 +1201,18 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
> >>      uint8_t kernel_hash[HASH_SIZE];
> >>      uint8_t *hashp;
> >>      size_t hash_len = HASH_SIZE;
> >> -    int aligned_len;
> >> +    int aligned_len = ROUND_UP(sizeof(SevHashTable), 16);
> >>  
> >>      if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
> >>          warn_report("SEV: kernel specified but OVMF has no hash table guid");
> >>          return false;
> >>      }
> >>      area = (SevHashTableDescriptor *)data;
> >> +    if (!area->base || area->size < aligned_len) {
> >> +        warn_report("SEV: OVMF's hashes table area is invalid (base=0x%x size=0x%x)",
> >> +                    area->base, area->size);
> >> +        return false;
> >> +    }
> > 
> > That's probably a useful check, so
> > 
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> 
> Thanks.
> 
> 
> > however, maybe it needs to be more thorough before using area->base to
> > qemu_map_ram_ptr? - I think it'll get unhappy if it's a bad address not
> > in a ram block. (Or check you're running over the end of a ramblock)
> >
> 
> Does address_space_write perform these checks? Or maybe another API for
> accessing the guest's RAM?

I'm not sure; for example in address_space_map I don't see an check that
flatview_translate gives a valid mr.

Dave

> -Dov
> 
> > Dave
> > 
> >>  
> >>      /*
> >>       * Calculate hash of kernel command-line with the terminating null byte. If
> >> @@ -1266,7 +1271,6 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
> >>      memcpy(ht->kernel.hash, kernel_hash, sizeof(ht->kernel.hash));
> >>  
> >>      /* When calling sev_encrypt_flash, the length has to be 16 byte aligned */
> >> -    aligned_len = ROUND_UP(ht->len, 16);
> >>      if (aligned_len != ht->len) {
> >>          /* zero the excess data so the measurement can be reliably calculated */
> >>          memset(ht->padding, 0, aligned_len - ht->len);
> >> -- 
> >> 2.25.1
> >>
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


