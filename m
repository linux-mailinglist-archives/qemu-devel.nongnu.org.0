Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D274B6A7E84
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 10:47:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfWl-0002kg-SK; Thu, 02 Mar 2023 04:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXfWj-0002kO-Ga
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:47:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pXfWh-00061i-Ua
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 04:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677750422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5S/+HyM7YsuxwBN+edxL/XbA4y/1XoC19NorNNzy4nk=;
 b=Buie2lWM5ny2/rDPtAjiO7o4FmeRz3CF4ev8QFoMzCjQoss1emYsk3jqW+BOaIXx4jKu6n
 reVZZqK6Pgy0veatbzx4Rj6tX4gMyoDPSuS6Pro41mS9OZTctM0pQIIGGDkDSL61vSjIX4
 RqCPQpWpVwdqMrt9vbxwh9mSWq+k7Mk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-v3a9srX0OX-kl5h2n72OTA-1; Thu, 02 Mar 2023 04:46:59 -0500
X-MC-Unique: v3a9srX0OX-kl5h2n72OTA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so5543143wmk.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 01:46:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5S/+HyM7YsuxwBN+edxL/XbA4y/1XoC19NorNNzy4nk=;
 b=H5rSWgo3KUZOEWW72Zy0YywdOLIfMImcZXGR9Ms+lXpG4NjWkLpSdX4dCmIhWnYrY1
 hzBrtodnJmMrlGpzAdO11J/UaonjVvGDOGiT/I8uyvAAJg6yHvGcADBjM4rf+gLTI9AC
 4McoZ3lSJJ1p9qdPEF4osrV7T1EJuVQxm+VqYYXs75LAJBv+zpZigx82IzYK3XdwonfI
 Ip6G7zCSlL0l5pUcMoEVQKu4kUVgLv7rRyTJLGUml0Yb7ZdOm/uoFQ4syFj1bATNtNue
 KQ5afIYeB2QF9F0KcnT+rvTuNblu6d8yuA7HYkoNfZFLw6bPukJ86vat/fUqGH3X8KjR
 hgvQ==
X-Gm-Message-State: AO0yUKXg5z79HjgPVXolyubWqqgf7516UjYBk/12/65kR9lj9gnMIKvd
 zJ47S95/oyhyiM4OJnArHbYw85xA5EGgnT4HXaZJBrV94D+8seaYetTMe3N5smD9vCCuFfn5M/e
 7qzR7Kvn0KsNkgHg=
X-Received: by 2002:a1c:7401:0:b0:3ea:e677:5017 with SMTP id
 p1-20020a1c7401000000b003eae6775017mr7222833wmc.8.1677750418302; 
 Thu, 02 Mar 2023 01:46:58 -0800 (PST)
X-Google-Smtp-Source: AK7set8NvcAkzHvjjvbPKSqcYyz3EK52sYfweXFiwP579/iFUod9+SL5N+3ZN0lgy7RDp2W54NIkjg==
X-Received: by 2002:a1c:7401:0:b0:3ea:e677:5017 with SMTP id
 p1-20020a1c7401000000b003eae6775017mr7222813wmc.8.1677750417982; 
 Thu, 02 Mar 2023 01:46:57 -0800 (PST)
Received: from ?IPV6:2003:cb:c70e:4f00:87ba:e9e9:3821:677b?
 (p200300cbc70e4f0087bae9e93821677b.dip0.t-ipconnect.de.
 [2003:cb:c70e:4f00:87ba:e9e9:3821:677b])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a1c7314000000b003eafc47eb09sm2142308wmb.43.2023.03.02.01.46.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 01:46:57 -0800 (PST)
Message-ID: <6c75e2e2-5ba9-bc52-2c6c-a0bfb5f5b56f@redhat.com>
Date: Thu, 2 Mar 2023 10:46:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 0/4] memory: Fix (/ Discuss) a few rcu issues
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230225163141.1209368-1-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230225163141.1209368-1-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

On 25.02.23 17:31, Peter Xu wrote:
> [not for merging, but for discussion; this is something I found when
>   looking at another issue on Chuang's optimization for migration downtime]
> 
> Summary: we tried to access memory_listeners, address_spaces, etc. in RCU
> way.  However we didn't implement them with RCU-safety. This patchset is
> trying to do that; at least making it closer.
> 
> NOTE!  It's doing it wrongly for now, so please feel free to see this as a
> thread to start discussing this problem, as in subject.
> 
> The core problem here is how to make sure memory listeners will be freed in
> RCU ways, per when unlinking them from the global memory_listeners list.

Can you elaborate why we would want to do that? Is there a real reason 
we cannot hold the BQL when unregistering a listener?

Or could we use any other, more fine-grained, lock to protect the memory 
listeners?

Naive me would think that any interactions between someone updating the 
memory listeners, and a listener getting removed, would require some 
careful synchronization (to not rip a notifier out while someone else 
notifies -- what is the still registered notifier supposed to do with 
notifications while it is already going away?), instead of doing it via RCU.

I'm all for using RCU if it improves performance and keeps things 
simple. If RCU is neither required for performance reason and 
overcomplicates the implementation, maybe using locking is the better 
choice.

TBH, so far I thought that any memory_listeners register/unregistering 
*requires* the BQL, and everything else is a BUG.

-- 
Thanks,

David / dhildenb


