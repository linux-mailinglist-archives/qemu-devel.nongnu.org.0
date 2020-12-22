Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4652E1030
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 23:33:50 +0100 (CET)
Received: from localhost ([::1]:45312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krqE1-0000Ly-2O
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 17:33:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.kravetz@oracle.com>)
 id 1krqBJ-0008J2-PF
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 17:31:01 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.kravetz@oracle.com>)
 id 1krqBH-00088s-1n
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 17:31:01 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BMMStOn003369;
 Tue, 22 Dec 2020 22:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=vDTa40BJaKHnSrn8xlxSJOGgL1/FIkyuNeoV6psII3Y=;
 b=nvwIsjQfbHfdax2SIBH7uUMyDn2veVDvyhYG6RYoGek2QI0zH06ijBeXfg9IciMQV4Is
 TSYWKxO1fFnFNlwm4jhdrlFGs8kL1dv++S7J6BXTHLZZPTH6/L2HlgepCFeCuXmAue51
 KY4J1fpevlAKXDZIdirCBxdyjo5VXd5KeEf/TWgYKEjn6NaEzg2tDsS2BgrIQ9Q3bq+8
 6Qj5kIgrtepAjTraEtGehvm7F3QOzvRjjBIDbbaXGD/sE1hiNu/KwzmlzEyRRasSXU36
 HoDLUl3C0WyLCNDIC4DsDmuJ7s+3gtHdygUsyl1QZtIkvNxrDGr3BEdZ4P6pGDnLSLYO SA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 35k0d8dj6y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Dec 2020 22:30:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BMMTcxW020317;
 Tue, 22 Dec 2020 22:30:40 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 35k0e8ytvr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Dec 2020 22:30:39 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BMMUa3a018806;
 Tue, 22 Dec 2020 22:30:36 GMT
Received: from [192.168.2.112] (/50.38.35.18)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Dec 2020 14:30:35 -0800
Subject: Re: [RFC PATCH 1/3] mm: support hugetlb free page reporting
To: Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@intel.com>, Michal Hocko <mhocko@suse.com>,
 Liang Li <liliangleo@didiglobal.com>, Liang Li <liliang324@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, qemu-devel@nongnu.org
References: <20201222074656.GA30035@open-light-1.localdomain>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <63318bf1-21ea-7202-e060-b4b2517c684e@oracle.com>
Date: Tue, 22 Dec 2020 14:30:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20201222074656.GA30035@open-light-1.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9843
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012220162
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9843
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012220162
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=mike.kravetz@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/20 11:46 PM, Liang Li wrote:
> Free page reporting only supports buddy pages, it can't report the
> free pages reserved for hugetlbfs case. On the other hand, hugetlbfs
> is a good choice for a system with a huge amount of RAM, because it
> can help to reduce the memory management overhead and improve system
> performance.
> This patch add the support for reporting hugepages in the free list
> of hugetlb, it canbe used by virtio_balloon driver for memory
> overcommit and pre zero out free pages for speeding up memory population.

My apologies as I do not follow virtio_balloon driver.  Comments from
the hugetlb perspective.

> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -41,6 +41,7 @@
>  #include <linux/node.h>
>  #include <linux/userfaultfd_k.h>
>  #include <linux/page_owner.h>
> +#include "page_reporting.h"
>  #include "internal.h"
>  
>  int hugetlb_max_hstate __read_mostly;
> @@ -1028,6 +1029,11 @@ static void enqueue_huge_page(struct hstate *h, struct page *page)
>  	list_move(&page->lru, &h->hugepage_freelists[nid]);
>  	h->free_huge_pages++;
>  	h->free_huge_pages_node[nid]++;
> +	if (hugepage_reported(page)) {
> +		__ClearPageReported(page);
> +		pr_info("%s, free_huge_pages=%ld\n", __func__, h->free_huge_pages);
> +	}
> +	hugepage_reporting_notify_free(h->order);
>  }
>  
>  static struct page *dequeue_huge_page_node_exact(struct hstate *h, int nid)
> @@ -5531,6 +5537,29 @@ follow_huge_pgd(struct mm_struct *mm, unsigned long address, pgd_t *pgd, int fla
>  	return pte_page(*(pte_t *)pgd) + ((address & ~PGDIR_MASK) >> PAGE_SHIFT);
>  }
>  
> +bool isolate_free_huge_page(struct page *page, struct hstate *h, int nid)

Looks like this always returns true.  Should it be type void?

> +{
> +	bool ret = true;
> +
> +	VM_BUG_ON_PAGE(!PageHead(page), page);
> +
> +	list_move(&page->lru, &h->hugepage_activelist);
> +	set_page_refcounted(page);
> +	h->free_huge_pages--;
> +	h->free_huge_pages_node[nid]--;
> +
> +	return ret;
> +}
> +

...

> diff --git a/mm/page_reporting.c b/mm/page_reporting.c
> index 20ec3fb1afc4..15d4b5372df8 100644
> --- a/mm/page_reporting.c
> +++ b/mm/page_reporting.c
> @@ -7,6 +7,7 @@
>  #include <linux/delay.h>
>  #include <linux/scatterlist.h>
>  #include <linux/sched.h>
> +#include <linux/hugetlb.h>
>  
>  #include "page_reporting.h"
>  #include "internal.h"
> @@ -16,6 +17,10 @@ static struct page_reporting_dev_info __rcu *pr_dev_info __read_mostly;
>  int page_report_mini_order = pageblock_order;
>  unsigned long page_report_batch_size = 32 * 1024 * 1024;
>  
> +static struct page_reporting_dev_info __rcu *hgpr_dev_info __read_mostly;
> +int hugepage_report_mini_order = pageblock_order;
> +unsigned long hugepage_report_batch_size = 64 * 1024 * 1024;
> +
>  enum {
>  	PAGE_REPORTING_IDLE = 0,
>  	PAGE_REPORTING_REQUESTED,
> @@ -67,6 +72,24 @@ void __page_reporting_notify(void)
>  	rcu_read_unlock();
>  }
>  
> +/* notify prdev of free hugepage reporting request */
> +void __hugepage_reporting_notify(void)
> +{
> +	struct page_reporting_dev_info *prdev;
> +
> +	/*
> +	 * We use RCU to protect the pr_dev_info pointer. In almost all
> +	 * cases this should be present, however in the unlikely case of
> +	 * a shutdown this will be NULL and we should exit.
> +	 */
> +	rcu_read_lock();
> +	prdev = rcu_dereference(hgpr_dev_info);
> +	if (likely(prdev))
> +		__page_reporting_request(prdev);
> +
> +	rcu_read_unlock();
> +}
> +
>  static void
>  page_reporting_drain(struct page_reporting_dev_info *prdev,
>  		     struct scatterlist *sgl, unsigned int nents, bool reported)
> @@ -103,6 +126,213 @@ page_reporting_drain(struct page_reporting_dev_info *prdev,
>  	sg_init_table(sgl, nents);
>  }
>  
> +static void
> +hugepage_reporting_drain(struct page_reporting_dev_info *prdev,
> +			 struct hstate *h, struct scatterlist *sgl,
> +			 unsigned int nents, bool reported)
> +{
> +	struct scatterlist *sg = sgl;
> +
> +	/*
> +	 * Drain the now reported pages back into their respective
> +	 * free lists/areas. We assume at least one page is populated.
> +	 */
> +	do {
> +		struct page *page = sg_page(sg);
> +
> +		putback_isolate_huge_page(h, page);
> +
> +		/* If the pages were not reported due to error skip flagging */
> +		if (!reported)
> +			continue;
> +
> +		__SetPageReported(page);
> +	} while ((sg = sg_next(sg)));
> +
> +	/* reinitialize scatterlist now that it is empty */
> +	sg_init_table(sgl, nents);
> +}
> +
> +/*
> + * The page reporting cycle consists of 4 stages, fill, report, drain, and
> + * idle. We will cycle through the first 3 stages until we cannot obtain a
> + * full scatterlist of pages, in that case we will switch to idle.
> + */

As mentioned, I am not familiar with virtio_balloon and the overall design.
So, some of this does not make sense to me.

> +static int
> +hugepage_reporting_cycle(struct page_reporting_dev_info *prdev,
> +			 struct hstate *h, unsigned int nid,
> +			 struct scatterlist *sgl, unsigned int *offset)
> +{
> +	struct list_head *list = &h->hugepage_freelists[nid];
> +	unsigned int page_len = PAGE_SIZE << h->order;
> +	struct page *page, *next;
> +	long budget;
> +	int ret = 0, scan_cnt = 0;
> +
> +	/*
> +	 * Perform early check, if free area is empty there is
> +	 * nothing to process so we can skip this free_list.
> +	 */
> +	if (list_empty(list))
> +		return ret;

Do note that not all entries on the hugetlb free lists are free.  Reserved
entries are also on the free list.  The actual number of free entries is
'h->free_huge_pages - h->resv_huge_pages'.
Is the intention to process reserved pages as well as free pages?

> +
> +	spin_lock_irq(&hugetlb_lock);
> +
> +	if (huge_page_order(h) > MAX_ORDER)
> +		budget = HUGEPAGE_REPORTING_CAPACITY;
> +	else
> +		budget = HUGEPAGE_REPORTING_CAPACITY * 32;
> +
> +	/* loop through free list adding unreported pages to sg list */
> +	list_for_each_entry_safe(page, next, list, lru) {
> +		/* We are going to skip over the reported pages. */
> +		if (PageReported(page)) {
> +			if (++scan_cnt >= MAX_SCAN_NUM) {
> +				ret = scan_cnt;
> +				break;
> +			}
> +			continue;
> +		}
> +
> +		/*
> +		 * If we fully consumed our budget then update our
> +		 * state to indicate that we are requesting additional
> +		 * processing and exit this list.
> +		 */
> +		if (budget < 0) {
> +			atomic_set(&prdev->state, PAGE_REPORTING_REQUESTED);
> +			next = page;
> +			break;
> +		}
> +
> +		/* Attempt to pull page from list and place in scatterlist */
> +		if (*offset) {
> +			isolate_free_huge_page(page, h, nid);

Once a hugetlb page is isolated, it can not be used and applications that
depend on hugetlb pages can start to fail.
I assume that is acceptable/expected behavior.  Correct?
On some systems, hugetlb pages are a precious resource and the sysadmin
carefully configures the number needed by applications.  Removing a hugetlb
page (even for a very short period of time) could cause serious application
failure.

My apologies if that is a stupid question.  I really have no knowledge of
this area.

> +			/* Add page to scatter list */
> +			--(*offset);
> +			sg_set_page(&sgl[*offset], page, page_len, 0);
> +
> +			continue;
> +		}
> +
> +		/*
> +		 * Make the first non-processed page in the free list
> +		 * the new head of the free list before we release the
> +		 * zone lock.
> +		 */
> +		if (&page->lru != list && !list_is_first(&page->lru, list))
> +			list_rotate_to_front(&page->lru, list);
> +
> +		/* release lock before waiting on report processing */
> +		spin_unlock_irq(&hugetlb_lock);
> +
> +		/* begin processing pages in local list */
> +		ret = prdev->report(prdev, sgl, HUGEPAGE_REPORTING_CAPACITY);
> +
> +		/* reset offset since the full list was reported */
> +		*offset = HUGEPAGE_REPORTING_CAPACITY;
> +
> +		/* update budget to reflect call to report function */
> +		budget--;
> +
> +		/* reacquire zone lock and resume processing */
> +		spin_lock_irq(&hugetlb_lock);
> +
> +		/* flush reported pages from the sg list */
> +		hugepage_reporting_drain(prdev, h, sgl,
> +					 HUGEPAGE_REPORTING_CAPACITY, !ret);
> +
> +		/*
> +		 * Reset next to first entry, the old next isn't valid
> +		 * since we dropped the lock to report the pages
> +		 */
> +		next = list_first_entry(list, struct page, lru);
> +
> +		/* exit on error */
> +		if (ret)
> +			break;
> +	}
> +
> +	/* Rotate any leftover pages to the head of the freelist */
> +	if (&next->lru != list && !list_is_first(&next->lru, list))
> +		list_rotate_to_front(&next->lru, list);
> +
> +	spin_unlock_irq(&hugetlb_lock);
> +
> +	return ret;
> +}

-- 
Mike Kravetz

