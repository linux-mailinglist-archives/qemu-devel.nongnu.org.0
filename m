Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E425B6BCC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 12:43:00 +0200 (CEST)
Received: from localhost ([::1]:44152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY3Nb-0002F8-6n
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 06:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3JK-00068e-SL
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:38:34 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oY3JI-0007bw-7U
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 06:38:34 -0400
Received: by mail-wr1-x432.google.com with SMTP id t7so20031309wrm.10
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=vE7BAUwDtLwnYDafllVOdB2CGchdKfaFFvLSPvYF6KI=;
 b=fQMnmHIKMh7Y8HgkbZx71AwGw1bv7pIBUJ9QeMr4oWY8ROdJCRcGS35PZt2I7hfBZJ
 YsRHoroBSTEnkbeYQubGr3uKhhnUdwlJEgNTV6u1xatDR39Y8pJCLI2qVjYJDKPGu6ZT
 XD+OIeJJKGQxwY6GqI6YFRqVe23/nQNSqx1ct4NeTf4Wn6eJTPe5WJV2h/5Gg7wVs4gk
 s90ssmSCKT4Q/9a3tHqP9mlGPCebO1mgfU1LAsEBZsTgLsB/W85t0tbaKLCy+8JyttkK
 xwlGzDSA0Vt05jdjlyyRaUxA3S/G16lQG+vsidMQrnfPxXMtLn8ukxTqBSrF9cozsaVW
 ND3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=vE7BAUwDtLwnYDafllVOdB2CGchdKfaFFvLSPvYF6KI=;
 b=7xTaNN7OCH12MEIiF8bqY3zgpV5bBoOo70hRkRj7AZYLOooSkHLCkuzHONdTPL4gQh
 Bj7ZLrrXlVYVxm87qqyIMxEdqVVMgVb+y93KCZGabGZtjUzgDjXAsiZIT3t46tTQEFha
 rIgDxpdiWKxzkOuZPmla8wCfUoN3RIkvlcMVejIdVMZ4OmXruRkAr0mM/pZPlEc8q6JQ
 C6dmVYp+WIRIGs2WfiWXk+cHos8paeFrs5bEvW17BmjiNgOHMlrovRVmmzRRijP3vII/
 cBU0xnNy++RbotNkMcb31JJWxUyzu4BLc5hOSvIYg0B3z6IVRN0yQZQPLmezIqR1Wyi+
 PvbA==
X-Gm-Message-State: ACgBeo1qhUo3rDLeS5M20f/G+pBFSvu7XPQz886Xvd95rzRJtHU1cMP4
 bv9emMhEATljb855qPLFUv4sLw==
X-Google-Smtp-Source: AA6agR7VKyQ4KSHk5BRadd7YQKzFcbaSdWR95+TUAupIb+zmcVHQp3YL6zn0pJDmfHP1TjbI4T0TXQ==
X-Received: by 2002:a5d:6e88:0:b0:225:3d19:addf with SMTP id
 k8-20020a5d6e88000000b002253d19addfmr17569925wrz.600.1663065510358; 
 Tue, 13 Sep 2022 03:38:30 -0700 (PDT)
Received: from [10.119.17.153] ([89.101.193.67])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a5d4536000000b0022a293ab1e9sm10406559wra.11.2022.09.13.03.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 03:38:29 -0700 (PDT)
Message-ID: <62385d3c-fc7f-5819-bcc3-ad78fba9aed2@linaro.org>
Date: Tue, 13 Sep 2022 11:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 30/37] target/i386: reimplement 0x0f 0x10-0x17, add AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-31-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-31-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
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

On 9/12/22 00:04, Paolo Bonzini wrote:
> +    tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_64);

I just noticed this here, but please examine any other direct loads: you've forgotten the 
endian specification: MO_64 | MO_LE, or MO_LEUQ for short.


r~

