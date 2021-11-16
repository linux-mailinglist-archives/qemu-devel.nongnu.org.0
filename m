Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F25453BCF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 22:44:45 +0100 (CET)
Received: from localhost ([::1]:59824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn6Fw-0003Nx-G3
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 16:44:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn6Et-0002jC-Rw
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 16:43:39 -0500
Received: from [2a00:1450:4864:20::32c] (port=39656
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mn6Er-0004Cr-TQ
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 16:43:39 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso3122312wmr.4
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 13:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=unlJY+vcQqwyR4SCwQyLVP/Rd3Jn+IOW7Ln9HmTlMWg=;
 b=g1fUKdQ778kHrEuaHsiRdFbDl+lW64c+B64hqFS1bPXHWaocVC8HnLD3L2InCvWrcI
 kaqckrieCcytI3CaduT5IZanMdOVZgpiqkzCqFmZFoKTe+B1ns5hrDkaxSQY74HNR3EK
 te8gHd6YBSzBj7+qiFZaRDiguKYo9Oy2dzB+mzZ/RYWg3cX90oSZ+rKUeoUqgx/T2cPZ
 QMudcgpi13hTuwaSbDP06hYH0y/CWWlV4KRAW7Cqukq6UnfJrzIPj/QXfb6fXaJ1CeOg
 2Vvr1jehmTtvR2t4jy9r8hsNUGnZKO7rS8tCaw1yj1F588n1scwD+I/Cs3/vvfApY/QW
 LUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=unlJY+vcQqwyR4SCwQyLVP/Rd3Jn+IOW7Ln9HmTlMWg=;
 b=fb6KAC35rag0RXngWj6dqOnPZ2LgEnoh9Psoci5hUKpLJsqz/k6J2EJfSQYwSRToGQ
 UBoMYtPDqreYX4HBceCj84HnL/iZUDPX0bnk32Q0lRuGBi0RjCQj7wV0pKlhduOKU91i
 A/5CCxBJ52EaG8t2eS++YT4BB21A1UdvQMMYzjrWmWKtMX+A6dHm9PmKvSivSxzUrg9+
 JKLcTObA/qqKpjjX4vzxJSdBQO2eNaqosdwWRmvzaZ6z6xniZKWkyFv0ktkhYAYPl2KC
 hmdXzQ9nDCWjQW6JgfPRmKyxq8LjLJgpqBE3q/OskFHnu0F98ay6IqjAxyWIrMVCSmXx
 SauA==
X-Gm-Message-State: AOAM533j3lUCi6YQgdsL/7/8lTaiPr8OE5SvsGidqL/jI4AeGDdIkXyB
 q9+HIOmejK94KF/ZYraXHolL1g==
X-Google-Smtp-Source: ABdhPJz2VUm9a7FseORTSkG0BkYRwoSn/JDqaNVo8XeQjg02+N8/ihdDq7dL8Q21rwUt/P/56WIyiw==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr73758772wmq.34.1637099015487; 
 Tue, 16 Nov 2021 13:43:35 -0800 (PST)
Received: from [192.168.8.105] (145.red-37-158-173.dynamicip.rima-tde.net.
 [37.158.173.145])
 by smtp.gmail.com with ESMTPSA id l11sm18267374wrp.61.2021.11.16.13.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 13:43:35 -0800 (PST)
Subject: Re: [PATCH v4 8/9] common-user: Adjust system call return on FreeBSD
To: Warner Losh <imp@bsdimp.com>
References: <20211116110256.365484-1-richard.henderson@linaro.org>
 <20211116110256.365484-9-richard.henderson@linaro.org>
 <CANCZdfrVjYazmNBLhVMnKsOqcbnYA1=mP2MhrhumEcVwdJnwKQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8a994325-998d-7b1d-a38c-26c381513776@linaro.org>
Date: Tue, 16 Nov 2021 22:43:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfrVjYazmNBLhVMnKsOqcbnYA1=mP2MhrhumEcVwdJnwKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.446,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/21 9:58 PM, Warner Losh wrote:
>     +#elif defined(__FreeBSD__)
>     +       /* FreeBSD kernel returns positive errno and C bit set. */
>     +       jcs     1f
> 
> 
> I needed to change this to 'jc' and that's all google found for Intel.

Yep, that's me jumping between too many arches in one day.  It's jc/jnc for intel.


r~

