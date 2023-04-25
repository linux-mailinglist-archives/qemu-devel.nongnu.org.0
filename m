Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83BE6EE8B5
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:56:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prOlO-00050A-HF; Tue, 25 Apr 2023 15:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOlG-0004zp-VI
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:55:38 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prOlF-0002lf-GT
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 15:55:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-2fbb99cb297so5620432f8f.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 12:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682452536; x=1685044536;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hHV8ZIgOB20an80J8t+9yjX36gKCYBjeJ9qjbjHqqf0=;
 b=FqjLUiaGUjhIThqNDJ29AqLrYPcE8uHvawjfVs5N3LklsETAdUjajvoxp3I0l9jhnS
 ma9hkW4ac7UafT3HIDWCzkpTL232Rg/oyZqZmfzntkjwKgJMNUZtL5+e4IdWa4iQljbC
 Eb1cJknFoLDPCw60B8VFS21bBoEuPrvsqSlSmGc7ATwsMPy/j95k59FnMhSz1QpRHylc
 KBdZj4weFYVTmDObqzyyr9X6BUJ6Fof/IIMiIzE8Mt0X+wkp1JWYA9Ujk1pbXLK5ulig
 ILrQvypggp2WZFSY9y+l5kncI5RG41kHOrWLh4ReTkhjrAv3fasrpqLT99Nfd0ifwAoP
 CSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682452536; x=1685044536;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hHV8ZIgOB20an80J8t+9yjX36gKCYBjeJ9qjbjHqqf0=;
 b=PaQ7S7Ecvo7O/7yI6uurii0gA1NcEonhoFoaOcOJuoBG6HhPx0nuDI6wJv4rDoRHsJ
 0p+16GwQv/655ESONAl/ho2EfjOiE9f7qrecXui/Dqd5PBxKFRF1XuSvPPDsZqPa2xpU
 RHG02G/JjNogzoaUnarYotPhwkqEV62/t9w57DOnrhcP2ZiFPoLfbyL1BOIhf/bcUrUl
 +OlVD5whkNBVRuBPEFBQYzTtNxPyzp0+Q9NCCdMhFlgPvdWVAyqG4PVoHN9btnwu8baS
 R0Sjr8/l07ImWOSs7QUeAo5NcOnm6mub7m+yNuggRUo9+x9lTHnt6UgJ4ms7g5DPKhzQ
 Pm8w==
X-Gm-Message-State: AAQBX9d7mKTXbza5fqH6eqWs8Nz2cS3yivZmOrGQTxY0pDrT0lYxd7BW
 QGFx94ihclWaTjFidrF8UpSXvw==
X-Google-Smtp-Source: AKy350a5EGUxQFusyB1AslLIP5LnxQFBeovc6Q6iOU3goYpmBbdL0zBM3ACG1+f6UqfoPIIzoAwVsw==
X-Received: by 2002:adf:f085:0:b0:2ef:b6e6:5985 with SMTP id
 n5-20020adff085000000b002efb6e65985mr12638794wro.58.1682452535829; 
 Tue, 25 Apr 2023 12:55:35 -0700 (PDT)
Received: from [192.168.180.175] (153.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.153]) by smtp.gmail.com with ESMTPSA id
 k24-20020a7bc318000000b003f16fc33fbesm15865368wmj.17.2023.04.25.12.55.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 12:55:35 -0700 (PDT)
Message-ID: <6af90075-9dda-ecf5-7bc6-41a90cc1f95c@linaro.org>
Date: Tue, 25 Apr 2023 20:55:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 08/57] tcg/i386: Drop r0+r1 local variables from
 tcg_out_tlb_load
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-9-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/4/23 07:40, Richard Henderson wrote:
> Use TCG_REG_L[01] constants directly.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/i386/tcg-target.c.inc | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


