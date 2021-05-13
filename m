Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8922A37FB5C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:19:06 +0200 (CEST)
Received: from localhost ([::1]:37092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhE3F-0002N7-LO
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhE0m-0008Kf-Cm; Thu, 13 May 2021 12:16:32 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:59239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhE0j-0004I5-AG; Thu, 13 May 2021 12:16:32 -0400
Received: from [192.168.100.1] ([82.142.31.78]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mlejs-1lHYAt19pi-00ihB6; Thu, 13 May 2021 18:16:17 +0200
Subject: Re: [PATCH] multi-process: Avoid logical AND of mutually exclusive
 tests
To: Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>, 
 qemu-devel@nongnu.org
References: <1620402803-9237-1-git-send-email-jag.raman@oracle.com>
 <5798d062-ee75-1a71-4ba7-3801ed61beb6@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <cb034443-de79-3f9d-96ba-6fffb6f877e9@vivier.eu>
Date: Thu, 13 May 2021 18:16:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5798d062-ee75-1a71-4ba7-3801ed61beb6@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2eKgv+YsYsyz8BaxjL8HUl1DnGfntFj83+BnPFYrDuezHGEjpsO
 6vKw8NZqkLw8x7B3OxIA1Lsn2RD2vcLbHpPVxGeoL3kCsAGluxXrJIcoORr8/aNYqqPnZLA
 tHKJOnmmM9NnLAbeSGMa8nyy2YHGF6QvM66daFdJVuezA1ZyHUEIBQMlGK5uG4Q9miSBI4e
 prYI0jduN+igSoFbUO1kg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9RK7vRCUogw=:VHGvmm1x3bjNHC0lw+SyvK
 pXymlSWpT3RzkTAEpXfhGjgLVlsY5EWN3bgDMxtvrgqt2jfA6O5M4JKOfq9c1O+t8kJKR7+Zu
 EFgksicSeHKL6Zw4Tiz+dbBENqmVgPa1i6/XQAbMBllRRHfCTkO53h7STSVwgvaXilqXm4BdA
 6ZVryIt6XVz3BfvAb7pjbY+KOJ6bBSWgGRB43z8C8aINE1Zbq09qZ9qWZSDGXwjG1NHS1p6sU
 8JCANj2LCmjUOm0fnMEUa5yw/+Z3J0DGVuvo3WY981dSIorWpc5Wa5JupfTjoBPkPesQ1rEsY
 jxWv7oIcOXTUAcYvUU8LTH+UqFKhEnhRi8KVU1zIN1NKbONfJ7Qt5HlPsAedP8xl9rkaJGcpQ
 m83oIroVDEaSwK6bb/2QEV80sD9h8J6la8F8M/uuJpbrwcAc72o0UlVVenb7jxgGBV3tEeixL
 ukYbtW05vIyNpuDdhuTEf4NpD5mJ/XcacCyj682CNAtDlaO1yaE3R+4GpephZd/PSlTcKVYzy
 atRYEhWd+DD+AFtWoN7nhU=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 QEMU Trivial <qemu-trivial@nongnu.org>, berrange@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 08/05/2021 à 06:34, Thomas Huth a écrit :
> On 07/05/2021 17.53, Jagannathan Raman wrote:
>> Fixes an if statement that performs a logical AND of mutually exclusive
>> tests
>>
>> Reported-by: Thomas Huth <thuth@redhat.com>
> 
> I just spotted the bug ticket on Launchpad :-) So whoever picks this patch up, please add this instead:
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1926995
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Applied to my trivial-patches branch.

Thanks,
Laurent

>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> ---
>>   hw/remote/mpqemu-link.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
>> index 9ce3152..e67a5de 100644
>> --- a/hw/remote/mpqemu-link.c
>> +++ b/hw/remote/mpqemu-link.c
>> @@ -218,7 +218,7 @@ uint64_t mpqemu_msg_send_and_await_reply(MPQemuMsg *msg, PCIProxyDev *pdev,
>>     bool mpqemu_msg_valid(MPQemuMsg *msg)
>>   {
>> -    if (msg->cmd >= MPQEMU_CMD_MAX && msg->cmd < 0) {
>> +    if (msg->cmd >= MPQEMU_CMD_MAX || msg->cmd < 0) {
>>           return false;
>>       }
> 
> 


