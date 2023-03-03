Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B96A9549
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:33:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2iM-0003nQ-K3; Fri, 03 Mar 2023 05:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2iG-0003m3-Eh
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:32:33 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY2iE-0005gU-VF
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:32:32 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso3583718wmq.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 02:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677839549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f1pROVcBV3nrVCEZrmHu/MP5fs6F2iV/FAUEQJ5Iezg=;
 b=zL9V0K2+2JxqUfuurvO55vixHISlonG4l2vP6Zsbp+DJaUY6InHEMnWWY/wUEFlZCX
 5kL85MVJGRL7iVUvnIzWJmY3A+UokDMOW0q69WJxiUillIKDOYS7a0BadKX+KGzt9pJp
 tCumYizOqvkO8EYFlMQTa25VuEnsKAG427aFxWqxT3bjPmSzZsTXfYG3pCTiyGbLCqUJ
 5j9GqRzh/YqHiKK17O7c8MeJI7BhHG2KamAw8Xeo6d5/YQRPYZ+y9y309G8UOZRV2voa
 qCSI5mIJFSJobiQD2///BonKz3xjbPYKXPTjkNOsDfXq5Cb9Pp3YbLbetB8TnNnd5oRJ
 gDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677839549;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f1pROVcBV3nrVCEZrmHu/MP5fs6F2iV/FAUEQJ5Iezg=;
 b=nGQnnHa80Zh3zG83VKdYg870p0wZqGvG+XJPhaCm2pvvNY5Mb7Exc/aLVJvM/CciBU
 DxAwJ+qHROgHHhpLoSFbLnYJ/u4N5lzZHy3lcEFxOOmhn2pWHZCoD5+3afR/TqLh2W//
 BlBg7sn/cC8j+waoca+2MLab6MZsxfpWZZMlDXQqyoG5kt5Aqp6THmAJ0YP/60USGTM7
 vdhuJU1MUUbyDfxzK1PBpR7RlC1PxLtl/EKcfM5+bl+F+64RW+UIVuRtBMZVdIsmlLmV
 goo9PGVy+M6L+aaQH/fOweRCVH46+7ueHl9gCimImYD1MTeRto9YSPc0Zh8LRGBtX88V
 Q0mA==
X-Gm-Message-State: AO0yUKVkbjEvssQ9OOD9LC05FVx4rnjSgMwY0IVrnB4R7wB0bklaKfRP
 0v+PsczyAnhs09YaYbtWwe9Alg==
X-Google-Smtp-Source: AK7set+jbtsz3+miBDd5771vXk7gVV1pFRtSyEudh6OhPTkHGXyEfbp+LwbJirLHjVT00ankuBSFfw==
X-Received: by 2002:a05:600c:4fc5:b0:3ea:f0d6:5d37 with SMTP id
 o5-20020a05600c4fc500b003eaf0d65d37mr1161853wmq.8.1677839549712; 
 Fri, 03 Mar 2023 02:32:29 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 l5-20020a05600c16c500b003e20fa01a86sm1996491wmn.13.2023.03.03.02.32.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 02:32:29 -0800 (PST)
Message-ID: <801a7b64-dd53-4e4d-c561-67292f7cf458@linaro.org>
Date: Fri, 3 Mar 2023 11:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/7] hw/net/eepro100: Finish QDev conversion
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
References: <20230213101048.94519-1-philmd@linaro.org>
 <e432c04d-6682-596f-c5bc-5266a38bbe0d@linaro.org>
 <092be240-8e2f-4ef1-aefc-f5622be4b314@linaro.org>
 <CACGkMEv4F1CZdPgU+dbGtDxdEp2aV1m=qLxpHrXpaTP6ZwdKAQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CACGkMEv4F1CZdPgU+dbGtDxdEp2aV1m=qLxpHrXpaTP6ZwdKAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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

On 3/3/23 09:01, Jason Wang wrote:
> On Tue, Feb 28, 2023 at 9:40 PM Philippe Mathieu-Daudé
> <philmd@linaro.org> wrote:
>>
>> Hi Jason, do you Ack this series?
> 
> Sorry for the late reply.
> 
> I've queued this series.

Thank you!


