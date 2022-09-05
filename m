Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4051B5AD18C
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:28:00 +0200 (CEST)
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAGl-0005GT-87
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9qZ-0004Nq-7K
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:00:56 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9qW-0003K2-Vm
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:00:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id k17so5055363wmr.2
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=0De+yCaFYqKzo1hQSqjfaO7YCfXhC/P05bx7syj9M1g=;
 b=Rcu4yvS/mQiW9Xim97AHZHlVaYlS3umwIAxHkI22fKcJJg7B4h5oKQcwWEn88gTwV9
 vrl9k1KhBHC0WekZczZaCKsnlb6uGQgib3qtb5OLzU6Y6tvtMx8aKRLsP3ls4VxA7P+H
 546BQGELYQSEAN/7sBk1hxobrmbe/ubl3llE/uXQ9sotM9UwJ7wmxYUFZmFDDduT9DpY
 fkoasVSGM2NwNbqLoK2xC53wWUUt49aa6HsKpb68YStUTjBqiVWDwl2pz2/4BgWzZ/vl
 C27B0dtiiCUuo+HZ72jQ8Qmh0V2yxsukSjURMgQz7EDS/m1C/0B12+RC+wOh+U9whhR5
 0Ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=0De+yCaFYqKzo1hQSqjfaO7YCfXhC/P05bx7syj9M1g=;
 b=WUJqc4qAcCIITZ6+u8C4xVwFsavQSvxVmrJjVWEaVbA7DiKgfmU2SkTl2uaOoZ7dJh
 zFVUUTIbQLjm4wgNMvpFgug6PMALawTU/k4bG1QDyTsNimRHGYVVUAefKV1XMx5fFN81
 5cnUO1HGGHXXTC47W8sqCiS5wn+0c0e+IXKaIeW7swVn4fzxK4D8B13R0szO8Welizxo
 Ci/04+D9FoAd8JTpKmQCDVP1Q9mZmTAScCyqBN5ioVO8qqV2lEEIr6DuVAjjTNld/Wpr
 J18YgUfZLtnkJeJCny7tvV44+0oZkSPHpoAh+4AuuRBKJLV4hZolKqOEvkP3ybdF9mTn
 H5sw==
X-Gm-Message-State: ACgBeo0CIt/rcJwwGiiEsy/Q/VXjcYwrE5sIQn40i0s8/QZhp/G/wh1/
 Zd1M6P/I+CiCbczNKtWu49NPyg==
X-Google-Smtp-Source: AA6agR7WpChGS3WxPcOyY7pDIw/ehvb2/uW3K2b4JDRwL7UkLXJ+UbUWcEqtxJbKsJVW+N9REpuljg==
X-Received: by 2002:a05:600c:3c96:b0:3a6:58b2:a98 with SMTP id
 bg22-20020a05600c3c9600b003a658b20a98mr10631414wmb.43.1662375650319; 
 Mon, 05 Sep 2022 04:00:50 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a5d48c4000000b00225239d9265sm8471759wrs.74.2022.09.05.04.00.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:00:49 -0700 (PDT)
Message-ID: <5a77bd00-9329-c45d-16c3-98b258baabcf@linaro.org>
Date: Mon, 5 Sep 2022 12:00:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/20] disas/nanomips: Extract enums out of the NMD
 class
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-3-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-3-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.716,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/5/22 10:55, Milica Lazarevic wrote:
> Definitions of enums TABLE_ENTRY_TYPE and TABLE_ATTRIBUTE_TYPE are moved
> out of the NMD class. The main goal is to remove NMD class completely.
> 
> Signed-off-by: Milica Lazarevic<milica.lazarevic@syrmia.com>
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> ---
>   disas/nanomips.cpp |  8 +++----
>   disas/nanomips.h   | 59 +++++++++++++++++++++++-----------------------
>   2 files changed, 33 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

