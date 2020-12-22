Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7288E2E076C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 09:50:58 +0100 (CET)
Received: from localhost ([::1]:37244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krdNg-0003ku-W8
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 03:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1krdMt-0003LN-PU
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 03:50:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1krdMr-00089Q-9V
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 03:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608627003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMHSD2oK/hpBE1SWjefvZVCPS8CnbnjDm/tKLudlcaA=;
 b=YhqkGeADvSL7wEETJ17C6mHYpG/If2yUi89GWGffPCYQ32LkPAn1f0O93WXzstScUvF6mO
 lP9ySxez6beRwRd7sMl3PudIKmulQ+CJpiTnjLY1VoIsUe8E/u6336X36M6aWZHF7z59tM
 o5ps6jYKISiz++2aiY1S88sZf1DE17k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-_ixAoxX4N3C5tAyWFegXGQ-1; Tue, 22 Dec 2020 03:49:59 -0500
X-MC-Unique: _ixAoxX4N3C5tAyWFegXGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F120180A08A;
 Tue, 22 Dec 2020 08:49:57 +0000 (UTC)
Received: from [10.36.113.220] (ovpn-113-220.ams2.redhat.com [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E001D5B6A8;
 Tue, 22 Dec 2020 08:49:50 +0000 (UTC)
Subject: Re: [RFC PATCH 3/3] mm: support free hugepage pre zero out
From: David Hildenbrand <david@redhat.com>
To: Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@intel.com>, Michal Hocko <mhocko@suse.com>,
 Liang Li <liliangleo@didiglobal.com>, Mike Kravetz
 <mike.kravetz@oracle.com>, Liang Li <liliang324@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, qemu-devel@nongnu.org
References: <20201222074910.GA30051@open-light-1.localdomain>
 <585791f4-4b41-5e73-296e-691d5478a915@redhat.com>
Organization: Red Hat GmbH
Message-ID: <a0bee19a-0703-54b1-2903-60383ab7da64@redhat.com>
Date: Tue, 22 Dec 2020 09:49:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <585791f4-4b41-5e73-296e-691d5478a915@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.20 09:31, David Hildenbrand wrote:
> On 22.12.20 08:49, Liang Li wrote:
>> This patch add support of pre zero out free hugepage, we can use
>> this feature to speed up page population and page fault handing.
>>
>> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>> Cc: Mel Gorman <mgorman@techsingularity.net>
>> Cc: Andrea Arcangeli <aarcange@redhat.com>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Cc: Dave Hansen <dave.hansen@intel.com>
>> Cc: David Hildenbrand <david@redhat.com>  
>> Cc: Michal Hocko <mhocko@suse.com> 
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Alex Williamson <alex.williamson@redhat.com>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Mike Kravetz <mike.kravetz@oracle.com>
>> Cc: Liang Li <liliang324@gmail.com>
>> Signed-off-by: Liang Li <liliangleo@didiglobal.com>
>> ---
>>  mm/page_prezero.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/mm/page_prezero.c b/mm/page_prezero.c
>> index c8ce720bfc54..dff4e0adf402 100644
>> --- a/mm/page_prezero.c
>> +++ b/mm/page_prezero.c
>> @@ -26,6 +26,7 @@ static unsigned long delay_millisecs = 1000;
>>  static unsigned long zeropage_enable __read_mostly;
>>  static DEFINE_MUTEX(kzeropaged_mutex);
>>  static struct page_reporting_dev_info zero_page_dev_info;
>> +static struct page_reporting_dev_info zero_hugepage_dev_info;
>>  
>>  inline void clear_zero_page_flag(struct page *page, int order)
>>  {
>> @@ -69,9 +70,17 @@ static int start_kzeropaged(void)
>>  		zero_page_dev_info.delay_jiffies = msecs_to_jiffies(delay_millisecs);
>>  
>>  		err = page_reporting_register(&zero_page_dev_info);
>> +
>> +		zero_hugepage_dev_info.report = zero_free_pages;
>> +		zero_hugepage_dev_info.mini_order = mini_page_order;
>> +		zero_hugepage_dev_info.batch_size = batch_size;
>> +		zero_hugepage_dev_info.delay_jiffies = msecs_to_jiffies(delay_millisecs);
>> +
>> +		err |= hugepage_reporting_register(&zero_hugepage_dev_info);
>>  		pr_info("Zero page enabled\n");
>>  	} else {
>>  		page_reporting_unregister(&zero_page_dev_info);
>> +		hugepage_reporting_unregister(&zero_hugepage_dev_info);
>>  		pr_info("Zero page disabled\n");
>>  	}
>>  
>> @@ -90,7 +99,15 @@ static int restart_kzeropaged(void)
>>  		zero_page_dev_info.batch_size = batch_size;
>>  		zero_page_dev_info.delay_jiffies = msecs_to_jiffies(delay_millisecs);
>>  
>> +		hugepage_reporting_unregister(&zero_hugepage_dev_info);
>> +
>> +		zero_hugepage_dev_info.report = zero_free_pages;
>> +		zero_hugepage_dev_info.mini_order = mini_page_order;
>> +		zero_hugepage_dev_info.batch_size = batch_size;
>> +		zero_hugepage_dev_info.delay_jiffies = msecs_to_jiffies(delay_millisecs);
>> +
>>  		err = page_reporting_register(&zero_page_dev_info);
>> +		err |= hugepage_reporting_register(&zero_hugepage_dev_info);
>>  		pr_info("Zero page enabled\n");
>>  	}
>>  
>>
> 
> Free page reporting in virtio-balloon doesn't give you any guarantees
> regarding zeroing of pages. Take a look at the QEMU implementation -
> e.g., with vfio all reports are simply ignored.
> 
> Also, I am not sure if mangling such details ("zeroing of pages") into
> the page reporting infrastructure is a good idea.
> 

Oh, now I get what you are doing here, you rely on zero_free_pages of
your other patch series and are not relying on virtio-balloon free page
reporting to do the zeroing.

You really should have mentioned that this patch series relies on the
other one and in which way.

-- 
Thanks,

David / dhildenb


