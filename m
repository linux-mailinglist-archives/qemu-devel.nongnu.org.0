Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE574B9C6F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:49:06 +0100 (CET)
Received: from localhost ([::1]:40852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKdPN-0002Y5-4P
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nKdGI-0004Ol-Or
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:39:42 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:58898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lizhang@suse.de>) id 1nKdGG-0004bB-Df
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 04:39:42 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CDD1921997;
 Thu, 17 Feb 2022 09:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645090778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmrqdEX/l5neUWygTj8Wnh6Yt8CcrKIN1iSFFPxyOJk=;
 b=I27Up5k7TEFrBQ6Udxt0iSNHm+yaKPIB6UMxDnTyhTtBmx9w2eZ7bvZM/xB8gktSRCO2zn
 ZQyEysaJcjmq46oMhRLUOjjFJ3f3mQN48KM0JmBoxJ66JmTBqcoGMvfzdOA0R4QEb1/ECE
 drdLyPov+jBjlL9UPezBVLlrH46S1TE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645090778;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmrqdEX/l5neUWygTj8Wnh6Yt8CcrKIN1iSFFPxyOJk=;
 b=wTQRzpdfFYNNtM7vY3L7TQxrxjq39uayBES2hghUuGtgh8OeiS5/vXEeOp92HHFo5eBQzD
 5yGyG3mOYttRc/BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8042813BBF;
 Thu, 17 Feb 2022 09:39:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /0XCHNoXDmL8JwAAMHmgww
 (envelope-from <lizhang@suse.de>); Thu, 17 Feb 2022 09:39:38 +0000
Subject: Re: [PATCH 1/1] numa: check mem or memdev in numa configuration
To: Igor Mammedov <imammedo@redhat.com>
References: <20220216163613.22570-1-lizhang@suse.de>
 <20220217101024.7c723f10@redhat.com>
From: Li Zhang <lizhang@suse.de>
Message-ID: <65f05997-dd2b-c30d-5c95-8e832f21afa0@suse.de>
Date: Thu, 17 Feb 2022 10:38:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220217101024.7c723f10@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=lizhang@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, wangyanan55@huawei.com, f4bug@amsat.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/22 10:10 AM, Igor Mammedov wrote:
> On Wed, 16 Feb 2022 17:36:13 +0100
> Li Zhang <lizhang@suse.de> wrote:
> 
>> If there is no mem or memdev in numa configuration, it always
>> reports the error as the following:
>>
>> total memory for NUMA nodes (0x0) should equal RAM size (0x100000000)
>>
>> This error is confusing and the reason is that total memory of numa nodes
>> is always 0 if there is no mem or memdev in numa configuration.
>> So it's better to check mem or memdev in numa configuration.
>>
>> Signed-off-by: Li Zhang <lizhang@suse.de>
>> ---
>>   hw/core/numa.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/hw/core/numa.c b/hw/core/numa.c
>> index 1aa05dcf42..11cbec51eb 100644
>> --- a/hw/core/numa.c
>> +++ b/hw/core/numa.c
>> @@ -132,6 +132,11 @@ static void parse_numa_node(MachineState *ms, NumaNodeOptions *node,
>>   
>>       have_memdevs = have_memdevs ? : node->has_memdev;
>>       have_mem = have_mem ? : node->has_mem;
>> +    if (!node->has_memdev && !node->has_mem) {
>> +        error_setg(errp, "numa configuration should use mem= or memdev= ");
>> +        return;
>> +    }
> 
> Wouldn't this breaks memory less numa nodes?

Yes, you are right. It will break it if there more numa nodes
than memory, and the numa nodes have no memory backends specified.

Is it allowed for users to specify more numa nodes than memory?

> 
> I'd rather add/rephrase to original error message that memory
> should be specified explicitly for desired numa nodes.
> And I'd not mention 'mem=' since
>    docs/about/removed-features.rst:``-numa node,mem=...`` (removed in 5.1)

Thanks for your suggestions, I will rephrase it.

> 
>> +
>>       if ((node->has_mem && have_memdevs) || (node->has_memdev && have_mem)) {
>>           error_setg(errp, "numa configuration should use either mem= or memdev=,"
>>                      "mixing both is not allowed");
> 


