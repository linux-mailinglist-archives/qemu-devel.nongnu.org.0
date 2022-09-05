Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D845AD1A3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:37:16 +0200 (CEST)
Received: from localhost ([::1]:50984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAPj-0003BH-PL
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9uE-0007R2-AP
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:04:47 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:54797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oV9uC-00044L-GN
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:04:41 -0400
Received: by mail-wm1-x336.google.com with SMTP id s23so5060315wmj.4
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=6PJ9eKmSUDicnJp17GKPJriJ/RVfSIKjZnnORhyxgCI=;
 b=ZUjhto+WjSvGgknlN8Ow7yn96A9oU8BQJyvIVaK5Cpdb0cxx3v5ONG4d4Y27Z54mwN
 iFo/zN6ffZ/1kyjXpOQxzMqNIm25y7KG8MuQuaMy0kAyUC8Qz/re3JNdbBSI2pua+hze
 4CW5DfundSIPUkAKcYAaMD6aHSthP/1vBR0f6U7hGX4ilmVRBYeS+1PT6EbpICbvR5j6
 Gnm/S2ceQiPF4sbd1/+W6scfk5y18rvxDuQImMiTXAD4n0s7hXyhNq9DGRfDzqs0gM8M
 Gg579vFV9IjaiwJqw+Cub01upF6WlL6LT787rR5BW8JDu58vSsAyyyuOTxNXoiAlCT05
 tgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6PJ9eKmSUDicnJp17GKPJriJ/RVfSIKjZnnORhyxgCI=;
 b=6oNptpzy+4aiIOczZlK4pr6LS9ZlPvjQ6/HGqmNUvr/TIGULfRO/0OGJBMJkCVH4/U
 9NMhQZx5ZbLFOBI5tgG85vLqvom2q99hC91xV1O2izi2sBUS6/M3D/qNHxadKj70dvXl
 G4nTC7skmYvChsl59WK4wDBwWG5Nu90ce/HgJ/YsqkOTfziauRthB+vu9ikp0DQHlyb/
 whnHWQydzFreBNYelqkdHM6LcwF993Do4ZKnNeODh/itCQhDy3oO3fNRAGO5Vk8q2s1a
 At+XQFJCZCm3oq2GMptj+gW363PknMLlcDjZoFxAqqzVxqnFQ3ltcBT+p0W8BzDk8NJw
 nFiw==
X-Gm-Message-State: ACgBeo0HnHt9zoM0SaID5AK9o5c3wOvtf01qsCSBEzUHdarNNjqcnVAG
 3kdv74tUCk/PNMeTNwYbhQ5fJA==
X-Google-Smtp-Source: AA6agR6YJKQGwqRlm2K6zpYeR6Eo37bMHbAbE/CgfJx/pYXbe88Cz3w/rxBnA7pZWW+5ig7SpE/Wrg==
X-Received: by 2002:a05:600c:1906:b0:3a5:fe9c:4dcf with SMTP id
 j6-20020a05600c190600b003a5fe9c4dcfmr10569672wmq.118.1662375878888; 
 Mon, 05 Sep 2022 04:04:38 -0700 (PDT)
Received: from ?IPV6:2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c?
 ([2a02:8084:a5c0:5a80:f2bf:c5c3:8866:995c])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a5d560c000000b0021ef34124ebsm8688298wrv.11.2022.09.05.04.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 04:04:38 -0700 (PDT)
Message-ID: <31be828d-4237-909f-3ae1-a2fa18817ed6@linaro.org>
Date: Mon, 5 Sep 2022 12:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/20] disas/nanomips: Delete NMD class fields
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 peter.maydell@linaro.org, djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220905095522.66941-1-milica.lazarevic@syrmia.com>
 <20220905095522.66941-4-milica.lazarevic@syrmia.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220905095522.66941-4-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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
> Two class fields have been deleted.
> 
> Since the m_requested_instruction_categories field always has the same
> value, which is ALL_ATTRIBUTES, the only use of that field has been
> replaced with the concrete ALL_ATTRIBUTES value.

Since these ALL_ATTRIBUTES tests are always true, you could just remove them.


> The second class field m_pc is added as a parameter where needed.
> Therefore, prototypes of the following functions have been changed:
> - public NMD::Disassemble method
> - private NMD::Disassemble method
> - NMD::ADDRESS method
> - all of the disassembly_function methods
> 
> Accordingly, the disassembly_function typedef has been changed.

Fine.

These two changes should be done separately.


r~

