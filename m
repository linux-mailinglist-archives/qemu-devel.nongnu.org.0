Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDF84EED0A
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 14:21:52 +0200 (CEST)
Received: from localhost ([::1]:58532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naGHn-0002tM-Bw
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 08:21:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naGEk-0001Og-VO; Fri, 01 Apr 2022 08:18:44 -0400
Received: from smtp36.i.mail.ru ([94.100.177.96]:53694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naGEV-00049z-Hn; Fri, 01 Apr 2022 08:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=DP8xYM1q6Bg/4KHm0M9Jkd8REsYqQ0RCQZm1VqcVE14=; 
 t=1648815507;x=1649420907; 
 b=r/jYXrdq6TX9TpxE7cSaFCcOxk/KipINaktFTQJJ1Znk7DOs491HhjPFIwrVPw1eKkw/RfgqkXR8ET55SaX5vSzXMP0OaTEQROrWE8eF6IpH4Ghvfy2umpG8wZuMggzF7XwkB3s+9XZeGHVWOhtYgSupKwSzJ2A1wdYwLxnYiEf+YU3Hz3sqsYzqAT+XDQJDYXXoNlsrTgGwCm5eg+34V+dLAWtA8S9zGkxfddqti+/4VtwzhAvHyNRdvxYP+s3OQBMeEeJyYtsDJWjLQNuWsXFIXWDQE9YbLyshVrnnz9lvIr8sjv8JMiD9OOO0sXbCGCVKQ3jszuthJQ8sm+CLwA==;
Received: by smtp36.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1naGER-0005ay-Bm; Fri, 01 Apr 2022 15:18:24 +0300
Message-ID: <842f569c-90b8-b84c-1d4d-8f76a08d5760@mail.ru>
Date: Fri, 1 Apr 2022 15:18:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/7] block/copy-before-write: add on-cbw-error open
 parameter
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@openvz.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-3-vsementsov@openvz.org>
 <ebed5d8a-5a07-1030-596e-d9f943c2ba83@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <ebed5d8a-5a07-1030-596e-d9f943c2ba83@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp36.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9771EFB8797C310D1FE519B944DE714847DCE9C180800E4D7182A05F5380850400073F0A9ACED3F9FDDCE088668611E6F1C3B9AC7DED072E21DFFE48FC2960DF3
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE74EC61905B8C6A847EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006377BA6DB23C50317A38638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80C20478BB9A8095785D9593E3CCE44D36F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7B857F55CE090FEC39FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCB84D56319E1D6EBF3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637C747C1EBF5ED864BD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F72BE6798D603635257739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5176A60E8303E6EC4FB2B6A3FC0CE2D6E515275E492E9DD48D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D347798CB24D8990473AA384971FA2BAB47E8B205B8B6B01C08EF96995A6E195A7DB792686FAC3BF3A51D7E09C32AA3244C7908269B729DFC6CA63B16CAB6C7FFC23E8609A02908F271ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojhgUChjrcp6FJb5MJugJHHA==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE36CD6473E7FF46F06F8DB4BD55CD3F89D0FABAB27254B1BCE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.96;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp36.i.mail.ru
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

01.04.2022 14:58, Hanna Reitz wrote:
> On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
>> Currently, behavior on copy-before-write operation failure is simple:
>> report error to the guest.
>>
>> Let's implement alternative behavior: break the whole copy-before-write
>> process (and corresponding backup job or NBD client) but keep guest
>> working. It's needed if we consider guest stability as more important.
>>
>> The realisation is simple: on copy-before-write failure we immediately
>> continue guest write operation and set s->snapshot_ret variable which
>> will lead to all further and in-flight snapshot-API requests failure.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   block/copy-before-write.c | 62 ++++++++++++++++++++++++++++++++++-----
>>   qapi/block-core.json      | 27 ++++++++++++++++-
>>   2 files changed, 81 insertions(+), 8 deletions(-)
>>
>> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
>> index 394e73b094..0614c3d08b 100644
>> --- a/block/copy-before-write.c
>> +++ b/block/copy-before-write.c
>> @@ -41,6 +41,7 @@
>>   typedef struct BDRVCopyBeforeWriteState {
>>       BlockCopyState *bcs;
>>       BdrvChild *target;
>> +    OnCbwError on_cbw_error;
>>       /*
>>        * @lock: protects access to @access_bitmap, @done_bitmap and
>> @@ -65,6 +66,14 @@ typedef struct BDRVCopyBeforeWriteState {
>>        * node. These areas must not be rewritten by guest.
>>        */
>>       BlockReqList frozen_read_reqs;
>> +
>> +    /*
>> +     * @snapshot_error is normally zero. But on first copy-before-write failure
>> +     * when @on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT, @snapshot_error takes
>> +     * value of this error (<0). After that all in-flight and further
>> +     * snaoshot-API requests will fail with that error.
> 
> *snapshot
> 
>> +     */
>> +    int snapshot_error;
>>   } BDRVCopyBeforeWriteState;
>>   static coroutine_fn int cbw_co_preadv(
>> @@ -99,11 +108,25 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
>>       end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
> 
> Wouldn’t it make sense to completely cease CBW if snapshot_error is non-zero?  (I.e. always returning 0 here, skipping block_copy().) You can’t read from it anyway anymore.  (Except from below the copy-before-write node, but users shouldn’t be doing this, because they can’t know which areas are valid to read and which aren’t.)

Agree, will do.

> 
>>       ret = block_copy(s->bcs, off, end - off, true);
>> -    if (ret < 0) {
>> +    if (ret < 0 && s->on_cbw_error == ON_CBW_ERROR_BREAK_GUEST_WRITE) {
>>           return ret;
>>       }
>>       WITH_QEMU_LOCK_GUARD(&s->lock) {
>> +        if (ret < 0) {
>> +            assert(s->on_cbw_error == ON_CBW_ERROR_BREAK_SNAPSHOT);
>> +            if (!s->snapshot_error) {
>> +                s->snapshot_error = ret;
>> +            }
>> +            /*
>> +             * No need to wait for s->frozen_read_reqs: they will fail anyway,
>> +             * as s->snapshot_error is set.
>> +             *
>> +             * We return 0, as error is handled. Guest operation should be
>> +             * continued.
>> +             */
>> +            return 0;
> 
> Hm, OK.  Naively, it looks to me like we could save us this explanation and simplify the code just by unconditionally waiting here (I guess we could skip the wait if snapshot_error was non-zero before) and not checking snapshot_error in cbw_snapshot_read_unlock().  I don’t think not waiting here meaningfully saves time.

Hmm. I tend to agree, this optimization doesn't seem to worth the complexity. Will drop it, we can implement it later if really needed.

> 
>> +        }
>>           bdrv_set_dirty_bitmap(s->done_bitmap, off, end - off);
>>           reqlist_wait_all(&s->frozen_read_reqs, off, end - off, &s->lock);
>>       }
>> @@ -176,6 +199,11 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
>>       QEMU_LOCK_GUARD(&s->lock);
>> +    if (s->snapshot_error) {
>> +        g_free(req);
>> +        return NULL;
>> +    }
>> +
>>       if (bdrv_dirty_bitmap_next_zero(s->access_bitmap, offset, bytes) != -1) {
>>           g_free(req);
>>           return NULL;
>> @@ -198,19 +226,26 @@ static BlockReq *cbw_snapshot_read_lock(BlockDriverState *bs,
>>       return req;
>>   }
>> -static void cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
>> +static int cbw_snapshot_read_unlock(BlockDriverState *bs, BlockReq *req)
>>   {
>>       BDRVCopyBeforeWriteState *s = bs->opaque;
>>       if (req->offset == -1 && req->bytes == -1) {
>>           g_free(req);
>> -        return;
>> +        /*
>> +         * No real need to read snapshot_error under mutex here: we are actually
>> +         * safe to ignore it and return 0, as this request was to s->target, and
>> +         * can't be influenced by guest write. But if we can new read negative
>> +         * s->snapshot_error let's return it, so that backup failed earlier.
>> +         */
>> +        return s->snapshot_error;
>>       }
>>       QEMU_LOCK_GUARD(&s->lock);
>>       reqlist_remove_req(req);
>>       g_free(req);
>> +    return s->snapshot_error;
>>   }
>>   static coroutine_fn int
>> @@ -219,7 +254,7 @@ cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
>>   {
>>       BlockReq *req;
>>       BdrvChild *file;
>> -    int ret;
>> +    int ret, ret2;
>>       /* TODO: upgrade to async loop using AioTask */
>>       while (bytes) {
>> @@ -232,10 +267,13 @@ cbw_co_preadv_snapshot(BlockDriverState *bs, int64_t offset, int64_t bytes,
>>           ret = bdrv_co_preadv_part(file, offset, cur_bytes,
>>                                     qiov, qiov_offset, 0);
>> -        cbw_snapshot_read_unlock(bs, req);
>> +        ret2 = cbw_snapshot_read_unlock(bs, req);
>>           if (ret < 0) {
>>               return ret;
>>           }
>> +        if (ret2 < 0) {
>> +            return ret2;
>> +        }
>>           bytes -= cur_bytes;
>>           offset += cur_bytes;
>> @@ -253,7 +291,7 @@ cbw_co_snapshot_block_status(BlockDriverState *bs,
>>   {
>>       BDRVCopyBeforeWriteState *s = bs->opaque;
>>       BlockReq *req;
>> -    int ret;
>> +    int ret, ret2;
>>       int64_t cur_bytes;
>>       BdrvChild *child;
>> @@ -273,7 +311,14 @@ cbw_co_snapshot_block_status(BlockDriverState *bs,
>>           assert(ret & BDRV_BLOCK_ALLOCATED);
>>       }
>> -    cbw_snapshot_read_unlock(bs, req);
>> +    ret2 = cbw_snapshot_read_unlock(bs, req);
>> +
>> +    if (ret < 0) {
>> +        return ret;
>> +    }
>> +    if (ret2 < 0) {
>> +        return ret2;
>> +    }
>>       return ret;
>>   }
>> @@ -366,6 +411,7 @@ static BlockdevOptionsCbw *cbw_parse_options(QDict *options, Error **errp)
>>        * object for original options.
>>        */
>>       qdict_extract_subqdict(options, NULL, "bitmap");
>> +    qdict_del(options, "on-cbw-error");
>>   out:
>>       visit_free(v);
>> @@ -407,6 +453,8 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>>               return -EINVAL;
>>           }
>>       }
>> +    s->on_cbw_error = opts->has_on_cbw_error ? opts->on_cbw_error :
>> +            ON_CBW_ERROR_BREAK_GUEST_WRITE;
>>       bs->total_sectors = bs->file->bs->total_sectors;
>>       bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>> index e89f2dfb5b..3f08025114 100644
>> --- a/qapi/block-core.json
>> +++ b/qapi/block-core.json
>> @@ -4162,6 +4162,27 @@
>>     'base': 'BlockdevOptionsGenericFormat',
>>     'data': { '*bottom': 'str' } }
>> +##
>> +# @OnCbwError:
>> +#
>> +# An enumeration of possible behaviors for copy-before-write operation
>> +# failures.
>> +#
>> +# @break-guest-write: report the error to the guest. This way the state
>> +#                     of copy-before-write process is kept OK and
> 
> I’d be more verbose here: “This way, the guest will not be able to overwrite areas that cannot be backed up, so the backup remains valid.”

Sounds good

> 
> I like the bluntness of how these two options are named, by the way. That does clearly tell users what they’ll have to expect.
> 
>> +#                     copy-before-write filter continues to work normally.
>> +#
>> +# @break-snapshot: continue guest write. Since this, the snapshot state
>> +#                  provided by copy-before-write filter becomes broken.
> 
> Maybe “Doing so will invalidate the backup snapshot”?

"invalidate" word was never clear for me.. In our block-layer for example "invalidate" is opposite to "inactivate".

something like:
   
    Doing so will make the provided snapshot state invalid and any backup or export process based on it will finally fail.

?

> 
>> +#                  So, all in-flight and all further snapshot-access
>> +#                  operations (through snapshot-access block driver)
>> +#                  will fail.
>> +#
>> +# Since: 7.0
>> +##
>> +{ 'enum': 'OnCbwError',
>> +  'data': [ 'break-guest-write', 'break-snapshot' ] }
>> +
>>   ##
>>   # @BlockdevOptionsCbw:
>>   #
>> @@ -4183,11 +4204,15 @@
>>   #          modifications (or removing) of specified bitmap doesn't
>>   #          influence the filter. (Since 7.0)
>>   #
>> +# @on-cbw-error: Behavior on failure of copy-before-write operation.
>> +#                Default is @break-guest-write. (Since 7.0)
> 
> *7.1
> 
>> +#
>>   # Since: 6.2
>>   ##
>>   { 'struct': 'BlockdevOptionsCbw',
>>     'base': 'BlockdevOptionsGenericFormat',
>> -  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
>> +  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap',
>> +            '*on-cbw-error': 'OnCbwError' } }
>>   ##
>>   # @BlockdevOptions:
> 


-- 
Best regards,
Vladimir

