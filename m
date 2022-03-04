Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0DB4CDC50
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 19:24:35 +0100 (CET)
Received: from localhost ([::1]:36274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQCbR-0000WK-Td
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 13:24:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nQBvl-0006oV-Gn
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:41:32 -0500
Received: from [2a00:1450:4864:20::52c] (port=37534
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nQBvh-0003T6-O2
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 12:41:28 -0500
Received: by mail-ed1-x52c.google.com with SMTP id q17so11708041edd.4
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 09:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y4X7zZ5JAuLGLSwyywi1CGH7/ISSL4imA7QsyDqRVvY=;
 b=Zg83Wu4hFYRokDvKj5bNo3JgAal33bZHydm7mZEKM7SIdifIT+Hq1rseBbkJpKjMbp
 Nto4G1cG2sdi0KujPF1+Jwt81wBhmC6cMHi+bLR1L4waMWVzD7EE299uSzsSwEn+vK1C
 CfMzYeJso+aMFo4Sr2BWjHBHRzR2/cjdu8S6p+q5Uv5xfstbO5F4SAylWTK3qAsCGCC2
 CQO+lCKJrFuGKSaXf4AycQwwRxVYX36b7Lt9cAcjrdp4IN9DYFnNFzHwq50jqbDrRW8r
 pxu1FgTWYl9P7HyY/lSZwbnUWOKgQupZl3TQD969S86NQYI42gS8BKDNndq9adL1x/kl
 6PVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=y4X7zZ5JAuLGLSwyywi1CGH7/ISSL4imA7QsyDqRVvY=;
 b=6CCo2tm1y9O+SUYChIACsrf+cJ6JzC7SPCpX/ETcGApnGkwTt4avNQH3Qk+vMe3y9P
 isx0ffmseLbvGT/f9RU01TqfU4TtiPrmxJq7mAgczsemTvaa4mNL2XlORSq2Wg3ATOdX
 jSoOfyzYLvFfOJcHHaiNvilaOuf1FnJn4wYNVVqmdI+uuzTdgDyK2HQ0oudX6jBxgOuB
 aoelVDXgFOzik5DQTWUB5/w/OxhgouY4VpHQW5ajQLJF0nUAubWR6GOSL+L38Zf21+m9
 zpPLMiXGCLqlJvBOt0LTjdew8OKRa6rmqXCj+nHUyhA17dw7O8jB090NHQJPpN1KJits
 K6Jw==
X-Gm-Message-State: AOAM5338dttm/VcfpQS09TcjFd0ipQSbXjou0i03Eyy0pvxR5jspdYgD
 dy9geZh2WGVQihaiSEjeT5w=
X-Google-Smtp-Source: ABdhPJzB3VIasiLQ6GnCf6o1ez13jAjzevy7NMOPI/yRV/yHHnyn2GmtJ/cw8xX0ITZf6IhHRK2xBw==
X-Received: by 2002:a05:6402:151a:b0:416:187f:bf8d with SMTP id
 f26-20020a056402151a00b00416187fbf8dmr71437edw.126.1646415682765; 
 Fri, 04 Mar 2022 09:41:22 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 qk8-20020a1709077f8800b006d6e920af3esm1954985ejc.87.2022.03.04.09.41.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 09:41:22 -0800 (PST)
Message-ID: <088024f5-7066-e6ec-953e-f55d7ff83b96@redhat.com>
Date: Fri, 4 Mar 2022 18:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL 00/11] QEMU changes for 2021-03-02
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220302181134.285107-1-pbonzini@redhat.com>
 <CAFEAcA8=8tiqmFTFPaNXcqjXy6Rb5xR59Q2VYUXOTbN91rbYuA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAFEAcA8=8tiqmFTFPaNXcqjXy6Rb5xR59Q2VYUXOTbN91rbYuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/22 21:55, Peter Maydell wrote:
> On Wed, 2 Mar 2022 at 18:26, Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> The following changes since commit 99c53410bc9d50e556f565b0960673cccb566452:
>>
>>    Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2022-02-28' into staging (2022-03-01 13:25:54 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
>>
>> for you to fetch changes up to 9e685c6c574a9e1f1e3affbb900f7c38fb4bff6e:
>>
>>    target/i386: Throw a #SS when loading a non-canonical IST (2022-03-02 10:38:40 +0100)
>>
>> ----------------------------------------------------------------
>> * whpx fixes in preparation for GDB support (Ivan)
>> * VSS header fixes (Marc-André)
>> * Add 5-level EPT support to vmxcap (Vitaly)
>> * Bundle changes to MSI routes (Longpeng)
>> * More precise emulation of #SS (Gareth)
>>
>> ----------------------------------------------------------------
> 
> build-oss-fuzz detects a new memory leak:
> https://gitlab.com/qemu-project/qemu/-/jobs/2155668404

... which is impossible given what the pull request changes; the leak is 
in qos-test (the test executable itself, not QEMU) and the only non-QEMU 
changes in this pull request (to the build system) are for Windows 
systems only.  I've seen hangs of qos-test in the past, as well as this 
leak, and they've become more common lately.

The test seems to be flaky, I've been fighting with it all week---trying 
multiple versions of this pull request and removing patches until 
build-oss-fuzz passed.  The set of patches that triggered it or not was 
completely random, but I'll not that it did pass with this exact commit 
I'm submitting (https://gitlab.com/bonzini/qemu/-/jobs/2154365356).

I wanted to look at this today again before replying to you, but as you 
know I was sidetracked by work on the qemu.org infrastructure.  So, I 
can look at this but I really need to ask you one of two favors:

1) decide that the test is flaky and merge this pull request, and then 
I'll send before Monday the changes that I've omitted here (which again 
have nothing to do with qos-test).  I'll look at qos-test during soft 
freeze.

2) accept that I'll send another x86 pull request (not a large one) 
after soft freeze, so that I have more time to debug this (likely 
unrelated) build-oss-fuzz issue.

Paolo

> ==7088==ERROR: LeakSanitizer: detected memory leaks
> Direct leak of 7200 byte(s) in 9 object(s) allocated from:
> #0 0x5645ae447747 in __interceptor_calloc
> (/builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-test+0x25c747)
> #1 0x7f79c6b36510 in g_malloc0 (/lib64/libglib-2.0.so.0+0x5a510)
> #2 0x5645ae48044a in walk_path
> /builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/qos-test.c:225:23
> #3 0x5645ae4cf97e in qos_traverse_graph
> /builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/libqos/qgraph.c:417:17
> #4 0x5645ae4cf97e in qos_graph_foreach_test_path
> /builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/libqos/qgraph.c:737:5
> #5 0x5645ae4801c4 in main
> /builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/qos-test.c:334:5
> #6 0x7f79c65e555f in __libc_start_call_main (/lib64/libc.so.6+0x2d55f)
> #7 0x7f79c65e560b in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x2d60b)
> #8 0x5645ae39fba4 in _start
> (/builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-test+0x1b4ba4)
> Indirect leak of 1152 byte(s) in 9 object(s) allocated from:
> #0 0x5645ae44792f in __interceptor_realloc
> (/builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-test+0x25c92f)
> #1 0x7f79c6b3664f in g_realloc (/lib64/libglib-2.0.so.0+0x5a64f)
> #2 0x7f79c6b5260b in g_string_sized_new (/lib64/libglib-2.0.so.0+0x7660b)
> #3 0x5645ae480487 in walk_path
> /builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/qos-test.c:232:25
> #4 0x5645ae4cf97e in qos_traverse_graph
> /builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/libqos/qgraph.c:417:17
> #5 0x5645ae4cf97e in qos_graph_foreach_test_path
> /builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/libqos/qgraph.c:737:5
> #6 0x5645ae4801c4 in main
> /builds/qemu-project/qemu/build-oss-fuzz/../tests/qtest/qos-test.c:334:5
> #7 0x7f79c65e555f in __libc_start_call_main (/lib64/libc.so.6+0x2d55f)
> #8 0x7f79c65e560b in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x2d60b)
> #9 0x5645ae39fba4 in _start
> (/builds/qemu-project/qemu/build-oss-fuzz/tests/qtest/qos-test+0x1b4ba4)
> SUMMARY: AddressSanitizer: 8352 byte(s) leaked in 18 allocation(s).
> (test program exited with status code 1)


