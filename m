Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF156420FD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Dec 2022 02:12:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2005-000628-Bs; Sun, 04 Dec 2022 20:10:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2001-000620-Te
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 20:10:25 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2000-0004zl-5j
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 20:10:25 -0500
Received: by mail-oi1-x22f.google.com with SMTP id n205so11408508oib.1
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 17:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k8d73uzvP/4e8u6Ac5c5NQILt5ROGzeMCAu9322ulwg=;
 b=uajv435Al94lR+WOd9PzlPEW+V4teqyD4/2iYtNgZ9oe/P6rLJz6ls47Ye4EY0+3ev
 u63ZN22LZabCuZhlBg6aHfsyqfxZLMgfCZ04evh6nMU2jenCXE5G+35lBWyu29VFHo3J
 5V4l+Dwj6HQJQcbezjLS5Wm4YDQsECzHLTHeFIRZIvYrTDxVN5P5v9VtkMB/dYJ+FQ5/
 nSMVdeXN6jfk24Zm/xw+APO4KyAB5u8lht/ofX9Ytk/9x9qFNNnI1NvpxMwD0+iJn0Z1
 8vNhQn0AfXeejCefrJ1gMFYSFWbUKuOx0N9gGNwIxt37bCDRTSwn4jtCZCDqqnjziQt+
 48xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k8d73uzvP/4e8u6Ac5c5NQILt5ROGzeMCAu9322ulwg=;
 b=LIzWaWm1fZK41FgQ1Fa22Ace9ZQjbLAiEU4PbLVpaLTEcVCuYbtr7Vg8tac+P1HrMA
 C5dsiM8+il4cIA0T8ROwK8bDZJZv3UhgQ8zDRzKvm5GP8M70Kgc9iZbtWMQstvM9A8GT
 LB3dyuYMEGtExM1RUH8a1w8Y2+uvcfbdJ+vIwShGb0tLy2sX49No9onMbheRrOZGXl76
 1bueA3ZqESG/H04Le739WbQ9DqwX4ubns35JZ9aXkzHIi7oXrGrMYxh92IuXlC+EjG9g
 G6QTx3wupFyAad52H7YFFND2F7e4waOsAmFeP/DKm5wWBFXez00n2swmg743O3VnHms7
 4/7A==
X-Gm-Message-State: ANoB5pl/k9QOOMYbD54rH6yruZYJzNnrzM25EyIsvcgtAZS4XidjDi92
 YdaAFdh8J0GnJZ7oYZnGCSnpaw==
X-Google-Smtp-Source: AA0mqf6hzYx+9czRA9xnxikrK2AmbtgBXF/AQGjulmHH7EYszCTDn5Xd4vUjO2XwA+VyNoCxCYB9Sw==
X-Received: by 2002:a54:478d:0:b0:35a:582b:e0f5 with SMTP id
 o13-20020a54478d000000b0035a582be0f5mr29111601oic.164.1670202621930; 
 Sun, 04 Dec 2022 17:10:21 -0800 (PST)
Received: from ?IPV6:2806:102e:18:70b5:fe5d:39e0:b5ba:592?
 ([2806:102e:18:70b5:fe5d:39e0:b5ba:592])
 by smtp.gmail.com with ESMTPSA id
 k203-20020aca3dd4000000b0035763a9a36csm6212694oia.44.2022.12.04.17.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 17:10:21 -0800 (PST)
Message-ID: <c925319c-c7ad-07de-544f-afff0d0884d7@linaro.org>
Date: Sun, 4 Dec 2022 19:10:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] configure: Add --enable-lto
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com
References: <20221204000340.282718-1-richard.henderson@linaro.org>
 <CAFEAcA87iyOWfAH-xKX7qt_y61A8ET-QHdz6x20rkKc3MeZMEA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA87iyOWfAH-xKX7qt_y61A8ET-QHdz6x20rkKc3MeZMEA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 12/4/22 11:40, Peter Maydell wrote:
> On Sun, 4 Dec 2022 at 00:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Separately control b_lto without --enable-cfi.
>> Also add --disable-lto for completeness.
> 
> Before this patch, CFI defaults to false and therefore LTO
> also defaults to false. After this patch, LTO defaults to
> true even if CFI is false. Intentional change ?

Nope.  Oops.

> Do we have figures for whether LTO produces an interesting
> performance improvement ?

No idea.  I wrote this after finding a bug report in which someone tried to add -flto via 
--extra-cflags.

> We should probably complain if the user tries '--enable-cfi --disable-lto'
> rather than silently doing something that presumably doesn't work.

We do, in meson.build:

if get_option('cfi')
   cfi_flags=[]
   # Check for dependency on LTO
   if not get_option('b_lto')
     error('Selected Control-Flow Integrity but LTO is disabled')


r~

