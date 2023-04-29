Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251F6F2404
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 11:49:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pshC4-0004A0-Tt; Sat, 29 Apr 2023 05:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pshC3-00049j-0Y
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 05:48:39 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pshC1-0007l9-GE
 for qemu-devel@nongnu.org; Sat, 29 Apr 2023 05:48:38 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2f86ee42669so635436f8f.2
 for <qemu-devel@nongnu.org>; Sat, 29 Apr 2023 02:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682761716; x=1685353716;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NegczVNfUGgxuPDVzgSB++f9P9q5NQCUS8cHES6hG4c=;
 b=nENbugGFdg4l0jFiXEESveaGg+GkBhCk23EUQXL/IeyDn7fh03UK64LS9w2Aq85zgs
 DXrKOV23+5MixIeHW9ZF9oq1rf+WDvO0G/Nzs6u1EdoO2MqYBbbPOdhCeBJ1C7+BiSN+
 TlDtHo5exVQGfSnRhoBkxbndBwJ2qsoHBiqdHAMPCLEb5ifkUjGs6Qp04BYH+kczUp3P
 3Ic7FD0OSuud9xzYPYDJ4reS6G7Iqt8PRSGI+Tp+n6OTimABAw0CvdY2XOIeDoG8lU3k
 9kDBjoAmmmBfEPdJc7WtoPlfl3vPGMAx/fjU6nOqBrg2TXILmwqZeye1jUzJeAQc1s1c
 HuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682761716; x=1685353716;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NegczVNfUGgxuPDVzgSB++f9P9q5NQCUS8cHES6hG4c=;
 b=b6JmIdJ0uPviKyXUt3QDPwPQYMSr4Ct0IY6A6At7kCIr4JZCwsw9B7CEM8UwqO9qE3
 RqOK34sFjPPkpcYTmbu0w/VkXaQukkNCahh1K6BaTSkfpPo78ujX1B5nRojIEHAHfKyX
 TmWfg5YEY25/n3dS5YE43OFdkiu6Ipn88eFHZajEObgy4SDX56cXmJ9nT/LXRQEBTjjU
 L6xWSTyIpe+1wZky6tKYMhcHJdrUIVqgLqfuzv6U16gnW85EiDxWyUcqbLyUkN4vFzVN
 nFZlnTmiRj0lXYNWqLT9AIYXwXTC/sRN54yzSKx7dPoVqIsl0V/qk8bKP91tMrVh3ZzE
 mB4Q==
X-Gm-Message-State: AC+VfDzOFxGLLqlYXGxfZNwuPs8+fa0LyMzaWi622qO/LVmy5KZADDvF
 0W2GHxjjNGmSETttLQngZtfw1w==
X-Google-Smtp-Source: ACHHUZ60kYzUhZ+0X1Ym5X3pa4zBQ8V3uUWIxKnCGuLpcYKIGUZej1wRnVstf7IJvsF/kwpN5/JfjA==
X-Received: by 2002:a05:6000:1284:b0:2c8:9cfe:9e29 with SMTP id
 f4-20020a056000128400b002c89cfe9e29mr5831153wrx.38.1682761716104; 
 Sat, 29 Apr 2023 02:48:36 -0700 (PDT)
Received: from [192.168.1.17] (78-141-23-110.xdsl.murphx.net. [78.141.23.110])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b003047dc162f7sm13850467wrs.67.2023.04.29.02.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Apr 2023 02:48:35 -0700 (PDT)
Message-ID: <21dc4558-d52b-0142-cffe-7ad225e9bcb4@linaro.org>
Date: Sat, 29 Apr 2023 10:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] test-aio-multithread: do not use mb_read/mb_set for
 simple flags
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com
References: <20230428111248.145037-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428111248.145037-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
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

On 4/28/23 12:12, Paolo Bonzini wrote:
> The remaining use of mb_read/mb_set is just to force a thread to exit
> eventually.  It does not order two memory accesses and therefore can be
> just read/set.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   tests/unit/test-aio-multithread.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

