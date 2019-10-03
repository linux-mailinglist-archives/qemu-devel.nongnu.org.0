Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16918C97FF
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Oct 2019 07:36:10 +0200 (CEST)
Received: from localhost ([::1]:33068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFtma-0004ik-Sp
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 01:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iFtlT-00048Q-FB
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 01:35:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iFtlR-0007iY-Io
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 01:34:59 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:2081)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1iFtlQ-0007dy-Vt
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 01:34:57 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35d95886c0dc-a7e68;
 Thu, 03 Oct 2019 13:34:37 +0800 (CST)
X-RM-TRANSID: 2ee35d95886c0dc-a7e68
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [192.168.5.184] (unknown[180.107.17.228])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee25d95886b4aa-72669;
 Thu, 03 Oct 2019 13:34:36 +0800 (CST)
X-RM-TRANSID: 2ee25d95886b4aa-72669
Subject: Re: [PATCH v2 1/3] tests/migration: mem leak fix
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
 <9b8662b94d89030b1f33193246c645baac2eedd7.1568170994.git.maozhongyi@cmss.chinamobile.com>
 <2731f5b5-f43d-cf97-0a1a-30f3cbd21ae0@vivier.eu>
From: maozy <maozhongyi@cmss.chinamobile.com>
Message-ID: <b9857d90-554b-5aaa-0930-529a52fa11ec@cmss.chinamobile.com>
Date: Thu, 3 Oct 2019 13:34:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <2731f5b5-f43d-cf97-0a1a-30f3cbd21ae0@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 221.176.66.79
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
Cc: tony.nguyen@bt.com, alex.bennee@linaro.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 10/1/19 11:31 PM, Laurent Vivier wrote:
> Le 11/09/2019 à 05:31, Mao Zhongyi a écrit :
>> ‘data’ has the possibility of memory leaks， so use the
>> glic macros g_autofree recommended by CODING_STYLE.rst
>> to automatically release the memory that returned from
>> g_malloc().
>>
>> Cc: armbru@redhat.com
>> Cc: laurent@vivier.eu
>> Cc: tony.nguyen@bt.com
>> Cc: alex.bennee@linaro.org
>>
>> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
>> ---
>>   tests/migration/stress.c | 10 ++--------
>>   1 file changed, 2 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/migration/stress.c b/tests/migration/stress.c
>> index d9aa4afe92..6cbb2d49d3 100644
>> --- a/tests/migration/stress.c
>> +++ b/tests/migration/stress.c
>> @@ -170,10 +170,10 @@ static unsigned long long now(void)
>>   static int stressone(unsigned long long ramsizeMB)
>>   {
>>       size_t pagesPerMB = 1024 * 1024 / PAGE_SIZE;
>> -    char *ram = malloc(ramsizeMB * 1024 * 1024);
>> +    g_autofree char *ram = malloc(ramsizeMB * 1024 * 1024);
>>       char *ramptr;
>>       size_t i, j, k;
>> -    char *data = malloc(PAGE_SIZE);
>> +    g_autofree char *data = malloc(PAGE_SIZE);
> So perhaps g_malloc() could be a better choice as it will exit on
> allocation failure?

right,  will fix it in next.

Thanks,
Mao
>
> Thanks,
> Laurent
>
>



