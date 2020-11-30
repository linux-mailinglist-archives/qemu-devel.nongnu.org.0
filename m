Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A14A2C8CCB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:30:19 +0100 (CET)
Received: from localhost ([::1]:32814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnwI-00030S-7Q
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjnsr-0007yH-F3
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:26:46 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:46522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kjnso-0002Im-O8
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 13:26:44 -0500
Received: by mail-oo1-xc41.google.com with SMTP id w9so2825466ooh.13
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 10:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+MDIivJ6gXfIGOMlZSKjn9E/hHXj/UQRnabnf4hMstQ=;
 b=tQDnuCcYNV1YLs+MXhoSAMDG+RmgTMj+ZyatnHlY7ORhOt0o0SoZqvtdbzgMXE33wY
 6+LWP4mCav1owmodWA8riCGNNvJavpPKwKUXKPvFyRrau51gkjWf/0/fxqxrLrJIedNu
 ObYjPD2wc0hPHvroLTtmIK6Yg7YO3H7HUF5UzLxUcnbGH2WB2gC32XpxGFBRXwy8lh8O
 NwhIXhecrCYoAYCzY713pSPPaFM44JiKmtUDCswGh6TsEDR2pox7PDLMdpbdrG4CbTjx
 ViVjdV3pxgV5nVaWZPw18+XEJpiLJ1FKt7UxsByeg5HbMUNyvqu5ziKf8bSwloRbt7kQ
 rqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+MDIivJ6gXfIGOMlZSKjn9E/hHXj/UQRnabnf4hMstQ=;
 b=YcN5P68vAO9KAAg2wgxgpUTNISAp3jHLxGkc4bKK6QuS31oP+HsdlqiCmxypM5+5NX
 /hApm695aHt+MHklRiLJ25sx+Qo5d9bTNk4vCG1IY8wNGBHrgqUa4YtIgpF2qrY0gTVG
 nBp2aSoiobpqhoQ7QSiF7g8e2h8EmlB/e+mCwis9NIlkVk8WuRb0trzgvNtf7Rb+aQMp
 fr0lpRjuTIFlzsPQ8NV9ivnCemxK6H0zkyD8U/W56NKrYOC8oFHZnN7ftzbWz8SL/BPK
 sVOmNmZdI4g+z3IC6IrUma9DyCM99og1Qi0sSahfrPciJxDft7kyl2Se4NjKjInAz4wu
 0uvg==
X-Gm-Message-State: AOAM530c8KX+iLn+DvC7TU1vzyr/th/fE1SMA/I1huWhio44bzytozzj
 yYE23hM+qYm5OzU+xnWELlGC5w==
X-Google-Smtp-Source: ABdhPJw+O6R7LifTF4brRuRqhw5lrs96jYaLqUHh2xvb1YTGPJ+cp7Cswte61cmAsuZv6pffrOGkXQ==
X-Received: by 2002:a4a:d641:: with SMTP id y1mr16565587oos.30.1606760801540; 
 Mon, 30 Nov 2020 10:26:41 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id j9sm9596881oij.44.2020.11.30.10.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 10:26:40 -0800 (PST)
Subject: Re: [PATCH 3/4] elf_ops.h: Don't truncate name of the ROM blobs we
 create
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201129203923.10622-1-peter.maydell@linaro.org>
 <20201129203923.10622-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ebdd6138-61ab-7708-71dc-206e56287889@linaro.org>
Date: Mon, 30 Nov 2020 12:26:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201129203923.10622-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc41.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/20 2:39 PM, Peter Maydell wrote:
> Currently the load_elf code assembles the ROM blob name into a
> local 128 byte fixed-size array. Use g_strdup_printf() instead so
> that we don't truncate the pathname if it happens to be long.
> (This matters mostly for monitor 'info roms' output and for the
> error messages if ROM blobs overlap.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/elf_ops.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


