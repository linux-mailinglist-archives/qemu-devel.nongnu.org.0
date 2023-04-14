Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A94D6E24D8
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 15:55:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnJt5-00075C-H1; Fri, 14 Apr 2023 09:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnJt3-00074p-QT
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 09:54:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pnJt1-00022k-R5
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 09:54:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id s2so14322159wra.7
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681480486; x=1684072486;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F1q5WDooVuTeiTWtZrBLMUqnLUQfECNu3kxMS7bx8qc=;
 b=FvIiMTOJubpliD+Ssndm0fhlvWYSGAz5ngyz+mCY1GWagz7Ze5S0thWU5X9qZkG/ZC
 TC76GdoxQDDsGZV1jWku/TAzf8caW083vaJb0raggL3iX5RglOMU92oOt06hFyK4hPJ6
 55HMrJoqdz+fieLOVA9t4wat69s4TP+iq+ccVwynC38StztJ2CNocE9hjVGnRQBtsdi9
 i1uC3tNwBtdPxLCqgRvKw4amS80rmvNvjs57aINPiYJTR94NUre59dfAdBjnp0mSs5iD
 FZT5odziMOD10Fl0AZnGuKRkqK13/rVjX0zfHLqrjHq3EtPy1iaR+hM1/AnuAAe7iLHc
 CkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681480486; x=1684072486;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F1q5WDooVuTeiTWtZrBLMUqnLUQfECNu3kxMS7bx8qc=;
 b=hbUSh0XhfvbRULCm8Bp8Gvpe3/F7nz1Up/v67emNv5U+FJUKsD+mp2W/3/rQr1+XPB
 uFojSVJeuip94dm9VpnE0sLnJ2CsRh0bClho778HQyNA6aMzaMy9NkFaH4LVOUeDk+Oh
 Yw9K+pjwqmB1GW2BuY24LKfhAXmz6Iza7ECY3Mw5oUy8obyUpLETcGCWgxyt4lbKavYT
 ACEjKFSI6qGjkW0qgCK+hjyXNZ/5HdL8ImmMPy4zCeXUnOupLRZP15X8Z05KgIaaNgYu
 TPRPRH483e7c1FqUxPLM0fSrdL527hBWfCqFtHj4tTt4V4CQ3tnPMj/nW8HdZb1dhVxC
 LSZA==
X-Gm-Message-State: AAQBX9cFlYHvR1lStgyWkMPNt2zsnRVJzWw5Xi2rSy8vwMEnBrahnh23
 lOvSYDPoQmD2mI7ZyW7kYL292KgwRLEiEn/yuUk=
X-Google-Smtp-Source: AKy350Y/BVC7uFC/rjCr2h7z+OuAj+kybmrVjTF0eRhCWC4syFNwHKNRTzW25uxo/1DEsca+E5mEcQ==
X-Received: by 2002:a5d:5246:0:b0:2ee:f77f:3d02 with SMTP id
 k6-20020a5d5246000000b002eef77f3d02mr4641053wrc.0.1681480486203; 
 Fri, 14 Apr 2023 06:54:46 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.204.198])
 by smtp.gmail.com with ESMTPSA id
 y12-20020a5d470c000000b002c70ce264bfsm3619114wrq.76.2023.04.14.06.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 06:54:45 -0700 (PDT)
Message-ID: <9949b687-f94d-20cb-59f9-be543c87a574@linaro.org>
Date: Fri, 14 Apr 2023 15:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] rtl8139: fix large_send_mss divide-by-zero
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230413171946.2865726-1-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230413171946.2865726-1-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 13/4/23 19:19, Stefan Hajnoczi wrote:
> If the driver sets large_send_mss to 0 then a divide-by-zero occurs.
> Even if the division wasn't a problem, the for loop that emits MSS-sized
> packets would never terminate.
> 
> Solve these issues by skipping offloading when large_send_mss=0.
> 
> This issue was found by OSS-Fuzz as part of Alexander Bulekov's device
> fuzzing work. The reproducer is:
> 
>    $ cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest, -m \
>    512M,slots=1,maxmem=0xffff000000000000 -machine q35 -nodefaults -device \
>    rtl8139,netdev=net0 -netdev user,id=net0 -device \
>    pc-dimm,id=nv1,memdev=mem1,addr=0xb800a64602800000 -object \
>    memory-backend-ram,id=mem1,size=2M  -qtest stdio
>    outl 0xcf8 0x80000814
>    outl 0xcfc 0xe0000000
>    outl 0xcf8 0x80000804
>    outw 0xcfc 0x06
>    write 0xe0000037 0x1 0x04
>    write 0xe00000e0 0x2 0x01
>    write 0x1 0x1 0x04
>    write 0x3 0x1 0x98
>    write 0xa 0x1 0x8c
>    write 0xb 0x1 0x02
>    write 0xc 0x1 0x46
>    write 0xd 0x1 0xa6
>    write 0xf 0x1 0xb8
>    write 0xb800a646028c000c 0x1 0x08
>    write 0xb800a646028c000e 0x1 0x47
>    write 0xb800a646028c0010 0x1 0x02
>    write 0xb800a646028c0017 0x1 0x06
>    write 0xb800a646028c0036 0x1 0x80
>    write 0xe00000d9 0x1 0x40
>    EOF
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1582
> Fixes: 6d71357a3b65 ("rtl8139: honor large send MSS value")
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/net/rtl8139.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


