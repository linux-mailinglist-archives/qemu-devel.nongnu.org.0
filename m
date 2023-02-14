Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD03695FBF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 10:50:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRrwB-0005dv-IM; Tue, 14 Feb 2023 04:49:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRrw9-0005dm-8d
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:49:21 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRrw6-0007mQ-Ud
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:49:21 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id E53B26257D;
 Tue, 14 Feb 2023 12:49:10 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b433::1:3c] (unknown
 [2a02:6b8:b081:b433::1:3c])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 9nfoi10QcCg1-FFXEUeTj; Tue, 14 Feb 2023 12:49:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676368150; bh=YXhp8mKCNdNDwFHPsYU8n+mutCiDa/zHur2Da2A21x4=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=E0+rE4Slv8ANVGr0VZheQZKML5/zdwwlNEZTdQecxZ0jYq2L8xds0xY0xF/Cj1eKq
 qPTADOTW4Vs+6JDMEiYBCpuoqEC8WbGvlU22RNNLmV9F6QD2zqlfxi4FJR7Y1t3Slj
 SEEU1qUaiAceoU/zjlEtWnyh3DEdSikc+DWwkCNs=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <9e01e6e6-4e73-fe98-f07c-e1ebcaaaa97a@yandex-team.ru>
Date: Tue, 14 Feb 2023 12:49:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 01/16] pci/shpc: set attention led to OFF on reset
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-2-vsementsov@yandex-team.ru>
 <4bc420b3-ce51-12c5-5373-ac5031105709@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <4bc420b3-ce51-12c5-5373-ac5031105709@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 13.02.23 17:16, Philippe Mathieu-Daudé wrote:
> On 13/2/23 15:00, Vladimir Sementsov-Ogievskiy wrote:
>> 0 is not a valid state for the led. Let's start with OFF.
> 
> "0 is not valid" so we should abort(value != 0) in shpc_set_status(),
> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   hw/pci/shpc.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
>> index fca7f6691a..1b3f619dc9 100644
>> --- a/hw/pci/shpc.c
>> +++ b/hw/pci/shpc.c
>> @@ -223,6 +223,7 @@ void shpc_reset(PCIDevice *d)
>>                               SHPC_SLOT_STATUS_PRSNT_MASK);
>>               shpc_set_status(shpc, i, SHPC_LED_OFF, SHPC_SLOT_PWR_LED_MASK);
>>           }
>> +        shpc_set_status(shpc, i, SHPC_LED_OFF, SHPC_SLOT_ATTN_LED_MASK);
>>           shpc_set_status(shpc, i, 0, SHPC_SLOT_STATUS_66);
> 
> ... however value=0 is used:
> 
> hw/pci/shpc.c:215:            shpc_set_status(shpc, i, 0, SHPC_SLOT_STATUS_MRL_OPEN);
> hw/pci/shpc.c:226:        shpc_set_status(shpc, i, 0, SHPC_SLOT_STATUS_66);
> hw/pci/shpc.c:522:        shpc_set_status(shpc, slot, 0, SHPC_SLOT_STATUS_MRL_OPEN);
> hw/pci/shpc.c:531:        shpc_set_status(shpc, slot, 0, SHPC_SLOT_STATUS_MRL_OPEN);
> hw/pci/shpc.c:543:    shpc_set_status(shpc, slot, 0, SHPC_SLOT_STATUS_66);
> hw/pci/shpc.c:589:    shpc_set_status(shpc, slot, 0, SHPC_SLOT_STATUS_66);
> 
> Is this fixable?

0 is not valid only for _STATE and _LED_ masks. It's OK for other fields

-- 
Best regards,
Vladimir


