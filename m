Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A59E4E540D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 15:10:54 +0100 (CET)
Received: from localhost ([::1]:48316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1hN-0003vL-Av
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 10:10:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX1eV-0000pE-3A
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:07:55 -0400
Received: from smtp53.i.mail.ru ([94.100.177.113]:57026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX1eS-0002uf-Ey
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 10:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=3XJhJZeIbwBHb51dzvSRc+CVP+rJePASJ7jJiMGnNoU=; 
 t=1648044472;x=1648649872; 
 b=jslW8qB1Qn9jfyC0APp5vAOS8owl9SxPO3dv+UnnUQGMajL+brnol39jbr73S4qaleaFgSxjVPFaTglvar9vJFuwW5BGDh0hVH3PgQflY3PPa3UgRIqs44lB/kubo/j7NkIVKuvojjvFF/BhCDMzt80QrOerrM87J27Cb1yWcwQdaMTHZU0D7v0tFLbOxYK4ZjzeFHev8rbvzeQ7J0fqY/XifD0+hGUNfTnP+NVGUAeOdSYaNjVWnV023kPHiZkTODPjw+MKNl4paD1RXGRgIX56pjJ5l/ruRQbU4hvS9Z8zvkxRjI1ZVL0KcSnBgwiTeP+ezXxGRO+cE1dk3yI1yQ==;
Received: by smtp53.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nX1eP-0004on-HV; Wed, 23 Mar 2022 17:07:50 +0300
Message-ID: <fc33d11e-b8f7-5e26-9448-fa6adea5b6a8@mail.ru>
Date: Wed, 23 Mar 2022 17:07:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 3/8] migration: Add vmstate part of migration stream
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, Nikita Lapshin <nikita.lapshin@virtuozzo.com>
References: <20220323105400.17649-1-nikita.lapshin@openvz.org>
 <20220323105400.17649-4-nikita.lapshin@openvz.org>
 <b59272e8-08e6-4de0-c7f7-f153f1d014c7@mail.ru>
 <8efe3ff4-0977-9b51-61df-b95246d3b264@mail.ru>
 <f03bf2db-a424-17e2-38f1-1608c004c0e4@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <f03bf2db-a424-17e2-38f1-1608c004c0e4@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp53.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196DC3ADA2256CB2C78C5981BBAFE660DCA7182A05F538085040F96BCE8976607BBB0E0817D20F1FF015D350E6287F24C81CE91489FC1C15928A
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75037DDE13FB75316EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637A521848D7B067A388638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E692E6123D67CF2614872D92BD02728A6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE75876D10C9F9311ED9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FC26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BE2CCD8F0CAA010FB389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637AC4D89093EE69848D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE71DEE4644EFFABC17EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3391879879441D74F35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5C1DB28A2BC1EA624C3124AD81504530093D315419F4F5627D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34AF12ADB97C97CD894FAAB51445A5E5137A85FCA4EA2FC38CF340DDC38EF5D9396AB8927CD8486AD11D7E09C32AA3244C4783DDE7A26F2FB169D21CF887AB2B46F2F5F14F68F1805B927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmDOBC2z001Cew==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15B5571FCF598DE6D21CDABD5EC791390BF971DEFEF195D0D2E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.113;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp53.i.mail.ru
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL=1.31,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

23.03.2022 16:21, Nikita Lapshin wrote:
> 
> On 3/23/22 15:49, Vladimir Sementsov-Ogievskiy wrote:
> 
>> 23.03.2022 15:40, Vladimir Sementsov-Ogievskiy wrote:
>>> 23.03.2022 13:53, Nikita Lapshin wrote:
>>>> From: Nikita Lapshin<nikita.lapshin@virtuozzo.com>
>>>> Now we can disable and enable vmstate part by stream_content parameter.
>>>> Signed-off-by: Nikita Lapshin<nikita.lapshin@openvz.org>
>>>> ---
>>>>    migration/migration.c | 10 ++++++++--
>>>>    migration/savevm.c    | 13 +++++++++++++
>>>>    2 files changed, 21 insertions(+), 2 deletions(-)
>>>> diff --git a/migration/migration.c b/migration/migration.c
>>>> index 4adcc87d1d..bbf9b6aad1 100644
>>>> --- a/migration/migration.c
>>>> +++ b/migration/migration.c
>>>> @@ -1334,9 +1334,15 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
>>>>        }
>>>>    }
>>>> -static bool check_stream_parts(strList *stream_content_list)
>>>> +static bool check_stream_parts(strList *stream_list)
>>>>    {
>>>> -    /* To be implemented in ext commits */
>>>> +    for (; stream_list; stream_list = stream_list->next) {
>>>> +        if (!strcmp(stream_list->value, "vmstate")) {
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        return false;
>>>> +    }
>>>>        return true;
>>>>    }
>>> When you move to enum for list elements in QAPI, this thing would be checked automatically, you will not have to check it by hand.
>>>> diff --git a/migration/savevm.c b/migration/savevm.c
>>>> index c68f187ef7..8f35c0c81e 100644
>>>> --- a/migration/savevm.c
>>>> +++ b/migration/savevm.c
>>>> @@ -949,6 +949,19 @@ static bool should_skip(SaveStateEntry *se)
>>>>            return true;
>>>>        }
>>>> +    /*
>>>> +     * Assume that any SaveStateEntry with non-null vmsd is
>>>> +     * part of vmstate.
>>>> +     * Vmstate is included by default so firstly check if
>>>> +     * stream-content-list is enabled.
>>>> +     */
>>>> +
>>>> +    if (se->vmsd &&
>>>> +        migrate_get_current()->parameters.has_stream_content_list &&
>>>> +        !migrate_find_stream_content("vmstate")) {
>>> And in migrate_find_stream_content you do
>>>       if (!s->parameters.has_stream_content_list) {
>>>           return false;
>>>       }
>>> Seems better to do
>>>       if (!s->parameters.has_stream_content_list) {
>>>           return true;
>>>       }
>>> in migrate_find_stream_content(), and rename it to something like should_migrate_content() or just migrate_content().
>>> Then here you don't need to check .has_stream_content_list.
>> Hmm, but that will work bad with dirty-bitmaps, as they are disabled by default.
>> So, this actually means that we have different default for different contents:
>> ram and and other device states are enabled by default, dirty-bitmaps are disabled by defaults. We can honestly realize these defaults in migrate_content().
> 
> Yes, I agree that this logic looks quite strange. May be explicit checks can help.


I think, checking for deprecated capabilites should be in same function migrate_content() too.

> 
>>>> +        return true;
>>>> +    }
>>>> +
>>>>        return false;
>>>>    }
>>


-- 
Best regards,
Vladimir

