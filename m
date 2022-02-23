Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1C84C1032
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:20:48 +0100 (CET)
Received: from localhost ([::1]:54680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMolL-0003lQ-2p
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:20:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMo7W-0003nZ-I2
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:39:39 -0500
Received: from [2a00:1450:4864:20::535] (port=44904
 helo=mail-ed1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nMo7Q-00072Q-0Z
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:39:38 -0500
Received: by mail-ed1-x535.google.com with SMTP id x5so43082206edd.11
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 01:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AdLKcArwc56L9HlSSWEAqX1kgfhU2IX6KlygRpHQZsw=;
 b=GfdgIE/3HqzQIgyOVtkVf/TIATN1gj11lB5GAF8hKeQzF+cKiPXUJC+VbCOtFBvKiM
 NZvg7OICC7Nm37vPYjvcs7SqqELnqLy8btNE8npHpABwrou75Fug7lS42eRTXW6pNlbo
 URtsWsTvS/Gw7RFqmE6ffhBckR78VMvFBXljZRGEQ2BPd9BpV0oCD0+NsjAJYHN67+P0
 kBsilt3xiO8NadtFm4j0fXrx29JQqbezJHhqA1k/fV21zVbzksq0tSchAawoCMtaIqJt
 DgGoHJrol25qjdkbeh7Ct8VmfnB+53E8a+VtaO3ELIgTHP2KaQxk0I9Qk7mdtjGbpJLN
 nv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AdLKcArwc56L9HlSSWEAqX1kgfhU2IX6KlygRpHQZsw=;
 b=6lhmb/zdiegVT7Fsl+gStZZZv2Qudi9j3fJ6oPJeAYpiqrDm3lo8nH5Auq8byyye9H
 skY50WI8ihkh0AwQrNNI8UefbVayfjWklpHzRMW71lP3KJeUxB/Wnv78fIrPp8iS/7q/
 ryw5uYyoBpti4uQMIfMPYaN1+7Z+a9dYIJDSPeeBPW9Q+Td6jJUppsDH3UrCibrPn3Qy
 vBfGeY2ByeXhyPuj83/f5jd3xxBExWYnhtrHmhU5Dxrc9GToL3NTZF/BqGxoMOBI8vGT
 0MgH8XZcvvfFi7xKM8d7fa2AOxLkmnDGbmOedSm7Tds69WsnsjOuGvWZQn+h7Xv3Njrz
 frBQ==
X-Gm-Message-State: AOAM530MqquXoyZjpoU+04XoR86/Focm0KDOSPXfHV7VW8gUY6cvVC+T
 9WtGC1vswOXE6l+gAv6JjmW3FEv5cpM=
X-Google-Smtp-Source: ABdhPJzuylY8qP//54DNKA84ClSfwm0LGubxV6kqXLovO6Xc8bwcJhjABGkNgF/sjK9MxDt8zKTx5A==
X-Received: by 2002:aa7:d7da:0:b0:40f:f16f:dc25 with SMTP id
 e26-20020aa7d7da000000b0040ff16fdc25mr29418789eds.17.1645609170744; 
 Wed, 23 Feb 2022 01:39:30 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id ay16sm4601884ejb.61.2022.02.23.01.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 01:39:30 -0800 (PST)
Message-ID: <e0933369-9c40-8b6c-2090-13e1027d82ed@redhat.com>
Date: Wed, 23 Feb 2022 10:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/3] qemu-sem-posix: use monotonic clock instead
Content-Language: en-US
To: "Longpeng(Mike)" <longpeng2@huawei.com>, berrange@redhat.com,
 mst@redhat.com
References: <20220222090507.2028-1-longpeng2@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220222090507.2028-1-longpeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::535
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: wangxinxin.wang@huawei.com, arei.gonglei@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 10:05, Longpeng(Mike) via wrote:
> The qemu_sem_timedwait() uses system time as default, it would be affected by
> changes to the system time. In the real scenario, the time that goes faster or
> slower is a common case and the NTP service could help us to sync time
> periodically.
> 
> This patchset uses monotonic clock instead of the realtime clock, this could
> make sure we would not be affected by the system time anymore.
> 
> Changes v1(RFC) -> v2:
>   Patch 2:
>    - clean the code [Paolo]
>    - use pthread_condattr_setclock when initializing qemu-cond. [Paolo]
>   Patch 3:
>    - new added, make the qemu-sem code neater. [Longpeng]
> 
> Longpeng (Mike) (3):
>    sem-posix: remove the posix semaphore support
>    sem-posix: use monotonic clock instead
>    sem-posix: refactor qemu-sem with qemu-cond and qemu-mutex
> 
>   include/qemu/thread-posix.h |   9 +--
>   meson.build                 |  12 ++-
>   util/qemu-thread-posix.c    | 178 +++++++++++++++-----------------------------
>   3 files changed, 73 insertions(+), 126 deletions(-)
> 

Queued, thanks!  I also sent a small optimization patch on top.

Paolo

