Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92AA6F2040
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 23:46:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psVtj-00053B-9z; Fri, 28 Apr 2023 17:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psVth-000533-K2
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 17:44:57 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1psVte-0005RZ-RW
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 17:44:57 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso963415e9.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 14:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682718289; x=1685310289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/qSg9McgUthlMB63jK62QZmGLiE0xWYmoseCiuiJofw=;
 b=ZFjR7qNVBEL2/RBfgaSa4caP0IcdME5MEGdgpF3otpNAate2lWqcxyEX2V6+TNRbrr
 kvUYNscWj0SWtJUrJk1CpPhnTcrz7Ani3RWhS9ky65VXrdNhdaZtHQaMq0/EELxzFeL7
 MEAgn5pjbrppMh1ybqnFf0lVynRqss4k966D2nvs7HS87uvI2hxnS7Gl8WUDk9ett2hP
 tDiGE0Cyf/zLRJIeTUrPkLg8pqHx0WiZPbHC+TCBGHovRKa8A7xN6/Wil7u6eEz3gi6e
 KFWYC/9fz5VkjHuyOo8o3BNMdwuwBd0M1Yopl6s5oKRNSCBDcfzbwhdiKsH4dbIi3Rb5
 dY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682718289; x=1685310289;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/qSg9McgUthlMB63jK62QZmGLiE0xWYmoseCiuiJofw=;
 b=kSvx18IUUoZ/SXiZgqnj5SvKWF+AF1YAbWCm8ReXiWe6zTD1o5UGp0hgAsnt89Uhn+
 mGXFSreiWuOjzL5bpJsAbp6Dqkv3uIBaozxNpRFD6o+TxwltejgGjQ55p1mRhBOp/MIy
 Qs3GdAb0/OMnmTgUIK9my9H4OyhrIGQwIfUPd/WfxX7U59PSA0DSxKpefjNzKZUCBFGB
 v56RIXXVlGC1UKWzTm71j3il96clTv6vUdYEbiNdEiCvLWCQaKVddIKivwgpqPK0QoSk
 AUaXAoMuy7V0E+30b+a04WU28ximpUIt/w0At9Lb/vduQKPz5zz2fu7cRCh9P7awaLco
 0LQg==
X-Gm-Message-State: AC+VfDwWCa7DJRvpzO0Ffi/AZwaXMsVIrecFzIp4IXsXTNZ8pWfPYNiM
 U8AqZSHJf4+15UOYsPQw9z4nIA==
X-Google-Smtp-Source: ACHHUZ4cZHFUNO2MqfApvVPvVypqGr01ExYNURdEY9q6d4mtqAik+4iPhJHIlU+I39gchSbKAymCDg==
X-Received: by 2002:a1c:cc0f:0:b0:3f1:718d:a21c with SMTP id
 h15-20020a1ccc0f000000b003f1718da21cmr5052790wmb.31.1682718288478; 
 Fri, 28 Apr 2023 14:44:48 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a7bc5cc000000b003f17329f7f2sm25361335wmk.38.2023.04.28.14.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 14:44:48 -0700 (PDT)
Message-ID: <3ee5308b-b25e-813b-4223-78aef99e93de@linaro.org>
Date: Fri, 28 Apr 2023 22:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/9] Hexagon (target/hexagon) New architecture support
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20230427224057.3766963-1-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230427224057.3766963-1-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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

On 4/27/23 23:40, Taylor Simpson wrote:
> Add support for new Hexagon architecture versions v68/v69/v71/v73

Where can one find docs for this?
The latest Hexagon SDK I can find is 3.5, which still ends at v67.


r~

