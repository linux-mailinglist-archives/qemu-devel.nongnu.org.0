Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4DE64F068
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 18:32:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6EYZ-00019U-Ew; Fri, 16 Dec 2022 12:31:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6EYU-00018e-EU
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 12:31:30 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6EYS-00018B-L1
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 12:31:30 -0500
Received: by mail-pj1-x102c.google.com with SMTP id o12so3153078pjo.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 09:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AmiaDP1lPORTUac4NRQdH1uwH+zPtL1+/vU80cgFMrI=;
 b=U4hes2Z88QPG1Kz19tMizxZY8Y9DfOW+wcsZEDTyO1nkGalFvx6MXvLCQMgwiFK2b9
 DVlnqUJpmTnc2+vN+Cx2ABw8FHCMGgYtZVQXsAzstFVYTuU+tPhV00wp0d1fPbS0Hk/g
 ROHBkYSNZyKMHR/SXuRq5kZ6ZKKwrNnDF+Q19UDwwe8VrXu+lt6OxCa1/nxDN555BexM
 q+Lzkufnz0ep9OBCVLXVb3osP2lzTJ0yto9P6ptbhmH8nvhXMussIBC0v73fFdkN8sbr
 yEEjlNqGy5s88lRRXL/8gzCtZZhO/4jJZQDb6S97P4xGnHYkZUwtG8REfLzKYHnBTIrL
 zt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AmiaDP1lPORTUac4NRQdH1uwH+zPtL1+/vU80cgFMrI=;
 b=mmfv5vUeH1PbRFGCRqzKmOFJaaFVuTT2Y8poPecABnxGuxlj3s5E7o6CWhREdDRFFP
 DWvtA8BRxsDF+sF+ZiyViSqptG1rZ94b9yz7kZYDBMgmvloEbBicCS+F5n94dF3JBrAo
 N2OjRX6qtMDe2taw0Rn6Ibe4lCU9TocbQOfdGgbgxIrMSy2ziDv7ALDZJqjqq9d29olj
 /9lFBueE4ChWdzB3nOppzu7hvbgthrI4d84gdqyd9EYMA+oKfzyWnkGNfVbQJliqZA0b
 nIQI32xW6eBuGn+88tJyjjunETzzGFTKdaa9doDUH44OcNEv7172/wpg9vTwK062f1hy
 jAgA==
X-Gm-Message-State: ANoB5pmF2PptvEy2THke2n44G3ssfBFApRIpiBppDzF6dBC1J6BAYbwx
 xmqMMVN8AmhFoDmDiQD57sG/8g==
X-Google-Smtp-Source: AA0mqf4XlP5A82PUOF9GMDtPF2W+k35+lZUjXnU2+JscljSTMnUIYm5Y4N8xNXShvcasmKU0j0DRsw==
X-Received: by 2002:a17:90b:1017:b0:221:77ae:af1f with SMTP id
 gm23-20020a17090b101700b0022177aeaf1fmr16539268pjb.30.1671211887049; 
 Fri, 16 Dec 2022 09:31:27 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 f61-20020a17090a704300b00218fb211778sm5083539pjk.41.2022.12.16.09.31.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 09:31:26 -0800 (PST)
Message-ID: <cce88689-00e1-d01e-d152-230d33a40c0e@linaro.org>
Date: Fri, 16 Dec 2022 09:31:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 3/5] accel/tcg: Rename
 tb_invalidate_phys_page_[locked_]fast()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20221209093649.43738-1-philmd@linaro.org>
 <20221209093649.43738-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221209093649.43738-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/9/22 01:36, Philippe Mathieu-Daudé wrote:
> Emphasize this function is called with pages locked.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/cputlb.c   | 2 +-
>   accel/tcg/internal.h | 6 +++---
>   accel/tcg/tb-maint.c | 6 +++---
>   3 files changed, 7 insertions(+), 7 deletions(-)

Our other subroutines of the same form use the suffix "__locked".
As this is my only quibble with the series, I'll fix it up when applying.


r~

