Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2A58C8A0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 14:53:26 +0200 (CEST)
Received: from localhost ([::1]:48786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL2G5-0002s8-9G
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 08:53:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oL26x-0000rq-5n
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:43:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oL26t-0007Fc-Tf
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 08:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659962633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1DhnKtPiQ8QZVg/4iM0AQ45a5mJviRK3i3PsVngj3BE=;
 b=GexndpkUYYYb4nYYaqV6mYBWGLc3UE/067t7ZOMnV1wBK5HTzCurZ+JzGENRvcL+PY2cR9
 GN+YxPpW0+yLPqMvMjCPJL8LZOzwOzgVM7Q5uB8YbLxqI9gqQhBQNHVqziZUSOK4dBoaK/
 gXwfGtrJVZLa1ulcaQJG8yjD+FJYeTk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-ekS4_w73NTeTXfujmgMYNg-1; Mon, 08 Aug 2022 08:43:52 -0400
X-MC-Unique: ekS4_w73NTeTXfujmgMYNg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h65-20020a1c2144000000b003a30cae106cso8313786wmh.8
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 05:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=1DhnKtPiQ8QZVg/4iM0AQ45a5mJviRK3i3PsVngj3BE=;
 b=agaAk49ZRQg8AI9SveWF6Uq1UDFu4YOKOA2SvIXxTzkJHvWbaOhlz8JAaIG7yccAjG
 c68RE7+AAc2VyKN7aYbC31KP2P8imuqGE1Oha67ax8GUrA13RQSRGq71G6xYbkkkV0z2
 Vq41KbLxLc3DkrooFCkWs498K2bnN9kpGiCo9vC34DgkvSjSjrnjmt9dq/9JoirySQss
 FlEvjN0HyJkXWHnf+Tx3ZuYgL0O/SrqEbYH9s9ONxTuI5xqpiLEpmAhUMs88VHd9gOeH
 ZOvEdo5Ly4AdMRA4Y7fTz52ZLKUtmwC6Fn4Zgl6MhLS6ZTQ/LpvSTtIKbnt7izvRKQTK
 TXcg==
X-Gm-Message-State: ACgBeo2Y70HhR9ybINB7FpNKlDHdC+k7OB+R9xLx0GxdO1l/NiH1X/U0
 E6W4OQozhInytQukngB1fkyVqEUrVzwJNqat1o313LyqkGL2msu6eybK/uwjDEjfl9XKAyQns//
 vSjl2DSXar7Y7+yY=
X-Received: by 2002:a1c:4c11:0:b0:3a5:4d01:54be with SMTP id
 z17-20020a1c4c11000000b003a54d0154bemr1605079wmf.32.1659962631446; 
 Mon, 08 Aug 2022 05:43:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6sclObL6IN4BKj7euFYA4voiqRdI3UGthSwzicrrC0R9wA0WOcfaDpVTj1qXtHKFDOci/HbA==
X-Received: by 2002:a1c:4c11:0:b0:3a5:4d01:54be with SMTP id
 z17-20020a1c4c11000000b003a54d0154bemr1605064wmf.32.1659962631265; 
 Mon, 08 Aug 2022 05:43:51 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-42-113-71.web.vodafone.de.
 [109.42.113.71]) by smtp.gmail.com with ESMTPSA id
 u11-20020adfeb4b000000b0021f15514e7fsm13283423wrn.0.2022.08.08.05.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 05:43:50 -0700 (PDT)
Message-ID: <41dd9dd2-55bc-5a49-1bf7-757373dac465@redhat.com>
Date: Mon, 8 Aug 2022 14:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Migration tests are very slow in the CI
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <7bf333f0-7bdc-1ba7-2a45-ffa2894ad809@redhat.com>
 <YvD+FXVf//5xvlgy@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <YvD+FXVf//5xvlgy@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 08/08/2022 14.14, Daniel P. Berrangé wrote:
> On Mon, Aug 08, 2022 at 01:57:17PM +0200, Thomas Huth wrote:
>>
>>   Hi!
>>
>> Seems like we're getting more timeouts in the CI pipelines since commit
>> 2649a72555e ("Allow test to run without uffd") enabled the migration tests
>> in more scenarios.
>>
>> For example:
>>
>>   https://gitlab.com/qemu-project/qemu/-/jobs/2821578332#L49
>>
>> You can see that the migration-test ran for more than 20 minutes for each
>> target (x86 and aarch64)! I think that's way too much by default.
> 
> Definitely too much.
> 
>> I had a check whether there is one subtest taking a lot of time, but it
>> rather seems like each of the migration test is taking 40 to 50 seconds in
>> the CI:
>>
>>   https://gitlab.com/thuth/qemu/-/jobs/2825365836#L44
> 
> Normally with CI we expect a constant slowdown factor, eg x2.
> 
> I expect with migration though, we're triggering behaviour whereby
> the guest workload is generating dirty pages quicker than we can
> migrate them over localhost. The balance in this can quickly tip
> to create an exponential slowdown.

If I run the aarch64 migration-test on my otherwise idle x86 laptop, it also 
takes already ca. 460 seconds to finish, which is IMHO also already too much 
for a normal "make check" run (without SPEED=slow).

> I'm not sure if  'g_test_slow' gives us enough granularity though, as
> if we enable that, it'll impact the whole test suite, not just
> migration tests.

We could also check for the GITLAB_CI environment variable, just like we 
already do it in some of the avocado-based tests ... but given the fact that 
the migration test is already very slow on my normal x86 laptop, I think I'd 
prefer if we added some checks with g_test_slow() in there ...

Are there any tests in migration-test.c that are rather redundant and could 
be easily skipped in quick mode?

  Thomas


