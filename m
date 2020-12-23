Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7892E17F0
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 04:59:10 +0100 (CET)
Received: from localhost ([::1]:54688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krvIr-0003k1-BO
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 22:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1krvHW-0003J7-BM
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 22:57:46 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:44207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1krvHU-0008Ly-G9
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 22:57:46 -0500
Received: by mail-lf1-x12c.google.com with SMTP id m25so36900399lfc.11
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 19:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=enuHhNBx3erTv6NGu3mnW7SPnLxGpEoV7bQL4nKhqzc=;
 b=VA1JPRz3K+EPcAExLpHvImEKhTkZKKlFdfj/D85QkXAxWQfXv3NhMFQjOjsPDmbib4
 TTMVjd/41mO7CUjSZveAq8PN7jv+07omfCXAEn/XS0PEmibkdGHTIV6xMkpM4Z0vdLWr
 uMY5ZscGmuwOHcf+O7m9nVa2ImfQWUDxqypaqEdzsfBGgXdGn07TRdEwSEaMLOLgRmfK
 YkfYygjWIfGtiS2jSsvLR9myX1+K3N7TdcbfzSh2q0saW6mvepJQIRqgE/DXzXMhFwJ/
 hc/03ydcIRVUdRyKQAtqG+E+MTaVllURwLkiu8kuuM9KyNdWgBjzOKV04LHTUQDHFk+0
 jOoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=enuHhNBx3erTv6NGu3mnW7SPnLxGpEoV7bQL4nKhqzc=;
 b=CHPG20AX5S8V5Bz5KnvTjlGbaOWcKskHtNBMrozlqmOAzxqfxZZsRaEee1zxMUIA8T
 SAmTKtxSC9mj9k20zvlwUecgj9O3/Fo1+Rjjgl5ZBULxFG363Hsa8OZqewVzRmwJvGfn
 dX+9RFBblm5clU4NsJV5cZ/SSmBfGUW4ABmiPjE/RZgv6TlthNP9xQwfg2XyzZwloWBW
 Xxrp0utcSQjL8H9yWNb83quxAtV2t/pwNaFE8a8buSO3EUgQx/tzG2r/9DzuSZah9gER
 99zrY97cTOtJiSq2FEQOj1jLwesc/2npWJU9IEpLvusuOBVQDkeBZubpVOSGociL/otG
 Kw6A==
X-Gm-Message-State: AOAM532L583//8CCSSEmLeNc8DrU9Q42oMC4Pym36sr/jbFrg6EXLQwU
 3zX0yyUNcLKd6nRvAuRVjdmDDIaqqN6/RHp+fI0=
X-Google-Smtp-Source: ABdhPJxeb9uR35SLDkEHQkSFzjI6GJGZz5VYrcM5t1drBy2nU9D3Lmn1TDuOZuq9KEJJ3obKbiwEa4Kg14NvoKT3LmY=
X-Received: by 2002:a05:6512:1112:: with SMTP id
 l18mr9559659lfg.538.1608695862702; 
 Tue, 22 Dec 2020 19:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20201222074656.GA30035@open-light-1.localdomain>
 <63318bf1-21ea-7202-e060-b4b2517c684e@oracle.com>
In-Reply-To: <63318bf1-21ea-7202-e060-b4b2517c684e@oracle.com>
From: Liang Li <liliang324@gmail.com>
Date: Wed, 23 Dec 2020 11:57:31 +0800
Message-ID: <CA+2MQi_QDnnsbMdOH5B4Hhak-CWA-Xs6PLhxoGq2f+Vv13sgyg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] mm: support hugetlb free page reporting
To: Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=liliang324@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Michal Hocko <mhocko@suse.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Liang Li <liliangleo@didiglobal.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 Dave Hansen <dave.hansen@intel.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On 12/21/20 11:46 PM, Liang Li wrote:
> > Free page reporting only supports buddy pages, it can't report the
> > free pages reserved for hugetlbfs case. On the other hand, hugetlbfs
> > is a good choice for a system with a huge amount of RAM, because it
> > can help to reduce the memory management overhead and improve system
> > performance.
> > This patch add the support for reporting hugepages in the free list
> > of hugetlb, it canbe used by virtio_balloon driver for memory
> > overcommit and pre zero out free pages for speeding up memory population.
>
> My apologies as I do not follow virtio_balloon driver.  Comments from
> the hugetlb perspective.

Any comments are welcome.


> >  static struct page *dequeue_huge_page_node_exact(struct hstate *h, int nid)
> > @@ -5531,6 +5537,29 @@ follow_huge_pgd(struct mm_struct *mm, unsigned long address, pgd_t *pgd, int fla
> >       return pte_page(*(pte_t *)pgd) + ((address & ~PGDIR_MASK) >> PAGE_SHIFT);
> >  }
> >
> > +bool isolate_free_huge_page(struct page *page, struct hstate *h, int nid)
>
> Looks like this always returns true.  Should it be type void?

will change in the next revision.

> > +{
> > +     bool ret = true;
> > +
> > +     VM_BUG_ON_PAGE(!PageHead(page), page);
> > +
> > +     list_move(&page->lru, &h->hugepage_activelist);
> > +     set_page_refcounted(page);
> > +     h->free_huge_pages--;
> > +     h->free_huge_pages_node[nid]--;
> > +
> > +     return ret;
> > +}
> > +
>
> ...

> > +static void
> > +hugepage_reporting_drain(struct page_reporting_dev_info *prdev,
> > +                      struct hstate *h, struct scatterlist *sgl,
> > +                      unsigned int nents, bool reported)
> > +{
> > +     struct scatterlist *sg = sgl;
> > +
> > +     /*
> > +      * Drain the now reported pages back into their respective
> > +      * free lists/areas. We assume at least one page is populated.
> > +      */
> > +     do {
> > +             struct page *page = sg_page(sg);
> > +
> > +             putback_isolate_huge_page(h, page);
> > +
> > +             /* If the pages were not reported due to error skip flagging */
> > +             if (!reported)
> > +                     continue;
> > +
> > +             __SetPageReported(page);
> > +     } while ((sg = sg_next(sg)));
> > +
> > +     /* reinitialize scatterlist now that it is empty */
> > +     sg_init_table(sgl, nents);
> > +}
> > +
> > +/*
> > + * The page reporting cycle consists of 4 stages, fill, report, drain, and
> > + * idle. We will cycle through the first 3 stages until we cannot obtain a
> > + * full scatterlist of pages, in that case we will switch to idle.
> > + */
>
> As mentioned, I am not familiar with virtio_balloon and the overall design.
> So, some of this does not make sense to me.
>
> > +static int
> > +hugepage_reporting_cycle(struct page_reporting_dev_info *prdev,
> > +                      struct hstate *h, unsigned int nid,
> > +                      struct scatterlist *sgl, unsigned int *offset)
> > +{
> > +     struct list_head *list = &h->hugepage_freelists[nid];
> > +     unsigned int page_len = PAGE_SIZE << h->order;
> > +     struct page *page, *next;
> > +     long budget;
> > +     int ret = 0, scan_cnt = 0;
> > +
> > +     /*
> > +      * Perform early check, if free area is empty there is
> > +      * nothing to process so we can skip this free_list.
> > +      */
> > +     if (list_empty(list))
> > +             return ret;
>
> Do note that not all entries on the hugetlb free lists are free.  Reserved
> entries are also on the free list.  The actual number of free entries is
> 'h->free_huge_pages - h->resv_huge_pages'.
> Is the intention to process reserved pages as well as free pages?

Yes, Reserved pages was treated as 'free pages'

> > +
> > +     spin_lock_irq(&hugetlb_lock);
> > +
> > +     if (huge_page_order(h) > MAX_ORDER)
> > +             budget = HUGEPAGE_REPORTING_CAPACITY;
> > +     else
> > +             budget = HUGEPAGE_REPORTING_CAPACITY * 32;
> > +
> > +     /* loop through free list adding unreported pages to sg list */
> > +     list_for_each_entry_safe(page, next, list, lru) {
> > +             /* We are going to skip over the reported pages. */
> > +             if (PageReported(page)) {
> > +                     if (++scan_cnt >= MAX_SCAN_NUM) {
> > +                             ret = scan_cnt;
> > +                             break;
> > +                     }
> > +                     continue;
> > +             }
> > +
> > +             /*
> > +              * If we fully consumed our budget then update our
> > +              * state to indicate that we are requesting additional
> > +              * processing and exit this list.
> > +              */
> > +             if (budget < 0) {
> > +                     atomic_set(&prdev->state, PAGE_REPORTING_REQUESTED);
> > +                     next = page;
> > +                     break;
> > +             }
> > +
> > +             /* Attempt to pull page from list and place in scatterlist */
> > +             if (*offset) {
> > +                     isolate_free_huge_page(page, h, nid);
>
> Once a hugetlb page is isolated, it can not be used and applications that
> depend on hugetlb pages can start to fail.
> I assume that is acceptable/expected behavior.  Correct?
> On some systems, hugetlb pages are a precious resource and the sysadmin
> carefully configures the number needed by applications.  Removing a hugetlb
> page (even for a very short period of time) could cause serious application
> failure.

That' true, especially for 1G pages. Any suggestions?
Let the hugepage allocator be aware of this situation and retry ?

> My apologies if that is a stupid question.  I really have no knowledge of
> this area.
>
> Mike Kravetz

Thanks for your comments, Mike

Liang

-- 
>

