Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE02471CF4
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 21:25:54 +0100 (CET)
Received: from localhost ([::1]:41430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwVPs-0008GS-SQ
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 15:25:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVO6-0007M3-V1
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:24:02 -0500
Received: from [2607:f8b0:4864:20::1030] (port=53164
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwVO4-0003XM-SW
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 15:24:02 -0500
Received: by mail-pj1-x1030.google.com with SMTP id h24so10484741pjq.2
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 12:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ee5jSlGRSqmHpuaJpMCxUbnMgNxQBog5FJw1qkW5xIg=;
 b=CO4RkmRJnG+qmaQM3lOUPYlNft4zp/FnGkrSiQJdaNetJNCK2CWov3JMTE9/ssROFW
 Ll8HUx1s+tg953V9wG5/XQhWT8K2P8ClxxUEiqdsM6gYFqLlRSraPr+79wbcjSDztPaa
 tnAeaxemBrh3vAcU52jD9gnn0Mp/UK75jtem8/m9NrVKw2HE26Tz3y1XZZTbUfBhBzDH
 FFaLvlcX78JDaPqS2Qr/uVsKNDBUnyG/wts5hEHoYaoXTR3arbpS+3v/1rZwAAqjTTI4
 F0ks+NOZ1p0ILxM8z+yjNoKN4O6MxHqaYrII+PsEK80GedCJKz8iA6EZ0CUTgL7vLZua
 5DlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ee5jSlGRSqmHpuaJpMCxUbnMgNxQBog5FJw1qkW5xIg=;
 b=PFQLDAwLwEPrYl34MxaeGWV+PYbNF981IFJ310Z3wK6j9pc5rcx3cescEP2Zr2bDtk
 ChBIDIV4O+FTAhDZM0prQKbdW4JPW8TuPA+VEY0E2LN5DSxAffUOkSTVJD2CA4QcRess
 /lM9Mu/8h0+lUOGdlCypX9K1kSfPpeDTrT1qfC1RJ9a4AzRzOwc9ME8+r59sYGKJEgs5
 kCR8rkkJjggzfcJrrA+iQYHpfUkX4xZ+D2aFE0EOVKIrEcxBG/EzGYYzeJX1gePPbmd5
 /fzJ2QA1pHhSJbbn4z/c1WNIIRq0QXVJej2VmnU2eh4f4KJBPmkiaFtusKQDiBMjBKdW
 guJg==
X-Gm-Message-State: AOAM532rjq8n25ZAj3w80GZvkvcQeSs23yGSrnDNjwlpNvAZ+sOz1JlU
 Hico0IkNHGOnmzXh1yQBiv8GKA==
X-Google-Smtp-Source: ABdhPJzzUDifcCRnK73xVqKspgLlEVCtYBh1Kor5TDsDsBvEd6hpMfa5xYxROjFUu458Hyj57mC9ew==
X-Received: by 2002:a17:902:e0d4:b0:142:8897:94e2 with SMTP id
 e20-20020a170902e0d400b00142889794e2mr90942417pla.58.1639340638869; 
 Sun, 12 Dec 2021 12:23:58 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id h186sm9880365pfg.64.2021.12.12.12.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 12:23:58 -0800 (PST)
Subject: Re: [PATCH 10/26] hw/intc/arm_gicv3_its: Use FIELD macros for DTEs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0bc61ca-d818-1e2d-625d-0a742b6b5d01@linaro.org>
Date: Sun, 12 Dec 2021 12:23:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Currently the ITS code that reads and writes DTEs uses open-coded
> shift-and-mask to assemble the various fields into the 64-bit DTE
> word.  The names of the macros used for mask and shift values are
> also somewhat inconsistent, and don't follow our usual convention
> that a MASK macro should specify the bits in their place in the word.
> Replace all these with use of the FIELD macro.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h |  7 ++++---
>   hw/intc/arm_gicv3_its.c  | 20 +++++++++-----------
>   2 files changed, 13 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

