Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EFA2E106B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 23:58:08 +0100 (CET)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krqbX-0005to-Er
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 17:58:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.kravetz@oracle.com>)
 id 1krqZP-0005Lj-S1
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 17:55:55 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:41706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mike.kravetz@oracle.com>)
 id 1krqZL-0007vy-AR
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 17:55:55 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BMMpWlD174018;
 Tue, 22 Dec 2020 22:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=N+6K3mCeYK/CoMCgVBBUHQgK04gVj9asaTrrtBEH5II=;
 b=xMjE8Cj23ZoYzPmldN5IYeUk4iWwtF72gnepmDtV597NPn+XfF/jb1Yqrc4kKLw8UPuO
 PuF+Gz3HXDcBc8LC/BTKqPlOSqus6fuXw1pYdzahisjKl8VvplckbgiyU4x5/a0YAlA5
 pvvmTYnW+6aTLZ+MmYu5u+nPG0qfNtOB+LJZVbltZ1NPMgEk+3WkY6XpZYmQqog0CkBa
 pBHUX6Ng/TtbZo+eFfHgMj8dxB2ZNakMuz8QmkhyC2kX5wLAuh4l+nO2UADVxEcBKLAK
 g5RCX73Cbryr+0+2pEz/MzI+NpM0d6/yup1ELAwRsjFUI1THCc84UNGYBpn1IWzB/fUQ iA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 35k0d15m2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 Dec 2020 22:55:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BMMnvTk007881;
 Tue, 22 Dec 2020 22:55:35 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 35k0ea3sym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Dec 2020 22:55:35 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BMMtUxk026442;
 Tue, 22 Dec 2020 22:55:31 GMT
Received: from [192.168.2.112] (/50.38.35.18)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Dec 2020 14:55:30 -0800
Subject: Re: [RFC PATCH 1/3] mm: support hugetlb free page reporting
To: Alexander Duyck <alexander.duyck@gmail.com>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, "Michael S. Tsirkin"
 <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@intel.com>, Michal Hocko <mhocko@suse.com>,
 Liang Li <liliangleo@didiglobal.com>, Liang Li <liliang324@gmail.com>,
 linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, qemu-devel@nongnu.org
References: <20201222074656.GA30035@open-light-1.localdomain>
 <CAKgT0Ucs4pv0+rcPi41uNDrav0sgOmLnVaD4NNWkg7=gncidnQ@mail.gmail.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <52a6cb93-1fed-dfd7-d21e-f14197a9c9dc@oracle.com>
Date: Tue, 22 Dec 2020 14:55:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAKgT0Ucs4pv0+rcPi41uNDrav0sgOmLnVaD4NNWkg7=gncidnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9843
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012220165
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9843
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 clxscore=1011
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012220165
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=mike.kravetz@oracle.com; helo=aserp2130.oracle.com
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

On 12/22/20 11:59 AM, Alexander Duyck wrote:
> On Mon, Dec 21, 2020 at 11:47 PM Liang Li <liliang.opensource@gmail.com> wrote:
>> +
>> +       if (huge_page_order(h) > MAX_ORDER)
>> +               budget = HUGEPAGE_REPORTING_CAPACITY;
>> +       else
>> +               budget = HUGEPAGE_REPORTING_CAPACITY * 32;
> 
> Wouldn't huge_page_order always be more than MAX_ORDER? Seems like we
> don't even really need budget since this should probably be pulling
> out no more than one hugepage at a time.

On standard x86_64 configs, 2MB huge pages are of order 9 < MAX_ORDER (11).
What is important for hugetlb is the largest order that can be allocated
from buddy.  Anything bigger is considered a gigantic page and has to be
allocated differently.

If the code above is trying to distinguish between huge and gigantic pages,
it is off by 1.  The largest order that can be allocated from the buddy is
(MAX_ORDER - 1).  So, the check should be '>='.

-- 
Mike Kravetz

