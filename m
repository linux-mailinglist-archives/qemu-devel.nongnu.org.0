Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A965524EC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 22:01:36 +0200 (CEST)
Received: from localhost ([::1]:41408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NaZ-0006qL-3q
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 16:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NYU-00068A-Ie
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:59:26 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3NYT-0004KS-2h
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:59:26 -0400
Received: by mail-pl1-x632.google.com with SMTP id f8so10633926plo.9
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 12:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=G8zDa9cfC+H/YofbjIU69uw70sVMNxHJL1CpP/ax0Fo=;
 b=Mrqb6ex0kfBUbva47UCIRn49XNFaI7ywGofrsuDfxF1F8jZJXdeel2OY5F3aJ8vfwP
 VCqMXVRdYyUaHT5ZUUjzsCdSypfDgxG6jLwAnbIkYjGg/4+hxtB/ySK/gG1f2qA2wZTQ
 TfYI2mfIxFYru0R1oOgViitmaBYzvqWXn26a5ae7o7I+IcbfOPCM7/iY9ysjmVIewKWZ
 hSD6Y6J2qioMPFwi+HVvHt9hdbqPjHVqKjtarLvIGeJ3QXJesIwZPzEGmNgN4aHhJtfJ
 lXbKXoFT9AFT3y77HCjWIGfE5lLlEypsY+ZrT3vMXXBRWX66kg9DO2TJKc38CjO5wsA1
 Rz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G8zDa9cfC+H/YofbjIU69uw70sVMNxHJL1CpP/ax0Fo=;
 b=h1Osi74siemPPDAk478eKwrvqO5aIze88pzMHYNedDcF+lzjjZaClJSM7jGwT1m6Mc
 D7aQIj7YwaGwqyqcf4gMwbsWOVtmUhDcMOpNETv6khm+HnPWNdSU3OmH2WCpwFrCJ3Tg
 3k0S/VDOQayJaUK6TgSRBWuCBe2gCKL53CJ0VI4x9ZH8GvdtFoL4lMo01crvdwZ8O561
 5fdrzsNqoWZqqARtYsy7bSvY0R456BuPdDQSKRSOq0/qvWqdXZutWIOYXbbjVUOrY+oJ
 VDGOIesesJ0r64KZ/JjrClMVmWV/kCmOKgPhOhrkUxKM3kcURQUwTXSLQx6CXNbffhOb
 sw2g==
X-Gm-Message-State: AJIora9LaW5n0uZF993p23eX4+Y8hGR91KbvH2nWq84loXzn4IoYlH+m
 NPbUAN0H9zlrVhSo5IqycyKmug==
X-Google-Smtp-Source: AGRyM1tufghrxR74pm2rbtOyhRrEXG0MWm83Kkj+zEjGlAIBY0BAp7oCORJJcMA2Mul/rZdkEjJtlg==
X-Received: by 2002:a17:902:860c:b0:16a:20a0:f6e4 with SMTP id
 f12-20020a170902860c00b0016a20a0f6e4mr8035978plo.164.1655755163268; 
 Mon, 20 Jun 2022 12:59:23 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a170902a3c800b0015e8d4eb2afsm8806732plb.249.2022.06.20.12.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:59:22 -0700 (PDT)
Message-ID: <5a93f9db-f057-e454-17fd-0d44de5355f8@linaro.org>
Date: Mon, 20 Jun 2022 12:59:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/avr: Drop avr_cpu_memory_rw_debug()
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, Michael Rolnik <mrolnik@gmail.com>,
 qemu-devel@nongnu.org
References: <20220322095004.70682-1-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220322095004.70682-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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

On 3/22/22 02:50, Bin Meng wrote:
> CPUClass::memory_rw_debug() holds a callback for GDB memory access.
> If not provided, cpu_memory_rw_debug() is used by the GDB stub.
> Drop avr_cpu_memory_rw_debug() which does nothing special.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Queued to tcg-next, for lack of anything better.


r~

