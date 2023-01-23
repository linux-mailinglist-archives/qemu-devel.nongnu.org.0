Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85419677C94
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:33:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJww2-0001cA-B6; Mon, 23 Jan 2023 08:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pJwtv-0001Jy-SS
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:30:24 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <d-tatianin@yandex-team.ru>)
 id 1pJwtr-0000pv-Ho
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:30:18 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 29B4E5FE18;
 Mon, 23 Jan 2023 16:30:04 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b684::1:1b] (unknown
 [2a02:6b8:b081:b684::1:1b])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 3UN32p0WTiE1-79dO4i6K; Mon, 23 Jan 2023 16:30:03 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1674480603; bh=dHffjsJMHD7AySNcNASLmhwAhA7GdBT+2QD468Kd7K8=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=EIPIR30a2PjVVXa0ni8YM0vxZleqgRugQeP24/EpPm8pK1o2+f5zQQF6tQIziWIin
 R3WrK8apTHywiKQtcSDj4xRB+8p6vcoJt9TmQJLpP5PzwP19cm6K1AMFFIVjnV5Ito
 i29pk1b084NFIlamQtLaS7NCeP6NAKK/CEjMlfHc=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <ace54833-f254-1b30-b720-c530e60c8266@yandex-team.ru>
Date: Mon, 23 Jan 2023 16:30:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v0 0/4] backends/hostmem: add an ability to specify
 prealloc timeout
To: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Igor Mammedov <imammedo@redhat.com>, yc-core@yandex-team.ru
References: <20230120134749.550639-1-d-tatianin@yandex-team.ru>
 <338cbc9a-4eea-a76c-8042-98372fb70854@redhat.com>
Content-Language: en-US
From: Daniil Tatianin <d-tatianin@yandex-team.ru>
In-Reply-To: <338cbc9a-4eea-a76c-8042-98372fb70854@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=d-tatianin@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 1/23/23 11:57 AM, David Hildenbrand wrote:
> On 20.01.23 14:47, Daniil Tatianin wrote:
>> This series introduces new qemu_prealloc_mem_with_timeout() api,
>> which allows limiting the maximum amount of time to be spent on memory
>> preallocation. It also adds prealloc statistics collection that is
>> exposed via an optional timeout handler.
>>
>> This new api is then utilized by hostmem for guest RAM preallocation
>> controlled via new object properties called 'prealloc-timeout' and
>> 'prealloc-timeout-fatal'.
>>
>> This is useful for limiting VM startup time on systems with
>> unpredictable page allocation delays due to memory fragmentation or the
>> backing storage. The timeout can be configured to either simply emit a
>> warning and continue VM startup without having preallocated the entire
>> guest RAM or just abort startup entirely if that is not acceptable for
>> a specific use case.
> 
> The major use case for preallocation is memory resources that cannot be 
> overcommitted (hugetlb, file blocks, ...), to avoid running out of such 
> resources later, while the guest is already running, and crashing it.

Wouldn't you say that preallocating memory for the sake of speeding up 
guest kernel startup & runtime is a valid use case of prealloc? This way 
we can avoid expensive (for a multitude of reasons) page faults that 
will otherwise slow down the guest significantly at runtime and affect 
the user experience.

> Allocating only a fraction "because it takes too long" looks quite 
> useless in that (main use-case) context. We shouldn't encourage QEMU 
> users to play with fire in such a way. IOW, there should be no way 
> around "prealloc-timeout-fatal". Either preallocation succeeded and the 
> guest can run, or it failed, and the guest can't run.

Here we basically accept the fact that e.g with fragmented memory the 
kernel might take a while in a page fault handler especially for hugetlb 
because of page compaction that has to run for every fault.

This way we can prefault at least some number of pages and let the guest 
fault the rest on demand later on during runtime even if it's slow and 
would cause a noticeable lag.

> ... but then, management tools can simply start QEMU with "-S", start an 
> own timer, and zap QEMU if it didn't manage to come up in time, and 
> simply start a new QEMU instance without preallocation enabled.
> 
> The "good" thing about that approach is that it will also cover any 
> implicit memory preallocation, like using mlock() or VFIO, that don't 
> run in ordinary per-hostmem preallocation context. If setting QEMU up 
> takes to long, you might want to try on a different hypervisor in your 
> cluster instead.

This approach definitely works too but again it assumes that we always 
want 'prealloc-timeout-fatal' to be on, which is, for the most part only 
the case for working around issues that might be caused by overcommit.

> 
> I don't immediately see why we want to make our preallcoation+hostmem 
> implementation in QEMU more complicated for such a use case.
> 

