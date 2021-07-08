Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5403BF6CA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 10:14:30 +0200 (CEST)
Received: from localhost ([::1]:37414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1PAz-0001RW-8d
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 04:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1PA2-0000Q3-U1
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:13:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1PA1-0006sR-Kl
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 04:13:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so3396159wmc.2
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 01:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zmSYGKtc/2D43vNCC2XOTMxj/+YCt7IVtix8sjlUgW4=;
 b=eH60MG2yvfvfDeU70+mqDh/5F0uSf8hHAQyZ1r7XUYXGwdj094ySZHGixpxdCSw2/C
 EMyLX9zFNHEviOukghP/g+FD+eAFVzueUNbHfbfTO/NcPFieOUX0DdBfwp0U0mWTGOt1
 K0j/1yTmG2P2ToNrcE+VScKEL4ny/UQ8uFRI5ihBH5jKsa/n4ZHPIf2WQ9XxalgWf/qY
 xU9YslQkqv2TeblXhUv3G+DiLAjKPGIDPLF+dpXaZvZGsPclZDb7/ogICktxrpu4GkUj
 30Ccz2jvkmAIO3MUVoNQCB0YNLDFeBOeNPJEiBjH4+mhSotwTuWNMwtt+NIpFXJz2j5O
 Bn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zmSYGKtc/2D43vNCC2XOTMxj/+YCt7IVtix8sjlUgW4=;
 b=q/0ABBZwzMcv0jVHGwFlM3UlWzqeMab8pjA5RUcZC0EN+uC53CAbORzIC2lmQda0vV
 nwRWvk6pT2LmvLe56W4tBRZfiJA4160SyNjM0AGA3WIM1YDmNxxccn4EWtHkpCYyejhP
 wSYfBOBVgbDeNJnwhQm+Gw0w0tU/PDYukTjAxFxg5Ml+5VT+skI1GSWuW/uARKTkp5vX
 XnCo4DarPdeFnXPyL95CfTs4sf+3+gVFuwge03ddTv1dkhVUO6jdd9l2sZmTNyPhFBtz
 u3QX+VqZLZmMWoqUOhO0QSGZG5U6Hp0jJ9HCfW1S255Pzz9uuFJVoeBdNrWlCGdfHjQh
 f0OA==
X-Gm-Message-State: AOAM532YDce0uEZuYkAb1eCBQkwDh0GJRfDvT1MMYKRDSGO9gW53sTmX
 FuVh0WUgf0b/alSM2bRQAeE=
X-Google-Smtp-Source: ABdhPJziCDDyQrpi1BnxKCqrxz/U9mLQ/GJlZZA1G24pIUh20j/AUrrtEydRh636+78NSIRSd6Oknw==
X-Received: by 2002:a05:600c:1c85:: with SMTP id
 k5mr3870813wms.47.1625732007982; 
 Thu, 08 Jul 2021 01:13:27 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g1sm8937955wmh.30.2021.07.08.01.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 01:13:27 -0700 (PDT)
Subject: Re: [PATCH v8 2/3] target/i386: Split out do_fninit
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210707222452.591810-1-richard.henderson@linaro.org>
 <20210707222452.591810-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8e6bed7f-bcca-5635-8daf-0bbe1f4d2c33@amsat.org>
Date: Thu, 8 Jul 2021 10:13:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707222452.591810-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com, ziqiaokong@gmail.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 12:24 AM, Richard Henderson wrote:
> Do not call helper_fninit directly from helper_xrstor.
> Do call the new helper from do_fsave.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/i386/tcg/fpu_helper.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

