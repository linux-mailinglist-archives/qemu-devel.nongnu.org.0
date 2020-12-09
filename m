Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262F92D3776
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 01:17:54 +0100 (CET)
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmnB2-00015p-Tt
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 19:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmn9t-0000eY-Uq
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:16:42 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:45206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmn9b-00064Z-K5
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:16:41 -0500
Received: by mail-ot1-x32c.google.com with SMTP id h18so504787otq.12
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 16:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eFo/Z5SW8V+pRCliZBTb9Pv4MCtSkuwbtREfCYNkySc=;
 b=BKcaMVoyBO2GRk4nN1aH7WXm9tLAtzuiCvCCbSPM8ylIKrhW+3SUFf90YZjTmfWFkU
 W+agfdTsO4oqK/bQ4qwY2DcNf93kNWHMPFfRW0rT6XRgJ0K3cL7a8vQpjU+vmvh3q2c/
 0WLR31ZDssKyoMiWPfpIt0fMhAXnMaRql2r8kB1L1sTfmOHbnkyq3VoTWxF5T0Bc46Y4
 z4K0y9g9X3+qu7TYJRu+VhImrSWDdUpan+2cqtgUc7rnjYLYnalLFciJ+gtXu1ou7k+p
 7FoUGJmoMrjgogeSUKcF9XbUArz4MkFP39bHlUL8wtgUVWGgWP96NO9eaEl+V6u7AS1s
 ppQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eFo/Z5SW8V+pRCliZBTb9Pv4MCtSkuwbtREfCYNkySc=;
 b=OcptRaMRB7/Pnu0SF7Qx69SReF5BjBn3fNLL+1UxyRUyuVzaeC6hO/B3nnhCPNMcjd
 rboySw2CxHzy8Jg2oVUjTqUNSl7Z6/rvNoBs7EoZywEhlsOMFPc9xXItQE9Cp24Epftb
 DX3DvkegFMbRbTsyNeWlxo1RNEADmhSs2Ot4a2m3Tb/iIfhtGdRX/btoczsrthTucprV
 U7EedjL8FBBo/3Emk7liKrh+9B9IhAVFZIZYbfrgpOcudbW6tBIzs3lorFAbNB4YTDgi
 nkfiClKchlWfK/in4XtJfT3K0dh6y8GDXz0Q/V9NXHpKmrNkTWSkrXYYkVgCNdym1QDs
 zySA==
X-Gm-Message-State: AOAM531IJkvLDxmspLtH1r8OXCuaNLsxk2fo6yTgWzcx76UG+T0FtLqh
 imbP+awYQ/qrcFdC0/zMl+RWug==
X-Google-Smtp-Source: ABdhPJwKFOxOzqfY/JCWQJEweuiNMgbGXtKlfomzwxwvoi+kKknhD/IBg5jJrfjtWHT5Q5SyoH6Bfg==
X-Received: by 2002:a9d:32f:: with SMTP id 44mr515380otv.239.1607472982117;
 Tue, 08 Dec 2020 16:16:22 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j46sm138490oof.36.2020.12.08.16.16.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 16:16:21 -0800 (PST)
Subject: Re: [PATCH 02/13] target/mips: Extract LSA/DLSA translation generators
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208203704.243704-1-f4bug@amsat.org>
 <20201208203704.243704-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <50609286-4f37-68a2-0081-a2ac19b1d6be@linaro.org>
Date: Tue, 8 Dec 2020 18:16:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201208203704.243704-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 2:36 PM, Philippe Mathieu-Daudé wrote:
> +++ b/target/mips/translate_addr_const.c
> @@ -0,0 +1,54 @@
> +/*
> + * Address Computation and Large Constant Instructions
> + */

Missing license.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


