Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6397376981
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:27:59 +0200 (CEST)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf4Gc-0000CY-F3
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf4F5-0007vS-4K
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:26:23 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:43972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf4F3-0000QK-Fr
 for qemu-devel@nongnu.org; Fri, 07 May 2021 13:26:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id v20so5471679plo.10
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jnh6D9QAy2En2QJ1VJ0CNIRutT6h3pVVh7fdcVpiElk=;
 b=SJS+sflSpBBCkFiuIB3mcCqlaENvjFdxETszbae5F/uxFFnk2ldYOHA/2SopH7Loc2
 nBdknFOuX+cH/W2s4lJ1DqQQXa03bd+j8y0ngux/JZAuXvm98Y53NbCdkyv1se+SkW3K
 swovoiE0v9b8bwcbzW44jSSVLG1VBcPy6x0QnpDY181OnqizHI38fYAlQTAa1bRct58D
 gRwSXcwtg0wJEfO2EFITB+NdRkFLKNb/ffNZggEPciQJbnbjSgpqV3Y8P65ly1Q4Ejj7
 3RQDxV8+dB04XejmVQn0F6eRbhyjypZRAP7ybcYpAOIKg7Tp9vNyvpc+8hAZEi+Af9rZ
 qmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jnh6D9QAy2En2QJ1VJ0CNIRutT6h3pVVh7fdcVpiElk=;
 b=thVvnJB67Y8FHP9zq890C8fMWIMmzVA5rdKtvYKkM5m6eMPj9b30VuIWLtHr8TVDS1
 XguyxqZH7utD+y2NGASgvX9g3hDvakbBZZy8WxIP3ZUN4ZMS0l3b1ub6eebRtv7xsiTI
 zjyuHx7k4JvJDhl/gzD/3DV7u1QZfZrhNxNKUXraknLg3+sxJMjqgF/7XksXu1EY00fe
 FSB6O196rN0s9n6jPBK6QyKM8+k+YlxRY1G/6GGCjeV0PJvGNyCybYst5G+yy4P7JPYh
 Jak/hbvzSYjhUpbVFqkJNkcUjrcE6+z7QFuizY9s03qaKe+ZG6lTdeGjnHZSpCPRVBlO
 dljQ==
X-Gm-Message-State: AOAM5309IZt3XLtgEisGm7/JOqBxAM5qorOyhKwOyRLh1Q2Rej98oo06
 /xznJco3vSms2FX1bCIGmNWksA==
X-Google-Smtp-Source: ABdhPJyoHPed0x77OxBOiyEV0mZWbxksyzR5MTC2E1VLBLRVxkQjYZEOsBXPWZZBKg7qtI8udGZm/A==
X-Received: by 2002:a17:902:e353:b029:ed:866b:7624 with SMTP id
 p19-20020a170902e353b02900ed866b7624mr11460536plc.25.1620408380076; 
 Fri, 07 May 2021 10:26:20 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id z3sm5218378pfn.12.2021.05.07.10.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 10:26:19 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] virtio-blk: Convert QEMUBH callback to "bitops.h"
 API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210507170634.2058801-1-philmd@redhat.com>
 <20210507170634.2058801-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6bf6963f-10a9-aa06-628c-f78f6877ea33@linaro.org>
Date: Fri, 7 May 2021 10:26:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210507170634.2058801-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/7/21 10:06 AM, Philippe Mathieu-Daudé wrote:
> By directly using find_first_bit() and find_next_bit from the
> "bitops.h" API to iterate over the bitmap, we can remove the
> bitmap[] variable-length array copy on the stack and the complex
> manual bit testing/clearing logic.
> 
> Suggested-by: Stefan Hajnoczi<stefanha@redhat.com>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   hw/block/dataplane/virtio-blk.c | 19 ++++---------------
>   1 file changed, 4 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

