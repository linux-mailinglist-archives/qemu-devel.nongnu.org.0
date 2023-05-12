Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A172970092D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 15:26:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxSlg-0007ze-HZ; Fri, 12 May 2023 09:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxSlX-0007yf-5N
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:25:00 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pxSlU-0007ov-MF
 for qemu-devel@nongnu.org; Fri, 12 May 2023 09:24:58 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b425so20509085e9.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 06:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683897894; x=1686489894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=swUN+p55CYRM2qdDeGnp5qu+tTOGHjayVFgtchathsc=;
 b=Arv6qAgZgye/CS7LAspD69Xl8Riyo8rdx/h715iAHJiA24fRCTSrPMWdm/P3E6Zf+A
 6K0IPVG3Hr3fqIZocsosTZaMfKKyI99puQpqz9N7J3lvXxhtHW+XzlldnRDS8ygxk8UR
 4hhdkrMLVXeWnIC4vAcFPGveYPH4Qgs6GJr8uPVHZuepZORHkzxRYfqCXJ+b2yb2pRJf
 heUYAHJzorR3KVC7NAB9OKtG74n//6+/qQ7LjdCGB6rOBU6VkULtIENMouMEz1X5Ch2c
 9Fpyi0n4DIyxfBjV5VZdNsb57GDUjwoXx/m8Wf//xdGCHkbcBSawKr8PlDwHjsaXm9Gq
 CqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683897894; x=1686489894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=swUN+p55CYRM2qdDeGnp5qu+tTOGHjayVFgtchathsc=;
 b=N1B2VQa544IV3DU38+NpQNvVAiiJwr7Iw/TVxTN1VfM58J6mzKmdk7Wu0IauiVoyDq
 MEP/fU2jUOYgrxxB5KebZTFEeXwTIKCJsS2xCmivSlxJGJXnv8Cm064yd5efmTcVdaNk
 Z82ljp4oNHnEpK8LMWy3eS7WxAk8NIK+wODtHK6V9TfABNSUWF4sUkvpWNNKAILoto/f
 WacRRjsqByl/29wk5OgffsJdwSLaglz4/P894AvEkbfzeGj5uE1vruynFVRZKgiDEqPe
 anaMj7YhGZi9D1//nb+aKuzqTuuM3GlYmgUL8j7os6o5cvgCCcQzhtgMzvCnLoMGoreJ
 U/8Q==
X-Gm-Message-State: AC+VfDxT2fv8bu274Ir9ocZik5UV3CSMOk7JZfMB80+xG2BS5ONuEPhb
 niVag5WysQBHw0ufbMqAT1cmyA==
X-Google-Smtp-Source: ACHHUZ4RY/S888cRpRtVw8f1KgK/R7fi+4IkyaYDVQHfXEZJwuAGgQxq4PDjIigZUkjej9+OD0lY5Q==
X-Received: by 2002:adf:ec41:0:b0:307:8ad1:4932 with SMTP id
 w1-20020adfec41000000b003078ad14932mr15429743wrn.11.1683897894093; 
 Fri, 12 May 2023 06:24:54 -0700 (PDT)
Received: from [192.168.220.175] (92.red-88-29-191.dynamicip.rima-tde.net.
 [88.29.191.92]) by smtp.gmail.com with ESMTPSA id
 f16-20020a5d4dd0000000b003062ad45243sm23346816wru.14.2023.05.12.06.24.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 May 2023 06:24:53 -0700 (PDT)
Message-ID: <1b91c223-ee2d-8451-6f31-f4dc54f4d73c@linaro.org>
Date: Fri, 12 May 2023 15:24:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 3/3] hw/intc: Add NULL pointer check on LoongArch ipi
 device
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, maobibo@loongson.cn, yangxiaojuan@loongson.cn
References: <20230512100421.1867848-1-gaosong@loongson.cn>
 <20230512100421.1867848-4-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512100421.1867848-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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

On 12/5/23 12:04, Song Gao wrote:
> When ipi mailbox is used, cpu_index is decoded from iocsr register.
> cpu maybe does not exist. This patch adss NULL pointer check on

"adds"

> ipi device.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/intc/loongarch_ipi.c | 40 +++++++++++++++++++++++++++++-----------
>   hw/intc/trace-events    |  1 +
>   2 files changed, 30 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


