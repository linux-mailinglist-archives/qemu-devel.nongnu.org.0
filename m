Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B34765FEEF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 11:27:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDjwT-0005VT-D1; Fri, 06 Jan 2023 05:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pDjwR-0005TF-G1
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:27:15 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>) id 1pDjwP-000290-RH
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 05:27:15 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7348920B8762;
 Fri,  6 Jan 2023 02:27:11 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7348920B8762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673000832;
 bh=K2iD4WyUcmg+EVrGv8V9OAjrXapji94nlKYHV9+z+Jk=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=jPgBNMsHlwCLKpf2LuZ5Pw0AuBunZyDGeRAS6NmjcQNs0XbgFcUFu0BEyF49+W+nB
 epCWgNNw37QGSuZAZ7k5gECCfkEeKLJytuNFCH6xit+4/CGU7zlJiBv3QJPXq21u07
 eb/zJS9JrLvvH7acMsSdLQhokuLY/k4EIyh4TNMU=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Subject: Re: [PATCH] semihosting: add O_BINARY flag in host_open for NT
 compatibility
To: Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20230105211940.14988-1-eiakovlev@linux.microsoft.com>
 <408a6546-025b-1a94-ee98-a577b8460e13@linaro.org>
 <CAEUhbmVkDVz_DLrzAFzGT75aBf6_t3LSAfTfogkLpLQLQ-+ZHg@mail.gmail.com>
Message-ID: <d69aa6a8-59fd-5332-3903-c81cb25dc627@linux.microsoft.com>
Date: Fri, 6 Jan 2023 11:27:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmVkDVz_DLrzAFzGT75aBf6_t3LSAfTfogkLpLQLQ-+ZHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -226
X-Spam_score: -22.7
X-Spam_bar: ----------------------
X-Spam_report: (-22.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-2.939, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 1/6/2023 10:48, Bin Meng wrote:
> On Fri, Jan 6, 2023 at 3:39 PM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>> On 5/1/23 22:19, Evgeny Iakovlev wrote:
>>> Windows open(2) implementations opens files in text mode by default and
>>> needs a Windows-only O_BINARY flag to open files as binary. Qemu already
>> s/Qemu/QEMU/
>>
>>> knows about that flag in osdep.h, so we can just add it to the
>>> host_flags for better compatibility when running qemu on Windows.
>> s/qemu/QEMU/
>>
>>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>>> ---
>>>    semihosting/syscalls.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
>>> index 508a0ad88c..00f77507e5 100644
>>> --- a/semihosting/syscalls.c
>>> +++ b/semihosting/syscalls.c
>>> @@ -278,6 +278,8 @@ static void host_open(CPUState *cs, gdb_syscall_complete_cb complete,
>>>            host_flags |= O_EXCL;
>>>        }
>>>
>>> +    host_flags |= O_BINARY;
>>> +
>>>        ret = open(p, host_flags, mode);
>>>        if (ret < 0) {
>>>            complete(cs, -1, errno);
>> Alternatively with more churn:
>>
>> -- >8 --
>> diff --git a/semihosting/syscalls.c b/semihosting/syscalls.c
>> index 508a0ad88c..b621d78c2d 100644
>> --- a/semihosting/syscalls.c
>> +++ b/semihosting/syscalls.c
>> @@ -253,7 +253,7 @@ static void host_open(CPUState *cs,
>> gdb_syscall_complete_cb complete,
>>    {
>>        CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
>>        char *p;
>> -    int ret, host_flags;
>> +    int ret, host_flags = O_BINARY;
>>
>>        ret = validate_lock_user_string(&p, cs, fname, fname_len);
>>        if (ret < 0) {
>> @@ -262,11 +262,11 @@ static void host_open(CPUState *cs,
>> gdb_syscall_complete_cb complete,
>>        }
>>
>>        if (gdb_flags & GDB_O_WRONLY) {
>> -        host_flags = O_WRONLY;
>> +        host_flags |= O_WRONLY;
>>        } else if (gdb_flags & GDB_O_RDWR) {
>> -        host_flags = O_RDWR;
>> +        host_flags |= O_RDWR;
>>        } else {
>> -        host_flags = O_RDONLY;
>> +        host_flags |= O_RDONLY;
>>        }
>>        if (gdb_flags & GDB_O_CREAT) {
>>            host_flags |= O_CREAT;
>> ---
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
> With Philippe's comments addressed,
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Done, sent out a v2, thanks!



