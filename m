Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E32D3C730A
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:20:02 +0200 (CEST)
Received: from localhost ([::1]:46354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3KCX-0006Oi-ES
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m3KBI-0005Jj-4P
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:18:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1m3KBG-0006Uv-HC
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:18:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626189521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hVUqzfPPZf2UFLSkI/Eg7Rv4cb2KLvwS7DYzN3vvqE8=;
 b=e8e5H5HfuoVWM6rGETsEl8WoAsQmDAUJ92KZuzBPXAvoJ2knARUNq6cVIGFmggoqPJ4lu4
 mfKmzdHgm0S5e3bs4MBvtODXhv/KA4Ox7LcQMlqVAkcFr8kD9qSSTVSiUnrpoYQ5Zyk1Ht
 WyLmnvmyQm8YRmmEpTn7F4ULmDw+8H8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-7POlVNDqO1-qHqILJn58ag-1; Tue, 13 Jul 2021 11:18:38 -0400
X-MC-Unique: 7POlVNDqO1-qHqILJn58ag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CCD88015C6;
 Tue, 13 Jul 2021 15:18:37 +0000 (UTC)
Received: from [10.10.115.211] (ovpn-115-211.rdu2.redhat.com [10.10.115.211])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A047560C05;
 Tue, 13 Jul 2021 15:18:36 +0000 (UTC)
Subject: Re: [PATCH 0/3] Atomic cleanup + clang-12 build fix
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210712155918.1422519-1-richard.henderson@linaro.org>
 <f186b5b5-8db2-a43b-d5cc-2563d76c7211@redhat.com>
 <67a16913-363a-8157-d5fc-1350702b431b@linaro.org>
 <4cc4bbf6-d856-35ab-3687-3fce79b7f8d7@linaro.org>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <e37ae8b2-441f-f7e1-b125-78bbd85ad4a2@redhat.com>
Date: Tue, 13 Jul 2021 11:18:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4cc4bbf6-d856-35ab-3687-3fce79b7f8d7@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 10:43 AM, Richard Henderson wrote:
> On 7/12/21 5:37 PM, Richard Henderson wrote:
>> On 7/12/21 2:30 PM, Cole Robinson wrote:
>>> On 7/12/21 11:59 AM, Richard Henderson wrote:
>>>> The first two patches are not strictly required, but they
>>>> were useful in tracking down the root problem here.
>>>>
>>>> I understand the logic behind the clang-12 warning, but I think
>>>> it's a clear mistake that it should be enabled by default for a
>>>> target where alignment is not enforced by default.
>>>>
>>>> I found over a dozen places where we would have to manually add
>>>> QEMU_ALIGNED(8) to uint64_t declarations in order to suppress
>>>> all of the instances.  IMO there's no point fighting this.
>>>>
>>>
>>> I tested your patches, they seem to get rid of the warnings. The errors
>>> persist.
>>>
>>> FWIW here's my reproduce starting from fedora 34 x86_64 host:
>>>
>>> $ sudo mock --root fedora-35-i386 --install dnf --install dnf-utils
>>> --install fedora-packager --install clang
>>> $ sudo mock --root fedora-35-i386 --shell --enable-network
>>> # dnf builddep -y qemu
>>> # git clone https://github.com/qemu/qemu
>>> # cd qemu
>>> # CC=clang CXX=clang++ ./configure --disable-werror
>>> # make V=1
>>
>> Ho hum.  So, the warnings are where clang has decided to insert calls
>> to libatomic.
>>
>> So we either have to
>>
>> (1) work around all of the places, which, unless we set up an i386
>> clang-12 builder will quickly bitrot, or
> 
> Update: (1) is out.  There's a warning in cputlb.c vs a pointer that's
> known to be aligned, and it still fires.  I have filed a bug:
> 
>   https://bugs.llvm.org/show_bug.cgi?id=51076
> 
>>
>> (2) write our own routines, compatible with libatomic, using cmpxchg8b
>> directly.  which requires no (extra) locking, and so is compatible
>> with the tcg jit output, or
>>
>> (3) file a bug with clang, and document "use clang-11 and not clang-12".
> 
> So, Cole, with respect to (3), is this just general regression testing
> that discovered this (in which case, yay) or is there some other reason
> clang is required?
> 
> Assuming that (3) isn't really viable long term, I guess (2) is the only
> viable option.
> 

I never tested building qemu with clang prior to this so no idea if it's
a regression.

There's some interest in using clang (eventually with cfi) to build the
Fedora qemu package,  so I gave it a test run. If this case is
problematic we could keep using gcc for it and clang for every other
arch, in the short/medium term.

Richard can you clarify, do you think the errors are a clang bug as
well, or strictly a qemu issue? If it's clang maybe I can get Red Hat
llvm devs to help

Thanks,
Cole


