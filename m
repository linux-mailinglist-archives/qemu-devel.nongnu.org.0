Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2604E652D28
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:08:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7tCY-0002aG-Vb; Wed, 21 Dec 2022 02:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tCP-0002ZP-Do
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:07:33 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7tCN-0006xM-Pl
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:07:33 -0500
Received: by mail-wm1-x32a.google.com with SMTP id bg10so10518595wmb.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 23:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UiMr4eqExyDc02lB4lUy+lavJZ9dW35qy4mbNhYlAb0=;
 b=Zc/EH7JXjkbXAkckOu9R2MugRXZ2E09hO3tlxMg2Qx92O3x1uUWmJ7N1KoOT6NrD3H
 I5VEFo3/LvoXow183NKi/BbkudUf3x3O/KZUx0ZFFHHLBCaPeS3b544bI+DsW1FFzwOH
 KeDN2sNS6TJ2u0w9oPTkSrCwo+uFsa57LgTnBFUNiIhWA0Pqu2v8cNY7Hdu+UqDnXNPy
 ta5aNO91oZi5pJW86dFuZJidqNwWUpic3Jc3/69mN3pXLNHOGlpBRTkBtWFWYL+qGPBF
 fUmlMb5Vj+qXhQMadN2CW9LSAth+K6OlO1ueqphZht8RrUXORt8BDkcALIEoPiMRq2BZ
 8Lug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UiMr4eqExyDc02lB4lUy+lavJZ9dW35qy4mbNhYlAb0=;
 b=AfWl8mdUbxVyNefljISuxLeOoZB0mgHXPPV6fuDYH2AyMfp7pZrHtwBYai6Dbl9HJc
 XbPzAxlXSNxAmFVtHsFXbKEpQXSzNQU+9q0w/qJrr6w8zw3qYGP81hjy3dNTJH5jauOa
 PERjXfw6iaz95ElvIuZ8hhRzN0nFDozS9Kc9TrrLuqvv7Ald2yZJbeExC68KW6K6icLs
 xlYIA4xTMpVsKonqwEa5SHznITwXg1DX73yh9v1EV4XRePjGvtPzn97TQVSiGjj0bal/
 t+akGQDuOmxrDOtSOyZ6eJQcejXTmH3ZzOWiEARlxSM9jk6HLA9lukUFgjWq9DmXYZNi
 Cn4w==
X-Gm-Message-State: AFqh2kosdl347uY04NjbJL+/hsnUe0sMwEmC1pyCMvDVWj/zNiU3RGmV
 1Z4wXJ2rT4LD6wIwahRY0rU7a/I+pMwAN+lkFc4=
X-Google-Smtp-Source: AMrXdXucE/HyA7M1cCTp5gDmlNu7xYfDURyjrz8zg3rpA8qIJpUnJzvLBgFa9L0W+dsU9MgEvv1BTA==
X-Received: by 2002:a05:600c:1e24:b0:3d0:8643:caf1 with SMTP id
 ay36-20020a05600c1e2400b003d08643caf1mr742239wmb.16.1671606449817; 
 Tue, 20 Dec 2022 23:07:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m185-20020a1c26c2000000b003c6f1732f65sm1157686wmm.38.2022.12.20.23.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 23:07:29 -0800 (PST)
Message-ID: <a3c3f639-dbb1-88a7-43fe-547a234c5890@linaro.org>
Date: Wed, 21 Dec 2022 08:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH-for-8.0 v2 00/11] hw/mips/malta: Generate nanoMIPS
 bootloader with bootloader generator API
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
References: <20221211204533.85359-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221211204533.85359-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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

On 11/12/22 21:45, Philippe Mathieu-Daudé wrote:

>    hw/mips/bootloader: Handle buffers as opaque arrays
>    hw/mips/bootloader: Implement nanoMIPS NOP opcode generator
>    hw/mips/bootloader: Implement nanoMIPS SW opcode generator
>    hw/mips/bootloader: Implement nanoMIPS LI (LUI+ORI) opcode generator
>    hw/mips/bootloader: Implement nanoMIPS JALRc opcode generator
>    hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (1/5)
>    hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (2/5)
>    hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (3/5)
>    hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (4/5)
>    hw/mips/malta: Use bootloader generator API for nanoMIPS CPUs (5/5)
>    hw/mips/malta: Merge common BL code as bl_setup_gt64120_jump_kernel()

Series queued to mips-next.


