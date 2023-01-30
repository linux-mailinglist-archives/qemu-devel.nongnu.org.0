Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6D6681E2D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 23:36:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMckL-00036f-6u; Mon, 30 Jan 2023 17:35:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMckF-00035q-VR
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:35:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pMckE-0006WR-8i
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 17:35:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675118120;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MJYxERV/Bb+mwVrSSqkTWbCLiiDFW7qYgLfpxKKfw7E=;
 b=BiPlhJOytOg3b5xUYdCX6+U37rMaMXih2sXE1NXBl3N1p/YhuDCqa/MT8PW5+wb9k0lWCP
 iRCQdphR1LugnmikCzYiBHKl7Ln/EJrAWY+NtITiygjjo94fD3ac6HlbWj0foW44/Qv7c/
 /cjmT/oM3qeVin4JxvfJV33Zc8Q1lcI=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127-14_bBaj8N7-vvgzgq263Lg-1; Mon, 30 Jan 2023 17:35:19 -0500
X-MC-Unique: 14_bBaj8N7-vvgzgq263Lg-1
Received: by mail-qk1-f200.google.com with SMTP id
 v7-20020a05620a0f0700b006faffce43b2so7871169qkl.9
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 14:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJYxERV/Bb+mwVrSSqkTWbCLiiDFW7qYgLfpxKKfw7E=;
 b=llRr/nzen90LU06vF+IN3iOReeEtBsRXp1f3FkCiHDbJVU8FB5QP9drCTKTSrvPQHl
 p479CbQks5FMRUR3Ljp7DCyqxLkU/dLQ7FhpJhRemqORh7mTynmhANkwK/szUsgo0fe6
 BXNyjiudToyR6RYuVJV42T7Td+bX7J+AUfhmXAN4asf2NA/j7REG1H9wFrAonjFLD3HM
 Jx2atjJkpKI7269W4sLq3SsPrMlJMT8WFU88CClQ8n3IsCa+V4Y0oqgssQTVN4c3t5yY
 fzazQhlGF/OkNpyMUi0QIVsnH2SI1LRjvIjPDshErWE7DFXKuGQk+Qd8tiqqs/Kas8EG
 Sb5w==
X-Gm-Message-State: AO0yUKUv45QNS78URoH1PtrbA+7UcloLuG9/F0psyY6oHG0fQGuQwEyy
 K2QAfhh4joyTnxJ+IZr27wVRLE8BSGTQXmAsYjpkGm8HZrvTmp/p6zNHNxaNa3LbtiLH+k4n8N3
 PruCBa5oPbk28tfk=
X-Received: by 2002:a05:622a:1143:b0:3b8:5f47:aac2 with SMTP id
 f3-20020a05622a114300b003b85f47aac2mr3520342qty.1.1675118118840; 
 Mon, 30 Jan 2023 14:35:18 -0800 (PST)
X-Google-Smtp-Source: AK7set/5KW5ZNrf5rBdbX1EMTk4PCKX6AVH+QxUW3+VXxSRtmSPm8j9HEoR+bEFdhrJZRLvxLU5Gbg==
X-Received: by 2002:a05:622a:1143:b0:3b8:5f47:aac2 with SMTP id
 f3-20020a05622a114300b003b85f47aac2mr3520324qty.1.1675118118571; 
 Mon, 30 Jan 2023 14:35:18 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca.
 [70.30.145.63]) by smtp.gmail.com with ESMTPSA id
 bs18-20020ac86f12000000b003b8558eabd0sm4331266qtb.23.2023.01.30.14.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 14:35:17 -0800 (PST)
Date: Mon, 30 Jan 2023 17:35:16 -0500
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 James Houghton <jthoughton@google.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 14/21] migration: Map hugetlbfs ramblocks twice, and
 pre-allocate
Message-ID: <Y9hGJCkD6sYbFSgi@x1n>
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-15-peterx@redhat.com>
 <87edrciohn.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87edrciohn.fsf@secure.mitica>
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

On Mon, Jan 30, 2023 at 06:24:20AM +0100, Juan Quintela wrote:
> Peter Xu <peterx@redhat.com> wrote:
> > Add a RAMBlock.host_mirror for all the hugetlbfs backed guest memories.
> > It'll be used to remap the same region twice and it'll be used to service
> > page faults using UFFDIO_CONTINUE.
> >
> > To make sure all accesses to these ranges will generate minor page faults
> > not missing page faults, we need to pre-allocate the files to make sure
> > page cache exist start from the beginning.
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> but what about this change
> 
> > ---
> >  include/exec/ramblock.h |  7 +++++
> >  migration/ram.c         | 59 +++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 66 insertions(+)
> >
> > diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
> > index 3f31ce1591..c76683c3c8 100644
> > --- a/include/exec/ramblock.h
> > +++ b/include/exec/ramblock.h
> > @@ -28,6 +28,13 @@ struct RAMBlock {
> >      struct rcu_head rcu;
> >      struct MemoryRegion *mr;
> >      uint8_t *host;
> > +    /*
> > +     * This is only used for hugetlbfs ramblocks where doublemap is
> > +     * enabled.  The pointer is managed by dest host migration code, and
> > +     * should be NULL when migration is finished.  On src host, it should
> > +     * always be NULL.
> > +     */
> > +    uint8_t *host_mirror;
> 
> I would consider here:
> 
>     uint8_t *host_doublemap;
> 
> as I have not a small name that means
>     uint8_t *host_map_smaller_size_pages;
> 
> That explains why we need it.

Sure, I can rename this one if it helps.

One thing worth mention is that, it's not mapping things in small page size
here with host_doublemap but in huge page size only.

It's just that UFFDIO_CONTINUE needs another mapping to resolve the page
faults. It'll be the guest hugetlb ramblocks that will be mapped in small
pages during postcopy.

> 
> 
> >      uint8_t *colo_cache; /* For colo, VM's ram cache */
> >      ram_addr_t offset;
> >      ram_addr_t used_length;
> > diff --git a/migration/ram.c b/migration/ram.c
> > index 2ebf414f5f..37d7b3553a 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -3879,6 +3879,57 @@ void colo_release_ram_cache(void)
> >      ram_state_cleanup(&ram_state);
> >  }
> >  
> > +static int migrate_hugetlb_doublemap_init(void)
> > +{
> > +    RAMBlock *rb;
> > +    void *addr;
> > +    int ret;
> 
> Not initialized variables, remove the last two.

I can do this.

> 
> > +    if (!migrate_hugetlb_doublemap()) {
> > +        return 0;
> > +    }
> > +
> 
> I would move the declaration of the RAMBlock here.

But isn't QEMU in most cases declaring variables at the start of any code
block, rather than after or in the middle of any code segments?  IIRC some
compiler should start to fail with it, even though not on the modern ones.

Thanks,

-- 
Peter Xu


