Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B22AF40E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 03:37:21 +0200 (CEST)
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7rZQ-0000Ny-6d
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 21:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52949)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7rYG-0007r6-EH
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 21:36:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7rYF-0005xq-3U
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 21:36:08 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:7736)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7rYE-0005oq-HS
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 21:36:07 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.9]) by
 rmmx-syy-dmz-app11-12011 (RichMail) with SMTP id 2eeb5d784f67de1-e75f6;
 Wed, 11 Sep 2019 09:35:35 +0800 (CST)
X-RM-TRANSID: 2eeb5d784f67de1-e75f6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.146.44] (unknown[112.25.154.148])
 by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee55d784f5673e-ad7c2;
 Wed, 11 Sep 2019 09:35:35 +0800 (CST)
X-RM-TRANSID: 2ee55d784f5673e-ad7c2
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190910120927.1669283-1-maozhongyi@cmss.chinamobile.com>
 <20190910120927.1669283-2-maozhongyi@cmss.chinamobile.com>
 <87d0g80yrp.fsf@linaro.org>
From: maozy <maozhongyi@cmss.chinamobile.com>
Message-ID: <eaa69623-5ba1-76e7-1953-f64eda0f1242@cmss.chinamobile.com>
Date: Wed, 11 Sep 2019 09:35:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <87d0g80yrp.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.81
Subject: Re: [Qemu-devel] [PATCH 1/3] tests/migration: mem leak fix
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
Cc: tony.nguyen@bt.com, armbru@redhat.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 9/11/19 2:52 AM, Alex Bennée wrote:
> Mao Zhongyi <maozhongyi@cmss.chinamobile.com> writes:
>
>> Cc: armbru@redhat.com
>> Cc: laurent@vivier.eu
>> Cc: tony.nguyen@bt.com
>>
>> Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
>> ---
>>   tests/migration/stress.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/tests/migration/stress.c b/tests/migration/stress.c
>> index d9aa4afe92..e6c9a6b243 100644
>> --- a/tests/migration/stress.c
>> +++ b/tests/migration/stress.c
>> @@ -181,6 +181,8 @@ static int stressone(unsigned long long ramsizeMB)
>>       if (!ram) {
>>           fprintf(stderr, "%s (%05d): ERROR: cannot allocate %llu MB of RAM: %s\n",
>>                   argv0, gettid(), ramsizeMB, strerror(errno));
>> +        if (data)
>> +            free(data);
> I wonder if it's worth using the glib macros here so:
>
>    g_autofree char *data = g_malloc(PAGE_SIZE);
>
> and the same for ram. You can then drop the frees.
>
I thins it's ok, which is also recommended in CODING_STYLE.rst.

Thx
     Mao
>>           return -1;
>>       }
>>       if (!data) {
>
> --
> Alex Bennée
>



