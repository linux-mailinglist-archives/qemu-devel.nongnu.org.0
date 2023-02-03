Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A84689605
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:29:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNtK8-0000X2-Ki; Fri, 03 Feb 2023 05:29:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pNtK5-0000WX-UG
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:29:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1pNtK4-0006Uc-CX
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675420175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iJmbzxkAB2BNvy9ZXeRlG5I1iG9TlOtnAajVxl+X67U=;
 b=aBYm88dY/pD84y6aMe6wm04DJ+/eNJPuHzVjLPgGhFqL5j7wfV26Jv4DDAJtHZ4Kx76KZR
 BAnsGxs9+jYR9TrkW/uxE7LqaH+JGYdvQO9QePhie0N254bCZLM+qkLtZuqoOIqvHSEtbL
 cQ8I4CHIceQXzaSele3Bu7/tbYNHxSo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-wSuneQgfP6CmIT3If4dFjw-1; Fri, 03 Feb 2023 05:29:34 -0500
X-MC-Unique: wSuneQgfP6CmIT3If4dFjw-1
Received: by mail-qv1-f71.google.com with SMTP id
 mx2-20020a0562142e0200b0053807f3eb76so2488401qvb.15
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iJmbzxkAB2BNvy9ZXeRlG5I1iG9TlOtnAajVxl+X67U=;
 b=HjkV8Vj0sQTflSLACAlkELnPM5bLXjOH2U6AfjIGou+Fe46+HLfVuk7s2e6xP4B2Yj
 Jj/IqmPyf2qZMDtsF/rxPfdtBxb8FHWayWleFK519j+5DTZO7SKOJRubC80yEUe9KXLC
 4QmE+FvKun06nzIHCPpPI3EuovxUoWH9EJFg5ixsQlt9W+wNo0dp/VTdaUhAl4x9DoOE
 E1mbs88s+JHModYf1XQ/FhhR80HLWa8AGUmDdThzaIbdYN0nN2AYWGdwXM55XObj5+dY
 VfO03BETLhPW2EjvITdWQ8r2ZSJChI1m6vcXQgjXn7rjXWLjevoDIDoRPjEjaCuwbyQb
 EWJw==
X-Gm-Message-State: AO0yUKXHyFBwaMCV96+CdlPATyo1hU+UsT3eZut6xxlJHhUXV1PtFZG0
 /NhMYhQeM+p4wAscY6x9F/dLpX3LWP+K7pZafRHyPHWe5hPdsH35SkOX+tjaCO2aSgh80WG/qjS
 7S4rfPM7yvKBGoHg=
X-Received: by 2002:ad4:50ab:0:b0:4c7:595c:9940 with SMTP id
 d11-20020ad450ab000000b004c7595c9940mr13052838qvq.51.1675420173722; 
 Fri, 03 Feb 2023 02:29:33 -0800 (PST)
X-Google-Smtp-Source: AK7set+0BA2Qm7eQfpTbAmQRS6V2QHLVlDb2vza+Rneq5oC2FwaJH45XXSsWEc+Yydl4VyVTeNK2qw==
X-Received: by 2002:ad4:50ab:0:b0:4c7:595c:9940 with SMTP id
 d11-20020ad450ab000000b004c7595c9940mr13052825qvq.51.1675420173474; 
 Fri, 03 Feb 2023 02:29:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 63-20020a370a42000000b00719d9f823c4sm1544989qkk.34.2023.02.03.02.29.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 02:29:32 -0800 (PST)
Message-ID: <5a9de193-e0e4-79f7-3c41-773078bb920c@redhat.com>
Date: Fri, 3 Feb 2023 11:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] accel/tcg: Complete cpu initialization before registration
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: iii@linux.ibm.com, qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>
References: <20221031054105.3552-1-richard.henderson@linaro.org>
 <d91ccc02-a963-946d-169a-fd4da2610861@redhat.com>
 <211b40bc-2bbb-63be-191a-42e03e049b98@linaro.org>
 <CAFEAcA8cbfqy-eBY=gjj6ttxJ-RbzBn_XhyjjVfj303=R+uV5Q@mail.gmail.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <CAFEAcA8cbfqy-eBY=gjj6ttxJ-RbzBn_XhyjjVfj303=R+uV5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

Hi Peter,
On 2/2/23 11:53, Peter Maydell wrote:
> On Wed, 1 Feb 2023 at 20:37, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 2/1/23 04:20, Eric Auger wrote:
>>> What I fail to understand is why this code is called with a kvm
>>> accelerated qemu (the test runs by default with kvm).
>> ...
>>> #2  0x000002aaab1500f0 in vmsa_ttbr_write
>>> (env=0x2aaac393850, ri=0x2aaac3c90e0, value=2154950976315703518) at
>>> ../target/arm/helper.c:3784
>>> #3  0x000002aaab14e5a8 in write_raw_cp_reg
>>> (env=env@entry=0x2aaac393850, ri=ri@entry=0x2aaac3c90e0,
>>> v=v@entry=2154950976315703518)
>>
>> This is indeed very curious -- vmsa_ttbr_write is supposed to be the "cooked" .writefn,
>> not the .raw_writefn.  We're not supposed to arrive here at all.
> 
> If you only provide a cooked .writefn and no .raw_writefn,
> the default is to assume that the cooked function will also
> work as the raw one. None of the ARMCPRegInfo structs that
> use vmsa_ttbr_write specify a raw_writefn...
I fail to understand. Do you suggest we miss explicit .raw_writefn =
raw_write in many places and that's the source of our trouble. Indeed
entering the TCG code in KVM mode looks weird.

Or is that supposed to work and we have a bug introduced by the abive
commit commit.

The backtrace of the sigsev shows:

Stack trace of thread 64909:
#0  0x0000aaaadb43ee4c tlb_flush_page_by_mmuidx_async_0 (qemu-kvm +
0x6aee4c)
#1  0x0000aaaadb0076a4 process_queued_cpu_work (qemu-kvm + 0x2776a4)
#2  0x0000aaaadb452ff8 kvm_vcpu_thread_fn (qemu-kvm + 0x6c2ff8)
#3  0x0000aaaadb591bf0 qemu_thread_start (qemu-kvm + 0x801bf0)
#4  0x0000ffff86382a28 start_thread (libc.so.6 + 0x82a28)
#5  0x0000ffff8632bb9c thread_start (libc.so.6 + 0x2bb9c)

Thanks

Eric

> 
> thanks
> -- PMM
> 


