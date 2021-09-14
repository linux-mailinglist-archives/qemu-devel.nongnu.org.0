Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB1C40A6FD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 09:00:43 +0200 (CEST)
Received: from localhost ([::1]:57970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ2Qr-0000ar-R9
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 03:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQ2Or-0007lP-Am
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:58:37 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQ2Op-0003Qu-O6
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 02:58:37 -0400
Received: by mail-wr1-x42b.google.com with SMTP id g16so18471189wrb.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 23:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rPr92asO/P+KyBIIJ5ivHy88tGBWO8auc0I1VI4Y1xU=;
 b=NoYAb6iZr3kKsiYchsK4pTJgP7+owMVNdWmFeV/mfc+mL3qbTefzY4eWPF3xlZljNf
 7ZkR0xw+RsQXZVYImis5UAB/3/q+GFN5GKCRYe1QgNaS3Y2okkAT9yXC+Wm7eK5fA9tr
 Gdm3Bj519OuF+RYiCZwtzVs8OJmdIFS987/U1qXEir2N94RejuJaVzAP34alP6JE9QVK
 BYi1g3qvMEwQva2lLHmm9vm9BjyXcFa9LqmZEML1AheQsKOPUPNGjtqVsNnr/DYgPlbu
 5CPUriDarfuUY6MNLsjUrWFiMKyutkKOWl3DWdoGl5Wb0S7vr5cLasYrDFGHHzgRqXEh
 UfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rPr92asO/P+KyBIIJ5ivHy88tGBWO8auc0I1VI4Y1xU=;
 b=cgzQkgH3rjE0ER9jhzEZMyX0euMPh5ueIhj2u8wGuOwyEeBJ7Zn/vUfq49bcjqiJv2
 W0uvwKLzKypS8LUncaIDT6uDUE5/oUsmpz2ZwdaNdfihBiFRN/xZZNVM+jYC+CuBVk30
 QNLmVixIuLxVlLI12EkTbaDXmfRT3uSjukHjph/7XEyAhia6UYa/k2/WJPO3ZLtOwNCd
 qhaQs8qO6ei9AOfoEht+yKPMYVVSqCr01p6Axv6JXCpQ/r3H7xXVufza0wUGvf6zvr0r
 2beHfqxjOsWTddGaLPwpwBkjWc7k55Q8beQYme/HwK/iXVaVQO4Aocc4iTDSutc/2d4v
 PimQ==
X-Gm-Message-State: AOAM530R3t5St4pyXfxlFTqdfO4lVVlFdWAXS5PWKkq/zZNcoHkSTqii
 AKVnrKw4kmujZetOo+q3wLP7NoUqcdg=
X-Google-Smtp-Source: ABdhPJxoddKaI2Bt8SkJVHMXgIBsv6DzgiQ9wFuDbBx3R3RTFYr5YFW80MjJEJBXIEDFaTRedfYHiw==
X-Received: by 2002:adf:b748:: with SMTP id n8mr16967155wre.133.1631602712536; 
 Mon, 13 Sep 2021 23:58:32 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id k17sm9453330wrq.7.2021.09.13.23.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 23:58:32 -0700 (PDT)
Subject: Re: [RFC PATCH 3/7] accel/tcg: Split out handle_sigsegv_accerr_write
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210913220552.604064-1-richard.henderson@linaro.org>
 <20210913220552.604064-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <df4185bb-a04b-09d0-67da-1f7c8217b6fb@amsat.org>
Date: Tue, 14 Sep 2021 08:58:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210913220552.604064-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/14/21 12:05 AM, Richard Henderson wrote:
> This is the major portion of handle_cpu_signal which is specific
> to tcg, handling the page protections for the translations.
> Most of the rest will migrate to linux-user/ shortly.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/exec-all.h | 12 ++++++
>  accel/tcg/user-exec.c   | 96 +++++++++++++++++++++++++----------------
>  2 files changed, 72 insertions(+), 36 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

