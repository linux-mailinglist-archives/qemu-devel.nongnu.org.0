Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF72144D5D3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 12:31:56 +0100 (CET)
Received: from localhost ([::1]:51952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8JA-00083H-4P
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 06:31:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Fd-00035f-2U
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:28:17 -0500
Received: from [2a00:1450:4864:20::436] (port=34751
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ml8Fa-0005Mu-VR
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 06:28:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id d5so9265909wrc.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MGtdEfHYESkt2IzKDZ/pa4CsRqijV6goiWSl35l5+Co=;
 b=v9mOPoBruF3STzc3/2Q56xgZ7A4ze8TnrWHW2Ij/kS8T4eMt7JUUq3Sv8LbZZoVuAF
 FAYpm0YmaFnft6d2PHFHjAh/ukQlwS8r2TrO4DznYSmqbWR2KR9DAhGK6G2Bfw6lcD1R
 92c5WqPmOvkUIgr9uHli9KydsSvDfRTPu8lOWlJI50CjsTZal2UrT/eoe2jFp0Oi0BmR
 SEMa64QPSTe+W8030fyNqQoDRl0QJesnbEauyUFQP/ep67IIk36a+Skby+sdSaywW3ur
 2LI+FUhpfFEq8Q3Y4Bhj8wy7WPi/u3mxdJf49e94ixe6CeYbNRA46W/Hq/2scOcrNivu
 oCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MGtdEfHYESkt2IzKDZ/pa4CsRqijV6goiWSl35l5+Co=;
 b=vIdFhpe0rQ46CG1pxRSQrTf6hVH913Z1H9LbAh1CBSkBEaNCFQdjkyHyWYUzNeGHkU
 qqozwEkSMhKV+5jPUMwfW5cwWy1OBtQWhsDUUk+zwKCXTHjLes2o8d8uJ9YrMgwvp8+9
 CUeFd/z8RpVKQh3K3dMmaCWNS7Rjya/qAyWJ/xggyfOSK75F9NYbcD22BU+3LKflrsXc
 FUmKDuDGa6+tzpREvOB8SQophtMqIowwapw3R4rQ6R+h3Yz8UAX1qIBFvHr33dO61jd0
 lAk/pv7GTw23V4CJxONhkzfJZ4JLSSCM7xh31HijLAAgZ95056WYG7VeZKX1AzjZiN+7
 u5Rg==
X-Gm-Message-State: AOAM530qY8nJRVNEX91YT1n/2qJKbsxYE7uYioUhwPazqpcqqlTe92TV
 aEMkxRTBfTN/umXFgo9tglWfCA==
X-Google-Smtp-Source: ABdhPJxJkD9YdYpGuboDOI1a5rif9bS2tf1EuYDcB5ghvAAaEqAUqrDApULxVro25+pTA5JYqE8kjg==
X-Received: by 2002:a05:6000:110b:: with SMTP id
 z11mr8073111wrw.32.1636630093516; 
 Thu, 11 Nov 2021 03:28:13 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id p62sm1535962wmp.10.2021.11.11.03.28.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 03:28:13 -0800 (PST)
Subject: Re: [PATCH v3 10/20] target/riscv: Calculate address according to XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
 <20211111055800.42672-11-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e558e7b0-d65e-c495-a756-7d78a8942cc1@linaro.org>
Date: Thu, 11 Nov 2021 12:28:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111055800.42672-11-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 6:57 AM, LIU Zhiwei wrote:
> Define one common function to compute a canonical address from a register
> plus offset. Merge gen_pm_adjust_address into this function.
> 
> Signed-off-by: LIU Zhiwei<zhiwei_liu@c-sky.com>
> ---
>   target/riscv/insn_trans/trans_rva.c.inc |  9 +++------
>   target/riscv/insn_trans/trans_rvd.c.inc | 19 ++---------------
>   target/riscv/insn_trans/trans_rvf.c.inc | 19 ++---------------
>   target/riscv/insn_trans/trans_rvi.c.inc | 18 ++---------------
>   target/riscv/translate.c                | 27 ++++++++++++-------------
>   5 files changed, 22 insertions(+), 70 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

