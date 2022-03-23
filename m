Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F385E4E52C7
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:07:45 +0100 (CET)
Received: from localhost ([::1]:39868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0iG-0003G6-Km
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:07:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX0Hm-00052p-T5
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:40:24 -0400
Received: from smtp32.i.mail.ru ([94.100.177.92]:55822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX0Ha-00045h-Ur
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=7piyTjFZyBn56Ki8xyYnHT32oXvqYXuhfJ5764r/87w=; 
 t=1648039211;x=1648644611; 
 b=cJhypxY6nMBu7uj46VqJnSmQVYldUy6Cf1NYkj8Ad6ssC2x9zo8/+lwCEZs3uwjdsKCsL+0UBaU9F95M/Oqcil5cMFsSLkXyn3w+kXey73MfdCrR89eQirRcatCrlyI2aXxngT2dij9s41Gb0vCK1vjAW9N9IC/P/NkpGoD8+CY9W8qNZ59YIvBhiQHh/4s5GJldNDiT3z7ew5e7Mef+78nS6PTyOt97VxO5Qv1MHC2RFVYo0g736AAxnbHkUrlgFQSPJwahD6HlSJjUAtuY4aC76Flaf0MgxU4L2/BNZ2LTJxmVOWYIt9hjMAcuWBmKmPF7KYNt0Jd+LsjkCNpmxA==;
Received: by smtp32.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nX0HW-0005Xm-EW; Wed, 23 Mar 2022 15:40:06 +0300
Message-ID: <b59272e8-08e6-4de0-c7f7-f153f1d014c7@mail.ru>
Date: Wed, 23 Mar 2022 15:40:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 3/8] migration: Add vmstate part of migration stream
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, Nikita Lapshin <nikita.lapshin@virtuozzo.com>
References: <20220323105400.17649-1-nikita.lapshin@openvz.org>
 <20220323105400.17649-4-nikita.lapshin@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220323105400.17649-4-nikita.lapshin@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp32.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196D8CF2CFB95539D9144AAA932A5836E553182A05F538085040FD3F7C5A4405DBECB648D03E21DCD1216AC4C39031233FCFD393F41D69A43AAA
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE73870E1FF9A049D91EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FF37B1FF54E2C7C48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8E77E06B9970DFE6CFE88346F18FD65816F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE75A64D9A1E9CA65708941B15DA834481FA18204E546F3947C21E93C0F2A571C7BF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063706C07FE7DDBB4AB7389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F79006374FDF5742F3EC5011D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE70D66F1D77A79F9A7EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C34B556A7116F344E835872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A58F4241E72346E9B7CD0A69BA70F13EE12A5724E0A8A8FE74D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34AC6E62257D6CD1C98D56CE90EC973DAF57C347792C4768663306111D2626B16D936958C82F20AE4B1D7E09C32AA3244CC8D909F2AB7622DCEBCBE7353B0715A4E646F07CC2D4F3D8927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmANw54pic25xw==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15E95DE0FCF0D321F149C676CC4147AD64DD52A0D2DD5064E3E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.92;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp32.i.mail.ru
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

23.03.2022 13:53, Nikita Lapshin wrote:
> From: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
> 
> Now we can disable and enable vmstate part by stream_content parameter.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
> ---
>   migration/migration.c | 10 ++++++++--
>   migration/savevm.c    | 13 +++++++++++++
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 4adcc87d1d..bbf9b6aad1 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1334,9 +1334,15 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
>       }
>   }
>   
> -static bool check_stream_parts(strList *stream_content_list)
> +static bool check_stream_parts(strList *stream_list)
>   {
> -    /* To be implemented in ext commits */
> +    for (; stream_list; stream_list = stream_list->next) {
> +        if (!strcmp(stream_list->value, "vmstate")) {
> +            continue;
> +        }
> +
> +        return false;
> +    }
>       return true;
>   }

When you move to enum for list elements in QAPI, this thing would be checked automatically, you will not have to check it by hand.

>   
> diff --git a/migration/savevm.c b/migration/savevm.c
> index c68f187ef7..8f35c0c81e 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -949,6 +949,19 @@ static bool should_skip(SaveStateEntry *se)
>           return true;
>       }
>   
> +    /*
> +     * Assume that any SaveStateEntry with non-null vmsd is
> +     * part of vmstate.
> +     * Vmstate is included by default so firstly check if
> +     * stream-content-list is enabled.
> +     */
> +
> +    if (se->vmsd &&
> +        migrate_get_current()->parameters.has_stream_content_list &&
> +        !migrate_find_stream_content("vmstate")) {

And in migrate_find_stream_content you do
     if (!s->parameters.has_stream_content_list) {
         return false;
     }

Seems better to do
     if (!s->parameters.has_stream_content_list) {
         return true;
     }

in migrate_find_stream_content(), and rename it to something like should_migrate_content() or just migrate_content().

Then here you don't need to check .has_stream_content_list.

> +        return true;
> +    }
> +
>       return false;
>   }
>   


-- 
Best regards,
Vladimir

