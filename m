Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16945786B1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 09:51:43 +0200 (CEST)
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs0Ra-00005v-1u
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 03:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40262)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hs0Qs-0007e3-F9
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 03:50:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1hs0Qr-0008Jq-Hp
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 03:50:58 -0400
Received: from mga03.intel.com ([134.134.136.65]:23472)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1hs0Qr-0008Ho-8m
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 03:50:57 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jul 2019 00:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,321,1559545200"; d="scan'208";a="346516903"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by orsmga005.jf.intel.com with ESMTP; 29 Jul 2019 00:50:14 -0700
Date: Mon, 29 Jul 2019 15:49:52 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190729074951.GA2255@richard>
References: <20190728131304.1282-1-richardw.yang@linux.intel.com>
 <20190728131304.1282-3-richardw.yang@linux.intel.com>
 <20190729090401.524ff8cd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190729090401.524ff8cd@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
Subject: Re: [Qemu-devel] [PATCH 2/3] memory-device: break the loop if no
 hint is provided
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
Cc: mst@redhat.com, david@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 29, 2019 at 09:04:01AM +0200, Igor Mammedov wrote:
>On Sun, 28 Jul 2019 21:13:03 +0800
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>
>> When there is no hint, the first un-overlapped range is the proper one.
>> Just break the loop instead of iterate the whole list.
>could it change default pc-dimm mapping (will address assignment stay
>the same as before this change)?

Yes, it stays the same as before.

>
>In commit message I'd suggest to replace 'the proper one' with more
>verbose explanation why it is safe to break earlier.
>

ok, let me re-phrase it. Thanks

>otherwise patch look good to me
>
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  hw/mem/memory-device.c | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
>> index df3261b32a..413b514586 100644
>> --- a/hw/mem/memory-device.c
>> +++ b/hw/mem/memory-device.c
>> @@ -180,6 +180,8 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
>>                  range_make_empty(&new);
>>                  break;
>>              }
>> +        } else if (!hint) {
>> +            break;
>>          }
>>      }
>>  

-- 
Wei Yang
Help you, Help me

