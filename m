Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D64831F125
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:39:15 +0100 (CET)
Received: from localhost ([::1]:60330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCq4w-0000nF-44
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCpxQ-0003RK-HD; Thu, 18 Feb 2021 15:31:28 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCpxN-0007La-6x; Thu, 18 Feb 2021 15:31:28 -0500
Received: by mail-wr1-x431.google.com with SMTP id v14so4382377wro.7;
 Thu, 18 Feb 2021 12:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4pWzLGq04lI0t6m/qR6Gzis7yBlbynG7tk/b8IxkwBA=;
 b=f+klUkXZMbM5KpsG9qGhQWLRgx5yaR60TCrrg+Fa0dSm7a9pnpJ3r1WBaEjYqzaO4v
 jJFlkof9+CgueXqcbZoAibcukBRWeM/HV6m1Ym5zf+YYxgSagiubm5ld6KDApZ/5FQMo
 gUdJb+Zm87QI9ZcEh3hPd6U99iDwlcaMUSiOEOm1c0pkQ6drqmESbidVYlHlGpfkpo75
 KlOJ3Sla/SxghIX6bhJHDIfV+lGO6c7PCXwwejaUE2r2E3bHktRoGxNydwYjZO6tWddA
 mbh7zWWvSYoLOktXyoWcdtsnUseA2McJZLsGXWBjzbCHZNgGCL3vHQBujw/OYI3W1vEm
 LSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4pWzLGq04lI0t6m/qR6Gzis7yBlbynG7tk/b8IxkwBA=;
 b=RN7XJVbBB6zsDyVjsK4ky0zkmkFck0LTO7JLB0r+/9+X4UFEzev8eE/dg8W9xnAg55
 2QY3mYN3lPV5aNg+a4q1ufSk9jRUoMRDnqZbfabtHbOCC1k4JrnH7fzwCVgqQskqbnnl
 o+w7+Hvpa8EbhB8uqcs124StO0nqSRJE5XEW7YvjE+K5kkxDzDjhD8+q6pOvo44dY9SW
 qBer0DUcVeCWcPnllYoiAqkqiJwcjcmHO97jmhHBGQQFQCABJgP6Fpb8Zp0MQPQoYBlW
 SMf5u+mJCZBxh8n5QgSeZ58tNszNurHzAvhgFza0ZNRqN576R/dgl4M1fMselFL3ixpv
 VGow==
X-Gm-Message-State: AOAM53218Gl3rXqFOEn32P8h482bUpekxpXOMS1sSy0fAY+SvcB2GzUP
 w11n6P5P2fXdPb+HsBcnFWTZtFuyXs8=
X-Google-Smtp-Source: ABdhPJxipXxeub20bIohmtbxDYdsSzkDUu6LHh1IevDzvplqt8r65b+172rjlYbUH6FF3LjSOz4yZQ==
X-Received: by 2002:a5d:654d:: with SMTP id z13mr6271539wrv.62.1613680270446; 
 Thu, 18 Feb 2021 12:31:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h11sm8228278wmq.26.2021.02.18.12.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 12:31:10 -0800 (PST)
Subject: Re: [PATCH v2 2/6] hw/sd: sdhci: Don't write to SDHC_SYSAD register
 when transfer is in progress
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Bin Meng <bmeng.cn@gmail.com>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
 <1613447214-81951-3-git-send-email-bmeng.cn@gmail.com>
 <277459ba-f35c-31fb-c088-def282c841d4@amsat.org>
Message-ID: <2d5c862c-6000-723e-5cb7-7ce141612446@amsat.org>
Date: Thu, 18 Feb 2021 21:31:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <277459ba-f35c-31fb-c088-def282c841d4@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/21 7:23 PM, Philippe Mathieu-Daudé wrote:
> On 2/16/21 4:46 AM, Bin Meng wrote:
>> Per "SD Host Controller Standard Specification Version 7.00"
>> chapter 2.2.1 SDMA System Address Register:
>>
>> This register can be accessed only if no transaction is executing
>> (i.e., after a transaction has stopped).
>>
>> With this fix, the following reproducer:
>>
>> https://paste.debian.net/plain/1185137
>>
>> cannot be reproduced with the following QEMU command line:
>>
>> $ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
>>        -nodefaults -device sdhci-pci,sd-spec-version=3 \
>>        -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
>>        -device sd-card,drive=mydrive -qtest stdio
> 
> Without the rest applied, I still can :(
> 
> AddressSanitizer: heap-buffer-overflow

Err, I used an old build for this test, sorry...

