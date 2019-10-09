Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A48D0513
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Oct 2019 03:13:10 +0200 (CEST)
Received: from localhost ([::1]:38424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iI0XO-0004NO-2q
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 21:13:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40345)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iI0WB-0003ap-6R
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:11:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iI0WA-0002xa-3K
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:11:55 -0400
Received: from mga09.intel.com ([134.134.136.24]:31753)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iI0W9-0002x4-QO
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:11:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 18:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,273,1566889200"; d="scan'208";a="277276255"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga001.jf.intel.com with ESMTP; 08 Oct 2019 18:11:51 -0700
Date: Wed, 9 Oct 2019 09:11:34 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/4] migration/ram: only possible bit set in
 invalid_flags is RAM_SAVE_FLAG_COMPRESS_PAGE
Message-ID: <20191009011134.GE26203@richard>
References: <20191005220517.24029-1-richardw.yang@linux.intel.com>
 <20191005220517.24029-2-richardw.yang@linux.intel.com>
 <20191008173825.GI3441@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008173825.GI3441@work-vm>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
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

On Tue, Oct 08, 2019 at 06:38:25PM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> The only possible bit set in invalid_flags is
>> RAM_SAVE_FLAG_COMPRESS_PAGE at the beginning of function
>> ram_load_precopy(), which means it is not necessary to do
>> another check for RAM_SAVE_FLAG_COMPRESS_PAGE bit.
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  migration/ram.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>> 
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 31051935c8..769d3f6454 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -4263,10 +4263,7 @@ static int ram_load_precopy(QEMUFile *f)
>>          addr &= TARGET_PAGE_MASK;
>>  
>>          if (flags & invalid_flags) {
>> -            if (flags & invalid_flags & RAM_SAVE_FLAG_COMPRESS_PAGE) {
>> -                error_report("Received an unexpected compressed page");
>> -            }
>> -
>> +            error_report("Received an unexpected compressed page");
>>              ret = -EINVAL;
>
>I'd rather keep this one; I think Juan's idea is that we might make
>other flags illegal here and then it's easy to add to invalid_flags at
>the top.
>

Reasonable.

>Dave
>>              break;
>>          }
>> -- 
>> 2.17.1
>> 
>--
>Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

-- 
Wei Yang
Help you, Help me

