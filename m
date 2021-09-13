Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F384409220
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:07:18 +0200 (CEST)
Received: from localhost ([::1]:47514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmc9-0000a8-7F
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmZC-0006DS-P0
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:04:16 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:40683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPmZA-00026N-AT
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:04:14 -0400
Received: by mail-pf1-x42d.google.com with SMTP id y8so3541913pfa.7
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/9Vxfp86LVw0WGR9pag3qQBu6XYGnh9858q7Sd0sPAA=;
 b=gv4rsfibkutPOjOcjbKatguTjypUDktIngW6uM31OW1Wbb/BmEMaKETk0H3dYUwzYG
 MvMNDx/mwZdATsKzc8c0tli6GiBDeQxSSpyNES1GIUhuZeoSHeqHdRkGd8ejQwROcrrK
 qPjnlmbLCNa4LYKmkmbOhfa10zS8Px2Tqi97TDEUvJpnlIOIv6kmZoxIfrvWxLBoRJ5N
 vrRWK81+RuGC7M3Uzn/AcnMNOfziMXibix12/o2tL+yTXjlsre8Kb/Km1Rp580HXXFei
 PyNLwknzrhcSg6XnqoI9NEXeQ8TG69zr416VGwe5vyCUFQjITNRii7at/XfrPHnuA5Q0
 v25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/9Vxfp86LVw0WGR9pag3qQBu6XYGnh9858q7Sd0sPAA=;
 b=4q4MgqLW+hzmzKZofTU1luHizu/54YQpHJMOGaMMNgFHoITq2C4jLLALsPSx7VYYQ2
 MbPDuvu+mQx6M0t6Y+9p7jAP7OiUYFuJdl1ZnSlICejSKEBGX4bFi+3L1P6ko5eunldm
 l1Pd+4IJDAeVScEPq5Ic+t2tuffgbSCUoSHD7IwCRn1yknF7hjRuv8+9fJZDXhqBDT+Q
 jI065Ud1aUcZ7K7D56Eoee25pD295KJuc6mb1IF3PHYZhH0Q2AJ0tknQ3SSWbrLE2bSI
 oEGNNxPZrlCqgQGvty/3YGVafWvQjA/xFtDqNNFMHqmg8JUyYHm2bHo5PnftRzy/Kd7k
 oNiw==
X-Gm-Message-State: AOAM532BWb4M8djmDAgL3Nmipwv84+dCtaX7rpsLz3EEjAXFq66VITu8
 uaidBkKeNMFFgfMWjFySMnVqng==
X-Google-Smtp-Source: ABdhPJwOz9aFrOvfaq/liBEHQKJ1IeGic53yCIS8uKcTlae4JMBQGxZwRDL2+tAEIi7ROmypTnuy9g==
X-Received: by 2002:a63:7554:: with SMTP id f20mr11265415pgn.161.1631541847359; 
 Mon, 13 Sep 2021 07:04:07 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id d18sm8177091pge.65.2021.09.13.07.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 07:04:06 -0700 (PDT)
Subject: Re: [PATCH v2 10/12] target/arm: Optimize MVE VSHLL and VMOVL
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0bcbd02d-abb6-de1c-efc3-d0ba465cdb9b@linaro.org>
Date: Mon, 13 Sep 2021 07:04:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913095440.13462-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 2:54 AM, Peter Maydell wrote:
> Optimize the MVE VSHLL insns by using TCG vector ops when possible.
> This includes the VMOVL insn, which we handle in mve.decode as "VSHLL
> with zero shift count".
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The cases here that I've implemented with ANDI then shift
> could also be implemented as shift-then-shift. Is one better
> than another?

I would expect and + shift to be preferred over shift + shift.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

