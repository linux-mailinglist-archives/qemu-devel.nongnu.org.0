Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717D76B9785
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 15:16:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc5Q4-0001XS-Mf; Tue, 14 Mar 2023 10:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pc5Ps-0001VL-7g
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 10:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pc5Pp-0000yQ-Nd
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 10:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678803249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Jo1nipRHEfeqixpn60IfH9xhp/v/Z6BlI9WHFhUnao=;
 b=E5EskE8o+8tMriaHKtgUDhzBleqgaqpTSXJ0oa93S8mJNkRPKcAI809A20RMu+ibyINKsM
 /dr1e5typ4Tt5sBiEQdvEXXUoSbdqiN6xYPBwq6YzLhSNT/bkcccmCkXzjGq5hjsGrPuCu
 9FfZJLDgfsOAX4/95kSL5YzydZc3fWU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-7Anw8yHcN4eMRxzctB-FrA-1; Tue, 14 Mar 2023 10:14:08 -0400
X-MC-Unique: 7Anw8yHcN4eMRxzctB-FrA-1
Received: by mail-wm1-f71.google.com with SMTP id
 fc11-20020a05600c524b00b003ed1fa46d1dso336416wmb.1
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 07:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678803247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Jo1nipRHEfeqixpn60IfH9xhp/v/Z6BlI9WHFhUnao=;
 b=3CPkHsNGC0M3M1IWdAyhlpXEcp1qJY2L1NP/QbYRtlhTrrFsV2HLmNBb6TEwZw0J89
 jTtN6/4nIfNywuqBAzW01rY5Srh2wCNy8dCdBIM74z1mIm9dvUOcAtElcMDwnjuR+r7c
 Icped+PJNDeN4K1GK9QIkIMpzoHA2rLttzNnsjHm+PIkcrnXWlloTa4jUGAP1HZtu+EM
 hQfqjUmifnHjPHy2oTczCuKgS2Mxg393QyWHbclX9S4HoNVW2TIRyLLaF34GyjyrPhL5
 8O0qQQ7ovv6lMIg9hJqpD7A3YE0BzcOEVu6r5GC5nqGgByeBzBr0oIEhOmrXZgixWBM9
 G9jQ==
X-Gm-Message-State: AO0yUKWZ+W0VRtEW4AUSmFlMA8xhJ/KmHJXp52L73CGo1/qRwMK9v3+N
 6Cc5DCOcAgUAn2vkEVA2q+bn+BGy4pOQPfgV2rS2RIHm+NDLtQtZ5MpjzKzqqq4eHnO+rrzEqai
 yOUH22l0tnRAI4eI=
X-Received: by 2002:a05:600c:1d29:b0:3eb:6878:5523 with SMTP id
 l41-20020a05600c1d2900b003eb68785523mr15539596wms.12.1678803246857; 
 Tue, 14 Mar 2023 07:14:06 -0700 (PDT)
X-Google-Smtp-Source: AK7set+lR2hZiiwHwQ6+UFVksnzufh6o4/BplMKWj8Wqda4XZXhWgia60JkfIKoHMn97d+zgOJSZ3g==
X-Received: by 2002:a05:600c:1d29:b0:3eb:6878:5523 with SMTP id
 l41-20020a05600c1d2900b003eb68785523mr15539585wms.12.1678803246604; 
 Tue, 14 Mar 2023 07:14:06 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-184.web.vodafone.de.
 [109.43.176.184]) by smtp.gmail.com with ESMTPSA id
 d9-20020a1c7309000000b003daf672a616sm2931182wmb.22.2023.03.14.07.14.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 07:14:05 -0700 (PDT)
Message-ID: <811c3baf-5fe5-a70a-bd6e-18ee91c10408@redhat.com>
Date: Tue, 14 Mar 2023 15:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] tests/qtest/migration-test: Disable postcopy/preempt tests
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 peterx@redhat.com
References: <20230314133310.1177954-1-peter.maydell@linaro.org>
 <a21f9c5f-d67f-8d88-d825-07d4175c56ef@redhat.com>
 <CAFEAcA92x061k1T0xRoHCT+9qb-0BT_Z75mPUFvSvdj5UDFqgg@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA92x061k1T0xRoHCT+9qb-0BT_Z75mPUFvSvdj5UDFqgg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/03/2023 15.08, Peter Maydell wrote:
> On Tue, 14 Mar 2023 at 14:01, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 14/03/2023 14.33, Peter Maydell wrote:
>>> The postcopy/preempt tests seem to have a race which makes them hang
>>> on the s390x CI runner.  Disable them for the moment, while we
>>> investigate.  As with the other disabled subtest, you can opt back in
>>> by setting QEMU_TEST_FLAKY_TESTS=1 in your environment.
>>>
>>> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>    tests/qtest/migration-test.c | 23 ++++++++++++++++-------
>>>    1 file changed, 16 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>>> index d4ab3934ed2..4643f7f49dc 100644
>>> --- a/tests/qtest/migration-test.c
>>> +++ b/tests/qtest/migration-test.c
>>> @@ -2464,6 +2464,11 @@ int main(int argc, char **argv)
>>>        const char *arch = qtest_get_arch();
>>>        g_autoptr(GError) err = NULL;
>>>        int ret;
>>> +    /*
>>> +     * Race condition suspected in the postcopy/preempt tests: see
>>> +     * https://lore.kernel.org/qemu-devel/CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com/
>>> +     */
>>> +    bool skip_postcopy_preempt = getenv("QEMU_TEST_FLAKY_TESTS");

You could maybe also call the variale skip_flaky_tests and use it in the 
other spot where you recently added a getenv() already.

  Thomas



