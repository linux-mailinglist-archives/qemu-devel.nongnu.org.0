Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB564580CC
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 23:21:08 +0100 (CET)
Received: from localhost ([::1]:34934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moYjK-0006o7-DY
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 17:21:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moYhY-00063N-TL
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 17:19:16 -0500
Received: from [2a00:1450:4864:20::42c] (port=40545
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moYhW-00052o-T3
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 17:19:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r8so24846060wra.7
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 14:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uXpyrC3qcidqF3BCl1Do1azpcuOZyCIiAoL+Rqxq15I=;
 b=EyFzoMUjIWnA2XtGyopqjuBUaABAbS8r9QmfS9lYoykxav7lR36SlBYVWHfGMVh+GZ
 qFE9rcyxmRgzC+5bgNAoF3B8W39p22GXumdz1GiSyl2hq2CzKr9KoCuZktBmICnYd3xu
 Wqm6SnK7/De9fBTpE4YtUl3myIeQD+OeLS1phSLMOmVThPPV+4hUOGJTUM+7EAnXnZut
 Hg86IXxGUQMNrSixBsQBPOuXy2jvrf20Zl76iyJGQMkncUDZI8bHrUm0TiqSSmOIM+LX
 cezZDw92VYbf0UuTme357HoyazA/F5iI75qch/XDwcRsqSEF7toMsDcuzOF7ow2bC2K0
 8cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uXpyrC3qcidqF3BCl1Do1azpcuOZyCIiAoL+Rqxq15I=;
 b=boT81J0FdeWls3VzgESju+mnbz7OFilOhA/NChgqSp8yo7JLGZ0KU3xITgL3XExuCa
 rH0vOdu3iuJmkftAx0dLmVH/Y2p2e2wGATMXpjdl7kDpfc+zUnIo0eVky+4dImI70/yS
 uBhbW7Xi+7sjTViLCSG6QXy8yjRngazpdVrKxjuwekdj4VRyAhqnyuYA5M25HFTbxXo6
 /ErUKltC9vX1hm6kdSTFpHNZoiX/zjDlbyUNx/MBrz+EnoTC9f5Ee5I+3F5v+rLvFCBS
 KC3LEC/RGzBviHrCblBCEw9fwfiIkodIXEqK/edwbjF15VF23MfH006pmsy62RObbnYs
 c2DQ==
X-Gm-Message-State: AOAM533gyNPttCS2jp7PSoEmo7wBBim2dxXtgElgymOjo2Gw+CoqGtfK
 KcOztDuvZjszdueHxdzbvTKnfQ==
X-Google-Smtp-Source: ABdhPJwt3VRvGHP0CCY2rFKpcz53xmoIFof/nEioGKwB8HlHCSQrP1T1ej681ezuKRf/sSUj8+l5/g==
X-Received: by 2002:adf:e482:: with SMTP id i2mr21442964wrm.284.1637446752957; 
 Sat, 20 Nov 2021 14:19:12 -0800 (PST)
Received: from [192.168.8.101] (77.red-88-31-131.dynamicip.rima-tde.net.
 [88.31.131.77])
 by smtp.gmail.com with ESMTPSA id b197sm4012974wmb.24.2021.11.20.14.19.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 14:19:12 -0800 (PST)
Subject: Re: [PATCH v1 03/12] target/riscv: Implement function
 kvm_arch_init_vcpu
To: Yifei Jiang <jiangyifei@huawei.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211120074644.729-1-jiangyifei@huawei.com>
 <20211120074644.729-4-jiangyifei@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d3f974e1-6278-8c11-898a-a1cc55965786@linaro.org>
Date: Sat, 20 Nov 2021 23:19:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211120074644.729-4-jiangyifei@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: bin.meng@windriver.com, Mingwang Li <limingwang@huawei.com>,
 kvm@vger.kernel.org, libvir-list@redhat.com, anup.patel@wdc.com,
 wanbo13@huawei.com, Alistair Francis <alistair.francis@wdc.com>,
 kvm-riscv@lists.infradead.org, wanghaibin.wang@huawei.com, fanliang@huawei.com,
 palmer@dabbelt.com, wu.wubin@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/21 8:46 AM, Yifei Jiang wrote:
> +    id = kvm_riscv_reg_id(env, KVM_REG_RISCV_CONFIG, KVM_REG_RISCV_CONFIG_REG(isa));
> +    ret = kvm_get_one_reg(cs, id, &isa);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->misa_mxl |= isa;

This doesn't look right.
I'm sure you meant

     env->misa_ext = isa;


r~

