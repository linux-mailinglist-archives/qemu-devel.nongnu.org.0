Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 375513AA456
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:29:39 +0200 (CEST)
Received: from localhost ([::1]:46554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltbEI-0005ob-9Q
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:29:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltbCx-0004lt-QV; Wed, 16 Jun 2021 15:28:15 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:39812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltbCw-0000qE-7f; Wed, 16 Jun 2021 15:28:15 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso4810389wmh.4; 
 Wed, 16 Jun 2021 12:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9k993XYPDUroBv/0NPjQ9d8dsuLuH4r65qaUJ1FMxMU=;
 b=RArhqJl6E8vKAiEJbqKF9vSqJGuD3oMtHy5mLYSS4sBvYWpw9DD6GvuYT64AX0B+69
 gEi8h1TjHAzx3Z8mO2QsVHQniWVlya9blFYAcs7OW8K9hpS/ms2Yputp9xe5ZvUlnr7K
 WXVbLFd2vaSj1pNGNNCc2xDuoYyc6BEXz0Ei04R7J6+C1RBV2aoYzA05niCzvEMRoxsz
 uQBpuGpCcQFynItyRZn93UZaHYaHEHm4/65lnsyrpIvh8QeSTNXeTxUHLAtEn7n4ohhB
 fyIANAwnuZmTDjULOqttj4d4qJyeumi4/rSiM9FZDus66Tgz1V+7zKzGPo4FjEiUHOQP
 cLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9k993XYPDUroBv/0NPjQ9d8dsuLuH4r65qaUJ1FMxMU=;
 b=qkUuFBcZHZd+YBXkvyRYYj23c5Y/TClsKGyAY6zf8ZAIG1gViTx5Vh9OGuN7eXP97y
 Hyrlq79pCH2NFpJj6CCS9xZkrRkZ8YkXJxdawIpT7WFn+wdz40e7Qw08DBcqiOwTGBly
 MJ/yu04ayitYruxyxmn5h6tXKGURpYJWsUxk409xv14M2EAS1RzgBR4YZSSDALFjfsKU
 Gl3Wp/njMtoPeNvd9eaS6+3otlO5uEg01txrbi+KDYASlhltTCzZ2BxO81OgMucKHW5m
 pIxTw2CwVyB8uLNB4DX3QpiEqlCsIq1HycFl5HYyiB0+iQ7zfe2gRrmwaUjgkKZnzjhO
 ZWYg==
X-Gm-Message-State: AOAM530fx05EBWBlz+td9cCO1P77U/yPU/bHZPM6JsP2sD/5Io3tO+oN
 X2KAdPf6wH2IsKrwm+YBo2/9/OybVVPzFw==
X-Google-Smtp-Source: ABdhPJw+lnqnfqoyj6vYhqYFUdZKax45kQZoWWh8z+LvJ7FVgBRN/dbhqHteNLKayGp/+/mOc/hBQA==
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr650515wmq.164.1623871691917; 
 Wed, 16 Jun 2021 12:28:11 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l9sm2620933wme.21.2021.06.16.12.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 12:28:11 -0700 (PDT)
Subject: Re: [PATCH v3 10/13] hw/misc/auxbus: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-11-f4bug@amsat.org>
 <0a45d89a-b710-12f7-6f82-75fdc6f0384d@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cad0abfc-da54-1ac5-74e6-882251c70465@amsat.org>
Date: Wed, 16 Jun 2021 21:28:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <0a45d89a-b710-12f7-6f82-75fdc6f0384d@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 8:46 PM, Richard Henderson wrote:
> On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
>> @@ -161,12 +157,11 @@ AUXReply aux_request(AUXBus *bus, AUXCommand
>> cmd, uint32_t address,
>>           }
>>             ret = AUX_I2C_ACK;
>> -        while (len > 0) {
>> -            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
>> +        for (i = 0; i < len; i++) {
>> +            if (i2c_send(i2c_bus, data[i]) < 0) {
>>                   ret = AUX_I2C_NACK;
>>                   break;
>>               }
>> -            len--;
>>           }
> 
> This form of updating ret is better than...
> 
>> @@ -200,14 +195,13 @@ AUXReply aux_request(AUXBus *bus, AUXCommand
>> cmd, uint32_t address,
>>             bus->last_transaction = cmd;
>>           bus->last_i2c_address = address;
>> -        while (len > 0) {
>> -            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
>> +        for (i = 0; i < len; i++) {
>> +            if (i2c_send(i2c_bus, data[i]) < 0) {
>>                   i2c_end_transfer(i2c_bus);
>>                   break;
>>               }
>> -            len--;
>>           }
>> -        if (len == 0) {
>> +        if (i == len) {
>>               ret = AUX_I2C_ACK;
>>           }
> 
> ... this one.

I totally agree :) I was a bit ashamed for posting that, I thought
Zoltan would prefer less changes so used this form.
Will update on respin.

> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

