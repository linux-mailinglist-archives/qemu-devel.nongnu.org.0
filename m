Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8F64E52A3
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 13:57:41 +0100 (CET)
Received: from localhost ([::1]:53634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0YW-0007KA-7p
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 08:57:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX0QT-00067d-N5
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:49:21 -0400
Received: from smtp51.i.mail.ru ([94.100.177.111]:40916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX0QQ-0001Ds-Vy
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=eDhfu2jhtEek7+Dnok9fBXMe+zIO7NyH61x1b40U09M=; 
 t=1648039759;x=1648645159; 
 b=VK1KmL+4iNOMc5lvPfzViFw656zWrsR+vG3iBns7gM+1qa153Rz4t0b2BgiCbHN6Tn6I6OXmhxye0MCeajkT8OeOAF5uYJ6PgD8e1kLWk1qXHhRDBIRFtR94DnhQcM9PmyQdTexrO8YGY57hfAWjFL/g6KkaFjO97kQSCWVcXIdM/xatLFpQyNIamQ5j4YSvZcHorNL5lT2sqKGqRxoUdyZeU84homSb1v4KGmxiGpOM0DIudAZjSKJs2bTOUDWUBJGeZvJjuqB70EOjWnDsewA/PBwZDTJTxg9zrs8cKlU/2s1Nbty989h9o+p+vdbnkqNI77uTlUQQq+CH05fRNw==;
Received: by smtp51.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nX0QM-0003qv-Sy; Wed, 23 Mar 2022 15:49:15 +0300
Message-ID: <8efe3ff4-0977-9b51-61df-b95246d3b264@mail.ru>
Date: Wed, 23 Mar 2022 15:49:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 3/8] migration: Add vmstate part of migration stream
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: Nikita Lapshin <nikita.lapshin@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, Nikita Lapshin <nikita.lapshin@virtuozzo.com>
References: <20220323105400.17649-1-nikita.lapshin@openvz.org>
 <20220323105400.17649-4-nikita.lapshin@openvz.org>
 <b59272e8-08e6-4de0-c7f7-f153f1d014c7@mail.ru>
In-Reply-To: <b59272e8-08e6-4de0-c7f7-f153f1d014c7@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp51.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95C8DF32398C35CA633AC8158FD68276C79E92F1BB1950288182A05F5380850404C228DA9ACA6FE27354E3E4CFB548A049A49FD09F8AFC6DDADF64DAAE04F407779012E5E075C3255
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7DB7B102DCB413779EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006374D0D183F14C070BA8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88158B36DF11B2873E466FE7250141DC26F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7ACC81C43B079CAD29FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD1828451B159A507268D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BA9BB761A57C26B8FA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC5BFAD0E70065EE5E3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637859E4BC76B98F11DD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F9963BF7538DF330757739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5E70146D14A7D00CD2CA57021413F123068588815BCE894E3D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C264B329661203DA2EA65EE12BCF93D18DC0E3A02B8636FF17BBF4DD468F24976CEBC87750959A621D7E09C32AA3244C31352B9E97E79E6E3402DCB9175C945BD08D48398F32B4A6927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmAUGmqNqlneLA==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F157695897E405BE6B3C1D2F8B9F53AFB3D520D52D5CF215F1EE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.111;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp51.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

23.03.2022 15:40, Vladimir Sementsov-Ogievskiy wrote:
> 23.03.2022 13:53, Nikita Lapshin wrote:
>> From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
>>
>> Now we can disable and enable vmstate part by stream_content parameter.
>>
>> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
>> ---
>>   migration/migration.c | 10 ++++++++--
>>   migration/savevm.c    | 13 +++++++++++++
>>   2 files changed, 21 insertions(+), 2 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 4adcc87d1d..bbf9b6aad1 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1334,9 +1334,15 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
>>       }
>>   }
>> -static bool check_stream_parts(strList *stream_content_list)
>> +static bool check_stream_parts(strList *stream_list)
>>   {
>> -    /* To be implemented in ext commits */
>> +    for (; stream_list; stream_list = stream_list->next) {
>> +        if (!strcmp(stream_list->value, "vmstate")) {
>> +            continue;
>> +        }
>> +
>> +        return false;
>> +    }
>>       return true;
>>   }
> 
> When you move to enum for list elements in QAPI, this thing would be checked automatically, you will not have to check it by hand.
> 
>> diff --git a/migration/savevm.c b/migration/savevm.c
>> index c68f187ef7..8f35c0c81e 100644
>> --- a/migration/savevm.c
>> +++ b/migration/savevm.c
>> @@ -949,6 +949,19 @@ static bool should_skip(SaveStateEntry *se)
>>           return true;
>>       }
>> +    /*
>> +     * Assume that any SaveStateEntry with non-null vmsd is
>> +     * part of vmstate.
>> +     * Vmstate is included by default so firstly check if
>> +     * stream-content-list is enabled.
>> +     */
>> +
>> +    if (se->vmsd &&
>> +        migrate_get_current()->parameters.has_stream_content_list &&
>> +        !migrate_find_stream_content("vmstate")) {
> 
> And in migrate_find_stream_content you do
>      if (!s->parameters.has_stream_content_list) {
>          return false;
>      }
> 
> Seems better to do
>      if (!s->parameters.has_stream_content_list) {
>          return true;
>      }
> 
> in migrate_find_stream_content(), and rename it to something like should_migrate_content() or just migrate_content().
> 
> Then here you don't need to check .has_stream_content_list.

Hmm, but that will work bad with dirty-bitmaps, as they are disabled by default.

So, this actually means that we have different default for different contents:

ram and and other device states are enabled by default, dirty-bitmaps are disabled by defaults. We can honestly realize these defaults in migrate_content().

> 
>> +        return true;
>> +    }
>> +
>>       return false;
>>   }
> 
> 


-- 
Best regards,
Vladimir

