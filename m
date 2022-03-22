Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965AB4E3CFC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:52:28 +0100 (CET)
Received: from localhost ([::1]:42582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWc7n-0002IL-Na
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:52:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWc5f-00088V-0w; Tue, 22 Mar 2022 06:50:15 -0400
Received: from smtp55.i.mail.ru ([217.69.128.35]:40022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nWc5c-0006VU-C5; Tue, 22 Mar 2022 06:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=BEANGy4m5gWxQVUYtieuwHlMfWIM21a+qkQv057roYg=; 
 t=1647946212;x=1648551612; 
 b=KySoPUEMm2yjqO+LIggXFYul/Vk9mxTzbXg5CVl4D2hYzDr1WiB18ZtjEX+A2Vz31zxlekGW9STIxWKWrTMXBXkbwjTwRD0E2wqJaAy8Wq+cLrUew+QWBOT3Lz56D4m7EJ7ynBDL5AYzvTfY9zfZHL+cdgBOe/1QP4RnZvym+36v/HlJ/ZX79SZMMc+xfVUmqrsgLsNCyftnf8L8YqqJ3HCkPUJOiimM9FBsWK1rkCF/5eh7UbNefzC7o/E/UUfwi4tAcvZkbrz7B02gHR5Hajnu9tQ3Qd+8yRl4O7VKDII4x+tLZbvGzBC8qbXtJrTmMq1i0Iq5w04wyyJhl6hczg==;
Received: by smtp55.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nWc5Y-000577-90; Tue, 22 Mar 2022 13:50:08 +0300
Message-ID: <dfb24ebb-74c7-2754-f38c-8abccd212463@mail.ru>
Date: Tue, 22 Mar 2022 13:50:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/3] iotests: Check for zstd support
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20220302124540.45083-1-hreitz@redhat.com>
 <91324d6a-0acb-3bbc-79e1-422982f2be6e@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <91324d6a-0acb-3bbc-79e1-422982f2be6e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp55.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196D8CF2CFB95539D9144AAA932A5836E553182A05F53808504076D8F28D07F18410BDAB52548242A265BEF27C83365521AAB5DE0B401F678632
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE793ECC5BC4DAF6EC5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006371D5B197C6EC5B4BE8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D85D5D8CDA623BCFD667053B01779416F16F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE764603B5C71CE8B8F9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18F04B652EEC242312D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B3733B5EC72352B9FA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC58EF6B6C4BA7D2813AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F790063764D99B6458681F42D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F29C2079CDE5AC980C6EABA9B74D0DA47B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A5A30DD2FC8FA53CAA28BB34240AAFB1326DEC2EE5E793E8ADD59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA7506FE1F977233B9BB410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3463DBE2ADA183F62F1155580C83B63CE7C21738F2AEDB18C6A0DD792FA3A2794ADDE5B0B291D6C7E01D7E09C32AA3244CA45CCF2E80593F7644FED72AC98561C9B038C9161EF167A183B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojYypBK0DWCMqKIrq8D9Ix4A==
X-Mailru-Sender: 6C3E74F07C41AE94BE5520CD20DE4F15FBC27BF1EC95F2C799C5585407639D6252A3109560D1A906E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
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

22.03.2022 12:48, Hanna Reitz wrote:
> Ping
> 
> On 02.03.22 13:45, Hanna Reitz wrote:
>> Hi,
>>
>> v1 cover letter:
>>
>> https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg04592.html
>>
>> We have two tests (as far as I know) that use compression_type=zstd for
>> qcow2 but do not check whether that is actually supported.  Thomas
>> reported this for 065, but it’s also the case for 303.
>>
>> This series makes 303 be skipped when zstd is not compiled in, and has
>> 065 use zlib for each of its test cases then (it was made to use zstd
>> just to improve on coverage, so using zlib as a fallback is perfectly
>> fine).
>>
>> v2:
>> - Add the first patch so that 065 and 303 can use these new iotests.py
>>    functions to check for zstd support instead of checking for their own
>>    qemu-img create’s output
>> - Have 065 fall back to zlib instead of skipping zstd test cases
>>
>>
>> Hanna Reitz (3):
>>    iotests.py: Add supports_qcow2_zstd_compression()
>>    iotests/065: Check for zstd support
>>    iotests/303: Check for zstd support
>>
>>   tests/qemu-iotests/065        | 24 ++++++++++++++++++------
>>   tests/qemu-iotests/303        |  4 +++-
>>   tests/qemu-iotests/iotests.py | 21 +++++++++++++++++++++
>>   3 files changed, 42 insertions(+), 7 deletions(-)
>>
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>

-- 
Best regards,
Vladimir

