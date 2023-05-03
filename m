Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4516F5629
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:28:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9iW-0003As-W7; Wed, 03 May 2023 06:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9iO-0002XM-BZ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:28:04 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9iM-0003BP-9j
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:28:03 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f315712406so18047855e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109680; x=1685701680;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DOQB4+MHpzaTXAAiQsZT3AlqRFj8f6wxP1oYl91JjrM=;
 b=kefAtt0vMweXgeOHZu+NmIM/GIjUTDqg5KRGQDvVUOnDFCO/XkpNhhtYIJPTFxegl8
 35W1gcqlkvJE7IevLN/5RKxF2EL67TjaPPMVsFDI4cdSu4LFhtGeOvGz9l4eDuzIsMxC
 5k0alxp9N7dnkVa7z4pJ8NSKP4bpy8pZVat//e5z5xik9BceNOotSJbGAqs1VUfkho60
 9lKgOwhIFIN7FvxKBcgSzpnq/unEtZzuJ2DXMNKEw1HgCeXy161zE9qHFDMMlkHfvAjO
 VDKHg8XP9/DeYhkKHRbF2zAb21J62sa2h0ASkhuvDtGAu6A2Ya/BBFVagoD+P9kalj9r
 UuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109680; x=1685701680;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DOQB4+MHpzaTXAAiQsZT3AlqRFj8f6wxP1oYl91JjrM=;
 b=GkcQq98OeStpyDQXfmvbjtVQHrXuWTf7DG+/DpgrKklrrwZPSRhoBHJGHGGyBeijdy
 NKThZpxCrqf6j2hMiYegkYG8qeIxhMDyIafpgFM+bjofKrmKUmlYF6n4AVUdWC8FDvo8
 u56qWxO74Ki6MjHQuqcBARNZvg5Y08uoCM6y8dz/uKNWn3BJYWCvdS0qBg0LextIZdVY
 7hf2cToxyHEdlH6AUj2Xc0hB2++qj9pP86IbyQl+XpYlCiuwzFLubqOYgvPes8rg8rM8
 wwhwlV42YhQDJO/aEbb1KV6O8hORDDAZ+9X2/DzV+mey9BpRboaUUzmZjjd48O2uE6XC
 OptA==
X-Gm-Message-State: AC+VfDw0ZNyt175yCNn5Xrhqj8cGojO7FuvEuI0jqb2V7sebDlgIKer6
 nCMV9ClFBE/yhVD8QEf44IoeiQ==
X-Google-Smtp-Source: ACHHUZ5plsYJYcYmmflalFaxvpv73znxjSrsT0IvHW1kVkBDsAJ9/YGXdciecqhKP+bmVq/jMUqP+g==
X-Received: by 2002:adf:f087:0:b0:2d9:10e7:57e8 with SMTP id
 n7-20020adff087000000b002d910e757e8mr1045521wro.16.1683109680389; 
 Wed, 03 May 2023 03:28:00 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 w12-20020adff9cc000000b0030635f6949fsm4714956wrr.103.2023.05.03.03.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:27:59 -0700 (PDT)
Message-ID: <02eea99e-c034-ce61-c7df-22a03fa1b78c@linaro.org>
Date: Wed, 3 May 2023 11:27:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 15/22] hw/sh4: make RTL8139 a hard dependency for RD2
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-16-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-16-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
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

On 5/3/23 10:12, Alex Bennée wrote:
> We can't just imply it as the board will fail to create otherwise.
> This shows up as a "make check" failure with a
> --without-default-devices build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   hw/sh4/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

