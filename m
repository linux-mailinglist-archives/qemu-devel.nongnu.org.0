Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260AA327653
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 04:11:19 +0100 (CET)
Received: from localhost ([::1]:44182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGYxq-0003jQ-72
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 22:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYwl-00037E-Tz
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:10:11 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:39831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYwk-0005Wh-BL
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:10:11 -0500
Received: by mail-pl1-x635.google.com with SMTP id k22so8993878pll.6
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 19:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f0V4rBAVTx34D3V2OVFuCVAz42KA19tjSpxZqfXk0Zk=;
 b=PDspEZ5z71Fh4N7V6D796GVsU7B6bXBp1NMJFadfKBnVcm3HPLLNopzPQNfQF5nhId
 ghx8ltlUA6VOGxYfjfBa5d6A/WxFfB0OFFdwCyjiaIVDGH1d9oje+cxGSAjJIDob1B09
 lso817rcF2mWP9qIYgH9pMkZywrFRp51E8kbFUjF7s/2Wx0h4UuR5edqfiN4mgNdMDW1
 QLxTPdzi4PQKcpO66WzC7pwzwCKIidbqJAWU/jU9b4dBmhwKHXHjLT0R8SSojdivigLt
 yrvuKVKPqOmQjrVBm1Hz/NiVOEWsFX18KX9DB+BqkoATKRaNOOiiFECfhQejKzD+ZH6o
 glxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f0V4rBAVTx34D3V2OVFuCVAz42KA19tjSpxZqfXk0Zk=;
 b=dutjisqVQGiYgWzzMMw/XOP/rU26Zss/2/dShgk2bMcDnqMvxIPNyAhzVV9bqH7nPA
 7FlxjOdFmX3pWLhac2wvM16FE77G/Le1coz3KH8TAlExyoY7iGdVUeDowsOvtItiq2rc
 T++3F4/Eshha0xgkEinjbLL5+z/hurRq8gci5VrqFIlTUZtH6gAi1jUgGx6wmo1z+/q9
 bPRqVaFQHVit0z82WErM7DVLnogVbXQJqPWLxUq+mFdr0JbPkXMIotc6YNmXe+Xc7RwN
 ijy4e6H7empIwpdYNJJuCkm1AE7D0z9Aa+Q4Xkm6TiW/Gz1EINObv0tEnx0hHZvp/Koc
 vCrw==
X-Gm-Message-State: AOAM530ohOX4P8CCI1/QKjOapcNmad8ogtrYmVtlkvog3VfPLN+4+BNW
 fCaPwJhzyRhGigE88yuqUdpB3Q==
X-Google-Smtp-Source: ABdhPJxn1rTJvseYWOrf+nL+Vz8UXXrTyAGjAa5puFbU50qVIB7dM4zzrbUhSd5/3cDA/2XJEu1c1Q==
X-Received: by 2002:a17:90a:ff15:: with SMTP id
 ce21mr15344913pjb.172.1614568208849; 
 Sun, 28 Feb 2021 19:10:08 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id l15sm14933445pjq.9.2021.02.28.19.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:10:08 -0800 (PST)
Subject: Re: [PATCH v2 06/24] hw/misc/mps2-fpgaio: Support SWITCH register
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e448af34-33b4-cead-33be-843f0c517a1d@linaro.org>
Date: Sun, 28 Feb 2021 19:10:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> MPS3 boards have an extra SWITCH register in the FPGAIO block which
> reports the value of some switches.  Implement this, governed by a
> property the board code can use to specify whether whether it exists.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/misc/mps2-fpgaio.h |  1 +
>   hw/misc/mps2-fpgaio.c         | 10 ++++++++++
>   2 files changed, 11 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


