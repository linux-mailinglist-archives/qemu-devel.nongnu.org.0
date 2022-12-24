Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D19655AD6
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 18:33:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p98OL-0003ZH-A3; Sat, 24 Dec 2022 12:33:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98OJ-0003Y3-7Q
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:32:59 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p98OG-0002hP-TJ
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 12:32:58 -0500
Received: by mail-pf1-x430.google.com with SMTP id n3so5106486pfq.10
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 09:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=egLvCV8ic8eY4PldT5NgzkR3X+1oEzQ7NovdsOlpKbM=;
 b=Hp3KFRaInxpUYgEE2zbwRGgFojZgYRTHoYdB84jYqA5QvWS+O5FMW6sKR0vIpvpbTs
 R5R9AfsbnafDhnsdLXjXCVIXSl+qGIToowaLGp9fq3VPE06Vn6gAYZ5RiTDziRssRzee
 T3dP6eLkfjqlV2sabUOx5rgLPj1QQ8+nKi5QcT/LeOZGtSXHf+PjRlcTdq4xttH3cpGU
 FJ6tXSkx8NZxWmFbJimGpuYWsG6eOvgLwSe4JDJrlWESWVc0DOZOz8piQTdhIYjNpMXu
 Oh1JEiUl4pnfKvQav+M8H5+e+uu6+jDdK61JDcrsAP7GIx+5PpgOXWcuGgJxQfV16dsF
 zhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=egLvCV8ic8eY4PldT5NgzkR3X+1oEzQ7NovdsOlpKbM=;
 b=pzfERk76+RXXiXttnnHAFy5E/b5CgYl6JkIt2SDqtHvJw10cC2u7byUohkeojH9hQS
 mNp8WkY12HFamDRvY4kbVpun9102aWCPoJwG4eXwAaf8tOv43AZU4lm65SKgcBqCrRTh
 Uwj/hftp843hxsn3v8f09Z5e3ioutUo/oV5yOS0X4UwPsxCnaRzYHryyntfr1Zex2Anr
 C9a9qH/IoM9no1JGeG6w9lksTp/26D6gI06BK4c3W04IUv/4X2dYxgalPh9sx4kZSxOz
 pxv/gk1lx+bzba04XP/MKQXbCVP6o3qkqHdAqskhrxhv+tpzrgX7Sdp2UA7AKfbcXpbB
 QM+Q==
X-Gm-Message-State: AFqh2kpaco650hn0tlwiGGhbUOeCSIJoUjqRxqiSqZtdS377zkrVoJ+Q
 jU7VTKQ4zTVH0X65+zbShp2k6fYuGFrj6KeR
X-Google-Smtp-Source: AMrXdXtchnkv4Cjz+b060INQgLkWme+tGbClmmW2Fx4YsK8OIBi4N0d361U9yNMOQDZ0ndKPPYzcxQ==
X-Received: by 2002:a62:6143:0:b0:577:3546:d7be with SMTP id
 v64-20020a626143000000b005773546d7bemr15042551pfb.30.1671903171378; 
 Sat, 24 Dec 2022 09:32:51 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 k8-20020aa79728000000b00575caf80d08sm4386996pfg.31.2022.12.24.09.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 09:32:50 -0800 (PST)
Message-ID: <fd5e8513-8890-ca06-194c-4ea4538bc7f3@linaro.org>
Date: Sat, 24 Dec 2022 09:32:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 01/43] target/loongarch: Add vector data type vec_t
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20221224081633.4185445-1-gaosong@loongson.cn>
 <20221224081633.4185445-2-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221224081633.4185445-2-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 12/24/22 00:15, Song Gao wrote:
> +union vec_t {
> +    int8_t   B[LSX_LEN / 8];
> +    int16_t  H[LSX_LEN / 16];
> +    int32_t  W[LSX_LEN / 32];
> +    int64_t  D[LSX_LEN / 64];
> +    __int128 Q[LSX_LEN / 128];

Oh, you can't use __int128 directly.
It won't compile on 32-bit hosts.


r~

