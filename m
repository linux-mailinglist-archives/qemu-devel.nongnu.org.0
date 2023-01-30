Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D51681398
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:43:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMVNG-0008VE-6k; Mon, 30 Jan 2023 09:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMVN8-0008Qm-Jd
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:43:02 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMVN6-0006Tj-UY
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:43:02 -0500
Received: by mail-pl1-x62b.google.com with SMTP id k13so11889683plg.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5ZG6+R9GPZg140VII+sGCGp308nrYFBQ1rehSUjRTpQ=;
 b=AIUzG2w9APPCQqA5sDp8ziM1jawcR5xn3M2B3aTtPMJc8K3lGozZW65bfmEs2G214J
 zdOl7c4M8/nqACGEZ9bt0GujtZTAOs3Cr1pSL11zUbh26NgjuwuFyeqqTfk/Z6P+rgto
 g63tVsID+TfWrP+8RqgNU4+OrgScKHOqT/VQggztV/HXUT38CMiei+NDrZAF9YgySvan
 SH4WEBv2n9HmXoZvXUv+syHkls37jsNEfVamjrVtOa25VR6d5p6jFEhnggtcyhfldE8p
 NIp3DC7jJ2Ub4UBSlSkjGIonp6ABbTz/1nasFMicrVoykzQmJmmIACbH0oQPBaeA5zrh
 Vocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ZG6+R9GPZg140VII+sGCGp308nrYFBQ1rehSUjRTpQ=;
 b=43NkLyP7ItuNO5va4TFRsvZ4vMQzEcWunn2rtcDFmUUzlNWCpT4FBcAil75IEn7wMr
 7MvHmJjp0dUHvTkWU0/SNzAkbWfKi6xoIoS4Fljm9zyMqdkZQz+6lC8HZqhvA0BKohi8
 tbDA1GUzJLbb82a4WkdkPEUllk8L4Rg1YessnJUy/v5f8KVFTWY3OYYNrvXALafS8aYs
 EhOxA6efZUdH6hXYEUXLpTfW84zukfFRvK4eDZQrsCKsJmsjLRZ7Ya5SJU4qhxplL1/e
 8d861SYczyQi0woiSz2LFtoiOY0/uNGqxYb1pVnNSVhlF9UK8VRMDgqJrqUO2C727VQE
 PsJA==
X-Gm-Message-State: AO0yUKUFDm6jBy24nuC+wTRZF/z6dcvqX39B4Cg8y4/ifdb0w9jSNZww
 eMk4ruiYvtlRRMH7oc0sPZ5EIA==
X-Google-Smtp-Source: AK7set9sKnBTyunEAs2Ly0B4pSRfMzStEDIqj7lVq8cNQnSLqujuKnk1JsJRZq4cFwrZ/iy88FtO/g==
X-Received: by 2002:a17:902:f10b:b0:196:7a96:cd82 with SMTP id
 e11-20020a170902f10b00b001967a96cd82mr4211411plb.42.1675089779781; 
 Mon, 30 Jan 2023 06:42:59 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:4457:c267:5e09:481b?
 ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 jl16-20020a170903135000b0019719f752c5sm1299884plb.59.2023.01.30.06.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 06:42:59 -0800 (PST)
Message-ID: <a217fed2-e868-5050-9370-9ad3e8ba357e@daynix.com>
Date: Mon, 30 Jan 2023 23:42:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH] fuzz: add igb testcases
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230114041004.36459-1-akihiko.odaki@daynix.com>
 <20230129053316.1071513-1-alxndr@bu.edu>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230129053316.1071513-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001,
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

On 2023/01/29 14:33, Alexander Bulekov wrote:
> Signed-off-by: Alexander Bulekov<alxndr@bu.edu>
> ---
> 
> Hi Akihiko,
> Thank you for adding a fuzzer config for this device. The fuzzer found
> some crashes. Many of these are probably duplicates - the crash
> deduplication script has limitations. Also some of these might not
> specific to igb (e.g. -net user/slirp issues) - I had not good way to
> filter those out.

Hi,

Thanks for testing igb. I have just sent fixes to the list. The below is 
the link to them:

[PATCH v5 0/9] Introduce igb
https://patchew.org/QEMU/20230130140809.78262-1-akihiko.odaki@daynix.com/

[PATCH] hw/timer/hpet: Fix expiration time overflow
https://patchew.org/QEMU/20230130135001.76841-1-akihiko.odaki@daynix.com/

[PATCH] softmmu: Use memmove in flatview_write_continue
https://patchew.org/QEMU/20230130135152.76882-1-akihiko.odaki@daynix.com/

ip: Enforce strict aliasing
https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/131

Regards,
Akihiko Odaki

