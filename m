Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017D04F2D56
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 13:37:04 +0200 (CEST)
Received: from localhost ([::1]:38760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbhUc-0004AB-9v
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 07:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nbhRn-0002SH-JG; Tue, 05 Apr 2022 07:34:07 -0400
Received: from smtp55.i.mail.ru ([217.69.128.35]:47968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nbhRl-0006Z0-7s; Tue, 05 Apr 2022 07:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=diwJQowV/DMOgk0LpZWyzH9osblLn6s5qDmdNMWrhPo=; 
 t=1649158445;x=1649763845; 
 b=nyS1fGvOqAIr7isl44pTSq8E14QSgWRgMm5ywkpKai1y7+ERUSc4zVvo6OyRge6wO6cuoaPCooTiHTNjJedB+1f6NQXpik1T5XGINXxYYbvzIKgZxNPjSo+jd7eHQuHS84UwtN8cz5ztNcoBE3+nooDKJMTl/GT5GbAM0GKniQ6Q6pw2Q8L9KIhrEL7dxXpxja7c6bhKJHoI/SIbSCEciXVUzRdcDQbaagi6B0S01rO6lAH8UbHR+ubgzqAn3DP7fSqn1YsSExxHcljL0hWJm5hwwEQHV2joNY10j/hjzoXVpw85mK9EOk6jvnCeg58YQFRIlLmOK4tOSxhNvMjb9g==;
Received: by smtp55.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nbhRg-0002JY-25; Tue, 05 Apr 2022 14:34:00 +0300
Message-ID: <f9d4d1de-e260-c64b-4f16-b2f26b3ce50f@mail.ru>
Date: Tue, 5 Apr 2022 14:33:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/7] block/block-copy: block_copy(): add timeout_ns
 parameter
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, vsementsov@openvz.org, stefanha@redhat.com,
 jsnow@redhat.com
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-6-vsementsov@openvz.org>
 <929f2a0d-e3d7-afad-b95b-d7f8b29fe077@redhat.com>
 <aa2e58e0-412b-161b-4f66-52d65a5bfd2f@mail.ru>
 <0e88e142-0a96-d867-034a-59091aa16602@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <0e88e142-0a96-d867-034a-59091aa16602@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp55.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD90FA8EB11E8F64C56FC2083200DA4A48F8179469474EE39DB182A05F538085040AEB27FD27D7ADBEEA219A512F83535AB493A554885841244DA7388A4F80D8623
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75A6765C746F51968EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063745476ED688D943148638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8770F49B1C7567B8B147CBE5FE56285EE6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7302A6E9DBA3751109FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD186FD1C55BDD38FC3FD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B5FC25ED3FCEC3375A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCF95EE0A5028F0C813AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637DE81888F2B2EFEBED81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FAE2BFB9A60527F4FCE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5FE1C5A65D2EF01D2B521A68CD506D5409B74DAA417A2A1B9D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342B8615F5CFAD9D023ACB80D817954FF0FC90A5F2D20A2B5778AACE2EEF4AB0E25600AE78A9703F6F1D7E09C32AA3244CDA10424643F79305D5EF8587E85890C605AB220A9D022EBCED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3Ye4yGrpcn9N/3KKz8y80w==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FED10BBC998AAB09D925EA8A6A8DB38069CC1D57080A158DB5E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.35;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp55.i.mail.ru
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

04.04.2022 17:39, Hanna Reitz wrote:
> On 01.04.22 18:08, Vladimir Sementsov-Ogievskiy wrote:
>> 01.04.2022 16:16, Hanna Reitz wrote:
>>> On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
>>>> Add possibility to limit block_copy() call in time. To be used in the
>>>> next commit.
>>>>
>>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>>>> ---
>>>>   block/block-copy.c         | 26 +++++++++++++++++++-------
>>>>   block/copy-before-write.c  |  2 +-
>>>>   include/block/block-copy.h |  2 +-
>>>>   3 files changed, 21 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/block/block-copy.c b/block/block-copy.c
>>>> index ec46775ea5..b47cb188dd 100644
>>>> --- a/block/block-copy.c
>>>> +++ b/block/block-copy.c
>>>
>>> [...]
>>>
>>>> @@ -894,12 +902,16 @@ int coroutine_fn block_copy(BlockCopyState *s, int64_t start, int64_t bytes,
>>>>           .max_workers = BLOCK_COPY_MAX_WORKERS,
>>>>       };
>>>> -    return block_copy_common(&call_state);
>>>> -}
>>>> +    ret = qemu_co_timeout(block_copy_async_co_entry, call_state, timeout_ns,
>>>> +                          g_free);
>>>
>>> A direct path for timeout_ns == 0 might still be nice to have.
>>>
>>>> +    if (ret < 0) {
>>>> +        /* Timeout. call_state will be freed by running coroutine. */
>>>
>>> Maybe assert(ret == -ETIMEDOUT);?
>>
>> OK
>>
>>>
>>>> +        return ret;
>>>
>>> If I’m right in understanding how qemu_co_timeout() works, block_copy_common() will continue to run here.  Shouldn’t we at least cancel it by setting call_state->cancelled to true?
>>
>> Agree
>>
>>>
>>> (Besides this, I think that letting block_copy_common() running in the background should be OK.  I’m not sure what the implications are if we do cancel the call here, while on-cbw-error is break-guest-write, though.  Should be fine, I guess, because block_copy_common() will still correctly keep track of what it has successfully copied and what it hasn’t?)
>>
>> Hmm. I now think, that we should at least wait for such cancelled background requests before block_copy_state_free in cbw_close(). But in "[PATCH v5 00/45] Transactional block-graph modifying API" I want to detach children from CBW filter before calling .close().. So, possible solution is to wait for all cancelled requests on .bdrv_co_drain_begin().
>>
>> Or alternatively, may be just increase bs->in_flight for CBW filter for each background cancelled request? And decrease when it finish. For this we should add a kind of callback to be called when timed-out coroutine entry finish.
> 
> in_flight sounds good to me.  That would automatically work for draining, right?
> 
> 

Yes it should

-- 
Best regards,
Vladimir

