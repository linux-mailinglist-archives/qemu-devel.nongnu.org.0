Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E27D47F510
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 04:49:42 +0100 (CET)
Received: from localhost ([::1]:42612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1KXU-0000xF-Qc
	for lists+qemu-devel@lfdr.de; Sat, 25 Dec 2021 22:49:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1KWJ-0000Aj-Nk
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 22:48:27 -0500
Received: from [2607:f8b0:4864:20::433] (port=39875
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n1KWI-0007AX-5q
 for qemu-devel@nongnu.org; Sat, 25 Dec 2021 22:48:27 -0500
Received: by mail-pf1-x433.google.com with SMTP id s15so10774063pfk.6
 for <qemu-devel@nongnu.org>; Sat, 25 Dec 2021 19:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5p1+El9ll2VSOgukMIqNAiiwkILUJLg8fOI9DP13lyA=;
 b=D56zIQ7JuOpjH0/egShB3kGELn7UyewI2qWTAg8PhTeAJRF0mS0+4jOaXA1AAl0jvp
 NH/r6Z10Nmw5rViISRC7oDkttK7uSY5XZFmgRyWkJa3IEOLj+Te7qm+w2CNTaz7QRTtj
 7AiOR+LtWcqWqQosh2Jy+4wq9Co1OW9jIwBYeOVtiwjXUeB3WXprsseruDHph73RzXMH
 5PtGUmVcwUbmJC4NQHLbIszXdqv/WfSyzdcMgIViHPcmhWFfWKjjc2lw205bSH8KKSwm
 0+zpWj9V/zaF7HL2a+nuWlAZYRMUPEouiz9hjSFix1P2IZ+C6SA2L4JSeyBDpZE3/rSD
 Zsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5p1+El9ll2VSOgukMIqNAiiwkILUJLg8fOI9DP13lyA=;
 b=a1+YTGxYvntVKc9svX2TGvOML5sAtfGh42BcKLisv8TqZ57OkoUjp339HaLlwlT90V
 tALGNDenleu6LtHCE7vEiGEMM1hkOZb9lhzG2EGxbwGDnyOThnmT1m/44QiTFu/HHX5Q
 AnvO31bVArueUp8/9ssiCiXPlqXKC0FoxaoBVvI4lTGjfQk+2ab1kuWDlartghhhzq6y
 R6cdAyRb0ja6jHgdG1tCreCVGoHuHD4zODBa8R4+MruXZOTMeTRPK1rmANwC/2TDB4Qp
 zoggUrybyVZFiCqt/VgjU2SafB7V8Im0L+U4GCxj9rLwrCIISXKcyLgmthr8fz5MHDht
 R/WQ==
X-Gm-Message-State: AOAM531H/LByU/uQJIWR+6H8OfUk+02otBtr/zs+wa2uDHjI3Atv8waR
 Nc+7MV5ZPTTI0XqQEfmMRbmTow==
X-Google-Smtp-Source: ABdhPJwCM+93JcG52+gJGzpEFnMras4EoYcE1IJ/IEyahY6vke0glnRZgmVFzq98I9uE90CFhYMNew==
X-Received: by 2002:a63:606:: with SMTP id 6mr11167481pgg.359.1640490504633;
 Sat, 25 Dec 2021 19:48:24 -0800 (PST)
Received: from [172.20.100.20] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id s30sm6111461pfw.195.2021.12.25.19.48.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Dec 2021 19:48:24 -0800 (PST)
Subject: Re: [PATCH 2/6] target/riscv: add support for unique fpr read/write
 with support for zfinx
To: liweiwei <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211224034915.17204-1-liweiwei@iscas.ac.cn>
 <20211224034915.17204-3-liweiwei@iscas.ac.cn>
 <ec5adcb4-3090-50e2-4981-38149e120249@linaro.org>
 <2acd9ead-d9e8-46be-b306-2aa26ced06b5@iscas.ac.cn>
 <be0bf212-5200-2f25-8b9e-5f7fe2941ccd@linaro.org>
 <9ea3554f-367a-bd4e-fc4f-a98367b96260@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f56629e-890d-5b42-b4b6-e3b7592e1e96@linaro.org>
Date: Sat, 25 Dec 2021 19:48:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <9ea3554f-367a-bd4e-fc4f-a98367b96260@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.196,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/25/21 5:42 PM, liweiwei wrote:
> Sorry. In the old spec(version 0.41), nanboxing is not totally disabled, but "NaN-boxing 
> is limited to |XLEN| bits, not |FLEN| bits". Taking misa.mxl into acount, if misa.mxl is 
> RV32, and maximum is RV64, this should be sign-extended. Is there any other new update for 
> nanboxing  to the spec?

Yes, in 1.0.0-rc, it's all gone.


r~

