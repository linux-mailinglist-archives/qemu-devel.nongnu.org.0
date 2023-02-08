Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2368F7D6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPpqn-00083q-MH; Wed, 08 Feb 2023 14:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPpqi-0007sk-L8
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:11:22 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pPpqg-0003Nl-HH
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:11:19 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 gj9-20020a17090b108900b0023114156d36so3117597pjb.4
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 11:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nJP1yGLiveBfNzIjhX2krrGn53w4wtj8etqfJwO0xFU=;
 b=mT4jFQguIae9ycHRK3KZRKZpwht9s/mEFr46OstO1OuMY1fnUnhhduj7vuqkDGZ6iq
 0HDQFgz9u0S7UjIEQSwpjKhiY/A5FkJhWkms2ytomQvM7DILtLeZQ5q46volSFsH+Rea
 DlxITvi2XBpEBEaGYtNCqK0reDdTTikgR+mNxgriCicTL+hr3Mb3EK7HEAWby9MGTxzU
 VGV6yksknRHI+LJcNi5is28OpLs6ERn9cUcGNn/6z//e6BpQ2qpEJIJ2c9HboMznO+1y
 n85J4XJo5lrUOdpZJCebK+xbm/MGL0il9yTQcTRCYhNbkiFdXp9cZqpyJsxW0q3SKkuX
 3SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nJP1yGLiveBfNzIjhX2krrGn53w4wtj8etqfJwO0xFU=;
 b=hquHGmLOjdhbKBXOznVuvW+vLN+bjdWC/evvpAYHES1rjHIE/MZCIcMgbKhkLPN2ea
 YXvbrQNtdGnX5DLE3igU2n4Pl5bMP+HBlcoOS14TK4Y8xG7Ux4QdBuDqoncVyanX6OHQ
 dCDsU3ws+WW0uAiXV/uMw8Vey+ExbjUv32+X1r9zDgUT5u8ueW++n27/PwEzz42jfNES
 LUoqibZE9vviDrb7p2+6syaKzNhmnF1ovFQlrSpBSxgErtKrE6Evt9w9Y7uRmM1ktM9g
 SFo939DCpcHfo5NVrFUM9MKV45mdywccg0NI45CQxwXEd/ZA0o5qs8x9zpvs+gvi+hQO
 ep2A==
X-Gm-Message-State: AO0yUKUEmxEIJkdOQA+ax0+Lw+8Ch0lT9MpNMOxjRCVgfr8HSTmgtEI3
 +t/CKz+np8xOj5vP5OwhbwU8eA==
X-Google-Smtp-Source: AK7set9R+b6EvIYP+CvUU7guSzjAJClVEILAoizH8IeW0sjUhyhcruD6YWnOOCRqu+abFCPoazQYiw==
X-Received: by 2002:a17:90a:47:b0:231:24c1:8025 with SMTP id
 7-20020a17090a004700b0023124c18025mr1489240pjb.34.1675883473188; 
 Wed, 08 Feb 2023 11:11:13 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 w5-20020a17090a380500b0022c942b8683sm1692547pjb.56.2023.02.08.11.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 11:11:12 -0800 (PST)
Message-ID: <81960e11-f378-6719-2e3e-45aa0e06366e@linaro.org>
Date: Wed, 8 Feb 2023 09:11:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] exec/ioport: Factor
 portio_list_register_flush_coalesced() out
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Bernhard Beschow <shentey@gmail.com>,
 David Hildenbrand <david@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230207234615.77300-1-philmd@linaro.org>
 <20230207234615.77300-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230207234615.77300-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/7/23 13:46, Philippe Mathieu-Daudé wrote:
> We always follow the same pattern when registering
> coalesced portio:
> 
>    - portio_list_init()
>    - portio_list_set_flush_coalesced()
>    - portio_list_add()
> 
> Factor these 3 operations in a single helper named
> portio_list_register_flush_coalesced().
> 
> Drop portio_list_set_flush_coalesced() which is now
> inlined.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/display/qxl.c      |  7 +++----
>   hw/display/vga.c      |  5 ++---
>   include/exec/ioport.h |  5 ++++-
>   softmmu/ioport.c      | 27 ++++++++++++++++++++++-----
>   4 files changed, 31 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

