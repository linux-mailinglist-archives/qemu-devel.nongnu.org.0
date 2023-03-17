Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0DE6BE961
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 13:37:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pd9JX-0003aX-T7; Fri, 17 Mar 2023 08:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd9JS-0003a8-00
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pd9JN-0007r8-Ef
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 08:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679056555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7xypAtLDjb46NZ2nAuHa+uynWiR7cEaJ2tIpSxTeag=;
 b=Xc9RVUfCmPIqVyxR9q+QYj4Cy2mfFHllM0jrW2Z4Hv81aye2/oAl4CjKnv5IgukRg4Vz1i
 yLnkIUKdx70UvwRcTQXYpaRnIHKAa6EbTRsTV7cIwMsYQy4v8wMDo3+zVS8RNRVkJ8Grlj
 7V3riZi2nTD3Jxie2g93uNRjpmmzx7Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-o1JsLkbKP9qPHvglQjYMTQ-1; Fri, 17 Mar 2023 08:35:54 -0400
X-MC-Unique: o1JsLkbKP9qPHvglQjYMTQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k18-20020a05600c1c9200b003ed2a3f101fso4204314wms.9
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 05:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679056553;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z7xypAtLDjb46NZ2nAuHa+uynWiR7cEaJ2tIpSxTeag=;
 b=sUaTsnR+OpS50oJ/oAJ2x7VCx6C7oHHpYeeS+PvlVoLKbGQiiBHE+7Yic+/2+YqwCn
 4xnfTWT2x6DYUZbLBiq+RxYNlRJEtdTK3h6FCKtfJsQVFnhK6hVeQbR1PQASKVAFrsgl
 UYKMZY2leo6bJ4xnwdg8WcEeIYtpP9iljCZaYPRyR64w/z4wBU1kN6hgsh+3u/09FFHU
 g3estgiXdyWy06orMg/q++DepJjMtuYY2YsaHN1QgIqKw3k2DaFbgQRlJit9+ezIWyDT
 CJAFVIDZdvzwOXpM3mohD8x34pAl+InGQKvKXWdy38CDjQDnDqiZFvl1dMUuvLkmJcOj
 FIdw==
X-Gm-Message-State: AO0yUKUuAupSIf/EXhR6QlwTnQbPxFgUEkt4dfgior35rSllX06p8eyW
 fsKbcBs5CoNdDliNOfEgeRrvzUAB12FEXiOI1f5JOoB03KI5Eq1PQ58k3TiswxU8bgIcHPrDGxy
 vuphWi6By/T8AJ5M=
X-Received: by 2002:a05:600c:524c:b0:3ed:352a:a1d3 with SMTP id
 fc12-20020a05600c524c00b003ed352aa1d3mr9665382wmb.22.1679056553086; 
 Fri, 17 Mar 2023 05:35:53 -0700 (PDT)
X-Google-Smtp-Source: AK7set8xOiubTPVLPeMnTJuVekWz1JZ4fj9RYRB+6wStvoGXfXs6TdQTC7RxFOBMzppDAEdPPtmAtw==
X-Received: by 2002:a05:600c:524c:b0:3ed:352a:a1d3 with SMTP id
 fc12-20020a05600c524c00b003ed352aa1d3mr9665371wmb.22.1679056552788; 
 Fri, 17 Mar 2023 05:35:52 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de.
 [109.43.176.33]) by smtp.gmail.com with ESMTPSA id
 a7-20020a5d5087000000b002c55306f6edsm1871255wrt.54.2023.03.17.05.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 05:35:52 -0700 (PDT)
Message-ID: <df71d7b5-7723-eaff-3dcd-45f69186f6af@redhat.com>
Date: Fri, 17 Mar 2023 13:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: test-blockjob: intermittent CI failures in msys2-64bit job
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Alberto Garcia <berto@igalia.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <CAFEAcA_SeUuZRo7HQPUJgeaepoup29YdAuFaWjNL+fhEt+pmkA@mail.gmail.com>
 <CAFEAcA87HtzYN76nHhHZBfazDZdoRnszgAt-e2CqBBWEoF6_2Q@mail.gmail.com>
 <CAFEAcA-n+9N+0ZuE6MSD1aMBeGYAJTbQe=j1-2K=SgD_Ly6nEA@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFEAcA-n+9N+0ZuE6MSD1aMBeGYAJTbQe=j1-2K=SgD_Ly6nEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 17/03/2023 11.17, Peter Maydell wrote:
> On Mon, 6 Mar 2023 at 11:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Fri, 3 Mar 2023 at 18:36, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> I've noticed that test-blockjob seems to fail intermittently
>>> on the msys2-64bit job:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3872508803
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3871061024
>>> https://gitlab.com/qemu-project/qemu/-/jobs/3865312440
>>>
>>> Sample output:
>>> | 53/89 ERROR:../tests/unit/test-blockjob.c:499:test_complete_in_standby:
>>> assertion failed: (job->status == JOB_STATUS_STANDBY) ERROR
>>> 53/89 qemu:unit / test-blockjob ERROR 0.08s exit status 3
> 
>> Here's an intermittent failure from my macos x86 machine:
>>
>> 172/621 qemu:unit / test-blockjob
>>             ERROR           0.26s   killed by signal 6 SIGABRT
> 
> And an intermittent on the freebsd 13 CI job:
> https://gitlab.com/qemu-project/qemu/-/jobs/3950667240
> 
>>>> MALLOC_PERTURB_=197 G_TEST_BUILDDIR=/tmp/cirrus-ci-build/build/tests/unit G_TEST_SRCDIR=/tmp/cirrus-ci-build/tests/unit /tmp/cirrus-ci-build/build/tests/unit/test-blockjob --tap -k
> ▶ 178/650 /blockjob/ids
>             OK
> 178/650 qemu:unit / test-blockjob
>             ERROR           0.31s   killed by signal 6 SIGABRT
> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> stderr:
> Assertion failed: (job->status == JOB_STATUS_STANDBY), function
> test_complete_in_standby, file ../tests/unit/test-blockjob.c, line
> 499.
> 
> 
> TAP parsing error: Too few tests run (expected 9, got 1)
> (test program exited with status code -6)
> ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> Anybody in the block team looking at these, or shall we just
> disable this test entirely ?

I ran into this issue today, too:

  https://gitlab.com/thuth/qemu/-/jobs/3954367101

... if nobody is interested in fixing this test, I think we should disable it...

  Thomas


