Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9735F0D82
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:28:32 +0200 (CEST)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeH0A-000133-IQ
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGh2-0004G5-Nx
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:08:49 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeGh0-00049U-Up
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 10:08:44 -0400
Received: by mail-pg1-x52f.google.com with SMTP id f193so4318105pgc.0
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 07:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=W5ZJKgp69M5RK4BB3AgmyWZMvgT/zIaRglKyNBzBnNs=;
 b=MPT9uNVROX9OC6EhafC+LNQmCFfE5efTvBonfscgGTKLWjaIEqtJfh1fUfMqUgUM5H
 02PM/YyC6Gl365D7LIRCepa+WCf0gdoS+QWq8iVg+FLebr+eF6l7T9QZpikBruG+9sXB
 OEZmehCUhmlSqqpHDUfmbBSmJoZgUH1727E2k0OoWaG1Ic+uZiURRCftq8+ffUvOXyGm
 BQfxYumdhYWxAN9XXQ/OFtdBuvwtHAK4HJgr+Nj7lnHYM0OSld/6mec3Ev9e3JOmYSMf
 0LvXlTQAtEXuQ080xrcBXlNl6xVrGF6PsXHX+HgUMNV/lD8iDLtoeLxd6ZuHdgM7IE5p
 hvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=W5ZJKgp69M5RK4BB3AgmyWZMvgT/zIaRglKyNBzBnNs=;
 b=R8CclO3ngBJDFAKp3P+k5pcnmFpjpV5qz+VElTSqm738itjFCJUslR6hvHKD8ltVTW
 uGAW4er5E3IOMwY6GhFs6Mz4Mg+MqsGlai0VUfqGhnA+gvE+xe6BXRLOENfAEzsFykYF
 ip0NeymSX0rpnqwWQ3eON4GCpoZtVMc1Y+d3wvMbNbR3lvPGy6777MSbI+1PAIyPGVw3
 eKMcTdh0TAW92aVKcyBxF2jh58vqk12YIJgCBaTqqioQ8JP6I60iFmGo0QK4u7So5Efo
 3KoV89qMu51v+WrbQs2XYd2p+XpMIZVP2veJLJI1ecAX4GsnLqNoqkVFwLiVhZNDBsSC
 XNlA==
X-Gm-Message-State: ACrzQf2IhOselNbn5Lcni/3+hUD+8EUy8szuR+loxxhLaf5bBUJ6vyqQ
 ZU1tFcQRaWC8WhHM9QbphzGetw==
X-Google-Smtp-Source: AMsMyM5UNFPJ7rxp6n7hGr5C/KpQPIdgmfCbf/ZCK02qDOB14pAopXHSjCsJSltU8uXGBOGNAvMyDg==
X-Received: by 2002:a05:6a00:4287:b0:543:7bae:55f7 with SMTP id
 bx7-20020a056a00428700b005437bae55f7mr9297741pfb.58.1664546921174; 
 Fri, 30 Sep 2022 07:08:41 -0700 (PDT)
Received: from [192.168.74.154] ([50.200.230.211])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6216d5000000b00537eb00850asm1823530pfw.130.2022.09.30.07.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 07:08:40 -0700 (PDT)
Message-ID: <d2d717d7-bce7-4121-cf0a-d3b357f9d264@linaro.org>
Date: Fri, 30 Sep 2022 07:08:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 1/2] hw/intc: Fix LoongArch extioi function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org, peter.maydell@linaro.org
References: <20220930095139.867115-1-yangxiaojuan@loongson.cn>
 <20220930095139.867115-2-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220930095139.867115-2-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/22 02:51, Xiaojuan Yang wrote:
> 1.When cpu read or write extioi COREISR reg, it should access
> the reg belonged to itself, so the index of 's->coreisr' is
> current cpu number. Using MemTxAttrs' requester_type and id
> to get the cpu index.
> 2.Remove the unused extioi system memory region and we only
> support the extioi iocsr memory region now.
> 
> Based-on:<20220927141504.3886314-1-alex.bennee@linaro.org>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   hw/intc/loongarch_extioi.c      | 51 +++++++++++++++++++--------------
>   hw/intc/trace-events            |  2 +-
>   target/loongarch/iocsr_helper.c | 16 +++++------
>   3 files changed, 38 insertions(+), 31 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

For future reference, the Based-on: tag belongs in the cover letter.


r~

