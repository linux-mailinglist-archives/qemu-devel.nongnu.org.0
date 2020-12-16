Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6A62DC459
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:34:07 +0100 (CET)
Received: from localhost ([::1]:49538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZkc-00011J-FI
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:34:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZa8-00062s-3k
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:23:16 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:46581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZa4-0006zf-MD
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:23:15 -0500
Received: by mail-pf1-x42d.google.com with SMTP id s21so16888398pfu.13
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=s3B1HB6FcS4tnPvF68sKHeQ6n0VwS9E+jzBx9RtzuQo=;
 b=fNLe1AxqsFBdyPjWCDZ+P6wnpy3qKld1UlD5Ci/VJdY6wBabY06a3AdgnB7gujpP6E
 CZX0I8DU1GuevQruO1vPsnA6lvRiF8vVgy7Y0CtgQqvWXQblKgA+2zhSuK5GxfzS1s4v
 9Md15xuXGbt3BRi+D8x9K7H9KLVJSkVmDlMyKXGQ4bF7KryqXuV+pY6sa7kjKwgtxMd+
 IkjA+NmZHHSJDLaeWyFJpwCRlQoZa7IlTFRN4xonAx9Sb2uJDzFgbyC4tnx3YHb0//tS
 UxI9FcEXwMQkx7gKyst25ulVtRgL/oPkfQ5oUtaShTybmhHOwlUj6Sumym03dYxXc5J6
 Nv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s3B1HB6FcS4tnPvF68sKHeQ6n0VwS9E+jzBx9RtzuQo=;
 b=DpvY4OnqYmKjnEcCsND4JRCh6MRSevuwxvQ5z08pVVnVH28OHJejkS0AYkHyyUy+2z
 cVl3+MeGm9E44OQS/hVkrf6P7szHYZ1vgmz7DbVbby0wn/D4yoSr57EZi9uzmXUWzeSs
 sqKhg2PqBCK/nZ2TgkPf7XYdVpKfL0RPbKCF9Fz/6/QrsVnGdIrCNqPXGZP79jMIpJgH
 MIBv3FZIzMVGqDiwFrsvc2v3YqS5dZDo50OoGHhZ5ye+RMvzqyaTmTaQZf80PDWXZQF6
 Z9sODUoKls/8UIfmYfm27DnpzHc+fyzP5FN7wFOzWiD5fVOVuqIvf+52ZbeHMcsrrfrS
 D15g==
X-Gm-Message-State: AOAM531XTu4a1btC1SgWzkboobFG8WGOms0kw7IwICubQ8Uf7RntQClS
 LjReRlU0a9YfADgRBDAgKuLXwA==
X-Google-Smtp-Source: ABdhPJxfp9uoEAnMaZKjCrwUtFG2vpqScviuSMltHgNNVh0CBM9WGSfwPM9RYaW8uMQHWfP4ZpbyvA==
X-Received: by 2002:aa7:860b:0:b029:19e:2827:93b7 with SMTP id
 p11-20020aa7860b0000b029019e282793b7mr32780891pfn.22.1608135791052; 
 Wed, 16 Dec 2020 08:23:11 -0800 (PST)
Received: from [192.168.71.34] ([172.58.27.195])
 by smtp.gmail.com with ESMTPSA id z28sm3022436pfr.140.2020.12.16.08.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:23:10 -0800 (PST)
Subject: Re: [RFC v2 05/15] target/riscv: rvb: pack two words into one register
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-6-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eefc741b-e765-8ee3-6832-6191603b00c1@linaro.org>
Date: Wed, 16 Dec 2020 10:23:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-6-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> From: Kito Cheng <kito.cheng@sifive.com>
> 
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> ---
>  target/riscv/insn32-64.decode           |  3 ++
>  target/riscv/insn32.decode              |  3 ++
>  target/riscv/insn_trans/trans_rvb.c.inc | 30 ++++++++++++++++++
>  target/riscv/translate.c                | 41 +++++++++++++++++++++++++
>  4 files changed, 77 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

