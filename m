Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DC7438705
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 07:03:24 +0200 (CEST)
Received: from localhost ([::1]:48716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meVfH-0001l4-KB
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 01:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meVdL-00013N-1U
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 01:01:23 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meVdI-0001I5-Qh
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 01:01:22 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso8809500pjm.4
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 22:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SHTd7ViaEjf3Uq/ZGewbvGAiGP7B+M0xeg//XIVB2l8=;
 b=fT1Z4Ucm07aBX85xvWBtQomvnj/Y9J1ArSjvU/PixdOQOJ80hneonNPbGJxyXcWAcn
 N3twHtUvgdeynBBXqJBllPSo8VXiLBdhYth72Gz2yUhWhJn0HfvYDIilKh3Em9rnOvEB
 AWhRyLwhDqyqGQ9ShCVaL5W+764oFwih6Q8He+TMcMCP2CvERv4dA2f9gtfm1GEWdbGH
 Etzo293w9vtreX8FEY7goudTN55z7i2EJqz+PdyUpz0D69GVFyCm+5tw3L+BVou6kAo3
 87P2fQ970pWcSXXhBw/AC445Mf/XpsBg5W5pZMnsqn5kYQzsgXrbwEmXrMe09A0R34t1
 fkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SHTd7ViaEjf3Uq/ZGewbvGAiGP7B+M0xeg//XIVB2l8=;
 b=xT2BvlaQOw7Iww9Xq8nhoEnqBoF7Ht3PG5rfI8ecM8sxyddDRO70ReVPeY4YbfVMs8
 3zq0qG6x+TieXat+8nzMOvpt9iJP7yHSRkguGSyN2E/UR29nZMyHP+m9rEtZq0wplDGJ
 ZoHJO6+Yx2XwwVgL6+hHOHJOm39q6mT9yRY7zQ42rQ2/fBvYRDh80zHfJi2g5IeFNrza
 ZWwbenUTrehAAJFwOcZVkCyg9jm19xCw1gqXTQhLJ6posDbxFgxauXu08TkUDY/cyejo
 tg8D5B00PbJcpwK8JYDzqKuPE7wfvzC0Hm8JtMNc6v0t8MgIaAF6kB8sYFguaU0Ih8ti
 yfyA==
X-Gm-Message-State: AOAM531u9dHfLfB3YoVQr6b740uVC0gWG+GyhKI9uEVeaxTO84LQ6vpm
 DjnzNPZ+m4MmexToAZEfGtuoyA==
X-Google-Smtp-Source: ABdhPJwMEt+R8nXypeAT34FTEyfWX6fimkXXrSQEM6yYLToaV9L4tI9J1mhbHUehfzlZ5kGEy8q74A==
X-Received: by 2002:a17:902:e852:b0:140:29ca:7d7c with SMTP id
 t18-20020a170902e85200b0014029ca7d7cmr8446682plg.10.1635051679257; 
 Sat, 23 Oct 2021 22:01:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id x2sm7311991pjd.50.2021.10.23.22.01.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Oct 2021 22:01:18 -0700 (PDT)
Subject: Re: [PATCH 16/33] target/mips: Convert MSA 2RF instruction format to
 decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91819d4d-5de6-03d9-7e7e-4b75c64211b2@linaro.org>
Date: Sat, 23 Oct 2021 22:01:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.781,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> +    TCGv_i32 twd = tcg_const_i32(a->wd);
> +    TCGv_i32 tws = tcg_const_i32(a->ws);

tcg_constant_i32.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

