Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6CF3C26BD
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:21:55 +0200 (CEST)
Received: from localhost ([::1]:42380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sKA-0000LI-72
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sJF-0007v9-Cy
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:20:57 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:42811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1sJD-0002x2-Sb
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:20:57 -0400
Received: by mail-pg1-x532.google.com with SMTP id d12so10260375pgd.9
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 08:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hj8GZyErqoRpwJ6pru/Fv1/NvpQNlyU7FuHh/CYFSq8=;
 b=L1ji9igHS2JmIkdstTyZ5iyjeJHaF4r/P92BlCsovxk7vl3WxqhkRCoiNeLSSXTFWA
 sjUBL7Zsa7oe7JcfsSi2GqtEt8/Msuoe16qGx2wP168Qh038qACvEIORsXw6GUN0gay7
 9pgdNbMGS3Ab0N6D4rag0A2f62oSrcX6URocWMI6s00lS4SFt4ssj0unEuNVUKiHP9X3
 9ala3gxyQ3k5pJ7LC37lcQRZx9AT8y2DcOKsIyWpz7jQU8uCXSe2J0OT5opw3QnX/eDE
 MWd9GfFZ4gbdT/VNkzcHq5uFIM5JaMlSXkil+6Bq7930/G1LwxJJXFLzr3WiM/D3BQk6
 siHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hj8GZyErqoRpwJ6pru/Fv1/NvpQNlyU7FuHh/CYFSq8=;
 b=dHwrXT+YbafVOB0cB5Gfvo3OxHqV8SBjMaUjYM5R3brogVCmO8w6yBcVfRvDxl9lpA
 9PRzJ6uAw+Q2G0ZIt82TeCusY+NsmXADmCmMTaW/lsHb81/FAEXHzTBkBX8AFd9ni5rX
 hluZYJDYeyOolcD+zcPhXnhnMsH9HrcJJol2iP1SlT0fJwa4ffxT1TSVO710Nizqt7A9
 SZmbmS602Uirtx9zk3wfuRv0yQeiAShch8fE1rwd+1n10uojvAaUESCOJLvfDNYGCfXW
 XI2JKi3NTqNpccLFMzZ6FvwYc0LfumoG8VELnTv53pR9WvW/df23ERUHqhw/6tJv33Js
 571Q==
X-Gm-Message-State: AOAM533BvWxd60TmxVwiFIS4O1UKdX8QUhO1+JpA1QUg/eAU1pzRd27o
 IVda6dqodgVlmdwWE8zpJm0CRQ==
X-Google-Smtp-Source: ABdhPJxYYkRduTp74uXAsuyHaltr7nPvN47w0khE1xi2D9kopWVIHhqhav7sLrhi1PKX3CHf1d1hag==
X-Received: by 2002:a63:445b:: with SMTP id t27mr39087231pgk.413.1625844054483; 
 Fri, 09 Jul 2021 08:20:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id y195sm6706728pfg.68.2021.07.09.08.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 08:20:54 -0700 (PDT)
Subject: Re: [PATCH v1 1/5] target/riscv: Expose interrupt pending bits as
 GPIO lines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3265e78d-3627-15d1-55e6-f081fa23001f@linaro.org>
Date: Fri, 9 Jul 2021 08:20:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <37f8680b1ae39de82f9594d8e7a0d9596de9be8b.1625801410.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 8:30 PM, Alistair Francis wrote:
> Expose the 12 interrupt pending bits in MIP as GPIO lines.
> 
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
>   target/riscv/cpu.c | 30 ++++++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

