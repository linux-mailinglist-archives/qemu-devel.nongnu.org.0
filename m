Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEF730045B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:39:18 +0100 (CET)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wej-00014F-9v
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2wdJ-00007z-1x
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:37:49 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2wdE-0008Jm-9g
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:37:45 -0500
Received: by mail-ej1-x62b.google.com with SMTP id w1so7647627ejf.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hNYYnoHoshlqNXRQlIYMrSDPGmEhNFlwQL1xSHnJIQI=;
 b=tTQqd+6zX35MxNIC7jepxxTg0iAzCSbVKvKd4pNXlMYmrROkge5mday7W5haaW8LXm
 B/dBSi/eNi0EWhouVzhz/SspVU3o7O6jphln5tUROuPA3TC3i56EiVWvZzC4rLLVyKhl
 hE/Pqc71pCQzZ+dFdnJjKoQZzlfJOeGh+aM7m9hhInIeOrk1BnxOMd2oFihPCfiVHAn5
 SSvbdvyP/a0x5E46kKISdkcxVqR+t2Ij0TdkiApl+GAZd5VD1E182tpKP/dGpjdd1+j6
 Hji/An9jewf/I3yStDEmVjSH2RjqtnEjdULe7VSh4xJhc8Y76XpXqrBRJmvyBtNUauyc
 ewLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hNYYnoHoshlqNXRQlIYMrSDPGmEhNFlwQL1xSHnJIQI=;
 b=f11zhA5TYF3FKxbX0uOFt7OnF4ss9R9B5qEEp6vHTGTCwaSZ8RYTEckso8JBXyRQjk
 S611kgTycF19uoD/Xy2a+x+LeSmpizuid7nO2Xd+AVH6cORUKkWAWhyUAwFfDT7of4pa
 WnRHxXzG+Sfqa1BVn0MxeTuYE6kIZwJ/FB0EIh+jf1z+SLIn6s0zRHpKPHZwsy5rSpNv
 0SYfGQXo8R31RpBYQiHVkW7ssMAJMd6w2wwaa4ff62qXBzA09NMPGkHMzsFPimBuQnKB
 zreJVPQ2asd08gKvciKoHQDvXQMtWBtjLTtaRkkTlMCeb/GAcgVnfaMuGF9ZG8p7MCU1
 xiJw==
X-Gm-Message-State: AOAM531eWkST++L0wdWrvPBlaizjXEuqFzTRDFhQgyAIR5sPAkiUQoHx
 Xsg/v6R3I/5UCT61jrmlkck=
X-Google-Smtp-Source: ABdhPJy3EGpV7WTZfYBsHtj6ML4h1r54/+gVYm/ThA8vUnWPx5p6IOkD9Y6CW7RU7YapuW3/F7a7KQ==
X-Received: by 2002:a17:906:1c42:: with SMTP id
 l2mr3044807ejg.390.1611322661432; 
 Fri, 22 Jan 2021 05:37:41 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m24sm4452749ejo.52.2021.01.22.05.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 05:37:40 -0800 (PST)
Subject: Re: [PATCH] hw/mips: loongson3: Drop 'struct MemmapEntry'
To: Bin Meng <bmeng.cn@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210122122404.11970-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3ebc284a-71d0-2a0a-84e2-462c4b7b9b7f@amsat.org>
Date: Fri, 22 Jan 2021 14:37:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122122404.11970-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 1:24 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> There is already a MemMapEntry type defined in hwaddr.h. Let's drop
> the loongson3 defined `struct MemmapEntry` and use the existing one.

Not really... based on 0e324626306:

$ git grep MemmapEntry origin/master -- include
$

What tree are you using?

Thanks,

Phil.

