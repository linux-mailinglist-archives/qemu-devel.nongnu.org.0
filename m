Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A046FB23C
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 16:06:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw1Tz-00024M-99; Mon, 08 May 2023 10:04:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw1Tp-00023w-Ce
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:04:45 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw1Tl-0007HU-9j
 for qemu-devel@nongnu.org; Mon, 08 May 2023 10:04:43 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so29000751e87.1
 for <qemu-devel@nongnu.org>; Mon, 08 May 2023 07:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683554679; x=1686146679;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8l6XA47qYFO1YMAGepeed1ERBmVNteR9iC8vQDwcbLE=;
 b=Tt+klrvBkv/CrWmeKNWa1jvNtkXylzf2/vkg5sEWJYdmflPTaKZydANBjugrkyXqc5
 InFX/DU/jxZdXOa9nVH5gt0Kz2z5B70aa3EtmFnvMBTPrEiEcPSSRA1ZSTwszEBIrwCJ
 H302iZE0fKuilTzbt4dvfZ/HHDiI6v6mABWs1owjSEdAvkFxjsl8cR4hefRK7awcUzZ+
 DD0DIiA6ZRbWIIgcTJg5OE22VSr+l2nV9CIQRLQ3vgEigjaPwPTgjYuDNhc6zIwCHjSG
 kBcC0p4wSzUNnHSoYHPikraDl854CpPaP/G+d99wfI7zCp0Cp0V/Jd3JzJmKlQFeiCGb
 k/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683554679; x=1686146679;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8l6XA47qYFO1YMAGepeed1ERBmVNteR9iC8vQDwcbLE=;
 b=AlEFsGSthDv4UaTSDStNbN4sE9ARt1c3T47QmE2yo4UMsDUu4eWKJT2VjpYCGt6O8b
 h3kyReCIXGGjwiILfHlakDkUJjR1PKYHeTENpzzCiORkOytbnxJ+xTVtrl9z2ZS9eTDg
 llxHyRI7MrZ0CvDp96vKsLnkY2mzkp2aoGausaT7oV+DxV6YdZcQVZ8XHI7M5Uc70/Rr
 7AbRfGAYqoVmT6+92/2kEjw3mQHFe+2nV0Xm0gqT7AjxKwu8qS7iApCmvLf0xg4o2Koo
 c9RZmuiUfJGy2iJmtn8UctZ6cFceIID0lUe5mjJMGYSw6BO6ZBm7dLUvMV0ensUX1DWJ
 V8+Q==
X-Gm-Message-State: AC+VfDzMrtncGfIevjmmSwOPDbToAC2a4fpohSKGivNhjyozgolbTKBO
 y2qJ+LLGqdkv4Zo2wrR9fK6z5Q==
X-Google-Smtp-Source: ACHHUZ7H10LN3hlYG8SP4tLdS1fmYSsmOE4agAbxAD6Uk2L1yzaD5q89WexG5aDDP3SKYPu/by/eOA==
X-Received: by 2002:a05:6512:3d8f:b0:4e2:7ab6:15cd with SMTP id
 k15-20020a0565123d8f00b004e27ab615cdmr5219074lfv.30.1683554679238; 
 Mon, 08 May 2023 07:04:39 -0700 (PDT)
Received: from [192.168.110.227] ([91.209.212.42])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a19c501000000b004cc8196a308sm4078lfe.98.2023.05.08.07.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 07:04:38 -0700 (PDT)
Message-ID: <5b21cdb6-fbc6-b9fd-edcc-6ca7e4c88885@linaro.org>
Date: Mon, 8 May 2023 15:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH 0/2] Make the core disassembler functions
 target-independent
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
References: <20230508133745.109463-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230508133745.109463-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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

On 5/8/23 14:37, Thomas Huth wrote:
> Move disas.c into the target-independent source set, so that we
> only have to compile this code once instead multiple times (one
> time for each target).
> 
> Marked as RFC since we have to replace the target_ulongs here
> with hwaddr, and the TARGET_FMT_lx with HWADDR_FMT_plx, which is
> a little bit ugly ... what's your opinion?
> 
> Thomas Huth (2):
>    disas: Move softmmu specific code to separate file
>    disas: Move disas.c into the target-independent source set

Patches 79-83 from

https://patchew.org/QEMU/20230503072331.1747057-1-richard.henderson@linaro.org/

do the same thing, using uint64_t instead of hwaddr (it's not).


r~


