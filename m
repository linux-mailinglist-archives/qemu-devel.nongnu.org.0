Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BDE4F7D3F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 12:48:03 +0200 (CEST)
Received: from localhost ([::1]:54672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncPgI-0007ZX-2A
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 06:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1ncPdn-0006fR-No; Thu, 07 Apr 2022 06:45:27 -0400
Received: from smtp31.i.mail.ru ([94.100.177.91]:57686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1ncPdg-0004PR-Sw; Thu, 07 Apr 2022 06:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=25zH8q1U00C7SmoiK0cfF100vxxNNb7/9xV72gs0/VM=; 
 t=1649328320;x=1649933720; 
 b=gqJkO03Mavyi8xyucnmlaVu6q9n6jq5cJZlRO8lybKsrD3aH9cOVax7bi12gwik0OK7gq7HB5gPxPqn9+ZZGnTymc2kLLEW+wfwQKAitOZa/dXaGkP5N1UDq+xw5FkwSJxwM29qM+5rPBS8VAWl75BDs/mEqOpvFUX1qX54d3wd4uF/WW7KJOU77YySXKuziM/g7oaCbLPy8pGenRlBl7quSswVdon9UgS0SbiFHcU5jIcTqqw9h6p57w0uyaDwlNKukQ37aPGRNnjKCFOQfYhN//yCtAQPdNn1gbZdGvyqojc6ciuyZrnJ95CH2H2Z69DqGQA6bYELUws3vt3tP5A==;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1ncPdc-0001a0-GU; Thu, 07 Apr 2022 13:45:17 +0300
Message-ID: <eb8fd7ca-6e71-236c-ddbd-3ca176e71f91@mail.ru>
Date: Thu, 7 Apr 2022 13:45:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] block/throttle-groups: use QEMU_CLOCK_REALTIME for
 qtest too
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, berto@igalia.com,
 vsementsov@openvz.org
References: <20220406153202.332186-1-vsementsov@openvz.org>
 <20220406153202.332186-2-vsementsov@openvz.org>
 <8d1a8d01-82c6-c6be-43e9-e8dde0c94467@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <8d1a8d01-82c6-c6be-43e9-e8dde0c94467@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp31.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD90FA8EB11E8F64C5639B5F8A763EE6707152DF9FAA08A7BCF182A05F538085040C72DF5D42AC8BBAA590A388ABABF8D7581BB180312BCD09348968C1F83ABAD12
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7965AF5021CACFC74C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7F65C230EDDCD559EEA1F7E6F0F101C6723150C8DA25C47586E58E00D9D99D84E1BDDB23E98D2D38BEBC5CAB6D411FFA63488DF74C997BC47624957D8F0D068F620879F7C8C5043D14489FFFB0AA5F4BF176DF2183F8FC7C0EF2A066DDA19BA868941B15DA834481FA18204E546F3947CA9FF340AA05FB58CF6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F790063793270F7220657A0A389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F7900637C4945DEF30497E25D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE77E1C1A36D5859E4ACD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6AAFF6397ACA71750089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A54BCB7B2FE78E128999CEB85072F373984BEB0AA08DA0FCE7D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34C53D1911AD7E4199C74F1388ABAAC67E7CF6E1EEDBC7346D08BDEB2FB001625FA6618A06D46292891D7E09C32AA3244C630612205BB2CEF08F73A740F1D595D6408A6A02710B7304DCA3B3C10BC03908
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojzDs61/8Pi1FXj2hOhbyvdA==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913F3E24E6875288B34F43A99A0AE63E2926645FBFBC26B0761E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.91;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp31.i.mail.ru
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

Thanks for explanation!

07.04.2022 09:42, Hanna Reitz wrote:
> On 06.04.22 17:32, Vladimir Sementsov-Ogievskiy wrote:
>> Virtual clock just doesn't tick for iotests, and throttling just not
>> work. Let's use realtime clock.
> 
> It does tick when you make it take, specifically with the clock_step qtest command.  093 does this, and so with this patch, it fails, because it is no longer deterministic.
> 
> So far, if I needed realtime throttling, I simply switched the accelerator to tcg (e.g. in stream-error-on-reset).

Hm, I tried but it doesn't help (Add vm.add_args('-accel', 'tcg') before vm.launch() in the test), as " -accel qtest" is kept anyway, and therefore do_configure_accelerator is called for qtest and finally qtest_allowed is set to true.

But using QEMUMachine class instead of VM helps.

> 
> I’m not really opposed to this, but it does break 093, and without looking too closely into it, I would guess that it’d be difficult to rewrite 093 in a deterministic way without it relying on throttling using the virtual clock.  (A runtime option for the throttle-group object to choose the clock type might be an option.)

OK, I don't think we need these patches now.

> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   block/throttle-groups.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/block/throttle-groups.c b/block/throttle-groups.c
>> index fb203c3ced..029158d797 100644
>> --- a/block/throttle-groups.c
>> +++ b/block/throttle-groups.c
>> @@ -753,10 +753,6 @@ static void throttle_group_obj_init(Object *obj)
>>       ThrottleGroup *tg = THROTTLE_GROUP(obj);
>>       tg->clock_type = QEMU_CLOCK_REALTIME;
>> -    if (qtest_enabled()) {
>> -        /* For testing block IO throttling only */
>> -        tg->clock_type = QEMU_CLOCK_VIRTUAL;
>> -    }
>>       tg->is_initialized = false;
>>       qemu_mutex_init(&tg->lock);
>>       throttle_init(&tg->ts);
> 


-- 
Best regards,
Vladimir

