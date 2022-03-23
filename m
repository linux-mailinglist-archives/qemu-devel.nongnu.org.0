Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63E14E53A9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:56:36 +0100 (CET)
Received: from localhost ([::1]:40654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX1TX-0003vd-Ry
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:56:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX1Q4-0000dn-UI
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:53:01 -0400
Received: from smtp61.i.mail.ru ([217.69.128.41]:50054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nX1Q2-0008Nk-Lg
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=gXk5T9lRNgT4EabG59vjvYPcEOqOHdmmQHUaYE0whdQ=; 
 t=1648043578;x=1648648978; 
 b=iqGuv1VBdV9DCB4GjpmQ5+eHyHhnkt0nK4mIfZ7erTQSSYvS1XhccCU2wYTaJiPW2PZ5eIGBJljHUX6R6QjOxxEXOFSASng6Wal0g5CxpzIZcm4F9CUc/aEbjvQCokqMLsYiHrxgQFr11SFl4INYQlQaHGM883kTelHys01lwuYTOVwqkiKRpcv9Of3e8VIyMgEGjdTpPXn0v6/rg8QYr91gGclpXLNhwWRBAqdtkFR92Jn6eG2zaMgZN8z/UbbkjKPKpz7T/eo3/KVxmfToemhwrvuHk/4suyNNGMqyQ52Vd7MWSAckP9ohKANWhRMxaOPN5LLsnFUw+cjs9MGuNA==;
Received: by smtp61.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nX1Pz-0002nY-2T; Wed, 23 Mar 2022 16:52:55 +0300
Message-ID: <7173cc21-004d-a25e-a787-1c7ee90dfba3@mail.ru>
Date: Wed, 23 Mar 2022 16:52:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/8] migration: Add RAM part of migration stream
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@openvz.org>, qemu-devel@nongnu.org
Cc: den@openvz.org, Nikita Lapshin <nikita.lapshin@virtuozzo.com>
References: <20220323105400.17649-1-nikita.lapshin@openvz.org>
 <20220323105400.17649-7-nikita.lapshin@openvz.org>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220323105400.17649-7-nikita.lapshin@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp61.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196D1A86FCEE7E90544709577A47801E79BC182A05F538085040DD12703EB3E844894FF1607D34079AF8BB1AABFC301C3C40E85AE16CE89CAC50
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE76EFCC492048C0D13EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371E8C7BD479B346ED8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D88376C5E75584EC2BCF0198B4B632ABA86F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE737BF09D08E861CDD9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD1828451B159A507268D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF80095D1E57F4578A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCE2E96C7DA591B4533AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637508445EA9913ED89EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3C479344848F76DD335872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A58B3AC8278D9E4FB93FCCDF92A81DD714BC49FB04F35AF08FD59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D349FD10E01B3CDC9E237E7AF84085D049873A15DCDA704DE2C860E5DCD56070724C16A3B691274BBA41D7E09C32AA3244C28CBA7849FDFEB7040DA980E2ADF2376F165894D92D62706927AC6DF5659F194
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojVRXGxxa4QmCreRdGSRsq3Q==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F152D6A5A5DB30C1B0712371C8FB506FCFD85AB3DD385E8E483E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.41;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp61.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
> 'ram' parameter enable RAM sections in migration stream. If it
> isn't specified it will be skipped.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
> ---
>   migration/migration.c | 17 ++++++++++++++++-
>   migration/migration.h |  1 +
>   migration/ram.c       |  6 ++++++
>   3 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index d81f3c6891..6528b3ad41 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1339,7 +1339,8 @@ static bool check_stream_parts(strList *stream_list)
>       for (; stream_list; stream_list = stream_list->next) {
>           if (!strcmp(stream_list->value, "vmstate") ||
>               !strcmp(stream_list->value, "dirty-bitmaps") ||
> -            !strcmp(stream_list->value, "block")) {
> +            !strcmp(stream_list->value, "block") ||
> +            !strcmp(stream_list->value, "ram")) {
>               continue;
>           }
>   
> @@ -2653,6 +2654,20 @@ bool migrate_background_snapshot(void)
>       return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
>   }
>   
> +bool migrate_ram(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    /*
> +     * By default RAM is enabled so if stream-content-list disabled
> +     * RAM will be passed.
> +     */
> +    return !s->parameters.has_stream_content_list ||
> +           migrate_find_stream_content("ram");
> +}

I think, better is avoid this extra function

> +
>   /* Checks if stream-content parameter has section_name in list */
>   bool migrate_find_stream_content(const char *section_name)
>   {
> diff --git a/migration/migration.h b/migration/migration.h
> index 411c58e919..5c43788a2b 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -395,6 +395,7 @@ int migrate_decompress_threads(void);
>   bool migrate_use_events(void);
>   bool migrate_postcopy_blocktime(void);
>   bool migrate_background_snapshot(void);
> +bool migrate_ram(void);
>   
>   bool migrate_find_stream_content(const char *section_name);
>   
> diff --git a/migration/ram.c b/migration/ram.c
> index 170e522a1f..ddc7abd08a 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -4263,6 +4263,11 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
>       return 0;
>   }
>   
> +static bool is_ram_active(void *opaque)
> +{
> +    return migrate_ram();

and here just call should_migrate_content("ram");

> +}
> +
>   static SaveVMHandlers savevm_ram_handlers = {
>       .save_setup = ram_save_setup,
>       .save_live_iterate = ram_save_iterate,
> @@ -4275,6 +4280,7 @@ static SaveVMHandlers savevm_ram_handlers = {
>       .load_setup = ram_load_setup,
>       .load_cleanup = ram_load_cleanup,
>       .resume_prepare = ram_resume_prepare,
> +    .is_active = is_ram_active,
>   };
>   
>   static void ram_mig_ram_block_resized(RAMBlockNotifier *n, void *host,


-- 
Best regards,
Vladimir

