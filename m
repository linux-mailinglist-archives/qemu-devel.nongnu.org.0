Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5502D2E0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 02:37:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVmaT-00007T-C6
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 20:37:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVmZ8-0007j2-OO
	for qemu-devel@nongnu.org; Tue, 28 May 2019 20:35:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hVmZ7-0000t8-0u
	for qemu-devel@nongnu.org; Tue, 28 May 2019 20:35:38 -0400
Received: from mga05.intel.com ([192.55.52.43]:40561)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hVmZ4-0000jW-VL
	for qemu-devel@nongnu.org; Tue, 28 May 2019 20:35:35 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 May 2019 17:35:21 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga006.jf.intel.com with ESMTP; 28 May 2019 17:35:20 -0700
Date: Wed, 29 May 2019 08:34:51 +0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: Juan Quintela <quintela@redhat.com>
Message-ID: <20190529003450.GC24428@richard>
References: <20190528014703.21030-1-richardw.yang@linux.intel.com>
	<20190528014703.21030-3-richardw.yang@linux.intel.com>
	<87imtv80aw.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87imtv80aw.fsf@trasno.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: Re: [Qemu-devel] [PATCH 2/4] migration/ram.c: use same type in
 MultiFDPages_t to define offsest
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Wei Yang <richardw.yang@linux.intel.com>
Cc: Wei Yang <richardw.yang@linux.intel.com>, dgilbert@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 28, 2019 at 10:12:39AM +0200, Juan Quintela wrote:
>Wei Yang <richardw.yang@linux.intel.com> wrote:
>> MultiFDPacket_t.offset is allocated to store MultiFDPages_t.offset.
>>
>> It would be better to use the same type.
>>
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  migration/ram.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 4c60869226..dcf4c54eb5 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -607,7 +607,7 @@ typedef struct {
>>      uint64_t packet_num;
>>      uint64_t unused[4];    /* Reserved for future use */
>>      char ramblock[256];
>> -    uint64_t offset[];
>> +    ram_addr_t offset[];
>>  } __attribute__((packed)) MultiFDPacket_t;
>>  
>>  typedef struct {
>
>This needs a comment, but it is on purpose.  We want that the value on
>the wire to be the same for any architecture.  (Migration stream is
>supposed to be architecture independent).  ram_addr_t is architecture
>dependent.
>

Sounds reasonable.

>Later, Juan.

-- 
Wei Yang
Help you, Help me

