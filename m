Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5CC5179BE
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:07:28 +0200 (CEST)
Received: from localhost ([::1]:47670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nleCV-0001o6-4h
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle43-0006FC-2l
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:43 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:43667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle41-0005SY-Ky
 for qemu-devel@nongnu.org; Mon, 02 May 2022 17:58:42 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso498915pjj.2
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 14:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Fhw7HwJPYbIwA7CNlUc4wn9LiDuqyxg+qv1llRXNv+I=;
 b=kT0Lqdwdqp5Y23997DvkBJSE6UuOorIApr6HoOdd6IrBoHlnWdGnAEbaNGZUwSn5L8
 zhU8R8CsDBpRUwYMSHUR4H5srXIai6g5spYy7Uizk2RVGCGcuP9Rw3pN1wys2w7y41y2
 bYtvrZSFEugKhWdPjqqqoq1I1iw9GB8IJD4iopLn2DVpgUQCwY0XFf90toVBm6H3ngr8
 UrNVwuzOW01Wd/4hXz9Gn9j/rkGABzqTix9oOOQ1e+Cmhv60gymL2IRRlPx1oHT2sCXQ
 z/iYJpq4DsKwoAJy/CdlIe70kuk71Y8YP6YfdqRWlGaUO37Q9KWvF9L/1eFmMnBp5Ih3
 Naaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fhw7HwJPYbIwA7CNlUc4wn9LiDuqyxg+qv1llRXNv+I=;
 b=kCVsM1zEn+OttWHHCQZNAVP8SlC4FxpontjMDs2vJOscU9DzctZaZ1cb5AP7Xflfbi
 KlvVVS+txtYRF5Yh0mg+06bRjtwIqI7Hd/6unuHqA8+0KZmZwKfcIyaSLAQquRhdP/Ah
 Y2qa+abODpqsxk4tNyErerezzMiG5TLWkBSmpnj8wXf0hXJahjBGEJMCtdaQ2G9RutkU
 3KiZK8XnKsDQiVuRF+GgeAUyAKibKGL5dgHWHJFMXz7SHf7DOE1mbcIazdwhNN+UuWFY
 a3ztgdPedmdW6B/5Vb3EEQj4jg4Q09Sf06hNpJ9ocDIucjFyAEi6p0LmjMPP92bruZm9
 HpZQ==
X-Gm-Message-State: AOAM531qO7t85bsWyACcqPQNnjCKbWu2zpp8iyMZACZIHFwY02MGItfu
 uAzybCldrI2+L5sALj/f4tyJgA==
X-Google-Smtp-Source: ABdhPJyB6l1nkplb1nRUiMam+eBZhrjlsUtZ6LB32vd/4On8CqzjjbfiIpg18Se0Sduni3dS3+Bfvg==
X-Received: by 2002:a17:902:c2cc:b0:15b:a4e6:f58c with SMTP id
 c12-20020a170902c2cc00b0015ba4e6f58cmr13418818pla.149.1651528720377; 
 Mon, 02 May 2022 14:58:40 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 e22-20020aa78c56000000b0050dc7628160sm5173517pfd.58.2022.05.02.14.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 14:58:39 -0700 (PDT)
Message-ID: <7741c077-6b7d-5003-f391-469dcd81b9c2@linaro.org>
Date: Mon, 2 May 2022 14:58:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 10/21] target/ppc: Remove msr_me macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-11-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-11-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/2/22 07:39, Víctor Colombo wrote:
> msr_me macro hides the usage of env->msr, which is a bad behavior
> Substitute it with FIELD_EX64 calls that explicitly use env->msr
> as a parameter.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

