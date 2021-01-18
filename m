Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7296D2FA810
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:58:02 +0100 (CET)
Received: from localhost ([::1]:60936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Ymv-0003j0-IJ
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1Ykp-00021y-NF
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:55:53 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:33355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l1Ykh-0002vq-PY
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 12:55:49 -0500
Received: by mail-pj1-x1030.google.com with SMTP id lw17so224562pjb.0
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 09:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SE8vf9eW3SnOLCOT2l+Ewm+uuWHLP0vI5RKOCNL6ErA=;
 b=hDpm9JT1/UhY4UC3Gfj5B3666m4C4vIHiPebdV04kHBEFycKJK5KmFlBklM4EOx5oo
 UvX5pRbldpEj54E5Uyf/qqgjJ2k2c17xcM5QVxX99nqucqi0HIC4e+PoQCgyZCSCWSXG
 hs4BCqrd5wuvVHJnzHBOASi19gmtg/xQEVgCqQknvqHaHcViyLyd5XZLh3Q9eIY/MqsW
 IJFKp2fjqX3GyhH2cLvJUEwIpCEy4R+Hfc9kTW1aHg05k87ba5H7IVCZVERGEZP7fVHI
 Czv3pzw1aFNzkG7U0B/ubFaFs6EcdmmYwcuEn60YeMh7nslzPrBh4K9d2TsuvlkASsV/
 NR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SE8vf9eW3SnOLCOT2l+Ewm+uuWHLP0vI5RKOCNL6ErA=;
 b=GTXGr6t1mkHHTbY1UFerXom/hIu+R4rQVMTP4AeYfqo9fGvELWrYl26DJq0d8hDFbf
 KJfc2Ahq2Av4m13mnGhDQ0RvGX/OvF/+f2vjn5bU3jAWlAqJlQRWoru78Py6d8FsweEQ
 QUomrYZlCpmaktr7CeYFTu2c+O0PiwiZPw/6y7uneb/b5kGIEl7df7FTUspMd1XAwhkx
 oeTVMMcqVFBtkUOc1+dJPqDxgTfbdVBPTGydv64ab7+8wmQeZdEMyxs4aJIPWtRfOc6r
 6fkFJnI8m54cX6Np+ZroD30I4DKcYwwex/eWpOQjkfCG1hq5gPrIqkyBLGrduGn1lkJr
 vOiw==
X-Gm-Message-State: AOAM533NoJtamBP1dPtwFaKvBQbciw36DtakKHZ2eYzMtCkPfvzZvgxO
 nMUuPvesUOduy8vjJr2p1Q63LbF84dc/cA==
X-Google-Smtp-Source: ABdhPJxhb07BKMCdI6+mB2vDkiO6FvJY2x/0ch03DBI6coGDsBt4I7LsWwkkpsfmuo/wKfwEI9YOvQ==
X-Received: by 2002:a17:90a:d249:: with SMTP id
 o9mr479378pjw.196.1610992541039; 
 Mon, 18 Jan 2021 09:55:41 -0800 (PST)
Received: from [192.168.3.43] (cpe-66-75-72-126.hawaii.res.rr.com.
 [66.75.72.126])
 by smtp.gmail.com with ESMTPSA id b2sm16702799pff.79.2021.01.18.09.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 09:55:40 -0800 (PST)
Subject: Re: [PATCH 1/4] target/riscv: Make csr_ops[CSR_TABLE_SIZE] external
To: Bin Meng <bmeng.cn@gmail.com>, Jim Wilson <jimw@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <1610427124-49887-1-git-send-email-bmeng.cn@gmail.com>
 <1610427124-49887-2-git-send-email-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5bb89965-266d-d789-bd64-a963559ea28f@linaro.org>
Date: Mon, 18 Jan 2021 07:55:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1610427124-49887-2-git-send-email-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.194,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 6:52 PM, Bin Meng wrote:
> +extern riscv_csr_operations csr_ops[];

You might as well use CSR_TABLE_SIZE here.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

