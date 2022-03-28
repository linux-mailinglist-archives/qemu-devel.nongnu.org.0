Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E514EA349
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:51:07 +0200 (CEST)
Received: from localhost ([::1]:46792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYyCY-000806-G5
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:51:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy9h-0004R2-5l
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:48:09 -0400
Received: from [2607:f8b0:4864:20::1034] (port=42842
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy9f-0000UR-Lb
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:48:08 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so917015pjf.1
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c+4kcRn0vdWfejQ5YCWICWWkqdMBeD9KvgFo40BooSI=;
 b=OwVYJwLDlC+hzJAzy0mq6gpkWyBN69tmfmtKwx5tYfRIoItROCpruFtLGeaqxYMdPb
 tssSZ/eqfIauRksKI288vmgRVleONPl5qqemOr1h5QmO4P+DNLcXt6uFkyJ68WNIVBKK
 3kWAv/kGszR6Jo9TFzX4qxIhjS3FHSpetnM1CI/u4bRApokXzeDYMLO1A7xHu+a3OUnx
 QZYzTE4pDDr3RUOVypcHmdaKBzykFIXkhiZcSoQIshWhVcD9SXKxgkroWIHQ3A07MudN
 JRNEpDSRvzXW1f1y9ld0xBDSckMxIEVhrLKeRheZYptAurbHK5YKDH88GF1xACKRfrZE
 vkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c+4kcRn0vdWfejQ5YCWICWWkqdMBeD9KvgFo40BooSI=;
 b=qlW2prji3Uaey04JvhA/sacrUJ1/GIMJ6NogavP4gi/I9WebeMPdyko6ERK8zy5u2Z
 zLhJ4DP5L1N1XYkYfRBAuy6ovEvNnydABTl53AiPn0BtI+YZ2VnZXg44H5ECXu/gCuBp
 1K0snQZXzk3AdoufAIQnznCYs/EosfhONQggW9Na4CW/A4ac4x0d8vjPga8riHDXYiMB
 8s8Z4RkXGH5fq8mjKDX1WLaiqcCZZno3Y60cDkBfv3tYx/3NlzCq54ogXSbM0IMnTxrL
 WiTYBad6jQVJZhz6ljAzfVswsqzVXxeEKgw/EiYf5b48DIbeh2BfAw/b97scQftJDgaz
 YM1Q==
X-Gm-Message-State: AOAM5304VoIfqX6QTvLGk/zliKQXGeniKfkWyXio5ubuaQHHkeGbRmco
 A/jH23xDnvUk0pkGlksr4V8=
X-Google-Smtp-Source: ABdhPJzBoCRlHs3+cTSJczeigz2jabTtgn/G3ymeMGC+PFhcSTEZyaEPBZdeBAPzBk+OtBf6DJ0Wtw==
X-Received: by 2002:a17:90b:1e47:b0:1c6:d5a9:b147 with SMTP id
 pi7-20020a17090b1e4700b001c6d5a9b147mr1328004pjb.223.1648507685432; 
 Mon, 28 Mar 2022 15:48:05 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:3c84:1cd:456b:b750?
 ([2600:70ff:f07f:0:3c84:1cd:456b:b750])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a056a00085600b004fb249e5be4sm10575653pfk.181.2022.03.28.15.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:48:04 -0700 (PDT)
Message-ID: <4c1a54bc-1600-7173-78fc-eb2cb98af2c2@gmail.com>
Date: Tue, 29 Mar 2022 00:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] memory: Make memory_region_readd_subregion() properly
 handle mapped aliases
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20220201100940.47788-1-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220201100940.47788-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/2/22 11:09, David Hildenbrand wrote:
> memory_region_readd_subregion() wants to readd a region by first
> removing it and then readding it. For readding, it doesn't use one of
> the memory_region_add_*() variants, which is why fail to re-increment the
> mr->mapped_via_alias counters, resulting in the
> assert(alias->mapped_via_alias >= 0) in memory_region_del_subregion()
> triggering the next time we call memory_region_readd_subregion().
> 
> Fix it by using memory_region_add_subregion_common() for readding the
> region.
> 
> Reported-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Fixes: 5ead62185d23 ("memory: Make memory_region_is_mapped() succeed when mapped via an alias")
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   softmmu/memory.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Thanks, queued to mips-fixes.

