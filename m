Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFA3694752
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:46:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZ9W-0007J7-KQ; Mon, 13 Feb 2023 08:45:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRZ9K-0007HA-QM
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:45:46 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRZ9H-0002z6-9B
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:45:42 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so11329247wma.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 05:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dNAzM32kwtHynYxcsQ2za0rZKez6T2DwGuAmV99K5Wk=;
 b=tQuimiDN8SnFwlr0SEW+S6TlFNSItT0WMbbgXlgtj42R8D7ak21ppdPgICFBfS8aXU
 Lx6oCmqUP1mNloeUXiAg1kdJi8J0jbJLWRoM68vg6Iv/2p4fI5ruYwS774p2Sn+q5AHc
 HQ+4N4ZzO9lvqRp48hJ4rOdH3IMFrrnjl++5wNpxQNx8dSWT2UBqVGZ1oh/NoDjRqmBM
 lvf7ODMY63c/rTGMcTYzv9N2HELR9SS6KYW7ceKU9ULITjHdAthd0aqfe8C6xU1DwC8M
 f1DFckzwkM9lYs67TqzQWP4Oms/fxVpTRjCRJmsDEFzXwm2TpjAvgFSm41BKkFBTCDm4
 obwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dNAzM32kwtHynYxcsQ2za0rZKez6T2DwGuAmV99K5Wk=;
 b=7+e3FZhnetsMiJ2jqrBJcRrtALyeUvZs00S6mHwT/lhJoHL99tRkIX8zYd/3GLypih
 mi4O2GbTnq/xA0wmRxbfBR9nDD8SmbqR9RIzpHlEZJuoSYXcStzH8RNiHNzjP5xC4XWB
 finJE8K7NoAbwT01VWsM/UDTRK0u0pGptKQ349IckOe09J5DrmJon67mU2j3UaIqO2OT
 DCbG0iUhsHFqXFgrUlAOalSHe4mrvpbH8SRA+5s/1VFsWBves+GuCxILLeg2a5OO/GaI
 BD8a2SYS/Twh1IMoQp8pgi+yP5dnZ/c+RTE+jb0Jvuu+jyPWMfHhOFt6rpO2OT5TEs3u
 fEHQ==
X-Gm-Message-State: AO0yUKVXc+OXgDhfX5bjdJyDqzr8NabVGgAXRlc0DkFji0eIRzRFYT0S
 l1+9SnW/aKVCYVNfWON/RkmX6V4o6I92L6HL
X-Google-Smtp-Source: AK7set+V5FuxfWVaAObbcBfYxJuQyS4UPWp3FVll2p3tL6FnY8/olv3Ikpiw93XzOfveSTh0OS/Tew==
X-Received: by 2002:a05:600c:5112:b0:3da:2a59:8a4f with SMTP id
 o18-20020a05600c511200b003da2a598a4fmr18840591wms.38.1676295934006; 
 Mon, 13 Feb 2023 05:45:34 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dd1bd0b915sm16866152wms.22.2023.02.13.05.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:45:33 -0800 (PST)
Message-ID: <8a2a0ec1-6708-5126-3007-e4112959fd4a@linaro.org>
Date: Mon, 13 Feb 2023 14:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] log: Add separate debug option for logging invalid
 memory accesses
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230119214032.4BF1E7457E7@zero.eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 19/1/23 22:40, BALATON Zoltan wrote:
> Currently -d guest_errors enables logging of different invalid actions
> by the guest such as misusing hardware, accessing missing features or
> invalid memory areas. The memory access logging can be quite verbose
> which obscures the other messages enabled by this debug switch so
> separate it by adding a new -d memaccess option to make it possible to
> control it independently of other guest error logs.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   include/qemu/log.h | 1 +
>   softmmu/memory.c   | 6 +++---
>   softmmu/physmem.c  | 2 +-
>   util/log.c         | 2 ++
>   4 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/include/qemu/log.h b/include/qemu/log.h
> index c5643d8dd5..4bf0a65a85 100644
> --- a/include/qemu/log.h
> +++ b/include/qemu/log.h
> @@ -35,6 +35,7 @@ bool qemu_log_separate(void);
>   /* LOG_STRACE is used for user-mode strace logging. */
>   #define LOG_STRACE         (1 << 19)
>   #define LOG_PER_THREAD     (1 << 20)
> +#define LOG_MEM_ACCESS     (1 << 21)
>   
>   /* Lock/unlock output. */
>   
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 9d64efca26..0a9fa67d32 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1379,7 +1379,7 @@ bool memory_region_access_valid(MemoryRegion *mr,
>   {
>       if (mr->ops->valid.accepts
>           && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, attrs)) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
> +        qemu_log_mask(LOG_MEM_ACCESS, "Invalid %s at addr 0x%" HWADDR_PRIX

Can we use LOG_GUEST_ERROR|LOG_MEM_ACCESS to keep current behavior?

