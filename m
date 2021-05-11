Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06951379DCC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 05:30:12 +0200 (CEST)
Received: from localhost ([::1]:49068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgJ63-0006E3-4A
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 23:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJ56-0005Ya-3V
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:29:12 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgJ54-0003zd-Me
 for qemu-devel@nongnu.org; Mon, 10 May 2021 23:29:11 -0400
Received: by mail-ej1-x62c.google.com with SMTP id zg3so27610155ejb.8
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 20:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lG5UeI8yLN2lePu+a+ZMhWohxlpHlbeT1dTgMa9+Q+0=;
 b=NN2m+cy3tgse1ltaeheF8MYnak3wR7E3UdO28wwzyw4O4qwALCqSyexOZ0XcYJJhh/
 IpEqwRvk56lz/ER6ElBdTRvvsZJogIfFIDvkM7GvkbT+XTZDMTe0XZOu5XukLfkD67Oh
 wnag8yXNxTx0SsBpiG6Z6tFx1lQq44UWH5UdsZbudnpetGQqTDMRU3PmLPo0qhvc5DgZ
 iDM/PUabQXtBc2yjseLYiFGD1mczbLpxS0Vi+53W06ay0t7G/j+PLodmmBnb3hbB3883
 BUTebccUO60hO2wFeVyxYEYoXSGNU3miDYujuLs7wkuQ+Pk5HGnWP5pOmEnoUP0IowOm
 uSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lG5UeI8yLN2lePu+a+ZMhWohxlpHlbeT1dTgMa9+Q+0=;
 b=CDGOQdI00Bo+E4paA2Wu79NTpDvVE2AhWYUeG9DAdh76tdBuYxJ6wvHyF/g5YHz2IL
 TkQrAe9BKpC2XEba6shrV045jS5ZnvRydzoREYRI1Ed06+LHKhU7S4o+gRf0gJwXXKqA
 F0yqBqGN3ZijARrOFRzRlbuVKX1sZEvvE/F25a23ScUaqQQi7YuTlAt2F8GfEozIcJ+X
 KRbK7p2S6itmVjb0K1SW7V3D9EKwxQdGXNHlC9QqvsIOhDs7M0xmYJWxbRUPXGRenm0q
 pOoppEC02Sy+wr6aYcOtmjyXqfgKOwHl5yv+7/4+oqtm2FFP7bf1UzCftuezdAH2vb9D
 1e6w==
X-Gm-Message-State: AOAM5330tH7PFY+Hyhp51FXPc6DYC9VYiZTIy3LbEwVa41Y3zyYVV09i
 ozi3UF2kdp00IFs7MdQ8DDk=
X-Google-Smtp-Source: ABdhPJw1bhRDkt79+BZJYELsZ7BDELPieJICsxUgtrwDD3tOkVViCeXZ5YtH7Fz60uzdzY5RvQG27g==
X-Received: by 2002:a17:906:28d4:: with SMTP id
 p20mr29520722ejd.552.1620703749308; 
 Mon, 10 May 2021 20:29:09 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v12sm13550846edb.81.2021.05.10.20.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 20:29:08 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] hw: Convert mc146818rtc & etraxfs_timer to 3-phase
 reset interface
To: qemu-devel@nongnu.org
References: <20210502163931.552675-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <89ae6ce0-7959-0d74-2f14-f5943a74bec2@amsat.org>
Date: Tue, 11 May 2021 05:29:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502163931.552675-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

I addressed your comments from v1, and this series is
now reviewed. Can it get merged via your qemu-trivial tree?

On 5/2/21 6:39 PM, Philippe Mathieu-Daudé wrote:
> Remove qemu_register_reset() when a qdev type has a qbus parent,
> implementing the 3-phase Resettable interface.
> 
> Since v2:
> - Lower IRQ in 'hold' phase, not 'exit' one (Edgar)
> 
> Since v1:
> - Use 3-phase reset interface instead of qdev one (Laurent)
> 
> Supersedes: <20210423233652.3042941-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (2):
>   hw/timer/etraxfs_timer: Convert to 3-phase reset (Resettable
>     interface)
>   hw/rtc/mc146818rtc: Convert to 3-phase reset (Resettable interface)
> 
>  hw/rtc/mc146818rtc.c     | 42 +++++++++++++++++++++-------------------
>  hw/timer/etraxfs_timer.c | 14 +++++++++++---
>  2 files changed, 33 insertions(+), 23 deletions(-)
> 

