Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D335537CF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 18:27:46 +0200 (CEST)
Received: from localhost ([::1]:49838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3gjB-0000pc-52
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 12:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3ggz-0008Rc-6k
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:25:29 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:45702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3ggx-0008RQ-LU
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 12:25:28 -0400
Received: by mail-pg1-x536.google.com with SMTP id 184so13565445pga.12
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 09:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UikPXuPfpLX7WU6fus6iol22gbUUYV2HMCH+ImfDpps=;
 b=QhaUkJYg29i2qxWleFknH5SS/4s3z37t1R9oOrj0Z+2wQkijBuDu+SEaGozCJ/ZBWs
 Mg81WhOzJioPnqLbHB6rtwCMs0+NkQVF8VslEqDk7gujH3SiktylbjBRNsvUBLt2j6J3
 Wkjxlw4mQ91u4ga6oMqPwSjnrqy62U5fOZF9H9J+KZt6NJSLuCOr5erRNED/JvsM2n3B
 yTTUtyFYPjC3TTMZBtoQZSbLZeAylK/QWTyom773n35ZwA19z57r7ZXWJD9rP5kzdUen
 Ab0ydcwXQNE8Y8B3Oz1FrfFECUP4o4eMoFyUMJoxlKI4GgtLs7D1+ez8wgJb65JnLddW
 T/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UikPXuPfpLX7WU6fus6iol22gbUUYV2HMCH+ImfDpps=;
 b=Vb+2nJ8WeTWA3Q8reSRYDG6aCV+hjJyzIeYfVupwZxzwtRFOIRTWe14tOZ5VXPt9Vz
 mqhjhQrFIzSKopGt6NlhnxDZqLLbUSR+Li7X3W23WsNIxpBdrrhzl226WMhlQJ3nGUwV
 FfXpriWQG84ZehJ31x3QA0t6Th0pYlvkAiZcSufcpet1R2DAgGPqr4gDFhBsKjZ49rkP
 EgYEGeh8aDwZoeEXdJdjjuoKQeLnZ1W8ZtQ2iMScsMSfeH6uqjN7JUrSlGDgl9cKZurM
 k8a9d1KQpjVXFo0Q3IfGAFNBFZPvwEJSSDmRCpr4Zz/LV/DkCyNt/R4Tkd4AwjHMF5PK
 hZ/A==
X-Gm-Message-State: AJIora9MY4H2fVy9yJNmdEBgBQh9b7Suv7CPfXI3WqZ4Gt3iAtcGii95
 VpvZjQ1yqsT4Mb9rNbCBglgr+Q==
X-Google-Smtp-Source: AGRyM1s8vBwupIZFlfM4QD5WxK7HxyVIj+wxU7N4sGNzQbpnnqrS+3jz6y5zukUaratRV5H16EmQcg==
X-Received: by 2002:a05:6a00:21c2:b0:4fa:914c:2c2b with SMTP id
 t2-20020a056a0021c200b004fa914c2c2bmr27522800pfj.56.1655828725999; 
 Tue, 21 Jun 2022 09:25:25 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:8adc:a144:6ec2:4d71?
 ([2602:47:d49e:3c01:8adc:a144:6ec2:4d71])
 by smtp.gmail.com with ESMTPSA id
 az9-20020a170902a58900b00167838b82e0sm10860913plb.205.2022.06.21.09.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 09:25:25 -0700 (PDT)
Message-ID: <653ada5f-a743-cc74-3022-403d06ae394e@linaro.org>
Date: Tue, 21 Jun 2022 09:25:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/2] qemu-timer: Skip empty timer lists before locking in
 qemu_clock_deadline_ns_all
Content-Language: en-US
To: Idan Horowitz <idan.horowitz@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 pbonzini@redhat.com
References: <20220114004358.299534-1-idan.horowitz@gmail.com>
 <20220114004358.299534-2-idan.horowitz@gmail.com>
 <79582bec-0591-8114-2479-7d5d79321698@linaro.org>
 <CA+4MfEJdjQ4ZMm-=nfJtLtNPz3=hLMqtk7yLznXRy=rHaS+3Ag@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CA+4MfEJdjQ4ZMm-=nfJtLtNPz3=hLMqtk7yLznXRy=rHaS+3Ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/22 01:54, Idan Horowitz wrote:
> On Wed, 26 Jan 2022 at 23:43, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> r~
> 
> Hey, I believe this patch might have accidentally been missed?

Oops, yes.  Got 1/2 but not 2/2.  Queued to tcg-next.

r~

