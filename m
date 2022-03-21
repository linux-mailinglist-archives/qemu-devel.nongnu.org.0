Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621B94E25AC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 12:53:27 +0100 (CET)
Received: from localhost ([::1]:38920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWGbG-00049g-2a
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 07:53:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWGYV-0001Kz-7Q; Mon, 21 Mar 2022 07:50:35 -0400
Received: from smtp47.i.mail.ru ([94.100.177.107]:57782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWGYS-0003WK-BC; Mon, 21 Mar 2022 07:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=XazBMo2sCUIfA3gdkuM3t0TzhMPS0A9/Cqh9C+nd2vM=; 
 t=1647863432;x=1648468832; 
 b=Z1l/qcRBvjMM6+IYLWl4wUpul7TUpMyGmo6Gi7f4Ve3sPbZ1iZvg2l6IbKIqBmSFoSLAI9akHWQGk/fDKQnoejmP2G7wdk38CaGTIaWEhGOfW18tEsrOVMgNjnhikbQnlNFNMcxvT7d4Pb2KCMsEhj1FHxo0EIqqx8mwjTo0/edzbZMO4xOJTy0aWgzR4yp9u57qD/dU80vrXWWjYw8o4qgy1vDRt8UJH09p0n3SiXrp0pFZWn1cFSEAZ6sCcLrIP7X/Eb/HrMLBFvhxRAgLihFsAef3fb8zup4BZreVqPuyDKM3Eut2FAE+0HzvLR0KHEILZWTufRHSVmUFaG5xZA==;
Received: by smtp47.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nWGYN-00020P-B4; Mon, 21 Mar 2022 14:50:27 +0300
Message-ID: <b55b3f46-6b8d-8522-9a08-e7c2ddcf8f67@mail.ru>
Date: Mon, 21 Mar 2022 14:50:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] qapi: nbd-export: allow select bitmaps by
 node/name pair
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, jsnow@redhat.com, v.sementsov-og@ya.ru,
 yuriy.vasiliev@virtuozzo.com
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
 <20220314213226.362217-3-v.sementsov-og@mail.ru>
 <20220316212855.ra54pckg3u6xgwzw@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <20220316212855.ra54pckg3u6xgwzw@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp47.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196DAEE08C8B4332C69BD3B54C3E627D4433182A05F5380850401465D607C980D6BE306D4A2BF93A719183AB23533A61D6BA025833BDA1320839
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7705F446BE41E38A1EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006375D8840FA58F505298638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8DAAA4DC8C962692F394892DFB522FEA06F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE78C592797616C97AB9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAE9A1BBD95851C5BA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC9FD33E375ABA78F43AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006376B6BCF2887184E5BD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F10D407B19AF7F7505E1C53F199C2BB95B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A580F987129B2527009AB80EA41EE81F93D14C0D959096CA11D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA7540E9CF2C1C1CEBBA410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D343DCFC3BEDFB0242D9CF0AAD3B80F374B2C221767A94219D57B99757AEED9890762AAAD2A2459A5621D7E09C32AA3244C5F39805A544BBFBAEA2A85488B71F8227101BF96129E401127AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojSLL0ldHQslbURscrkxB7+Q==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15F2A23F2152AD3C63A3B51619249ACB9DD3C18203515230B3E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.107;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp47.i.mail.ru
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

17.03.2022 00:28, Eric Blake wrote:
> On Tue, Mar 15, 2022 at 12:32:25AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
>>
>> Hi all! Current logic of relying on search through backing chain is not
>> safe neither convenient.
>>
>> Sometimes it leads to necessity of extra bitmap copying. Also, we are
>> going to add "snapshot-access" driver, to access some snapshot state
>> through NBD. And this driver is not formally a filter, and of course
>> it's not a COW format driver. So, searching through backing chain will
>> not work. Instead of widening the workaround of bitmap searching, let's
>> extend the interface so that user can select bitmap precisely.
>>
>> Note, that checking for bitmap active status is not copied to the new
>> API, I don't see a reason for it, user should understand the risks. And
>> anyway, bitmap from other node is unrelated to this export being
>> read-only or read-write.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
>> ---
>>   blockdev-nbd.c         |  8 +++++-
>>   nbd/server.c           | 63 +++++++++++++++++++++++++++---------------
>>   qapi/block-export.json |  5 +++-
>>   qemu-nbd.c             | 11 ++++++--
>>   4 files changed, 61 insertions(+), 26 deletions(-)
>>
> 
>> @@ -1709,37 +1709,56 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
>>       }
>>       exp->export_bitmaps = g_new0(BdrvDirtyBitmap *, exp->nr_export_bitmaps);
>>       for (i = 0, bitmaps = arg->bitmaps; bitmaps;
>> -         i++, bitmaps = bitmaps->next) {
>> -        const char *bitmap = bitmaps->value;
>> +         i++, bitmaps = bitmaps->next)
>> +    {
>> +        const char *bitmap;
> 
> I'm not sure if our prevailing style splits { to its own line on a
> multi-line 'for'.  But this is a cosmetic question, not one of
> correctness.
> 
>> +        case QTYPE_QDICT:
>> +            bitmap = bitmaps->value->u.external.name;
>> +            bm = block_dirty_bitmap_lookup(bitmaps->value->u.external.node,
>> +                                           bitmap, NULL, errp);
>> +            if (!bm) {
>> +                ret = -ENOENT;
>> +                goto fail;
>> +            }
>> +            break;
>> +        default:
>> +            abort();
> 
> Not sure if g_assert_not_reached() or __builtin_unreachable() would be
> any better here.  I'm fine with the abort() for now.
> 
>> +++ b/qapi/block-export.json
>> @@ -6,6 +6,7 @@
>>   ##
>>   
>>   { 'include': 'sockets.json' }
>> +{ 'include': 'block-core.json' }
> 
> Hmm.  Does this extra inclusion negatively impact qemu-storage-daemon,
> since that is why we created block-export.json in the first place (to
> minimize the stuff that qsd pulled in without needing all of
> block-core.json)?  In other words, would it be better to move
> BlockDirtyBitmapOrStr to this file?

And include block-export in block-core?

Another alternative is to move BlockDirtyBitmapOrStr to a separate file included from both block-export and block-core but that seems to be too much.

> 
> Everything else looks okay with this patch.
> 


-- 
Best regards,
Vladimir

