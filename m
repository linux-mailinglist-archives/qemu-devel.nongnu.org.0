Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8E26F792A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 00:32:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puhTR-0007qo-MV; Thu, 04 May 2023 18:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puhTL-0007ps-0I
 for qemu-devel@nongnu.org; Thu, 04 May 2023 18:30:47 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1puhTH-0002W9-WA
 for qemu-devel@nongnu.org; Thu, 04 May 2023 18:30:46 -0400
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c00:2582:0:640:9a17:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 506C260048;
 Fri,  5 May 2023 01:30:35 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b43e::1:b] (unknown
 [2a02:6b8:b081:b43e::1:b])
 by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id YUYo4k0MkiE0-pO0hKabW; Fri, 05 May 2023 01:30:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1683239434; bh=echa88ZIhbu8ot6QKMCiDjD3F9LAZ450hbPMp3s+Jus=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=Hc7lCiTP6EYRlAQvazkS4D/RgmrRpIJwe1J3/DcGklq831DLQgTvZ9jwCoMJcwXs7
 UONnXzqHHM58C8hEZAa9pOWaBHxpf+TpQHca26JOm0TDsQSMaP0hWCby3Gzj520CKp
 +gVibOtpzFnSfCq79lse0foxe1ZFFsoCAK16DldY=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <35dd6e24-543f-e36e-5130-4f1a92be6a40@yandex-team.ru>
Date: Fri, 5 May 2023 01:30:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 10/10] migration: block incoming colo when capability
 is disabled
Content-Language: en-US
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, chen.zhang@intel.com,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>
References: <20230428194928.1426370-1-vsementsov@yandex-team.ru>
 <20230428194928.1426370-11-vsementsov@yandex-team.ru>
 <20230504221054.616e4fe6@gecko.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230504221054.616e4fe6@gecko.fritz.box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 05.05.23 01:10, Lukas Straub wrote:
> On Fri, 28 Apr 2023 22:49:28 +0300
> Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> 
>> We generally require same set of capabilities on source and target.
>> Let's require x-colo capability to use COLO on target.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> 
> Good patch, this is needed anyway for COLO with multifd.
> 
> Also, it allows to remove a some code, like
> migration_incoming_enable_colo(), qemu_savevm_send_colo_enable() etc.
> I will send patches for that.

Great! But with such changes we should be careful to not break compatibility between versions.. On the other hand, x-colo - is still experimental with that x-, so there is no guarantee how it works.

> Or you can do it if you like.

To be honest, I don't :)

> 
> Please update the docs like below, then:
> Reviewed-by: Lukas Straub <lukasstraub2@web.de>
> 
> diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
> index 8ec653f81c..2e760a4aee 100644
> --- a/docs/COLO-FT.txt
> +++ b/docs/COLO-FT.txt
> @@ -210,6 +210,7 @@ children.0=childs0 \
>   
>   3. On Secondary VM's QEMU monitor, issue command
>   {"execute":"qmp_capabilities"}
> +{"execute": "migrate-set-capabilities", "arguments": {"capabilities": [ {"capability": "x-colo", "state": true } ] } }
>   {"execute": "nbd-server-start", "arguments": {"addr": {"type": "inet", "data": {"host": "0.0.0.0", "port": "9999"} } } }
>   {"execute": "nbd-server-add", "arguments": {"device": "parent0", "writable": true } }
> 

I'll resend with this addition, thanks for reviewing!

> 
>> ---
>>   migration/migration.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 8c5bbf3e94..5e162c0622 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -395,6 +395,12 @@ int migration_incoming_enable_colo(void)
>>       return -ENOTSUP;
>>   #endif
>>   
>> +    if (!migrate_colo()) {
>> +        error_report("ENABLE_COLO command come in migration stream, but c-colo "
>> +                     "capability is not set");
>> +        return -EINVAL;
>> +    }
>> +
>>       if (ram_block_discard_disable(true)) {
>>           error_report("COLO: cannot disable RAM discard");
>>           return -EBUSY;
> 
> 
> 

-- 
Best regards,
Vladimir


