Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F66D23E053
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 20:29:31 +0200 (CEST)
Received: from localhost ([::1]:56490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3kdt-0005Y1-SQ
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 14:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3kdA-00055V-3G
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 14:28:44 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:55957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k3kd8-0000m6-HW
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 14:28:43 -0400
Received: by mail-pj1-x102f.google.com with SMTP id 2so7288045pjx.5
 for <qemu-devel@nongnu.org>; Thu, 06 Aug 2020 11:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bsRgwOPzrc3FZMWPqVKagC6uUtXuXsg7zOA+N6JF174=;
 b=rROK1yJyqmMAzGwXFulT1XDpXNxQWHM4flDog7Go7qRVqlNceQyupOiit905J8ifgC
 LTxX0rbjk4N+mfwSuEvF1G6tJpBAtUk9ELGPZY8SLRlpbFhT3yJkpX+fDFGI4T0P+99P
 sdWaBbDoCheDWg4DJOn/I20ohbNYuTNW9RAlP3O+ttp37m+O+Gtz7EossYvZbTqbhLuY
 6Ni83DOdxkTR3PRTQWlg75XoEyf3pkOVBmzil1x8wghPK3sh9Omwu4n+N8Snvrkethuu
 BPl65FQefoovuPe7BRR2cKPpzVa3izPFWAN8EyyDdOeDA5HyOYP9XT8qfDhyKo7sMVP1
 bexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bsRgwOPzrc3FZMWPqVKagC6uUtXuXsg7zOA+N6JF174=;
 b=qULgeZkzC02qScsE1ns2mlQ+AoriPUi/6BKlz8oqR2eT1FOIMFcXj7FW+2jvjEGom8
 U4CL1hguNTgB/cdSf/eCphDVu0ETueCJn1qsQFq/gm6gFynb3FoIVVkzVdzfbCeYzCRS
 eQ1mV4AFT3DVuggPeG25+v/f7Hjxwgxzgd+gObxDJBgptNZ362C3zXwYqxR04h211JLP
 pv6B670AsW3TqUEtxQmTZG2udIgnhXZebQu7LdWWn0TnqLhb+wxTiCYrCQyhHYah1q+5
 UTKbB+DX7UFsOqTAnqeG2LaEmVjkf0HS8XJBQ9jD7g/e6xLXXzpCHAOlxkJySo/yp4xN
 O99g==
X-Gm-Message-State: AOAM533k6FzSeFe8SUT735jPMbrYnhUI7HwsYnOk1T/eyu98NAGucrsu
 T1mFkDHuy5+UTYt9MI2IFdkRAw==
X-Google-Smtp-Source: ABdhPJw/W6FSLj8laPi2G1JL/3PiG5IinycNQ31aRyhfaAXMr9ISjEFdAOIkAwo5CmCwCX1ELk6Yqw==
X-Received: by 2002:a17:902:9683:: with SMTP id
 n3mr8918726plp.65.1596738520939; 
 Thu, 06 Aug 2020 11:28:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a16sm9391802pfr.45.2020.08.06.11.28.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 11:28:40 -0700 (PDT)
Subject: Re: [RFC v3 10/71] target/riscv: rvv-1.0: check MSTATUS_VS when
 accessing vector csr registers
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200806104709.13235-1-frank.chang@sifive.com>
 <20200806104709.13235-11-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6d8e542e-129b-9ba1-8022-0c20a7b0e32a@linaro.org>
Date: Thu, 6 Aug 2020 11:28:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806104709.13235-11-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/20 3:46 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> If VS field is off, accessing vector csr registers should raise an
> illegal-instruction exception.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/csr.c | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

