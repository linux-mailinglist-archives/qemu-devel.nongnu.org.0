Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8603F4792
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 11:32:09 +0200 (CEST)
Received: from localhost ([::1]:45546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI6JM-0005Ug-4w
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 05:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI6H6-00040X-3L
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:29:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mI6H0-0007xa-LE
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 05:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629710981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7QY7xgjqnr/exTyTNSJm305EITy8xWF2mF7IraPW3c=;
 b=S6VBuWKhMOiRfuc7iP7F1uUunUxuN5RPhTm/C64SaaKFEJGyBPQf+qbEROZEA5mPm5qzVU
 nuEMC0/4q1X9AShZDOT25Iz09epj+OB1evU8gUnXJ51Yyfj5GY4MpR0BlnIzSJyxlm19kz
 EtgYiuztoO0hao/+mnFfB0UThxGyxVM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-Ixe8roU-MA-kM_D_ViYGnw-1; Mon, 23 Aug 2021 05:29:40 -0400
X-MC-Unique: Ixe8roU-MA-kM_D_ViYGnw-1
Received: by mail-wm1-f69.google.com with SMTP id
 x125-20020a1c3183000000b002e73f079eefso2821524wmx.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 02:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=u7QY7xgjqnr/exTyTNSJm305EITy8xWF2mF7IraPW3c=;
 b=Rx08eXVVebNjP3buSiAMxz96QCmHk/Ga9FwgFHo/lDM+6T/kk9H7UTYJDoWAPr5eHt
 FIhrGLCzCLPBMvhz2ddeWk2u5i6WzFg5IzQg0eL18w8wPBlZXqqdgLAMLWd8SSZf1cd4
 4edUl08Up4LeWHstAeVbQZ3N5fT06CM23sxRa3JYkuNy/aUs3xFtMMWZUXMM19VHxbUD
 0RXIsnOaNrpZ+espka0nMPk3uECFz4LLlAlpnmpEqNisMqC/Pi00RNPPUmLi3DeJVLhQ
 V3P2FPwMUcqlSFxXTkepCtMf0MG1U7rI2epAVrKudxn8fnRD3OAcB8NZOzLQpcQ4dLtO
 61zA==
X-Gm-Message-State: AOAM531DL5DU5T9+ydIBaZF9MEMq+qd3XdZT/2EGEL2MYJnLNs5vZ4Gu
 jVo+SYhol6KX/SWxwjqnzqJzEKt5nvAD6b8iOqch76VqiMURITKcZvXisBGXRr0uv2KqULNvTQD
 Xoti2GinC8MSolYc=
X-Received: by 2002:a7b:c192:: with SMTP id y18mr13279591wmi.163.1629710978835; 
 Mon, 23 Aug 2021 02:29:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlVxG0oaasu2dv0Tk41rlJOxZgwCOXA8LAZdX8yxCFlltzvFbWyX3jnHyTQlBdOH/+j0kCVQ==
X-Received: by 2002:a7b:c192:: with SMTP id y18mr13279573wmi.163.1629710978681; 
 Mon, 23 Aug 2021 02:29:38 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
 (p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
 [2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
 by smtp.gmail.com with ESMTPSA id 17sm27022wmj.20.2021.08.23.02.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 02:29:38 -0700 (PDT)
Subject: Re: [PATCH] softmmu/physmem: Improve guest memory allocation failure
 error message
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210820155211.3153137-1-philmd@redhat.com>
 <20a53e29-ba23-fe0d-f961-63d0b5ca9a89@redhat.com>
 <d68297ca-7be3-48ab-e25c-4f55dc735670@redhat.com>
 <d3cdb3bb-e05f-f909-1a98-ba45ff9b2b28@redhat.com>
 <CAFEAcA8V6gaGZeWeXOwdts771Ni11Eo8vYR2nXNy-w8dEsxdpg@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <6165f86e-1ce7-d178-1f5c-4b3c5110f0c1@redhat.com>
Date: Mon, 23 Aug 2021 11:29:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8V6gaGZeWeXOwdts771Ni11Eo8vYR2nXNy-w8dEsxdpg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23.08.21 11:23, Peter Maydell wrote:
> On Mon, 23 Aug 2021 at 09:40, David Hildenbrand <david@redhat.com> wrote:
>> Not opposed to printing the size, although I doubt that it will really
>> stop similar questions/problems getting raised.
> 
> The case that triggered this was somebody thinking
> -m took a byte count, so very likely that an error message
> saying "you tried to allocate 38TB" would have made their
> mistake clear in a way that just "allocation failed" did not.
> It also means that if a future user asks us for help then
> we can look at the error message and immediately tell them
> the problem, rather than going "hmm, what are all the possible
> ways that allocation might have failed" and going off down
> rabbitholes like VM overcommit settings...

We've had similar issues recently where Linux memory overcommit handling 
rejected the allocation -- and the user was well aware about the actual 
size. You won't be able to catch such reports, because people don't 
understand how Linux memory overcommit handling works or was configured.

"I have 3 GiB of free memory, why can't I create a 3 GiB VM". "I have 3 
GiB of RAM, why can't I create a 3 GiB VM even if it won't make use of 
all 3 GiB of memory".

Thus my comment, it will only stop very basic usage issues. And I agree 
that looking at the error *might* help. It didn't help for the cases I 
just described, because we need much more system information to make a 
guess what the user error actually is.

-- 
Thanks,

David / dhildenb


