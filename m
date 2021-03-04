Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1673532D1D6
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:33:50 +0100 (CET)
Received: from localhost ([::1]:57234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHmEm-0006eM-Jo
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:33:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lHmCb-0005TZ-EI; Thu, 04 Mar 2021 06:31:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:35878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lHmCZ-0001vX-Rm; Thu, 04 Mar 2021 06:31:33 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7961BAD57;
 Thu,  4 Mar 2021 11:31:29 +0000 (UTC)
Subject: Re: [PATCH 8/9] hw/arm/virt: Restrict 32-bit CPUs to TCG
To: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-9-f4bug@amsat.org>
 <20210205151900.7rqsv6evey6erfqh@kamzik.brq.redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <8a67dc3c-7b14-b0a4-9514-95d017b6aa32@suse.de>
Date: Thu, 4 Mar 2021 12:31:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210205151900.7rqsv6evey6erfqh@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

what do you think of the following patch? We messaged yesterday about cortex-a15 being the default cpu for virt,

this patch would need also changing the default CPU for virt under KVM I would think.

Or, we could change the virt default cpu to "max"?

Thanks,

Claudio


On 2/5/21 4:19 PM, Andrew Jones wrote:
> On Fri, Feb 05, 2021 at 03:43:44PM +0100, Philippe Mathieu-Daudé wrote:
>> Support for ARMv7 has been dropped in commit 82bf7ae84ce
>> ("target/arm: Remove KVM support for 32-bit Arm hosts").
>> Restrict the 32-bit CPUs to --enable-tcg builds.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/arm/virt.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index f5e4a6ec914..ab6300650f9 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -197,8 +197,10 @@ static const int a15irqmap[] = {
>>  };
>>  
>>  static const char *valid_cpus[] = {
>> +#ifdef CONFIG_TCG
>>      ARM_CPU_TYPE_NAME("cortex-a7"),
>>      ARM_CPU_TYPE_NAME("cortex-a15"),
>> +#endif /* CONFIG_TCG */
>>  #ifdef TARGET_AARCH64
>>      ARM_CPU_TYPE_NAME("cortex-a53"),
>>      ARM_CPU_TYPE_NAME("cortex-a57"),
>> -- 
>> 2.26.2
>>
> 
> So this filters the cpus out of KVM only builds, which seems
> reasonable to do. Of course, if the build is for both KVM and
> TCG, then the cpus won't be filtered out and we'll have to rely
> on the runtime checks to error out if one where to try a 32-bit
> cpu with KVM. But that's fine too, so
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> 
> Thanks,
> drew
> 
> 


