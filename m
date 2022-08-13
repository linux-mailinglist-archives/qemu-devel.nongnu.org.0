Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5468C591861
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Aug 2022 04:34:15 +0200 (CEST)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMgyb-0008Nf-S3
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 22:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMgwX-0006tg-Td
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 22:32:05 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMgwW-00060U-8Q
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 22:32:05 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 t2-20020a17090a4e4200b001f21572f3a4so2414472pjl.0
 for <qemu-devel@nongnu.org>; Fri, 12 Aug 2022 19:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=+nD50yWFTzf9KklZthJooBQnjFykLFjLsP1Pg5eOfJE=;
 b=DUBIruKvXTHNcJlt4Wf04OCvQCFmpd/Im3wuriTMuIEyswmUIBKn0DWXCHdaY1rhL5
 IZ9IWY4mMN/PIk2yx5tUmBY4zVn99EY/HnbwD10UqAr23TuU5WjgFKkThRSdpzQ4vXj5
 ILouCz0AFYL//qkMRGDAlKWUO7eNhE71RJYDtdosCFVQJ0tjp69BW+kDHbRyWEgSrZnN
 UlFy8ye1WQfBLXkC4mnb9lJ6LnOKzg71It8cbPVA+sE0M6OsQ/A5Kbz9PBqt3UGK1OS+
 d++R4Qp1UT6EASweo5Or1klzGWqaeyMht4DnYW1uQ/F0ZTrMWQ2oPiFZ0fVPxDIa/Usf
 pUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+nD50yWFTzf9KklZthJooBQnjFykLFjLsP1Pg5eOfJE=;
 b=XPZjSzkAd6uaeSBlwXjaIl4KYQoZwYFPk46EQTSzDP8z8AmkwTW8DIYpixhotq/gxt
 aMApeCn2gqP3BveU/dlUwY0SSwHXkUM29049Wvd50344Cj3jT23/qAIvjaJmtzRtLFRF
 ypLecBdiHJQWkRXYF2vopvrQj7kLlAfVlkzDGnuZdFKfZ/Ijbd/9gAYw5vRSYb9EEat6
 hCbwPSwr7r7+Xe7/gfYEPEyEIj6wp7R+4qj2Z8kIBGYqYWmY4Cgu1xbd+eb6WmLDLChC
 V2vbRzGYuxlfXGLkgQfipeVHDCsZAmpOCrIe0pEGV7547nMRiJP5BU9iBWyKSRfyvdOw
 vzTw==
X-Gm-Message-State: ACgBeo2o+EX3nN1PVPHYB27NvV6pxK131A3n1zawPDgnbAMdyyS5e4Ew
 +w4G+dxGWlkWmxUrd5XLxJEs+g==
X-Google-Smtp-Source: AA6agR5iIVHvX776205vRgyKM/Xjyq1eT1nGk7d9BtAs17fvMoHDdcvcAzaJcMpRy/5V0kVOGruDxw==
X-Received: by 2002:a17:902:e0c9:b0:16d:bfe8:f7e0 with SMTP id
 e9-20020a170902e0c900b0016dbfe8f7e0mr7079625pla.131.1660357922622; 
 Fri, 12 Aug 2022 19:32:02 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:8243:412:5fdf:6909?
 ([2602:47:d49d:ec01:8243:412:5fdf:6909])
 by smtp.gmail.com with ESMTPSA id
 k26-20020aa7973a000000b0052ad49292f0sm2313619pfg.48.2022.08.12.19.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 19:32:01 -0700 (PDT)
Message-ID: <1f4b1b9b-51a0-8970-83ed-b4618a60cb1a@linaro.org>
Date: Fri, 12 Aug 2022 19:31:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] riscv: Make semihosting configurable for all privilege
 modes
Content-Language: en-US
To: Furquan Shaikh <furquan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <CA+tJHD7FcrBTetGRO0vZn-XGPmZmQraMrw1dw9ia6jzHQniB0w@mail.gmail.com>
 <37244ef8-d2f1-038a-8a51-01d9f62fbe2c@linaro.org>
 <f977101c-bdc0-3b24-5fad-a75b07b5dac7@linaro.org>
 <CA+tJHD4MC9xjVkDAg6QZ3Yq2L-cKDQkofQyGjX67cD_qxbCf1g@mail.gmail.com>
 <804cd7cd-e83c-2b89-f2ba-cc2ca5c7f835@linaro.org>
 <CA+tJHD6gNrtcrZ9bkDet8NuiR8mcSQfeN-Rk3dtm3LmeakKnvQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CA+tJHD6gNrtcrZ9bkDet8NuiR8mcSQfeN-Rk3dtm3LmeakKnvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/22 17:50, Furquan Shaikh wrote:
>> Why do you need such fine-grained control?  What is the use-case?
> 
> I ran into a problem when I was testing a project (with a microkernel
> in M-mode and tasks in U-mode) that uses semihosting for debugging.
> The semihosting worked fine for M-mode but not in U-mode.

Sure.  This would be handled by Peter's proposed userspace-enable=on property.

> As I started
> digging into this, I realized that this is because qemu restricts
> semihosting to only M and S modes. From reading the debug spec, I
> understood that the DCSR presents options for ebreak behavior in each
> mode including VS and VU.

I strongly suspect that VS also already works, since that's just

   env->priv == PRV_S && riscv_cpu_virt_enabled(env)

VU would also be handled by userspace-enable=on.

I do not see any use for 5 separate properties.


r~

