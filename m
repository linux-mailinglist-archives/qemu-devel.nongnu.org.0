Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E38D42FD16
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 22:42:50 +0200 (CEST)
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbU2T-0005IV-HW
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 16:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbTxq-0001VF-PY
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 16:38:03 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:42852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbTxp-0005Gd-8P
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 16:38:02 -0400
Received: by mail-pl1-x632.google.com with SMTP id l6so7090772plh.9
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 13:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zWbKDnG3OuWdfxg14jGVAaQZVHbQJ65XkHq+72/38X4=;
 b=yZkQYHaD638JrYk9XKMqAe+cwwK00Venlm22KMa9ZMPOY2EMInwSyv9nTo7gBLTKNQ
 P0a7jKKdAa0gMh7QK3Cume6AzDUB5YWMG6uevr9Qvnscq7lM+YKtr2OXSKG9dsHM9Dh1
 dkNyAXzQbBottMC9H+xvTsPxdlnheQVQTXEeGkyHOW2ij3VCulUIeHALS/WoRDltEFp4
 JnVYKZtWtCNpMpYoTykhbeHkBXfPXaS1YuUFH1pFg3jbYsc+Z+IN9svQ1yhxNJ4VVAAI
 e8O0eq9OKchyBlNX9lG4laskT+he0huOogepepIxNZJ7+aW0qs/uKtw+0dRsm5u1Fx8i
 rZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zWbKDnG3OuWdfxg14jGVAaQZVHbQJ65XkHq+72/38X4=;
 b=ejOpD7PWxaCWi3EwiTOFoARBphGdBIRp3OgFMJDoCif7PYB61tpv6ApE1cCBN6n5mK
 LKvAWDloC/+fdM/zg8g+8aa3ybXp6IZWSSUMKsK7xFfDawa9mMUCh55Rt57jFC4DhAll
 D16FARxz6pDk3FxFCMiiuu9+y/IfjsrMbWuhj03LtMFoGhTVKsB4rVe35KMQpWu5ifRK
 NHAYWOppy7BpbanbZ7T0YviIHta8ysGHu0WaqXFQz40SmJYRTFqXuzvdCasrWTRyJiWR
 u/FrdIiGjR4crw+to1BES84ZCiDni7lvaCmlqOUP5yjNn0SJ+dc+ClLuyTDciWCv63fa
 XQOg==
X-Gm-Message-State: AOAM532zdaHNKAabnFoaAXNMphDMjH1i0PHIz1UDmWkNiD4vqy4jEIIK
 BW9Iq2JQPyS5mNgNGRVGccem+A==
X-Google-Smtp-Source: ABdhPJxG+6nN24ODFJC1x4fsmrShgEg0uDIn6JZGN+TNjXb9jeEzAVCg6dE0hMi2aUWMHBtMtOH4eQ==
X-Received: by 2002:a17:902:7e4b:b0:13d:c03f:5946 with SMTP id
 a11-20020a1709027e4b00b0013dc03f5946mr12804501pln.4.1634330277926; 
 Fri, 15 Oct 2021 13:37:57 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a20sm5446886pfn.136.2021.10.15.13.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 13:37:57 -0700 (PDT)
Subject: Re: [PATCH v2 1/6] target/riscv: zfh: half-precision load and store
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20211015070307.3860984-1-frank.chang@sifive.com>
 <20211015070307.3860984-2-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1afd1b54-6580-19b0-96c5-2179b793993c@linaro.org>
Date: Fri, 15 Oct 2021 13:37:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015070307.3860984-2-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Cc: Chih-Min Chao <chihmin.chao@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/21 12:03 AM, frank.chang@sifive.com wrote:
> +#define REQUIRE_ZFH(ctx) do { \
> +    if (!ctx->ext_zfh)        \
> +        return false;         \
> +} while (0)

Missing braces for if.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

