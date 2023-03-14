Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F308F6B9D4A
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:45:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc8iN-0004HK-5J; Tue, 14 Mar 2023 13:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pc8iK-0004Gg-SP
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:45:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pc8iJ-0003ss-6A
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:45:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678815930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUKrk6zvfzniIhhSitO6rQcRyICLKcteleyS+UBkN4k=;
 b=e+4frZPqamR/PPVGxvLEKCJh8m3icYjztiY7Xdi9zR6QtbWFh2XUx4ThjMZF5EUhPbu72I
 y1syH5RZQlkCKHrRJOV0kO4aPB3ZQpMLgzoTMjKxUzoVJVG32ZdbdlQD+aJ/V85iAEMMZ/
 D5FSpPqbGYSelaJwrrzS3XWSLwpqd64=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-1xkgzOLaPVuQEoQ41048ig-1; Tue, 14 Mar 2023 13:45:29 -0400
X-MC-Unique: 1xkgzOLaPVuQEoQ41048ig-1
Received: by mail-wm1-f72.google.com with SMTP id
 bi27-20020a05600c3d9b00b003e9d0925341so5794992wmb.8
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 10:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678815928;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QUKrk6zvfzniIhhSitO6rQcRyICLKcteleyS+UBkN4k=;
 b=VTFODu6gf8jqmq0IzfW0lLtgKH5t1eNFvGg1Isnu2SUfSCZdJNUdwiLZxuMkp3YUxV
 jCs9AfmymOpwmDKMvE3q929M9YZGa+QC1DXj7RTQuXt2FUSNe+oyBsvhb4ZRGUiRj5tw
 vLV7uUSxNkokQHSTyBOkRzCMC17h8n6yvxz16Emn1O4jE5OlzrHKdfCWcEsDCQzaryG5
 rcnRMnauSCn41rN2+A9r6wh2VUduxQ28c+yAb76/xr+Zh9W8zvLijQYCZQ2z2DVhsbgv
 CFi8btLF9JM4EteFhtu6RgalV02ht1D+mT7OmajV1w92E/VCt6+RkXB/UZTj8s+jItTW
 zmEQ==
X-Gm-Message-State: AO0yUKUgFR4PYhZD6TsC9/OTDGwwD+HzQmZSpD5N6W26TVBbTobCVfzW
 wJG4/gsDquojqNt2n+ADNtaM575rJ7PYoa+k06iBMDUabXSGZKstsT6uGZzpIEeEVV+yJhtQGIT
 PeZBUaB88Srq6Dug=
X-Received: by 2002:a05:600c:3b12:b0:3ed:2a3d:be6f with SMTP id
 m18-20020a05600c3b1200b003ed2a3dbe6fmr4599950wms.36.1678815928361; 
 Tue, 14 Mar 2023 10:45:28 -0700 (PDT)
X-Google-Smtp-Source: AK7set8xxqQr2d22WlwG34EhFZVCaOxcRuc9BWshNvTZNISA2DLKtVt4V5crpfNc5C1YQzaxkLppHQ==
X-Received: by 2002:a05:600c:3b12:b0:3ed:2a3d:be6f with SMTP id
 m18-20020a05600c3b1200b003ed2a3dbe6fmr4599942wms.36.1678815928135; 
 Tue, 14 Mar 2023 10:45:28 -0700 (PDT)
Received: from [192.168.8.107] (tmo-099-230.customers.d1-online.com.
 [80.187.99.230]) by smtp.gmail.com with ESMTPSA id
 p1-20020a1c7401000000b003e1202744f2sm3366027wmc.31.2023.03.14.10.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 10:45:27 -0700 (PDT)
Message-ID: <df010d2a-df6e-22fd-6b79-566489903cca@redhat.com>
Date: Tue, 14 Mar 2023 18:45:25 +0100
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
 <811c3baf-5fe5-a70a-bd6e-18ee91c10408@redhat.com>
 <CAFEAcA904=NOW5236nmMWWf9-uHGdgkYHc6Z1MS7z-bRw-k04w@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA904=NOW5236nmMWWf9-uHGdgkYHc6Z1MS7z-bRw-k04w@mail.gmail.com>
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

On 14/03/2023 15.17, Peter Maydell wrote:
> On Tue, 14 Mar 2023 at 14:14, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 14/03/2023 15.08, Peter Maydell wrote:
>>> On Tue, 14 Mar 2023 at 14:01, Thomas Huth <thuth@redhat.com> wrote:
>>>>
>>>> On 14/03/2023 14.33, Peter Maydell wrote:
>>>>> The postcopy/preempt tests seem to have a race which makes them hang
>>>>> on the s390x CI runner.  Disable them for the moment, while we
>>>>> investigate.  As with the other disabled subtest, you can opt back in
>>>>> by setting QEMU_TEST_FLAKY_TESTS=1 in your environment.
>>>>>
>>>>> Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>>>> ---
>>>>>     tests/qtest/migration-test.c | 23 ++++++++++++++++-------
>>>>>     1 file changed, 16 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
>>>>> index d4ab3934ed2..4643f7f49dc 100644
>>>>> --- a/tests/qtest/migration-test.c
>>>>> +++ b/tests/qtest/migration-test.c
>>>>> @@ -2464,6 +2464,11 @@ int main(int argc, char **argv)
>>>>>         const char *arch = qtest_get_arch();
>>>>>         g_autoptr(GError) err = NULL;
>>>>>         int ret;
>>>>> +    /*
>>>>> +     * Race condition suspected in the postcopy/preempt tests: see
>>>>> +     * https://lore.kernel.org/qemu-devel/CAFEAcA-q1UwPePdHTzXNSX4i6Urh3j6h51kymy6=7SzDAFU87w@mail.gmail.com/
>>>>> +     */
>>>>> +    bool skip_postcopy_preempt = getenv("QEMU_TEST_FLAKY_TESTS");
>>
>> You could maybe also call the variale skip_flaky_tests and use it in the
>> other spot where you recently added a getenv() already.
> 
> That would make it a bit harder to do a simple revert of the
> commits when we figure out the cause of the problem, though.

Ok, fair.

So with the "!" added before the getenv:
Reviewed-by: Thomas Huth <thuth@redhat.com>


