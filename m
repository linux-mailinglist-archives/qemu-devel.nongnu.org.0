Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548404EEEBA
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:00:20 +0200 (CEST)
Received: from localhost ([::1]:38414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHp5-0002DY-E8
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:00:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naHnb-0008Q6-Sh; Fri, 01 Apr 2022 09:58:47 -0400
Received: from smtp30.i.mail.ru ([94.100.177.90]:48870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naHnY-0004MU-2y; Fri, 01 Apr 2022 09:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=6OcGi0MAKte0PYUrdOBWkMaH1VbGbtmLxUvbmpagmo8=; 
 t=1648821524;x=1649426924; 
 b=h1U0uHoW6Zk8mRP1erSGkSo+NVUgVcaLmFjO3WCV873AOxUrXyenaJNVyjggY41cTcBPSKyujDpChyGkjf8+Z5qMNe1bdAiI5WeHuUbgvOfMFxPK5QhTyE6x6qo8yjWzdqL4/+hEwGdERNxKPvIYAtLsPtPbmQFzYP7HZrzMe4QMAFPu9bTRKkXNdg6uZ0Nt/pwZ/7KDFM7piLekdAGsrWDJCj9XPhc7WLQbwuO/GOT6uHCPa0etCmaWhMLH/LT1WLEvv2DmI0PElmt1cqr95ulQMb+HEqmfG/2z3x+13iEkwRRTWt/5PaiE6ME1e4YFNSgd+apPoSV2IwHRjk4gJg==;
Received: by smtp30.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1naHnU-0006SM-2b; Fri, 01 Apr 2022 16:58:40 +0300
Message-ID: <d89a3b93-0bd5-db4c-ba08-d52e0a8bffdc@mail.ru>
Date: Fri, 1 Apr 2022 16:58:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 6/7] block/copy-before-write: implement cbw-timeout
 option
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@openvz.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-7-vsementsov@openvz.org>
 <14f219f3-be1c-888e-3076-779de736a2c0@redhat.com>
 <233b9b99-bb0b-4149-65bb-699a3783a1a9@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <233b9b99-bb0b-4149-65bb-699a3783a1a9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp30.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD96DC212D1D15EACC4ACA8308985A3EC9B455786C35F6180B1182A05F5380850404C228DA9ACA6FE278AED742B81D4A67E6826C28D9665372414B7478F27AB8FB4D89D2B3E425821BB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE706CBCB8C0AB1BC4FEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FF37B1FF54E2C7C48638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8BBCC488B8867974B6347DA3778BE57806F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74796267E12EBBF229FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B55D5BE2F85BDEC5FA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC98E65B3B218E692D3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063750C2B358740BB6D8EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C33DEAD47B5EA388C235872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A50078CD691EEF5FB8EC8ED2370AF836382492A669239841FFD59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3407FE5477D6A8AF084417C3B6FDBDBC1263DF107891B4B9A4AEE422B71BD57C67E959A187ED6EC7331D7E09C32AA3244C78EA230026C1CABA6EBC7006A74DD91A5A1673A01BA68E40ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojhgUChjrcp6EExY3uam2+LQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE6800ED10D491D2F6A42AA90FD3C3B23C16E256B11BC4C1E9E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.90;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp30.i.mail.ru
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

01.04.2022 16:28, Hanna Reitz wrote:
> On 01.04.22 15:24, Hanna Reitz wrote:
>> On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
>>> In some scenarios, when copy-before-write operations lasts too long
>>> time, it's better to cancel it.
>>>
>>> Most useful would be to use the new option together with
>>> on-cbw-error=break-snapshot: this way if cbw operation takes too long
>>> time we'll just cancel backup process but do not disturb the guest too
>>> much.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>>> ---
>>>   block/copy-before-write.c | 6 +++++-
>>>   qapi/block-core.json      | 5 ++++-
>>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>>
> 
> [...]
> 
>>> diff --git a/qapi/block-core.json b/qapi/block-core.json
>>> index 3f08025114..e077506e0f 100644
>>> --- a/qapi/block-core.json
>>> +++ b/qapi/block-core.json
>>> @@ -4207,12 +4207,15 @@
>>>   # @on-cbw-error: Behavior on failure of copy-before-write operation.
>>>   #                Default is @break-guest-write. (Since 7.0)
>>>   #
>>> +# @cbw-timeout: Zero means no limit. Non-zero sets the timeout in seconds
>>> +#               for copy-before-write operation. Default 0. (Since 7.0)
>>
>> *7.1, but:
>>
>> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> 
> On second thought, perhaps we should make an explicit note that a timeout means an error?  E.g. “When a timeout occurs, the respective copy-before-write operation will fail, and the @on-cbw-error parameter will decide how this failure is handled.”
> 

Agree, worth noting, will add.

-- 
Best regards,
Vladimir

