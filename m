Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250656EC1B8
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 21:04:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqex6-0000Bd-Uw; Sun, 23 Apr 2023 15:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqex0-0008V8-8j
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:00:44 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqewt-0004Pm-Rm
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 15:00:39 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso22542555e9.1
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 12:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276433; x=1684868433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GBN5wcHZUSG4gSnKo/pkXGWb4P0E094RZYM0hsP/MIA=;
 b=ntfukK7OvoBh4rcO3lj64YwOp9Kv5nnhgrIAbspm3yX/2mmQaADG1qhY4SUpqIjzW3
 I50ikr5MbnVRjvu/dh09UoVCyEJbZMwWSXsscl1YF0EI/vHxfsnkp/VqchjW6rTYaQhA
 yxBXAj6vR1KLVjDpMtxLVJdfy53ekFkZOXep0ic5Z1PxZbLcgki88YFXKaE8uwVfz6HC
 cnZEjAnN8/FOgBHVVtcxbuU+YM6y4ywNIwEsp5hTD16mcxH6FXvEstrMeMFKQBqBKkqV
 nGZOwCXkeS4aLQEzM2NacRvAYhpQ0PP4YXOUjdwvgVvuLTheqmmyt2yR2LXUGv5LQ+L4
 4KJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276433; x=1684868433;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GBN5wcHZUSG4gSnKo/pkXGWb4P0E094RZYM0hsP/MIA=;
 b=lhiwfAXq15J6gVqy2NrsWayPOCZc7mW7AXpUzKSapW9qI+A50m1J62cij2keFLnl0U
 WkAid6ztr9WmOsNKCLtWSxredEVDopIOm5LgI8LVSy8vVsTif0yGi+eSd6nDzVvwSP35
 H9Vk0vUSBEOKzWAwmUNsOHIvJAXpsaaqugNyTDJotjmWAV2Awmgl4HDifYvdcw9iaVyO
 uf38iEEniskNQCWKuqs/6cLaEOAVY9v0Gkd8nKQ3y+WS/z+HWwcR3mpaAcCgJERzLPj/
 s0KWkGHyZaY+ttD1/oZtJjagaOwqD2pwn7IaTqW/n8/QidfhhN+JuLJhZb0PDCaf4nkN
 VngQ==
X-Gm-Message-State: AAQBX9cANQVG4DXZxvDgV9yYhLUiyA1CT12kWMqtbtbsO0gjNsZwLQSK
 UIks1yE+JcVFPQ8FuJkDJQRIEg==
X-Google-Smtp-Source: AKy350aZj2sq6Ff4L16ERKyMREtiQc6NkesMPWPTOd4C1kZRgUHgm92I3tdQ+T83BgywoqYBXjOMpQ==
X-Received: by 2002:a05:600c:2214:b0:3f1:987b:7a28 with SMTP id
 z20-20020a05600c221400b003f1987b7a28mr3357822wml.29.1682276433689; 
 Sun, 23 Apr 2023 12:00:33 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 k25-20020a05600c081900b003f17122587bsm13617136wmp.36.2023.04.23.12.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:33 -0700 (PDT)
Message-ID: <f7192acc-2ad1-8bc1-fc7b-0f23518fb2e8@linaro.org>
Date: Sun, 23 Apr 2023 20:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 20/54] tcg/i386: Rationalize args to
 tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 11/4/23 03:04, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.
> Mark the argument register const, because they must be passed to
> add_qemu_ldst_label unmodified.
> 
> Pass data_type instead of is64 -- there are several places where
> we already convert back from bool to type.  Clean things up by
> using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 113 ++++++++++++++++++--------------------
>   1 file changed, 52 insertions(+), 61 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


