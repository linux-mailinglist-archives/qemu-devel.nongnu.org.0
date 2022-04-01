Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265124EEFD0
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:29:56 +0200 (CEST)
Received: from localhost ([::1]:39262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIHj-0008S7-8Y
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:29:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naIBc-0005a8-0s; Fri, 01 Apr 2022 10:23:36 -0400
Received: from smtp37.i.mail.ru ([94.100.177.97]:34564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1naIBZ-00089i-57; Fri, 01 Apr 2022 10:23:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=+u6Er0W2Bfq6mITPcKUAFQtWSGoviV3yHupi0bvWqmM=; 
 t=1648823013;x=1649428413; 
 b=YpHLEDj1Qf/xVyOFHNiMjotMMqicPjEmnAFLjkzH8JFacWdas1IATwQEEVgvBs9fbJitIH1z8mavkBTcH5ksCoFV6WoaAAMAoeV7wxEnIvneU9gdqHlNzX4pN/Mg6jukMapZpolFFpbmPR6B6hrO5cQJycYPrUFC+7XT8I4Bf0B7/nDYT91frUNK86sIPBK+6a+xw4IKzFF57hwyvBFOX/if+G88HRK/5nBwf+4GrB8SXy3c/mtQEXdQitF1Y+9CnEiwK/sBEdd8wlNPt5aGdNNmidbJlWGg1QMFJ54m03GEfC/8GJyZoExa+jfy1KUnrZnsuMNcnsG6cpBeW76uhQ==;
Received: by smtp37.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1naIBV-0008FJ-44; Fri, 01 Apr 2022 17:23:29 +0300
Message-ID: <6e0786a3-f912-9aa0-63bb-b29b14c8bd33@mail.ru>
Date: Fri, 1 Apr 2022 17:23:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/7] util: add qemu-co-timeout
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 stefanha@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@openvz.org
References: <20220401091920.287612-1-vsementsov@openvz.org>
 <20220401091920.287612-5-vsementsov@openvz.org>
 <a6360f9e-008c-210f-0037-26054d99d44f@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <a6360f9e-008c-210f-0037-26054d99d44f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp37.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9771EFB8797C310D1E1BF93EDB477DECB541E6F1DEED947CC182A05F53808504094365B433261710924293236BCE095D417C62204E54D297EF2E719EEC50547AB
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7CB5C87C4C9A74E8BEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DEEC83A7CF8598608638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8C749C673CB1EBF449350465AE0BBC0936F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE76CD001D47D3CCD289FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751FE5D25F19253116ADD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BC5BB9672376CF5DAA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC441A79B3AE784F5FD81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE71BCDBE5F25F73B60EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3901E7AD39770591135872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A55B005F9343FDBE6E9A3050DA1CDEAD75B65DBAA05816C37DD59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75040BF32255FAA22B410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34EB7BD66E9101C1000F2A561CFA04D9BE9FE1928FD6511E77D6C4CCAB982EBBDB46035EBF706D46041D7E09C32AA3244C8A6F7FCB79FFABAE2B58EC2B54D3BC0F7101BF96129E4011ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojhgUChjrcp6GK1kN4v4YQyQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE958A14EA894A3F35D6614F1B2B33E109F32926FFFE615266E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.97;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp37.i.mail.ru
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

01.04.2022 16:13, Hanna Reitz wrote:
> On 01.04.22 11:19, Vladimir Sementsov-Ogievskiy wrote:
>> Add new API, to make a time limited call of the coroutine.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   include/qemu/coroutine.h | 13 ++++++
>>   util/meson.build         |  1 +
>>   util/qemu-co-timeout.c   | 89 ++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 103 insertions(+)
>>   create mode 100644 util/qemu-co-timeout.c
> 
> I don’t really understand what this does.  Intuitively, I would have assumed this makes the first yield of the respective coroutine not return when the timeout has elapsed, and instead, we switch back to qemu_co_timeout(), which returns to its callers.
> 
> But it looks like when this yield happens and we switch back to qemu_co_timeout(), the coroutine actually isn’t cancelled, and will just continue running, actually.  Is that right?  On first look, this looks like it’ll be quite difficult to think about what happens when this is used, because the coroutine in question is no longer run in sequence with its caller, but actually might run in parallel (even though it’s still a coroutine, so it’ll remain cooperative multitasking).
> 

Yes, the coroutine continue execution in parallel. That's a generic interface, and there is no way to "cancel" generic coroutine. So, caller should care about it.


-- 
Best regards,
Vladimir

