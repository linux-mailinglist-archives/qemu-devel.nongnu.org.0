Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C33655BD1
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Dec 2022 00:39:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9E6L-0007p8-EE; Sat, 24 Dec 2022 18:38:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9E6J-0007oY-FI
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:38:47 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p9E6H-0005M3-QO
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 18:38:47 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 c8-20020a17090a4d0800b00225c3614161so4768527pjg.5
 for <qemu-devel@nongnu.org>; Sat, 24 Dec 2022 15:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2p/wIHMt5QkVq4c2GBCeHoBMkVJIOYm8sUddhj7sHUI=;
 b=akpNQo8FdNjzOrI+hcw2DCihnBbDfz07lwVnaM4WObap8ql17RBEktTOeTvBfXES5g
 YNWp7eBPkWM/hzRrM36z3X2PmxCUNw7+N5V+tZO564MXqui2PiP5gMNst01mgWYMRKMb
 65IjdCohoLTmEO/gvYFAfB/SuBlylp7zrndcBz0Fk6WzO7HRg4Gw5MGAp24bPOUEXJ9a
 R0vHJNUCigRmrV6xBvgPMSvngTMbjeN4Ti0TtQaIgrxXz04l7cTEGJsvzpI5J6i5uKQY
 x0ZtxIICZNMwCmmhHWkyRqsXvCwmsn0eJp/WuyigDg4g4wKyqxriE7CNDTM34DDIgm3D
 JAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2p/wIHMt5QkVq4c2GBCeHoBMkVJIOYm8sUddhj7sHUI=;
 b=SRvsCkVFAg+5refTktSb9e7W02XrejO/x7rA3U3Rt9FsshZ/TFIenUkukWpAD56jAT
 gdIxK2tn2MiKq/gRr2ZxnrEr9i61xO4Upkcp2lxt3bdazhhlhCYit+7sqIjxab1H4lq/
 nL+tJUadYO8++7nanXOyskTtHT9uiVb2EUtXWv0cwc5vGmuVxnmezbQ5DECN+5OUv6sC
 L+V+tI0MhxZIPPx9QVRk2xpHoHm9/X1Ez017UiqJbcEBei07pe5bvMm6HJ7M6xrA1QEu
 JLqi4V7cT+vY7VfcP+Gc26aSWKDpqvsHLkz99hgCOq+8aR77wQcxZTvta5qmShDrcGPI
 1BaA==
X-Gm-Message-State: AFqh2kpo1fnjeefKTDqn4YrJJT2m9ATVVL28348JRTA4loOt6YeC00rM
 Je49WEPDNLuTbZqLFmvy8RWZAg==
X-Google-Smtp-Source: AMrXdXsDuoP/eRusnptWKx/XKiFbPIwBGUYWvS2QUxnPfz0Xcm89KauviEMLMXkXrqXbvXMygTvyzw==
X-Received: by 2002:a17:902:7b94:b0:191:3ebd:c3a5 with SMTP id
 w20-20020a1709027b9400b001913ebdc3a5mr14059728pll.17.1671925124132; 
 Sat, 24 Dec 2022 15:38:44 -0800 (PST)
Received: from [172.16.2.110] (76-14-210-194.or.wavecable.com. [76.14.210.194])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a170902f68200b00177faf558b5sm4487183plg.250.2022.12.24.15.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Dec 2022 15:38:43 -0800 (PST)
Message-ID: <0849f5d5-5f6c-f9f4-da05-361bcf914ec9@linaro.org>
Date: Sat, 24 Dec 2022 15:38:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
References: <20221223090107.98888-1-agraf@csgraf.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221223090107.98888-1-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 12/23/22 01:01, Alexander Graf wrote:
> The finalize_gic_version() function tries to determine which GIC version
> the current accelerator / host combination supports. During the initial
> HVF porting efforts, I didn't realize that I also had to touch this
> function. Then Zenghui brought up this function as reply to my HVF GICv3
> enablement patch - and boy it is a mess.
> 
> This patch set cleans up all of the GIC finalization so that we can
> easily plug HVF in and also hopefully will have a better time extending
> it in the future. As second step, it explicitly adds HVF support and
> fails loudly for any unsupported accelerators.
> 
> Alex
> 
> v1 -> v2:
> 
>    - Leave VIRT_GIC_VERSION defines intact, we need them for MADT generation
>    - Include TCG header for tcg_enabled()
> 
> v2 -> v3:
> 
>    - Fix comment
>    - Flip kvm-enabled logic for host around
> 
> Alexander Graf (2):
>    hw/arm/virt: Consolidate GIC finalize logic
>    hw/arm/virt: Make accels in GIC finalize logic explicit

Series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


