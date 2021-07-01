Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A273B94BC
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 18:37:20 +0200 (CEST)
Received: from localhost ([::1]:34162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyzgl-0007xc-7d
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 12:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyzeK-0006Cv-2w
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:34:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lyzeH-0002YE-R8
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 12:34:47 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t15so5673633wry.11
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 09:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ngHoPpLBuEIsv2eN3rPIrANA5DtoeBxzMAleOQJr58A=;
 b=j82IfdkFSUEC1NSxhOhxnxnf9aXnilhvSTbXTR8PvK9C/of73PWY3FGzVPoPo5Ckor
 X/ghm6lXD5CyZJjJ8I8xsVLy8xO6bkqcYICZHlP58AQIxn5ntQdB90XEMW4icXnMR3io
 Ukp7A++IhHA35FuABP1SrDGoLjgvbA/tuDWd/5NcbNjjXw73Ej1UZFCi/rIVZCl3VBej
 L8/JLq0wQzk758z7quvFh8i+pzScLPBHSKZm5y6wvLKXYgOq6SRfFXNudMcnBc8PSqb4
 ucHx6RV97KYXZNk5JNuvvQEG6DZbc9q+f5SKdCA33CNiw0qfYR0qmiLn51FgQgc91uNV
 c1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ngHoPpLBuEIsv2eN3rPIrANA5DtoeBxzMAleOQJr58A=;
 b=PKX3jWO++Ke2yraX0w9+mYAHOmU6yzX8MhWL65auh3oXHEty28n24yKh9GUkD5OrCL
 FxDlJ5NOWb/aFIBRgk2zvyBkks52oAmsFqR8jWQ5PZuMPLGW1UW1qw6pPjkmPruYwTpo
 SzRsQ+efP2IuwDp9acDS0vlEem6qlPPx9zISh31SNUfkdjx+Krc/vLoXsu4RqgPyRQEM
 1audn/OuSCkCs4jQO1nxYva4TrmEUhUPnbj3tHCttw+WG/IAY+hYSzFNByHlkMXL5VBf
 UiJnwvv5g/NWNYCiCUVhKC4xy0JX2kYaq9eSI62XOpFG73edqeGeyttKaTmYbM6MU2Dh
 B2Ig==
X-Gm-Message-State: AOAM53364P+rmsXbG8b6dKtGCRuHzvXYuG3did2yYsIpntaefENPxW2T
 KSKDNb1ZM9cf547DbvOD/g8=
X-Google-Smtp-Source: ABdhPJzw+TyrXlum4wftk63j0UCaecAVMaUuqzxRCKpdQzr+ZhD5mhEgsoeUhEFVBVy2W3z7WtqpuA==
X-Received: by 2002:a5d:5108:: with SMTP id s8mr631237wrt.311.1625157283489;
 Thu, 01 Jul 2021 09:34:43 -0700 (PDT)
Received: from [192.168.11.95] (pop.92-184-108-151.mobile.abo.orange.fr.
 [92.184.108.151])
 by smtp.gmail.com with ESMTPSA id k13sm478224wro.2.2021.07.01.09.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 09:34:42 -0700 (PDT)
Subject: Re: [PATCH 03/17] accel/tcg: Move tb_lookup to cpu-exec.c
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
 <20210701152537.3330420-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6530243a-5a01-43b4-091e-4ae810a2dc95@amsat.org>
Date: Thu, 1 Jul 2021 18:34:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701152537.3330420-4-richard.henderson@linaro.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: alex.bennee@linaro.org, peter.maydell@linaro.org,
 mark.cave-ayland@ilande.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/21 5:25 PM, Richard Henderson wrote:
> Now that we've moved helper_lookup_tb_ptr, the only user
> of tb-lookup.h is cpu-exec.c; merge the contents in.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/tb-lookup.h | 49 -------------------------------------------
>  accel/tcg/cpu-exec.c  | 31 ++++++++++++++++++++++++++-
>  2 files changed, 30 insertions(+), 50 deletions(-)
>  delete mode 100644 accel/tcg/tb-lookup.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

