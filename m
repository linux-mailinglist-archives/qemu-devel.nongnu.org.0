Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2967166471
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 04:29:49 +0200 (CEST)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hllJj-0004g7-PS
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 22:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hllJX-0004HB-EK
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 22:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hllJV-0006jh-T5
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 22:29:35 -0400
Received: from mga03.intel.com ([134.134.136.65]:13144)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hllJV-0006jF-KC
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 22:29:33 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2019 19:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,480,1557212400"; d="scan'208";a="341570683"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga005.jf.intel.com with ESMTP; 11 Jul 2019 19:29:30 -0700
Date: Fri, 12 Jul 2019 10:29:03 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190712022903.GA3684@richard>
References: <20190703011234.20517-1-richardw.yang@linux.intel.com>
 <20190711093427.GE3971@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711093427.GE3971@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] [PATCH] migration/postcopy: fix document of
 postcopy_send_discard_bm_ram()
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
Cc: quintela@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 11, 2019 at 10:34:27AM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> Commit 6b6712efccd3 ('ram: Split dirty bitmap by RAMBlock') changes the
>> parameter of postcopy_send_discard_bm_ram(), while left the document
>> part untouched.
>> 
>> This patch correct the document and fix one typo by hand.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  migration/ram.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>> 
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 246efe6939..410e0f89fe 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -2763,8 +2763,7 @@ void ram_postcopy_migrated_memory_release(MigrationState *ms)
>>   *
>>   * @ms: current migration state
>>   * @pds: state for postcopy
>> - * @start: RAMBlock starting page
>> - * @length: RAMBlock size
>> + * @block: RAMBlock to discard
>>   */
>>  static int postcopy_send_discard_bm_ram(MigrationState *ms,
>>                                          PostcopyDiscardState *pds,
>> @@ -2961,7 +2960,7 @@ static void postcopy_chunk_hostpages_pass(MigrationState *ms, bool unsent_pass,
>>  }
>>  
>>  /**
>> - * postcopy_chuck_hostpages: discrad any partially sent host page
>> + * postcopy_chuck_hostpages: discard any partially sent host page
>
>While we're here we should probably fix the name of the function as
>well!   s/chuck/chunk/
>

Ah, didn't notice this :)

Do you like me to send v2 to fix this?

>Dave
>
>>   *
>>   * Utility for the outgoing postcopy code.
>>   *
>> -- 
>> 2.19.1
>> 
>--
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

-- 
Wei Yang
Help you, Help me

