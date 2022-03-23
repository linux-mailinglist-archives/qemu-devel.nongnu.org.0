Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA2F4E52BC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:04:47 +0100 (CET)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0fN-0007Qm-RK
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:04:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX0Qa-0006QE-EB
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:49:28 -0400
Received: from smtp40.i.mail.ru ([94.100.177.100]:34200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX0QY-0001HV-Hk
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 08:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=+QhMU+UPsZ2qJK2d61izkJE8qwVfZ7fqfdZsHRhVoso=; 
 t=1648039766;x=1648645166; 
 b=Cd/yw3NxUBvPwsTIulKu51QvXqLGR1zYSa7nY1IA/LM9s5bqNvKQQ++jZAFTdvW90va2bzCfkV/5zp8oiL7Xvps1Oi+Yg2fJy/DmrIe8hkF2XmjvAV4DjYD6ClGnT+vYL46CVJ61n/bYuTD0Q/MwRfIaQaHftccQlS15XqmXkNJcW7GfqgpqG3uXJwIqOamDC0JlXsLMDnWlcVCurQ6xa/oFqxS+0+Kh0E+3HEEfV67EKPd439cEYsjj3Jm1et61mnj8exL7SvEbOlTqKmQvzQu4qsUp3vg2N+M5nM/zDlhsCE9O2aOHQntKYi/qYoGIae/h6hSSmHyoa5cdrl5C6g==;
Received: by smtp40.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nX0QW-0006LU-8x; Wed, 23 Mar 2022 15:49:24 +0300
Message-ID: <f7917db2-cac6-b0d7-4697-faded66c9c66@mail.ru>
Date: Wed, 23 Mar 2022 15:49:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 4/8] migration: Add dirty-bitmaps part of migration
 stream
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, Nikita Lapshin <nikita.lapshin@virtuozzo.com>
References: <20220323105400.17649-1-nikita.lapshin@openvz.org>
 <20220323105400.17649-5-nikita.lapshin@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220323105400.17649-5-nikita.lapshin@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp40.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196DC6E89A8CCEF2E51DF9B70E0E78BE6910182A05F538085040EF2D332CA79BD71C4BF1F053D90841F7A0FE9C48F0FC38B467A13C96D8D8D2D9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76AB1B6FB25ACEDC9EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637ECAF4C2CEE0D0B2F8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D806FA75F084E98D339D53410EB9553EFB6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A4E090B122B102069FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751F2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B292D688DDAD4E7BC389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637746F2AC962FBC282D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE75B5FE1C846F4DC05EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3CD11E96DA5DC791B35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5685E5798D4C3D1A55666D54AC64D86E2BE1C7DAE45990C13D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34EE19B6E2433CA0935DFF35804048695733D6FCEB945B1C58E7FB1C4BAFB199CDEFD4343FAF724F421D7E09C32AA3244CA592A2F5F4739840B2760F569A59DEBBF26BFA4C8A6946B8927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmAnOIjYiq/tsA==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F157695897E405BE6B3A634BE876871F1934D3D87B76E3BD6EAE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.100;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp40.i.mail.ru
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
> This enable and disable dirty-bitmaps in migration stream.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
> ---
>   migration/migration.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index bbf9b6aad1..ad789915ce 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1337,7 +1337,8 @@ void qmp_migrate_set_capabilities(MigrationCapabilityStatusList *params,
>   static bool check_stream_parts(strList *stream_list)
>   {
>       for (; stream_list; stream_list = stream_list->next) {
> -        if (!strcmp(stream_list->value, "vmstate")) {
> +        if (!strcmp(stream_list->value, "vmstate") ||
> +            !strcmp(stream_list->value, "dirty-bitmaps")) {
>               continue;
>           }
>   
> @@ -2501,7 +2502,8 @@ bool migrate_dirty_bitmaps(void)
>   
>       s = migrate_get_current();
>   
> -    return s->enabled_capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS];
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_DIRTY_BITMAPS] ||
> +           migrate_find_stream_content("dirty-bitmaps");
>   }
>   
>   bool migrate_ignore_shared(void)

Probably we should restrict using dirty-bitmaps capability together with new stream-content parameter to be strict.


-- 
Best regards,
Vladimir

