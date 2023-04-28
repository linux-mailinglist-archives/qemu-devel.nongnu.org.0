Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6901C6F20CB
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 00:28:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psWZU-0006xi-Pc; Fri, 28 Apr 2023 18:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWZS-0006xC-NR
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:28:06 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWZQ-00056D-RZ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:28:06 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso1150195e9.3
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 15:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682720881; x=1685312881;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=56IOLzA770kT40xdSibzvmIUHfGCxiEPZX/wywdJkEw=;
 b=cXj9Hhot8+zIe8kg9Sa/PiXrJvm/U46gOXWqoaLwkT3gvFc13zKF1qvLWatOJw4Q/Z
 J4u/bJ97Wwte6Iid3DeHjicf5i8HHDrVy/QfaK0kNaCCnqJueKE9dSMQgbjn14aMNEW2
 0k65H+/8jrSAab9zAsLCjlE/N+6jfCl3Pj9Dfs9xeDn+b8jqqIMj0Mrn2NayljXPq4rQ
 4m0DbV+TOJ5YlmHoPlhWCdw4qHvdk4PJxKFdmTvCL/8NBH6m45ape3i8qw4g1ga8J32I
 9qdHlYgvAKVBgBQe6XhPzq2iqZlXwjKdSoTPiTy51G88uCaIAFVQQPkOuQf1UElrGvHc
 gMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682720881; x=1685312881;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=56IOLzA770kT40xdSibzvmIUHfGCxiEPZX/wywdJkEw=;
 b=BRfzWZVYjRFdV5fm86UmrM5lS34V6ORTEnen17/zyYtGaudBE29Qs58DTVQs8U44B3
 MAVyZLv036v5PqDrx9i0JPjrDpVaYRxN/8ejbX62UUK449Pf33M75Km5MEgLIF1uLcAg
 3t7vUWw/onTpnMdH0Flqa8GVZSKk+o87OGx4AEHVAMC3G6LwQcHA/Bz9P2Kamj+tPx7K
 bcia+7913+m8ZqbZuoOk9RXvUY45ux1Rbq9pLEst2gw8tTcvbTRIG4dAkj9cUpqGU30l
 Uqne0zhwusPPfGeuRuYL8N3pPqBvB8Stc2YKVGF8fjSqjInCzofKcVTRAPcxVH9IC55O
 9tbw==
X-Gm-Message-State: AC+VfDwonM9buBREC8VVrZwbx8dGTF9kC1NjhdPlbKqu0PQSRthNFCAJ
 dZFPmXcsQdykQ54YhAmJuDu+zA==
X-Google-Smtp-Source: ACHHUZ4maGIwkNKVdegMC7L/CUk72WiJkdmq3rMfG//GBiNlSCC/0fuIXSRYTRvM8zzwJfa07oSkmQ==
X-Received: by 2002:a7b:ce86:0:b0:3f0:4734:bef8 with SMTP id
 q6-20020a7bce86000000b003f04734bef8mr5310808wmj.39.1682720881528; 
 Fri, 28 Apr 2023 15:28:01 -0700 (PDT)
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net.
 [88.28.19.47]) by smtp.gmail.com with ESMTPSA id
 j14-20020adfea4e000000b002fc3d8c134bsm22130949wrn.74.2023.04.28.15.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:28:01 -0700 (PDT)
Message-ID: <c17cbfae-ac52-90f1-a204-18c991fae011@linaro.org>
Date: Fri, 28 Apr 2023 23:27:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 5/5] virtio-gpu: CONTEXT_INIT feature
Content-Language: en-US
To: Gurchetan Singh <gurchetansingh@chromium.org>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, marcandre.lureau@redhat.com, akihiko.odaki@gmail.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
References: <20230428164823.789-1-gurchetansingh@google.com>
 <20230428164823.789-5-gurchetansingh@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230428164823.789-5-gurchetansingh@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 28/4/23 18:48, Gurchetan Singh wrote:
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> 
> The feature can be enabled when a backend wants it.
> 
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> ---
>   hw/display/virtio-gpu-base.c   | 3 +++
>   include/hw/virtio/virtio-gpu.h | 3 +++
>   2 files changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


