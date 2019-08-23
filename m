Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2DB9A4B9
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 03:09:28 +0200 (CEST)
Received: from localhost ([::1]:50776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0y51-0007PK-Hk
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 21:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47050)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1i0y3t-00070b-1X
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 21:08:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1i0y3s-0000UL-1Z
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 21:08:16 -0400
Received: from mga01.intel.com ([192.55.52.88]:38086)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1i0y3r-0000TJ-PT
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 21:08:15 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 18:08:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,419,1559545200"; d="scan'208";a="208377298"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2019 18:08:12 -0700
Date: Fri, 23 Aug 2019 09:07:50 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190823010750.GA21179@richard>
References: <20190321082555.21118-1-richardw.yang@linux.intel.com>
 <20190321082555.21118-3-richardw.yang@linux.intel.com>
 <d5fb9e01-acb9-06ab-edf9-57e2b80bd880@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5fb9e01-acb9-06ab-edf9-57e2b80bd880@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-devel] [PATCH 2/6] exec.c: remove an unnecessary assert
 on PHYS_MAP_NODE_NIL in phys_map_node_alloc()
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
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: rth@twiddle.net, mst@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 22, 2019 at 12:24:32PM +0200, Paolo Bonzini wrote:
>On 21/03/19 09:25, Wei Yang wrote:
>> PHYS_MAP_NODE_NIL is assigned to PhysPageEntry.ptr in case this is not a
>> leaf entry, while map->nodes_nb range in [0, nodes_nb_alloc).
>> 
>> Seems we are asserting on two different things, just remove it.
>
>The assertion checks that this "if" is not entered incorrectly:
>
>    if (lp->skip && lp->ptr == PHYS_MAP_NODE_NIL) {
>        lp->ptr = phys_map_node_alloc(map, level == 0);
>    }
>

Hmm... I may not get your point.

phys_map_node_alloc() will get an available PhysPageEntry and return its
index, which will be assigned to its parent's ptr.

The "if" checks on the parent's ptr, while the assertion asserts the index for
the new child. I may miss something?

>Paolo
>
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  exec.c | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/exec.c b/exec.c
>> index 98ebd0dd1d..8e8b6bb1f9 100644
>> --- a/exec.c
>> +++ b/exec.c
>> @@ -242,7 +242,6 @@ static uint32_t phys_map_node_alloc(PhysPageMap *map, bool leaf)
>>  
>>      ret = map->nodes_nb++;
>>      p = map->nodes[ret];
>> -    assert(ret != PHYS_MAP_NODE_NIL);
>>      assert(ret != map->nodes_nb_alloc);
>>  
>>      e.skip = leaf ? 0 : 1;
>> 

-- 
Wei Yang
Help you, Help me

