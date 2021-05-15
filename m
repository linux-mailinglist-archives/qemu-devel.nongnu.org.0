Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDFE381713
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 11:04:10 +0200 (CEST)
Received: from localhost ([::1]:53040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhqDR-0002he-2o
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 05:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqAA-0001Cq-6b
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:00:47 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhqA8-00012U-VG
 for qemu-devel@nongnu.org; Sat, 15 May 2021 05:00:45 -0400
Received: by mail-wr1-x436.google.com with SMTP id i17so1403147wrq.11
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A6mE+I36mbr40wW9xJV1YCC1nbHQym/jt1lMO6ry1Nw=;
 b=WvTHITZ9mrSt26IU6Cb6gErleMpBwfv/PQAbKCH49jWBW8qFWaAL+J+TfOosbXAaYh
 TlJ20vfduJxj0GXaQ6VtVtvGC2q5mTaanT8zTVeL9ckLboRuEljG3kOcCnDbf1o4Y+Sk
 OCx7doX1zIneOXUH2WKZtBfjhoXGBVE2uCWJNzsXLLTYPDQVoVAWTn6A1J0XtUCL1moQ
 dWA4Sf91KD6DwHhF+sGuLzmXCO3JnAwj28v2TKHUp4qy3GoCkPTjta5AFh8ZWu+AisAH
 RXZvvpLGNO1bF/Z/PGmOx0BZSPMXvpBxlq7w+c6qrdbexsVDSGt/H/2aZJuFJiKGs+28
 EEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A6mE+I36mbr40wW9xJV1YCC1nbHQym/jt1lMO6ry1Nw=;
 b=lggR+rpqkmmtals2dCG4aCM+45/DLQblpqngnLwduKqFWtnxet4RNsNAFeLvhgqZdT
 NTaeSwxmo9lXdWnCjJnn/qvinhiKNoM3Qk7tAdwlUGHSiIAmItK94meLAzwKtnD2CBCX
 29wPoYkdc7Gj0+TPowLrYiK8RsNrkZRRXSH6nJEa1A+U/lT+EgZ7bICEfvEBphHVDT4x
 IcKuUL8xY9kccc9089yy/6g39eoYNndmtpec01PvSP6ra4iuxRi1IRD+9PcWMb+t2vL0
 9x1xVIUxsuffrujN7L4Nf7wN4/Noxt07r5MOIx7WDxf6sycFVlqmrcpeZFCutU8Ia0ej
 sA4Q==
X-Gm-Message-State: AOAM531hzGvFUOGnxySJqbC6/nMiYTSU3XM8lyHmIpuNLIVfoSK6p3wG
 I45Wq2bJmj88zGj4FQ3AlD0agt6D7CkFyQ==
X-Google-Smtp-Source: ABdhPJyGbKtluF6txVw81tBwr8gRnldKgInV1sAYltnnUULuVSfQbmUDx541qmv3EyP6RHieFeZ0hQ==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr64824365wro.413.1621069241521; 
 Sat, 15 May 2021 02:00:41 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j10sm8797996wrt.32.2021.05.15.02.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 02:00:40 -0700 (PDT)
Subject: Re: [PATCH v6 06/26] tcg: Store the TCGHelperInfo in the TCGOp for
 call
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
 <20210502235727.1979457-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d8e65980-6807-076d-924c-0c96ec7f3c60@amsat.org>
Date: Sat, 15 May 2021 11:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> This will give us both flags and typemask for use later.
> 
> We also fix a dumping bug, wherein calls generated for plugins
> fail tcg_find_helper and print (null) instead of either a name
> or the raw function pointer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/internal.h | 14 +++++++++++++-
>  tcg/tcg.c      | 49 +++++++++++++++++++++----------------------------
>  2 files changed, 34 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

