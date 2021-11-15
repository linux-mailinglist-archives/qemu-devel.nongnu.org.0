Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E979D450001
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 09:33:09 +0100 (CET)
Received: from localhost ([::1]:52370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmXQL-00042G-28
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 03:33:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmXNu-0001HH-TA
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:30:39 -0500
Received: from [2a00:1450:4864:20::336] (port=45620
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mmXNs-0002pn-WC
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:30:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so11724215wme.4
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 00:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eP8t+WPPKNOql2d9p0CB4oUy01lLXrRP65bNiZrPoM8=;
 b=TBMhCfyOLsGyAcytX0wPwEgyohUWMUCAy/zzS6h4wD9ynVlqJ14qIQGh5S6c8e1Sxx
 LAeEu1XZpEZDoWLUrepCe3Zitl/S/qk/3KfP4bQtBy1OOBaFGDZJnLKbSQyAYiTRzwtw
 Hfr5dXgqpHAK8qs2zbAnOXKCsPgrXuXwYuz+yHNDbf5xtd8IbIhMHAyna0emvGRmfGpU
 i+nysItn6FXhHCSYO7JOjICAcxufqhDmqkm61ae/hBg1aS1BJorPTJagUZDdN9jGxE6T
 8z9TVnxQeFnHatAYrhwxUPTsgUbX/NJVijr0loJvu9tIoSLoWO0VB1V1wazUSrHNDDXb
 XVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eP8t+WPPKNOql2d9p0CB4oUy01lLXrRP65bNiZrPoM8=;
 b=JwsCOYq+PHrcGfuwdCcoLw0k5arYe1nj5qJG9Q+Hlo2ZuAVFNCEhhlCO9D8FJiNijK
 PlBlQZAEq3E0cr3SMjoYZ7Y3VqNTbKLyzCLIqJusF3+0EvQNndTep6izUfV736HRGbdr
 phVMDG+WwXO+fXsHCdQU6qP4r7A+Ro9PdI7CxC/2jbkPYAtQu9QGSGXyx4qA6775aduN
 RM/EfyRJhl4o1eFnsWqC25uvxumiLZxrsqEbDHV/M3WIS/eGdWWDmpI0hTlKA8nCk5+A
 Ybn5efY55CgjhMJXX6/luIxJ/YjmjmfIDloOBVoLxwJVQBTNS8dVUCyHrMvdCmGf8h5X
 jASg==
X-Gm-Message-State: AOAM530+/ifnUzt436dNKoOflk5yb8ARCLaqa5If3Q9dz4ToX85SuST+
 Ji0ZBtLy4cuS65LaEKAW/BMSoA==
X-Google-Smtp-Source: ABdhPJxNRt+JqQJ2enxD3oBW55QBABx9HFL5x+QkvAI+oEoO3eJHwyztbX8F0iky2fQ9zvW3YbiBhQ==
X-Received: by 2002:a05:600c:500a:: with SMTP id
 n10mr337786wmr.136.1636965035494; 
 Mon, 15 Nov 2021 00:30:35 -0800 (PST)
Received: from [192.168.8.105] (137.red-176-80-46.dynamicip.rima-tde.net.
 [176.80.46.137])
 by smtp.gmail.com with ESMTPSA id r7sm13266769wrq.29.2021.11.15.00.30.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 00:30:35 -0800 (PST)
Subject: Re: [PATCH v5 10/18] target/riscv: support for 128-bit bitwise
 instructions
To: =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211112145902.205131-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20211112145902.205131-11-frederic.petrot@univ-grenoble-alpes.fr>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <52a0a7b1-fa81-4428-1c0f-47a532716ef0@linaro.org>
Date: Mon, 15 Nov 2021 09:30:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211112145902.205131-11-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.278,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: philmd@redhat.com, bin.meng@windriver.com, alistair.francis@wdc.com,
 palmer@dabbelt.com, fabien.portas@grenoble-inp.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 3:58 PM, Frédéric Pétrot wrote:
> The 128-bit bitwise instructions do not need any function prototype change
> as the functions can be applied independently on the lower and upper part of
> the registers.
> 
> Signed-off-by: Frédéric Pétrot<frederic.petrot@univ-grenoble-alpes.fr>
> Co-authored-by: Fabien Portas<fabien.portas@grenoble-inp.org>
> ---
>   target/riscv/translate.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

