Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EECFD04F2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 02:57:07 +0200 (CEST)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iI0Hq-0003z1-53
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 20:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39180)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iI0GR-0003Xa-6Y
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 20:55:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iI0GQ-0003xJ-4H
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 20:55:39 -0400
Received: from mga11.intel.com ([192.55.52.93]:26836)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iI0GP-0003vw-Dt
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 20:55:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 17:55:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; d="scan'208";a="368591308"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga005.jf.intel.com with ESMTP; 08 Oct 2019 17:55:29 -0700
Date: Wed, 9 Oct 2019 08:55:12 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/3] migration/postcopy: not necessary to do
 postcopy_ram_incoming_cleanup when state is ADVISE
Message-ID: <20191009005511.GB26203@richard>
References: <20191001100122.17730-1-richardw.yang@linux.intel.com>
 <20191001100122.17730-3-richardw.yang@linux.intel.com>
 <20191008160202.GE3441@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008160202.GE3441@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.93
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 08, 2019 at 05:02:02PM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> postcopy_ram_incoming_cleanup() does cleanup for
>> postcopy_ram_incoming_setup(), while the setup happens only after
>> migration enters LISTEN state.
>> 
>> This means there is nothing to cleanup when migration is still ADVISE
>> state.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  migration/migration.c | 1 -
>>  1 file changed, 1 deletion(-)
>> 
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 5f7e4d15e9..34d5e66f06 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -461,7 +461,6 @@ static void process_incoming_migration_co(void *opaque)
>>               * but managed to complete within the precopy period, we can use
>>               * the normal exit.
>>               */
>> -            postcopy_ram_incoming_cleanup(mis);
>>          } else if (ret >= 0) {
>>              /*
>>               * Postcopy was started, cleanup should happen at the end of the
>
>I think that misses the cleanup of mlock that corresponds to the
>munlockall in postcopy_ram_supported_by_host - that's called very early
>on; I think in the advise stage.
>

Thanks you are right.

BTW, do we need to check enable_mlock when calling munlockall() in
postcopy_ram_supported_by_host() ?

>Dave
>
>> -- 
>> 2.17.1
>> 
>--
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

-- 
Wei Yang
Help you, Help me

