Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB716BF848
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 07:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdPmi-0004ix-VH; Sat, 18 Mar 2023 02:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pdPmT-0004iU-HS
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 02:11:07 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pdPmR-0006sO-RR
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 02:11:05 -0400
Received: by mail-pf1-x432.google.com with SMTP id ay18so4290943pfb.2
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 23:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679119862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2PumKDP0T9AGbrlg9ULgOVbL9K9S9B8XgGHaoLBF0aY=;
 b=Re+AgLn5rslhTrDsEHkD6f7yGA/6rZXwqOkbMPmZA21t1A3HtSEeH3DyB0z9mUpf44
 9MZxeuwGXl/qBn4N89MJLmUjunOoOVLuMOrKRjs4knu7Pjz7qqwZYIs72OR3IwIhYQTE
 VxY7ORKWPwz+OPEUlJmPPbWgdXULDUX5OyIf4AE2TXCbMtl6ZqYYwr+lO62EUCSlhECQ
 RMOwuOrwqNSdvfD/awRLZqYDFaIBu/d4peGjb8TvBkB5R113+ckwgNOm8BC11FU3zEUs
 NYx5Uxn9s/JIqdVybI66QCjTTVnpc5zp6EDnoQCbixiebR5c6XqZqCwAmHJkhhYNvtWF
 +ecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679119862;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2PumKDP0T9AGbrlg9ULgOVbL9K9S9B8XgGHaoLBF0aY=;
 b=V1oQPD60Yus3E/PLEnU0TQfxFvsmwQL8jR/TLduf4yZUW4gRGW18sAp89BAMIojRWT
 8tSglJ9ORlEij2oGBTXZC1eVOM6StSqLoq274VWVTzVgzypFh79tuvebCylZzRwf3Lyv
 UYSyKua3oz9+8mx7zv1Dw6Yp86Iws7JnoSZYE4K8ScXZiWA+1XhP6iKqCigSx7+ZmjDI
 0X6KuBuO/iFPDOfPSQxN95vq1AIY/RGNx3J5ifoF6AUyZISJBwknmFWaVEXiFP4daK4V
 +Zt+oB2Nc39Fez3vtNE45r5M+EsQ2xDeJmn9uh37TIENHtQNd6znY140Qp0ovwgydrLz
 JHIQ==
X-Gm-Message-State: AO0yUKUQPsaKNB+9JmQFuMSF8Fdw0kkUTJfjEFm1ftXv2jxKJw+Ibe+z
 /Xu5t+5MeAy5IRFAEDxibEoW9Q==
X-Google-Smtp-Source: AK7set8EwXIc/dv3ZtuDBbBYr8Tu6PurmPduNJUs0EGzxKRTXlrD3OEQ3JA4CeY7VLlagrw/0YQHew==
X-Received: by 2002:a05:6a00:9d:b0:624:ace6:c658 with SMTP id
 c29-20020a056a00009d00b00624ace6c658mr7653272pfj.28.1679119861713; 
 Fri, 17 Mar 2023 23:11:01 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 d1-20020aa78141000000b0062608a7557fsm2503234pfn.75.2023.03.17.23.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 23:11:01 -0700 (PDT)
Message-ID: <3d6089c8-21a6-acc6-28fe-16c00e49fa01@daynix.com>
Date: Sat, 18 Mar 2023 15:10:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for 8.0 v3] memory: Prevent recursive memory access
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230316162044.31607-1-akihiko.odaki@daynix.com>
 <CAFEAcA-creBruZ5FRkb__BtDiVW6BWL8hJr9QcN0SEK=gcpf-g@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <CAFEAcA-creBruZ5FRkb__BtDiVW6BWL8hJr9QcN0SEK=gcpf-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 2023/03/18 1:30, Peter Maydell wrote:
> On Thu, 16 Mar 2023 at 16:21, Akihiko Odaki <akihiko.odaki@daynix.com> wrote:
>>
>> A guest may request ask a memory-mapped device to perform DMA. If the
>> address specified for DMA is the device performing DMA, it will create
>> recursion. It is very unlikely that device implementations are prepared
>> for such an abnormal access, which can result in unpredictable behavior.
>>
>> In particular, such a recursion breaks e1000e, a network device. If
>> the device is configured to write the received packet to the register
>> to trigger receiving, it triggers re-entry to the Rx logic of e1000e.
>> This causes use-after-free since the Rx logic is not re-entrant.
>>
>> As there should be no valid reason to perform recursive memory access,
>> check for recursion before accessing memory-mapped device.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1543
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>> V1 -> V2: Marked the variable thread-local. Introduced linked list.
> 
> Don't we already have proposals on the mailing list for
> addressing this? How does this patch differ from those?
> 
> Also, "device A DMAs to device A" is only a subset of the problems --
> you can also have "device A DMAs to device B which triggers DMA to
> device A" and more complicated situations.
> 
> thanks
> -- PMM

I was not aware of the proposals when I wrote this. Alexander's proposal 
is better than this as it covers bottom half API and can disable the 
check if not appropriate.
https://lore.kernel.org/qemu-devel/20230313082417.827484-1-alxndr@bu.edu/

My patch can handle the case "device A DMAs to device B which triggers 
DMA to device A" as the accessed memory region is recorded with a linked 
list, and a DMA won't overwrite the history of the prior DMAs. But it 
cannot handle asynchronous case while Alexander's patch can.

Regards,
Akihiko Odaki

