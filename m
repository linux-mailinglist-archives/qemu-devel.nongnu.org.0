Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0666529FA4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 12:42:07 +0200 (CEST)
Received: from localhost ([::1]:38260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqueV-0001xj-0y
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 06:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nquYz-0008U1-Af; Tue, 17 May 2022 06:36:25 -0400
Received: from smtp40.i.mail.ru ([94.100.177.100]:49852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nquYv-00082U-DM; Tue, 17 May 2022 06:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=/J6mmNodQZy+gP4FziLEYkEoySGx2UBPljjDH+rMrmo=; 
 t=1652783781;x=1653389181; 
 b=bkTOK2UXrdIGpxSvyIViyYRtkyNVCir/snXC3wBKyi2tLqsoWZnWvN9bK2IWUtPmpzhCY7N7B2RpvKcPAOYbsFr1GamJoMl0j1DnOTn5A5kelzvyAxAgXSSLTLRgVfJNBW5XYrZjJX8nrzxws/hpH/e2dw/uTkUbtfSxlk1SeUttPbXqGkEpvoh0Q3YcNBtsOs771y3ssRTQhpVhbmbhkxAhW6KXRFGo72OuFj6Gz6ZkvV/eJJzEf6vVXq1zW5UOj/JebywYjkO8jbBAhYpNVmmH0xjuhV/o0ZpYlu/hHpGP04MTEdB9XjoW5jaRbtlN/A8Krti95mPoGOvdEel0PQ==;
Received: by smtp40.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nquYr-0001Em-K5; Tue, 17 May 2022 13:36:18 +0300
Message-ID: <ff4edfe2-29a7-9b31-0cfd-5e54b20b17a0@mail.ru>
Date: Tue, 17 May 2022 13:36:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/3] block: improve block_dirty_bitmap_merge(): don't
 allocate extra bitmap
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, eblake@redhat.com,
 hreitz@redhat.com, jsnow@redhat.com, vsementsov@openvz.org,
 nikita.lapshin@virtuozzo.com
References: <20220401100804.315728-1-vsementsov@openvz.org>
 <20220401100804.315728-3-vsementsov@openvz.org> <YnD00CJqxBT/hM2T@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <YnD00CJqxBT/hM2T@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp40.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9AB830312DE1E2EF83FFDFE29368BDF0CE4A6DE51A314C9A4182A05F5380850409053753CFADAA107D4CC2C20825AA738D94387BD6993EBE25CC58F07922F3C9F
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77BF46084C0059042EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006378D70459436292EC88638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8F175A21E57F72F3FBF88C6DA12DA88866F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7655D724DF6BFD6619FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BF1175FABE1C0F9B6A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC06A76AC5103252BB3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063733A25861FFD6A8E5EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3EB868C3EEB441C6B35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A58D93E7140598D0B447A793B4367CA2ED3DC2F21D749482E0D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D346B222596F62B8FA931943CA79014DCCC8F13D9BC612D1FD8B66C37B6B08865513714D5F08423EF581D7E09C32AA3244CA1CB7C91B8FE3587EA293CF39B48E9B805AB220A9D022EBC27AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3fsA429394Mo8v7msAhumQ==
X-Mailru-Sender: 6C3E74F07C41AE9425C26D04B7325D44A8B921FE1CB2B2C0F3CE5E42E9A2E9B028DD59064C361AE9E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

03.05.2022 12:24, Kevin Wolf wrote:
> Am 01.04.2022 um 12:08 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> We don't need extra bitmap. All we need is to backup the original
>> bitmap when we do first merge. So, drop extra temporary bitmap and work
>> directly with target and backup.
>>
>> Still to keep old semantics, that on failure target is unchanged and
>> user don't need to restore, we need a local_backup variable and do
>> restore ourselves on failure path.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   block/monitor/bitmap-qmp-cmds.c | 39 ++++++++++++++++-----------------
>>   1 file changed, 19 insertions(+), 20 deletions(-)
>>
>> diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
>> index 4db704c015..07d0da323b 100644
>> --- a/block/monitor/bitmap-qmp-cmds.c
>> +++ b/block/monitor/bitmap-qmp-cmds.c
>> @@ -261,8 +261,9 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>>                                             HBitmap **backup, Error **errp)
>>   {
>>       BlockDriverState *bs;
>> -    BdrvDirtyBitmap *dst, *src, *anon;
>> +    BdrvDirtyBitmap *dst, *src;
>>       BlockDirtyBitmapMergeSourceList *lst;
>> +    HBitmap *local_backup = NULL;
>>   
>>       GLOBAL_STATE_CODE();
>>   
>> @@ -271,12 +272,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>>           return NULL;
>>       }
>>   
>> -    anon = bdrv_create_dirty_bitmap(bs, bdrv_dirty_bitmap_granularity(dst),
>> -                                    NULL, errp);
>> -    if (!anon) {
>> -        return NULL;
>> -    }
>> -
>>       for (lst = bms; lst; lst = lst->next) {
>>           switch (lst->value->type) {
>>               const char *name, *node;
>> @@ -285,8 +280,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>>               src = bdrv_find_dirty_bitmap(bs, name);
>>               if (!src) {
>>                   error_setg(errp, "Dirty bitmap '%s' not found", name);
>> -                dst = NULL;
>> -                goto out;
>> +                goto fail;
>>               }
>>               break;
>>           case QTYPE_QDICT:
>> @@ -294,29 +288,34 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
>>               name = lst->value->u.external.name;
>>               src = block_dirty_bitmap_lookup(node, name, NULL, errp);
>>               if (!src) {
>> -                dst = NULL;
>> -                goto out;
>> +                goto fail;
>>               }
>>               break;
>>           default:
>>               abort();
>>           }
>>   
>> -        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
>> -            dst = NULL;
>> -            goto out;
>> +        /* We do backup only for first merge operation */
>> +        if (!bdrv_merge_dirty_bitmap(dst, src,
>> +                                     local_backup ? NULL : &local_backup,
>> +                                     errp))
>> +        {
>> +            goto fail;
>>           }
>>       }
>>   
>> -    /* Merge into dst; dst is unchanged on failure. */
>> -    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
>> -        dst = NULL;
>> -        goto out;
>> +    if (backup) {
>> +        *backup = local_backup;
>>       }
> 
> Don't we need something like '... else { hbitmap_free(local_backup); }'
> in order to avoid leaking the memory?

Right! Will resend.

> 
>>   
>> - out:
>> -    bdrv_release_dirty_bitmap(anon);
>>       return dst;
>> +
>> +fail:
>> +    if (local_backup) {
>> +        bdrv_restore_dirty_bitmap(dst, local_backup);
>> +    }
>> +
>> +    return NULL;
>>   }
> 
> Kevin
> 


-- 
Best regards,
Vladimir

