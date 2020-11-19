Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEF2B8CA1
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 08:56:35 +0100 (CET)
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfeny-0007lc-Dz
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 02:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfeml-00077f-UR
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 02:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfemi-0000aj-Ob
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 02:55:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605772515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vh7Te/NwyVq7zOA1EUnbBODksjd9sq49sv5NgK1BvEk=;
 b=GCvw4CVYZv1g+jaswKaWP0NYoEVuQ0qFO9zVo+gqn++vAyGL/jGca7x2emYQkqMkBL7P3/
 LOAoGengqGm5p51DIIZqdGsqPyKfb4lYUa++JR3trnKvmK8Jq7B4rZxWegqf/P0UNCswPC
 4wFkMznEEd6cJOEsOCOhrIGziti2mbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-vhifZ1bJNMOtd3EshILjug-1; Thu, 19 Nov 2020 02:55:11 -0500
X-MC-Unique: vhifZ1bJNMOtd3EshILjug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7638A80048F;
 Thu, 19 Nov 2020 07:55:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-109.ams2.redhat.com [10.36.113.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F6BD19C4F;
 Thu, 19 Nov 2020 07:55:06 +0000 (UTC)
Subject: Re: [PATCH-for-5.2? 1/2] tests/qtest: variable defined by g_autofree
 need to be initialized
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Chen Qun <kuhn.chenqun@huawei.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
References: <20201118115646.2461726-1-kuhn.chenqun@huawei.com>
 <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
 <cd63f998-e3fe-d93f-f515-a47103592e05@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5abd4a9c-d8bf-6918-26fa-7921f6c08195@redhat.com>
Date: Thu, 19 Nov 2020 08:55:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cd63f998-e3fe-d93f-f515-a47103592e05@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 23:36:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, peter.maydell@linaro.org,
 zhang.zhanghailiang@huawei.com, hskinnemoen@google.com, wuhaotsh@google.com,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2020 13.13, Philippe Mathieu-Daudé wrote:
> On 11/18/20 12:56 PM, Chen Qun wrote:
>> According to the glib function requirements, we need initialise
>>  the variable. Otherwise there will be compilation warnings:
>>
>> glib-autocleanups.h:28:3: warning: ‘full_name’ may be
>> used uninitialized in this function [-Wmaybe-uninitialized]
>>    28 |   g_free (*pp);
>>       |   ^~~~~~~~~~~~
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
>> ---
>>  tests/qtest/npcm7xx_timer-test.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer-test.c
>> index f08b0cd62a..83774a5b90 100644
>> --- a/tests/qtest/npcm7xx_timer-test.c
>> +++ b/tests/qtest/npcm7xx_timer-test.c
>> @@ -512,11 +512,9 @@ static void test_disable_on_expiration(gconstpointer test_data)
>>   */
>>  static void tim_add_test(const char *name, const TestData *td, GTestDataFunc fn)
>>  {
> 
> Or:
> 
>> -    g_autofree char *full_name;
>   +    g_autofree char *full_name = NULL;

I think we better go with the current version of the patch - otherwise a
supersmart new compiler version might warn again that the NULL that we
assign here is never used...

Reviewed-by: Thomas Huth <thuth@redhat.com>


