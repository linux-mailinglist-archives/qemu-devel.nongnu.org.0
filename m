Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBA347C99E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:17:47 +0100 (CET)
Received: from localhost ([::1]:51158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzoOA-0004ZQ-99
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:17:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoLK-0001TI-Ah
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:14:50 -0500
Received: from [2607:f8b0:4864:20::434] (port=39762
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoLI-0006ff-Of
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:14:49 -0500
Received: by mail-pf1-x434.google.com with SMTP id s15so613230pfk.6
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q5W1EGxNcApQXa0N5MAigLvCTHQIYCbfugC4mfBfxZE=;
 b=MEedVHfGN01YpF31zJa9qV0YGRgGrKM7dSa1wKf+y7rUuaKZp1y+psynRbBSxtdpuG
 OlYjO/kfNwjZfMocf3Xy7YV3XW7+mzeqgs8uiBQ/d0Yn7QSYfze9GuLhy8DISmkZyxnW
 utupQtHZ2t2n7yUP7hYJlzq8XgGtQeFqcqsrRDGmFGsIEbBqyJBYVZZ+SqITQ6kijEdi
 6J+O9WUoe1FUT2WzUGVnxhMgiZ4VQY/K36fGdHEjyi2Sv4s5pcMIatn5ec6Z0reBk89y
 C8EQYBHIjzy0v6sp4oCE5fM0ASxnvj/KxAWTv+W2iwJbLobFk4wg3Y4U+rCDG5Jlctq5
 Q+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q5W1EGxNcApQXa0N5MAigLvCTHQIYCbfugC4mfBfxZE=;
 b=x4SsdQZVjKElzu6npaw56Si8xEHi/RXHBV5Tu/wYMXHC40t51Z+tFyGbWP55P0ADzV
 3/HdvTHdqym/oXFB+iFvdJFDeTuBHAYsC1EPYZe8Vq4/Ya7M/jLddnToDDdkrfuqmuQC
 netF5yZz3yZjABRtBoZgOTywfQ45a1fBh9P0xU47OzOkugmXmKtjPeOB31U13OgPndu7
 ig7nsmCNGsYqjAb9ohuJTI6MCTil5Vkm/pJ98HusAOTDf5nFo2Tt/SpTsMv+wAehFQl3
 SZ4fV0qeeDQjQKz3gjFK9aUep7d9KFF56eZWaCCrTqiLVrs1/vIMbwvtmMy0xof5Pz1G
 kzjg==
X-Gm-Message-State: AOAM5312PUiJBsNfjI01zy+Ta06i5/sMuSsF+xihudeEH7NMfKSL/O7W
 krLtEVBOBptF1RZVoWvIIJt18w==
X-Google-Smtp-Source: ABdhPJwObAy0n8cvAxPZizsdZYoEu7evIzo8IRwM9N8Z34rsF77xIng855LUjCMa/uROHkvR5uOkhw==
X-Received: by 2002:a63:8141:: with SMTP id t62mr497807pgd.548.1640128487311; 
 Tue, 21 Dec 2021 15:14:47 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id f124sm131878pgc.32.2021.12.21.15.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:14:46 -0800 (PST)
Subject: Re: [PATCH 2/5] dma: Let st*_pci_dma() take MemTxAttrs argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211218151053.1545962-1-philmd@redhat.com>
 <20211218151053.1545962-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <738ec9e9-96dd-1184-f57f-f83188c2a213@linaro.org>
Date: Tue, 21 Dec 2021 15:14:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211218151053.1545962-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 7:10 AM, Philippe Mathieu-Daudé wrote:
> Let devices specify transaction attributes when calling st*_pci_dma().
> 
> Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   include/hw/pci/pci.h | 11 ++++++-----
>   hw/audio/intel-hda.c | 10 ++++++----
>   hw/net/eepro100.c    | 29 ++++++++++++++++++-----------
>   hw/net/tulip.c       | 18 ++++++++++--------
>   hw/scsi/megasas.c    | 15 ++++++++++-----
>   hw/scsi/vmw_pvscsi.c |  3 ++-
>   6 files changed, 52 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

