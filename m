Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58315659876
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 13:52:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBEr3-0007Zz-Jc; Fri, 30 Dec 2022 07:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEqm-0007XM-M6
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:51:04 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBEqk-00058l-Qj
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 07:51:04 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so12697061wml.0
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 04:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YKbqGHWXzj6FzgglAnQDtQD7J60AoFmaDERCFQs9o4k=;
 b=qdgi2moNSYKMwub5AdlFgxw9K/el7VxWJV5bMdAcFMh4n57pc7cgz83Stpu/OtYZKZ
 Zwmv8PvRBS4ICNft/c/FglkqbNjk0zSci+hugbczBEJuWonIMQAS/74CVgOP4zvImw0X
 1dmfot6Mx/gGt3uyJuc7QH0kSrxhvMU38ovWfgSmKEcJ8Nhe7CkT9apNaIIADj5rSMF3
 tAKc+CLRBwkH8ZaEL25BC6dLJ3p7Z1TqkQVN87uhD6wt0/FTou1zyZgULRLa6xKtHnr6
 RA0KP29+FWr6ZXCmgWZ+WZymmZOREId/MrSK+LEa+gFgtqcI3qqTX75Pb3Xi/07HcRUU
 x1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YKbqGHWXzj6FzgglAnQDtQD7J60AoFmaDERCFQs9o4k=;
 b=6nFgMvrc0QvqF0rZnMr/TQgvuclcK+T3GkgNPPChUB1vnbgBmUm0yb9ptxwF6nWdRV
 32iMUGYEK1+9eg/l8dHneJ65YE8eDJeP6pqPou8XJ9JAIG7YtP6M49S2w7bS6+LC5BmB
 HRQddMYrk+iYatlH2E2MIJF0UmVo7GZY04xfwlxn0SluTu1ipe1/iXGokf8h3Zkq4YrI
 pej6GZgtvu9DBL7ES6DmoMnkdyhHGTQb1I0Oxbd4L0kxyWgGqakBBi8e2YjkHvwV3dVq
 MqwU1+3aWWTfpXBOqF5jCHcERu6PgseE3Nh+IzSEsFKv7dXndjGccEcBZdk8+mtkp5aA
 ttOw==
X-Gm-Message-State: AFqh2koE90BkNWbzkjHlNHM9hyC2V65ehSqoxQTmd2ODlF4OCD+/vE+F
 OuLjdNNIq6Vu/uPmTt0sD60tCg==
X-Google-Smtp-Source: AMrXdXu+lxjpy/439Ud0ndzUXdnw6SZ58hZn4l7vVU9U8dOwELV5x+i9VdipebTI5K5Uukld1C5uYQ==
X-Received: by 2002:a05:600c:3c90:b0:3d9:6717:92e1 with SMTP id
 bg16-20020a05600c3c9000b003d9671792e1mr20188363wmb.40.1672404661344; 
 Fri, 30 Dec 2022 04:51:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0a4c00b003cfa3a12660sm46513380wmq.1.2022.12.30.04.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 04:51:00 -0800 (PST)
Message-ID: <cfa6be0b-54e8-71b4-4700-161ce2468fc3@linaro.org>
Date: Fri, 30 Dec 2022 13:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/11] tests/avocado: add RISC-V OpenSBI boot test
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, Cleber Rosa <crosa@redhat.com>,
 Bin Meng <bmeng@tinylab.org>
References: <20221229181135.270661-1-dbarboza@ventanamicro.com>
 <20221229181135.270661-2-dbarboza@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221229181135.270661-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 29/12/22 19:11, Daniel Henrique Barboza wrote:
> This test is used to do a quick sanity check to ensure that we're able
> to run the existing QEMU FW image.
> 
> 'sifive_u', 'spike' and 'virt' riscv64 machines, and 'sifive_u' and
> 'virt' 32 bit machines are able to run the default RISCV64_BIOS_BIN |
> RISCV32_BIOS_BIN firmware with minimal options.
> 
> The riscv32 'spike' machine isn't bootable at this moment, requiring an
> OpenSBI fix [1] and QEMU side changes [2]. We could just leave at that
> or add a 'skip' test to remind us about it. To work as a reminder that
> we have a riscv32 'spike' test that should be enabled as soon as OpenSBI
> QEMU rom receives the fix, we're adding a 'skip' test:
> 
> (06/18) tests/avocado/riscv_opensbi.py:RiscvOpenSBI.test_riscv32_spike:
>          SKIP: requires OpenSBI fix to work
> 
> [1] https://patchwork.ozlabs.org/project/opensbi/patch/20221226033603.1860569-1-bmeng@tinylab.org/
> [2] https://patchwork.ozlabs.org/project/qemu-devel/list/?series=334159
> 
> Cc: Cleber Rosa <crosa@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Bin Meng <bmeng@tinylab.org>
> Tested-by: Bin Meng <bmeng@tinylab.org>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>   tests/avocado/riscv_opensbi.py | 65 ++++++++++++++++++++++++++++++++++
>   1 file changed, 65 insertions(+)
>   create mode 100644 tests/avocado/riscv_opensbi.py

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


