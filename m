Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925B360C1A4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 04:24:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on9Yw-00036A-DN; Mon, 24 Oct 2022 22:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on9Yi-0002zY-K9
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:20:53 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1on9Yf-0004K1-TR
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 22:20:52 -0400
Received: by mail-pj1-x1031.google.com with SMTP id pb15so9540224pjb.5
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 19:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mOsji/zr2IFciMJ4k4N69wTW3L6ugFiv+W5OZ+1vNLY=;
 b=G61qHHtynv8/QazOkREILda7T9qvezsnevQ+nvNLjCuiP5yo+jhsFYucSeyEBSwUiR
 32VJyc4O8h0MoIJu0sjcbJhqLWH8AYMd792qCA8d6kooc9d/YG7hOJfX4bA739NuQZcz
 Yin9W4YcmeMoMj7me8Q1iIKYAs5HqnPLMbkrEQf+d2FGX05Hh5+qvee9qiHoTaro8qfU
 4CxtLJ4nCmNQjMQhdW6jVEYPvhW0GqhV3qbjckGPXCdlyWDSfcQB4dBCva111GI79D2u
 XFHp3Pui4/lTg+CGT6V/6b+DvdyiTRWqDLM7hfrfbQzV6jplmosD1BBDqg2Qp/xCBWmV
 w3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mOsji/zr2IFciMJ4k4N69wTW3L6ugFiv+W5OZ+1vNLY=;
 b=EMk9GmExM86bFEQ/+yJDSayswfKjLt7kH+LtjyGeEEHWgaJCuDX/Y/hOxHZmNNYAif
 LTDZzEIG2Qy8ELXLdHty6lI9M71dbG8U3kgoJR5RJlTtsu+CD6Hf6PcSvMubzTzDfSOB
 igGldGGSg4WxcrGac7/b/tKshrNEF8I4WNbIWfEAnzemkN9IWbOlYPJselabix1yr0hp
 NJj2Idyz5KdVjY23crUcq3C9S/XEW+ISi46lTC421CEcvKvYWLXU2Qp46cLB9q1rybkk
 mYZCnktAGqZOkMMMF1kD+HMsI6DVe7o6U6k9Garx6N/RGqIy0IMR6mo9wDnJGJI9v3T1
 WeRw==
X-Gm-Message-State: ACrzQf0YaMAC4j5CcqvdfuUH7fz+Z7DXnZfJqqI2lGQolurG2JAY1oK/
 GJfNbAvTCPPZf0EtNnTApiZiiw==
X-Google-Smtp-Source: AMsMyM7iTtFd0rPnQicFzauPtCtg0msAawj77PjKuV0zmR6CGbu3A3QTFXq3JsIRK7sefEKRkXFLSg==
X-Received: by 2002:a17:902:ec92:b0:186:9fc6:868c with SMTP id
 x18-20020a170902ec9200b001869fc6868cmr10004158plg.12.1666664448143; 
 Mon, 24 Oct 2022 19:20:48 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a17090a688100b0020d29388107sm4498921pjd.21.2022.10.24.19.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 19:20:47 -0700 (PDT)
Message-ID: <bbae47f1-45b5-f206-4c25-1641209f19c3@linaro.org>
Date: Tue, 25 Oct 2022 12:20:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4] linux-user: Add close_range() syscall
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
References: <Y1b45IL371MJP2WW@p100>
 <6412545a-5b43-421f-d94a-cf3111725047@linaro.org>
 <436afa3a-bb4b-3807-4c01-25d3ddb195a1@gmx.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <436afa3a-bb4b-3807-4c01-25d3ddb195a1@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/25/22 11:39, Helge Deller wrote:
> On 10/25/22 00:39, Richard Henderson wrote:
>> On 10/25/22 06:43, Helge Deller wrote:
>>> +            abi_long maxfd = arg2;
>>> +
>>> +            if ((sizeof(abi_long) == 4 && arg2 == (abi_long)0x7FFFFFFFUL) ||
>>> +                (sizeof(abi_long) == 8 && arg2 == (abi_long)0x7FFFFFFFFFFFFFFFULL)) {
>>> +                maxfd = target_fd_max;
>>> +            }
>>> +
>>> +            for (fd = arg1; fd < maxfd; fd++) {
>>
>> Why do we need explicit checks for INT32/64_MAX?
>> If the guest passes 0x7FFFFFFFFFFFFFFEULL,
> 
> A 32-bit guest (on a 64bit host) will pass 0x7FFFFFFFUL...
> 
>> do we really need to iterate over all of those impossible values?
> 
> The compiler will optimize one of those checks away, so it's effectively
> just one expression.

By impossible values, I mean all descriptors above target_fd_max.
The compiler will most certainly not optimize the number of loop iterations.


r~


