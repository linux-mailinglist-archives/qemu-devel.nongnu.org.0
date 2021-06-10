Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FC93A21F3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 03:48:41 +0200 (CEST)
Received: from localhost ([::1]:49790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr9oG-00057M-Pc
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 21:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1lr9nK-0004Sr-4R
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 21:47:42 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1lr9nH-0000MP-NG
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 21:47:41 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G0mty5Mg6zWscJ;
 Thu, 10 Jun 2021 09:42:34 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 10 Jun 2021 09:47:27 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 10 Jun 2021 09:47:27 +0800
Subject: Re: [PATCH] vl: Fix an assert failure in error path
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
References: <20210610084741.456260-1-zhenzhong.duan@intel.com>
 <048a18be-0d1c-7fd0-7031-51e64c5432f3@redhat.com>
 <87fsxrnss4.fsf@dusky.pond.sub.org> <YMCw5E2havaaC+UI@redhat.com>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <2a094460-5549-4a64-8df0-c376e046b012@huawei.com>
Date: Thu, 10 Jun 2021 09:47:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <YMCw5E2havaaC+UI@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=liangpeng10@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/2021 8:15 PM, Daniel P. Berrangé wrote:
> On Wed, Jun 09, 2021 at 02:09:47PM +0200, Markus Armbruster wrote:
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>
>>> On 10/06/21 10:47, Zhenzhong Duan wrote:
>>>> Based on the description of error_setg(), the local variable err in
>>>> qemu_maybe_daemonize() should be initialized to NULL.
>>>> Without fix, the uninitialized *errp triggers assert failure which
>>>> doesn't show much valuable information.
>>>> Before the fix:
>>>> qemu-system-x86_64: ../util/error.c:59: error_setv: Assertion `*errp == NULL' failed.
>>>> After fix:
>>>> qemu-system-x86_64: cannot create PID file: Cannot open pid file: Permission denied
>>>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>>>> ---
>>>>   softmmu/vl.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>> diff --git a/softmmu/vl.c b/softmmu/vl.c
>>>> index 326c1e9080..feb4d201f3 100644
>>>> --- a/softmmu/vl.c
>>>> +++ b/softmmu/vl.c
>>>> @@ -2522,7 +2522,7 @@ static void qemu_process_help_options(void)
>>>>     static void qemu_maybe_daemonize(const char *pid_file)
>>>>   {
>>>> -    Error *err;
>>>> +    Error *err = NULL;
>>
>> Common mistake, I'm afraid.
> 
> Initializing isn't likely to be a performance impact, so I'd think
> we should make 'checkpatch.pl' complain about any 'Error *' variable
> that is not initialized to NULL, as a safety net, even if not technically
> required in some cases.
> 
> Regards,
> Daniel
> 

Hi,
Could we add a coccinelle script to check (and fix) these problems?  e.g.:
@ r @
identifier id;
@@
  Error *id
+ = NULL
  ;

Using this script, I found that local variable err in
qemu_init_subsystems is not initialized to NULL too.  The script is not
prefect though, it will initialize all global/static 'Error *' variables
and all local 'Error *' variables in util/error.c to NULL, which is
unnecessary.

Thanks,
Peng

