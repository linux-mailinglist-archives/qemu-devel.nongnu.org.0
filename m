Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A4C3DEA21
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 11:56:25 +0200 (CEST)
Received: from localhost ([::1]:51772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAr9s-0007LX-JO
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 05:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAr96-0006ci-Hf
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:55:36 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAr95-0007KA-39
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 05:55:36 -0400
Received: by mail-wr1-x42d.google.com with SMTP id n12so24663761wrr.2
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 02:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8i7oXz26IaLSF5ln1GTK9Uqm4tTRtd8yguUhdaXx7rU=;
 b=fXmVvVR0sV1SBDqbClP7BOnpLNysnAyw0MJ1qkiKGWhJTeD4cOIWMTlE+JuWHGgSrH
 h4jdyWn2PVI9EXkgry4Eq+OsmW7iFov+laygnwOj/4aVGyDS5gp30rJIQ545WRKcgWjy
 dXyud3dtyD638ulwRAo+F1K5W4eotCVtvcClo7b5KaEdIr95kbJeproJo+bMLRj/ZUCj
 3PjksG9ndC4j5rTjROJ6HFlQAu6usiXfZ4WOFal1yH9LqD3lI2rf5gOSvUPFsyEGtPhu
 N2MUiKun4aRzgrIfunL3ngLyEKQ2e9E8yubWYgrz31o55iTkBID2HZTw77pTgO9Eulp2
 KYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8i7oXz26IaLSF5ln1GTK9Uqm4tTRtd8yguUhdaXx7rU=;
 b=ZaECpmEuN0tzRvXE4JUl19FpcCCZ9VFmgvrzMXjqELF8HVLZrAH7C5BDjyvdiYSlZa
 IbXKXV+EWLIPsmacF+rhcu4ZN8R7B/ZpYT6t0oqucufkwymdVLJTJbNmrmYINUozDRCN
 CuvtiPzlg/IV+G3qemSnpx56ybwiBJVT8zYUePWYQIXxrOsIogyyO+gyvdfxGfZL43zC
 eBdffBpCqS5WZmTwy0YRPDouAH+vjfuxzH1Sc33quoBrlUXxBI14iHUQIkD1rRBz2nnI
 MJBYRO1/bKCp9qdLxUxNm79/qwYwAVoZG4kzTlPwd9/y4eHmcEHFNe1Wj1XIu5s6zaiL
 hOCg==
X-Gm-Message-State: AOAM533RGSVhYlKPptI95u7dnbtSDF5zH8Z6tLOJzqgqMHdBp7+HTEXh
 OT9tiw2Ev0DU8Q4EyUcXGIU=
X-Google-Smtp-Source: ABdhPJzEiY6ajtwDPNZZU61f8G7DajB50KV+KElaALKXaZqvJWkClKg5hU840z4x2G3geD6r1+Iezw==
X-Received: by 2002:a5d:518a:: with SMTP id k10mr22081597wrv.400.1627984533426; 
 Tue, 03 Aug 2021 02:55:33 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id u11sm14328768wrt.89.2021.08.03.02.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 02:55:32 -0700 (PDT)
Subject: Re: [PATCH v2 39/55] target/sparc: Use cpu_*_mmu instead of
 helper_*_mmu
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210803041443.55452-1-richard.henderson@linaro.org>
 <20210803041443.55452-40-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1e1b6010-ef91-5f90-1649-ae1c0e3b2ffb@amsat.org>
Date: Tue, 3 Aug 2021 11:55:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803041443.55452-40-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/3/21 6:14 AM, Richard Henderson wrote:
> The helper_*_mmu functions were the only thing available
> when this code was written.  This could have been adjusted
> when we added cpu_*_mmuidx_ra, but now we can most easily
> use the newest set of interfaces.
> 
> Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/sparc/ldst_helper.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

