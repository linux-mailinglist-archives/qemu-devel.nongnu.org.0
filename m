Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A15B86B7367
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:07:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbf4n-0000Op-3J; Mon, 13 Mar 2023 06:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbf4l-0000Og-Fv
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:06:43 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbf4j-0003Gl-Ox
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:06:43 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso7445659wmo.0
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 03:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678701999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C+GfHszVAROq90VK/0ukmJiK/wCjvT4xrufxPbjnQzI=;
 b=fRDg/c7OH5X9keyEC39OZFIjDzb86Q9aratcSVn9qxYMG9awH74lUvd7GiZZAUgA1r
 HgXUc7A79pUVvAqbLoVkvHloXkAsJrAXpCZyw0SQ1LBl2PhsUV2JsdQT6gQo13VuoW9T
 sVALi+oKOED2PWc74+t+L2t355wps1ZXNLPSfGTEvZKb/QhBL9uyE1uIH5Rm2fTBE1Bd
 4KKCj4ldDRxNakU1deUY7sPeQSGJph8sb6F0WzxxgOvRMr5+h2CJ4dLvHeVH/JfyQOMS
 S2KRcWEveRjHIE6VP5AMhqJ6WDOJOP6mN/vlIvVfD6KbT7zbU7pI0gfQRDjAPKthqQF0
 89Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678701999;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C+GfHszVAROq90VK/0ukmJiK/wCjvT4xrufxPbjnQzI=;
 b=zAmQbiPt3QEEAhW8aAUwJeJsZIv2O/IJzDBsDgvWH/zoHY79LDfUQfW/LFiHJeh5V4
 VPtEuf7dCq121x7ftXE7Mmd3eBNI4UHmSLWZTAJPxu9rL92Z3G798MZS1q77BHhJ9PFY
 hCZ2sCjh+1TVTYNjdj8XRW2tI+yyZIWeKDEpXM4Y8QlDUzdA1n0XcNyi2T9fUaghcwev
 SPzo9Tc87KVKhyHuKxCyTdvhGUwUDwera5k+B2Qhka44oV0bZ641e05Qwvug6ywpnoHe
 IBjOTfkbf8ocyIBr8UYwIVlX5yNZulRxvVWBF5XxZeg67BniVKR2ZS6hqpIK0gQrqaNT
 +ydA==
X-Gm-Message-State: AO0yUKXLd/to/149z/4E5g1T9k64iS5Ma24d5HaNBxIbmMrfl3s2kNjy
 tlfvfPZoR5Xq/NTLlZUwSO3boA==
X-Google-Smtp-Source: AK7set9S76SyZwbOnv8aiZqXzlqAM84HtWRp8phuduLd6h7tcnG47rJpuMulCkKxAAhlVsjPW9J45g==
X-Received: by 2002:a05:600c:600d:b0:3ea:f0d6:5d37 with SMTP id
 az13-20020a05600c600d00b003eaf0d65d37mr9913111wmb.8.1678701999199; 
 Mon, 13 Mar 2023 03:06:39 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i8-20020a1c5408000000b003ed246f76a2sm2541486wmb.1.2023.03.13.03.06.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 03:06:38 -0700 (PDT)
Message-ID: <d26dc7f1-72d0-e0a1-df0f-9e38a7e347df@linaro.org>
Date: Mon, 13 Mar 2023 11:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/6] memory: prevent dma-reentracy issues
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
References: <20230313082417.827484-1-alxndr@bu.edu>
 <20230313082417.827484-2-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230313082417.827484-2-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 13/3/23 09:24, Alexander Bulekov wrote:
> Add a flag to the DeviceState, when a device is engaged in PIO/MMIO/DMA.
> This flag is set/checked prior to calling a device's MemoryRegion
> handlers, and set when device code initiates DMA.  The purpose of this
> flag is to prevent two types of DMA-based reentrancy issues:
> 
> 1.) mmio -> dma -> mmio case
> 2.) bh -> dma write -> mmio case
> 
> These issues have led to problems such as stack-exhaustion and
> use-after-frees.
> 
> Summary of the problem from Peter Maydell:
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282

BTW we need to commit these reproducers as tests/qtest/fuzz-*.

> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> Acked-by: Peter Xu <peterx@redhat.com>
> ---
>   include/hw/qdev-core.h |  7 +++++++
>   softmmu/memory.c       | 17 +++++++++++++++++
>   softmmu/trace-events   |  1 +
>   3 files changed, 25 insertions(+)


