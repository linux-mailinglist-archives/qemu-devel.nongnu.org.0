Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 708E466609C
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 17:35:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFe2U-0001zK-RP; Wed, 11 Jan 2023 11:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe2E-0001wO-3b
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:33:06 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFe2C-0006Lr-Bw
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 11:33:05 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso13124020wms.5
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=y8jCKVsR4MxJB8umO/EIZGA3CTPqpk8S9QK8JC1lx7A=;
 b=I5AKM32zy9xYd0qoWCb14QTtwZ+0zgvF5XXK80pYUKSrLlqV8momvvaObfFm0mWcTl
 xiuAhUQUY1oMKOhwJgUsrQEcBGD1o4cteqaUnurAa2y/SO/USKpYMWoLCs6Q4ZEODqq/
 R0SUySkf7S0QEt1tXRiMwu6rCyrkQ2eh8fYqymVV0u4r8idsNvXcdSo1INbqY/Ku4wIl
 TGwMGuWG6hWyZOT3gn+ldJIeNt87hWt28835TF5/myQftJdn9udp2ivxd9S7Tl7Rulik
 19MNNYdLmNmWF/m6r9ETEfudP2xG3eN6YCIg/fszv8sX32DnnrsH2oYwn2STO9zAZ6e6
 MKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=y8jCKVsR4MxJB8umO/EIZGA3CTPqpk8S9QK8JC1lx7A=;
 b=cJH+rMmUEDHBUVpPo8YwVArIol1VMIhd2OaZdtdINkKswV1DQTNt2oEYU9Hb262cuO
 MsWLKrNz1WJ57Mypl1zuV9bnU6TBQjh6m5EVdqw6fSjBU6dwxmjH5MQQEYVEVmsesOv9
 VOSOiDlLwryTCDIbmAtLD+8ajWAEIgcRzASFe7ktWzNtjbHFTgAlbnbyOFugFe2vnZap
 OUUHOx88S+z94gwC9V9coNZm7I2qhQBx3MovQd2Bq/r1u1Qg1Q0cm21m3k1cn+OLIFG3
 E5HD4z2bxn7MTJyqJvQRLYMk1rLgW+Cc4fScrSHTF7SHPXuf3seuoQD5IEseRN8dpzO9
 eScQ==
X-Gm-Message-State: AFqh2krT6UBdQq9c20iXjO/vCCF/wEx2uQSjLPEVeA+nv11WsTiiKPGO
 0VR610yUxmcaYBgty9FhIC6kSA==
X-Google-Smtp-Source: AMrXdXvNkLzrjJpnLXfhG9KwkDgzRoCFcKae1e/jpy8C6729y0u8HvDY6xd/o3ENgwN6cH7nyPmaYQ==
X-Received: by 2002:a05:600c:3552:b0:3d9:f801:bb6 with SMTP id
 i18-20020a05600c355200b003d9f8010bb6mr5849515wmq.10.1673454782836; 
 Wed, 11 Jan 2023 08:33:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm25124963wmo.24.2023.01.11.08.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 08:33:02 -0800 (PST)
Message-ID: <cb1fafb5-a83d-210c-d0a1-8129eedb5c73@linaro.org>
Date: Wed, 11 Jan 2023 17:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/8] qemu/bswap: Add const_le64()
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Michael Tsirkin <mst@redhat.com>
Cc: Ben Widawsky <bwidawsk@kernel.org>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, Ira Weiny <ira.weiny@intel.com>,
 Gregory Price <gourry.memverge@gmail.com>
References: <20230111142440.24771-1-Jonathan.Cameron@huawei.com>
 <20230111142440.24771-7-Jonathan.Cameron@huawei.com>
 <68f9b74a-b0e7-c5a6-7b99-ce4f96d79f36@linaro.org>
 <aa007274-a787-5c93-c9b3-843a6b50f1f2@linaro.org>
In-Reply-To: <aa007274-a787-5c93-c9b3-843a6b50f1f2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 11/1/23 17:07, Philippe Mathieu-Daudé wrote:
> On 11/1/23 16:49, Philippe Mathieu-Daudé wrote:
>> On 11/1/23 15:24, Jonathan Cameron via wrote:
>>> From: Ira Weiny <ira.weiny@intel.com>
>>>
>>> Gcc requires constant versions of cpu_to_le* calls.
>>>
>>> Add a 64 bit version.
>>>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>>> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>> ---
>>>   include/qemu/bswap.h | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Actually I thought this was already merged but apparently
> this never got in:
> https://lore.kernel.org/qemu-devel/20200928131934.739451-1-philmd@redhat.com/

Oops unrelated, I meant:
https://lore.kernel.org/qemu-devel/20200917163106.49351-1-philmd@redhat.com/

But thank for the reminder, good opportunity to respin the
other one ;)

