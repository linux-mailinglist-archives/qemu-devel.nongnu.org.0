Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326A2327671
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 04:40:21 +0100 (CET)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGZPv-0001V8-Ls
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 22:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZOa-0000dC-Kk
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:38:56 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:37649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGZOY-0001vj-T1
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 22:38:56 -0500
Received: by mail-pj1-x102c.google.com with SMTP id u12so10557519pjr.2
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 19:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xjfI8c19VU5xmR9aH8KpKnFjR4UkB4tHzovk1lbI9D0=;
 b=FnQ9w3AY8/xjaJoI0+WQOOVejJL0FuwfoTXuGbwHV5mhSle5zSSyegLsUMTlGNMqnZ
 Om2zk1MeDu3JLFW+AAju+DmWAbKNQlHSOL1XKjQK9xg4sM+r1yu9nAa23dtQaghMGoVZ
 oz1JnD6XQaT8tzacZkb+wcHQU9L93yufNZmb2qZbXSfnSs2Kd4Dr8ZIlxryas3iRi4Jm
 COPr86CMdIUGof7tSUEMKqSYscJqrBhbq/6b8AKJBTMj1+DdEhjweBs4B9teeYnSWXjw
 juorXc2/OqGyLxOZDXBfLmZfbVQZSTwfvo7rvB4RTWdX3MRKTIQ8aafpqFshDs9cAprm
 CHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xjfI8c19VU5xmR9aH8KpKnFjR4UkB4tHzovk1lbI9D0=;
 b=OSc/juboNw/Eg6EFwlb3semOVg6NDz3omVd/Sy9xBx1vPMiD362mZObi1T6Xi3pBUm
 r1vzJZaCQhL+3Lg/TTMhgpt/Tn1pUAfOw/Nhv4I3SHDJHZ7F0/k+wt631rB3IqUQimck
 OXJ8VYX3smrMU3W8twY5uR+bpBgwwCkcaTk+qV4rI/l7DY6ilaMbHJU7t2SmlN1QQ01q
 ogRGz/AtrnUGAJRlsQevpgc6tZvxL5x+hKvlOwS21MYAdH2LnT1IAH4d/BBOg2SWVczL
 6iffiBzEZLAzk1SoOowzTPXLY9FcyerIqOXUBYnL/u0HSFdthBjncg4nEXDHF9d/H5I2
 XaEQ==
X-Gm-Message-State: AOAM530gVwOWPYYW2BVnaVPQhrCMi8EVxOhYFYvZzJZ6okl2VBS/wxPX
 m0AEwj/avgfw69XemVmMYsY9qg==
X-Google-Smtp-Source: ABdhPJwcwLu5xufm4saiOgTCoQBSVWfqfokuZ2L8vox4yQIB8LkpJZFeBQCHjFaTnILLp93lzYU4Qg==
X-Received: by 2002:a17:902:704c:b029:e3:1bd3:6318 with SMTP id
 h12-20020a170902704cb02900e31bd36318mr13817941plt.20.1614569933330; 
 Sun, 28 Feb 2021 19:38:53 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id w3sm15792753pjn.12.2021.02.28.19.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 19:38:52 -0800 (PST)
Subject: Re: [PATCH v2 10/24] hw/misc/mps2-scc: Implement CFG_REG5 and
 CFG_REG6 for MPS3 AN524
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3f34f2fc-a44a-e951-0fb5-8614e700a627@linaro.org>
Date: Sun, 28 Feb 2021 19:38:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> The AN524 version of the SCC interface has different behaviour for
> some of the CFG registers; implement it.
> 
> Each board in this family can have minor differences in the meaning
> of the CFG registers, so rather than trying to specify all the
> possible semantics via individual device properties, we make the
> behaviour conditional on the part-number field of the SCC_ID register
> which the board code already passes us.
> 
> For the AN524, the differences are:
>   * CFG3 is reserved rather than being board switches
>   * CFG5 is a new register ("ACLK Frequency in Hz")
>   * CFG6 is a new register ("Clock divider for BRAM")
> 
> We implement both of the new registers as reads-as-written.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/misc/mps2-scc.h |  3 ++
>   hw/misc/mps2-scc.c         | 71 ++++++++++++++++++++++++++++++++++++--
>   2 files changed, 72 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


