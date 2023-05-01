Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040CA6F35DB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 20:35:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptYMa-0006vN-Jz; Mon, 01 May 2023 14:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYMW-0006ur-Uu
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:35:00 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptYMV-000806-71
 for qemu-devel@nongnu.org; Mon, 01 May 2023 14:35:00 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so27491615e9.0
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 11:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682966093; x=1685558093;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/hd1oHcPB3UyyPRBUMui4WdHE/rr/W6WLfBfHEuxIZE=;
 b=fqwERAsbYcdezVqcvaYkdtuz759V5vk9RUsvfbdAoUJf6UNCjp1kbmddXj845253J7
 6MgnUZHG6g/hNMk8ew16zysa4FDNFaGW/RIevrOjWIflezROnQ999Kv9WGJkJLNwvBhp
 LjeedCrYDaMPITnQvGgmkIMFAvJx4uMZUM88POd0B6vay1QyjT8zqmBc8OVEWPrUY4a6
 d+HLggLbXC882ElMgeplkxv2g5x2fluSYorLBV+SR2OXwURZr35BBUPhOZnE4B6SmP5B
 /kOdIwMy8q5NEPi6gi/j+qCr9CbYUHU13yClVaGVt0HxcngdLtDewtCNfCKGgUR+sv79
 ExAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682966093; x=1685558093;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/hd1oHcPB3UyyPRBUMui4WdHE/rr/W6WLfBfHEuxIZE=;
 b=FttgJ6CPIV6ualz0oLLOc4FbQ7cOa+IyEHDrdv4i6r6jRYRIbei26q2dnPsnMkiOo8
 mHPV1Vcn71vb8KhByEMCM/br9n1vuWes5EZxCePNIDPtEXrU2YFkm+z26Vm1Ie3fQuYc
 I9KtnkkjVFFiHKBcfR89NxfPy5twVbFtvHNa6wEpPCK30qxaPP5CN1CA/rUlaWw4Kf3X
 XkBT8VAPbI0nD2FIZfC4xexh7NkGZCRjCKcvfoJ+R2pDM/w5gcAEHz9CHzW7nQw39PiN
 m/Qx87rUxNtIyqmMVcIVjchuN5s+NoGLIPAjHTYx6PxIccPDsRBZhhTMh+IUYkcdZqrS
 J/SA==
X-Gm-Message-State: AC+VfDxouo+CWqhBdpzcq0hsa91dedmp2cnP4ZYuJozXVK4G4gEzS52X
 2VIykF3xQbK5hzX2hAGS73dDLg==
X-Google-Smtp-Source: ACHHUZ6sdZFyKHOgPJfP+GMwD6g/jjsnNosxZmn9/t4XDRq6J6Jhk1ZoijRmF6mDl3UaScl0kwLpCg==
X-Received: by 2002:adf:ec09:0:b0:2ff:f37:9d0e with SMTP id
 x9-20020adfec09000000b002ff0f379d0emr9636171wrn.61.1682966092846; 
 Mon, 01 May 2023 11:34:52 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940?
 ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 w9-20020a5d6089000000b0030633152664sm1156110wrt.87.2023.05.01.11.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 11:34:52 -0700 (PDT)
Message-ID: <1b1cfc71-b31a-2b1d-9886-b6fccb2b6432@linaro.org>
Date: Mon, 1 May 2023 19:34:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v4 14/44] target/loongarch: Implement
 vmul/vmuh/vmulw{ev/od}
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230425070248.2550028-1-gaosong@loongson.cn>
 <20230425070248.2550028-15-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230425070248.2550028-15-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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

On 4/25/23 08:02, Song Gao wrote:
> This patch includes:
> - VMUL.{B/H/W/D};
> - VMUH.{B/H/W/D}[U];
> - VMULW{EV/OD}.{H.B/W.H/D.W/Q.D}[U];
> - VMULW{EV/OD}.{H.BU.B/W.HU.H/D.WU.W/Q.DU.D}.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/disas.c                    |  38 ++
>   target/loongarch/helper.h                   |  30 ++
>   target/loongarch/insn_trans/trans_lsx.c.inc | 550 ++++++++++++++++++++
>   target/loongarch/insns.decode               |  38 ++
>   target/loongarch/lsx_helper.c               |  76 +++
>   5 files changed, 732 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

