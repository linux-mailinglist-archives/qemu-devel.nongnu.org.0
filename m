Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AEC497795
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 04:02:57 +0100 (CET)
Received: from localhost ([::1]:52642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBpd9-0002zB-He
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 22:02:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBpbS-0002DA-03
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 22:01:10 -0500
Received: from [2607:f8b0:4864:20::434] (port=42777
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBpbQ-0007a5-7Y
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 22:01:09 -0500
Received: by mail-pf1-x434.google.com with SMTP id i65so14504387pfc.9
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 19:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JLzfxIylLKKQSi6tMs3ZeudA7bhZ48a98bNRARhQZuw=;
 b=lwY+6vpmJ52S22aNfnUGeyJOqHzO+OtYHpsT++YBfceUOmnQGZAHrHGd3G2eqARKWq
 jeRjPC20rsDZPG/sQaUpZjN1uXyudRTHopWZQdznpNxprwb2XkqPhrQ2vSzBar6FHt5V
 t2IFnkkRl75m/vxX2jbwwd8JwLuPJf+2z3LQKZPWipi3qfmShd33KYYqGaR9PB4enkuh
 48e2qcXuzXbJirLhWkCfq1dNpskPBSZRlxUuSTukef3mRhiV785stHHo1pcIygmImfiM
 zJlJVSMT5yGHUeuEOZVC/FaeXSMS1h18TwC4iozP0jChRTF0bN4Wj1MIR38b3OgDPu0X
 rOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JLzfxIylLKKQSi6tMs3ZeudA7bhZ48a98bNRARhQZuw=;
 b=5BKQTulkY9YP8PkNeYa1HPmPicYkqqfUF3VyJJcOPUkrTGTxZc35Maj2STBllrz0c+
 6r73qZv5w9LT2qbYhuFkwJ0Jx8Nj5J61UCM1FF3XKqtIF9hNz4Mm2NIFR9HASShsabUs
 njE15VnWInqMeqie64eolgVMh3xgc5S3IZC3c5uMTAzdEfdfREN583E5JRZ/LncfWNUS
 W9gumVcShdjKghAShYb+LlwXmD2+ajDBeW4o/aDCatCVO3d4O+Fa2MeBVZGJJ5Bwjfp0
 Z+vnjopaiiF2uev/hMa99gppnj8nmhDmD0wp4N9EfrNGNXiDUgH0dkSeiXKIGKSyaCGl
 FXEA==
X-Gm-Message-State: AOAM532kFoisQ0yfMt31FtMpzmh1qed6zXxcDjC9PJlBEYQdwLTJbcqu
 lFbNcQUAzkVvOP2alMh4wERzoA==
X-Google-Smtp-Source: ABdhPJyiVHZTXpQxDPRI12uvCKgqmh5d8Ij7BbQWwTgKgpmBiRroa6SVj2wyMe1lV/mS4/jA3aU5Tw==
X-Received: by 2002:a63:5920:: with SMTP id n32mr10356557pgb.226.1642993266709; 
 Sun, 23 Jan 2022 19:01:06 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id g9sm5765995pfc.109.2022.01.23.19.01.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 19:01:06 -0800 (PST)
Subject: Re: [PATCH 20/30] bsd-user/signal.c: core_dump_signal
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-21-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2b706ed2-a9ac-175c-e723-bd1de381711c@linaro.org>
Date: Mon, 24 Jan 2022 14:01:01 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-21-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:19 AM, Warner Losh wrote:
> Returns 1 for signals that cause core files.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@freebsd.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/signal.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

