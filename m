Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB546221B7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 03:08:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osaVY-0007Is-Qg; Tue, 08 Nov 2022 21:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osaVS-0007IH-G4
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 21:07:58 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1osaVQ-0008JA-Tv
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 21:07:58 -0500
Received: by mail-pg1-x52e.google.com with SMTP id v3so14983268pgh.4
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 18:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5LEkd/qtbMX2p0tKaDqqxc4WkYTcomjJ9Xq8liuI4jw=;
 b=Jm7P5xS0vgtDsnXHWGC/3ycjCf/hBB/QlP8p2hGNEHFtlibiR5VBx/yn4XzU79jvVi
 7jxW4t8TZsxtikfgp75POatfdb4ccsvbDlulb8JWc4SAyeDOd9kRmzb1QvIkHAsgcI+D
 S8d12fKq0FjJ4iRI8NUTrELhExJSGxSc4FDmbkbTW3WnFI9w8EJA98qvODpCRgPH3dUr
 qjilVVeqalyEwgFrwmr+6YxFPqzYRgmmwd+E+xiQEkI6aJkyBwIYOVRD4Q5kBYwAvqzr
 nPrpmQrkt31w6dFMjJJLjuo6EEnqbBuHIZ6mjq67sg76Bh7wn0sQEKIiuDLZIEM6BcEJ
 wJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5LEkd/qtbMX2p0tKaDqqxc4WkYTcomjJ9Xq8liuI4jw=;
 b=FYcsb+kiTOqbVx0rxWXqroXpt7GOdI3m4NhxvdQhvfOSjLpgG6lL10gYuYHnGZWntn
 bZOVNRUlTzN2o7/ms3A23hpw2Zbj5BylyAxg/Wihx9ryiQF4v/bGT5roTGr9aeGLfLuR
 IrLCOrUpJr7+v1RCYPYqdPPfkhYk4tRVoy+YSoifvuF5+nad54Wyr+/eAjs+2Tdgc7+Q
 f7lhssYsI86xU6cnRJP7KeaA4rXF9PWL07TnhUGAcTBkgUMr3hsjjC8R1NLbS2kVj1Q7
 yhQtQbsE0yVCDaVqaSndH/rcotR9CU7tpnpZ9N7TYdXucF9sxmaJttnRsd2ZaQ+6aOAF
 YynA==
X-Gm-Message-State: ACrzQf1Su4cPFXwA3hCS6QbUIQF9wdSfFGl1jtzrZoY2wAKTLCrez3uS
 o95asgXnDkAG1xxojyDZ6+wQs+nGeH9iRXd2
X-Google-Smtp-Source: AMsMyM6s/DsoKZ4nxrwg0aemJWX3UrAWbrcpwYytgRL3ZrpxJlmdk6wsMCG6sxs3wG7j4B5r1dvDCQ==
X-Received: by 2002:a05:6a00:1306:b0:555:6d3f:11ed with SMTP id
 j6-20020a056a00130600b005556d3f11edmr58266724pfu.55.1667959675511; 
 Tue, 08 Nov 2022 18:07:55 -0800 (PST)
Received: from [10.3.10.183] ([203.47.88.146])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a17090301d100b00177f25f8ab3sm7740166plh.89.2022.11.08.18.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 18:07:54 -0800 (PST)
Message-ID: <2c862b60-66c7-2d0b-1834-94b9f3c103c6@linaro.org>
Date: Wed, 9 Nov 2022 13:07:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] target/loongarch: Fix loongarch fdt addr confict
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: stefanha@gmail.com, yangxiaojuan@loongson.cn, maobibo@loongson.cn
References: <20221109020449.978064-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109020449.978064-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 11/9/22 13:04, Song Gao wrote:
> Fix LoongArch check-tcg error:
>     TEST    hello on loongarch64
> qemu-system-loongarch64: Some ROM regions are overlapping
> These ROM regions might have been loaded by direct user request or by default.
> They could be BIOS/firmware images, a guest kernel, initrd or some other file loaded into guest memory.
> Check whether you intended to load all this guest code, and whether it has been built to load to the correct addresses.
> 
> The following two regions overlap (in the memory address space):
>     hello ELF program header segment 0 (addresses 0x0000000000200000 - 0x0000000000242000)
>     fdt (addresses 0x0000000000200000 - 0x0000000000300000)
> make[1]: *** [Makefile:177: run-hello] Error 1
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/virt.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

