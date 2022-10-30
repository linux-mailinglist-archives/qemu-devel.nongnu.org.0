Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 588E7612E45
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 01:31:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opIgV-0008Hj-SU; Sun, 30 Oct 2022 20:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opIgU-0008Hc-2X
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:29:46 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opIgS-0006k6-CY
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 20:29:45 -0400
Received: by mail-pl1-x630.google.com with SMTP id p3so9403749pld.10
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 17:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gN/Hl17dRXABRcXDRYj5AYgpcnHMJzl1B/0SAs2fwhQ=;
 b=Gm4kY4D41yOOudZUwkrRaWy/yNJSvVGBadfyn7dJcQ3AwSbfsmnBbbYNdbN1kqwg05
 lV8SQ8QFyYpMuqLWlFiEOYSM2dbnuomD1xAQhNOCnAmgABaa6sNhJ93iwp+VC5ETs/6U
 ZbguwJDW0M39h8GggYslJYkWHxehHtdqg2j3QcUQSZ3JU5JQE0Jcp0XxtV7FJM4Qy17H
 3EES6axV1fXLnQgS9EpaYV2pd5R1bDUYWYkt1OGLJQmyHA5SS0uCQglhPu6rJMFBTdQ7
 3heeiOx3Ml/7Vhb0LHwfKMwowncn06DnWTErYxvIPqjcoKAB16I0iuPAamtNzUTkkOo/
 2KmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gN/Hl17dRXABRcXDRYj5AYgpcnHMJzl1B/0SAs2fwhQ=;
 b=V03A45vfcRPkf7gt7+8aqS/KL8R8u1iAS8l0UC3ZIYTQQKoTgsAN9cZ4MAscxOjo7q
 EmGl4fBenD2ctDpivc/vc3lt31y7FsvMJysqM85JZ640eMw/oCdZDIPO1zshyOnmEuly
 /DSgqKbVLKZcDe4Cfgp0PaDyNQL9mmeXD8fwqxB43AfQvqztgYwMULm9Kh/DkUSi+IR9
 Nqb0KM53kO46rzW0LOTF5SFndAtdiXDCR22vUstvBjkvr2HpfuNiYyijzncG04dexO99
 v5ckQoI3Ff4eHHeJJ5+dNZ1wgP0+Z434GqT8KOdhYzTljCMpiiVqK3BWvXhgnDmDNJOg
 43YQ==
X-Gm-Message-State: ACrzQf1LN6Ipmoit6+OFv1Ar191C2jkII1iSZcCJFRL1ZpzeuCiV72uT
 K3L4S4x7JcfBrjJwhcqKzjKi4A==
X-Google-Smtp-Source: AMsMyM6AbskB/TU4dp/dTYcRfkDAT1miqPmeH2XPEQYYOOPjceycOF4UmhBlhd0WP8TtgF0xaQrUkw==
X-Received: by 2002:a17:903:2596:b0:186:a395:c4bd with SMTP id
 jb22-20020a170903259600b00186a395c4bdmr11853736plb.60.1667176182262; 
 Sun, 30 Oct 2022 17:29:42 -0700 (PDT)
Received: from [192.168.207.227] ([172.58.27.183])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a17090311d100b00186985198a4sm3178851plh.169.2022.10.30.17.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Oct 2022 17:29:41 -0700 (PDT)
Message-ID: <0ed31b6d-e665-db66-ec87-d9a9d6394da5@linaro.org>
Date: Mon, 31 Oct 2022 10:22:11 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/3] tcg/sparc: Remove support for sparc32plus
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221017062445.563431-1-richard.henderson@linaro.org>
 <20221017062445.563431-2-richard.henderson@linaro.org>
 <CAFEAcA-7q2fat9grNuTVcvzozTiCUBaPSSwqHLe02Dos7zFing@mail.gmail.com>
 <9ff5d8fe-f138-b1fc-3b7d-88fc46235c02@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <9ff5d8fe-f138-b1fc-3b7d-88fc46235c02@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/31/22 04:21, Philippe Mathieu-Daudé wrote:
> On 30/10/22 16:45, Peter Maydell wrote:
>>> -#define TCG_TARGET_REG_BITS 64
>>
>> Why do we delete this?
> 
> We get the default definition from include/tcg/tcg.h:
> 
>    58 /* Default target word size to pointer size.  */
>    59 #ifndef TCG_TARGET_REG_BITS
>    60 # if UINTPTR_MAX == UINT32_MAX
>    61 #  define TCG_TARGET_REG_BITS 32
>    62 # elif UINTPTR_MAX == UINT64_MAX
>    63 #  define TCG_TARGET_REG_BITS 64

Exactly.


r~


