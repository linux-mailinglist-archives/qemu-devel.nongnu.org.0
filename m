Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4513933E1CF
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 00:01:06 +0100 (CET)
Received: from localhost ([::1]:58134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIgT-0007Xt-6j
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 19:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIe9-0006Np-LU
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:58:41 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIe8-00010a-99
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:58:41 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so263468wmj.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MBPy5pkkI2+LPBHsr3Ohq5fqs3mfGjbHP+RyoMyDa2c=;
 b=X07HLxteZGjn8VLVpz7Bgml8keZoiC7Z2yKcBgwNLWlPHh1wcbAq1H5wC0mVBGr1L5
 Icbv3GAEAl2f8xFRnbc+Yw7qPlB07SxHmjMI1LI9yILpULFY0Z0v9ahF9D8bgkv7sh1T
 aTv6OA07QtcnY37RtqY0CW0RTh3AahntSYvazXEr1f2kLWefNiRE6W0oS59MdoKqNpuP
 NCyRUHIgsyKnpdv2hidR72pRJuLkPf/qNAzg4KS49XaGqBkFWg/G2Hx7F/aZFaTC3EjA
 aCjiaNafG9IuYmcqIbXrhsZW3DwQP4jNL5zo9iIu3XLhWt+RJ/fGQm71eYzvqSWWBtNl
 1Yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MBPy5pkkI2+LPBHsr3Ohq5fqs3mfGjbHP+RyoMyDa2c=;
 b=nvQ4kGp/bs+Hd3ZMTSah95xEXHJQDdmLQnAnfOUS9jlTeDY8z/+waNPUqKV09grija
 Kff4ZQ+G5yco67lhOCyqfypdPHKlfhWdC+oJ17jDHfEbZ14MixVB8OK46k4kyRmeKcd1
 ewBk9FZomKgIB1v/bw5IHoaHNd1A3NFpZzDeY2c7ts66PouK1Ej2uiZgZY+NRdrG/omy
 tYgDo12RkVFDi670+o7rSXKO25K8oRFTGwYjyKOUF8rvpK3kmvdBYD+fi5AR5Wcd/qlm
 exKVX4LZCZMP77pUebPpqhGaQs/59434wBP5bhic0FWLNsb2B8j+VIKVsOB6Q3/gifzY
 uC7A==
X-Gm-Message-State: AOAM530BLA13bcVXK6cctsw6IeI27L7YcwcRLlwa9y73TLTtwulK6Vq3
 4LiraIl148XJY/vTgOYU4Z0=
X-Google-Smtp-Source: ABdhPJyhyRH2EMRm/BUZGZydsWXQxuM9vrB+lGu+Rrbp7W1F5fwknMvb0Y6HiNZK75qbaNlFWCL6TA==
X-Received: by 2002:a05:600c:4a18:: with SMTP id
 c24mr858369wmp.173.1615935518946; 
 Tue, 16 Mar 2021 15:58:38 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l15sm660538wme.43.2021.03.16.15.58.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:58:38 -0700 (PDT)
Subject: Re: [PATCH v5 08/57] tcg/tci: Split out tci_args_rrrrrc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0032147e-7fc9-6a96-406d-f16c5724086b@amsat.org>
Date: Tue, 16 Mar 2021 23:58:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 3:39 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

