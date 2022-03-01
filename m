Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917534C9864
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:32:39 +0100 (CET)
Received: from localhost ([::1]:39708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPB2s-00050U-LA
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:32:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPApI-0006t5-It
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:18:42 -0500
Received: from [2607:f8b0:4864:20::42a] (port=33342
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPApG-0008G2-8U
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:18:35 -0500
Received: by mail-pf1-x42a.google.com with SMTP id d17so154109pfl.0
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7F3Og0JarDaFh0GalDWtEP2RLU3dEgxDuKtjIClYhTA=;
 b=gJxlRS/Xy90LGUcHtXRcz5cj7uC+eGvNM7NcgLRq15wHNqvpx7wx10rXlkzjpwnmMn
 rnbD1IQvBq2rDesKGL5g4k+oq4Xb/VqrdOczNBDHukanj5r4m3eKX0/ZwYJEr7QVg7zF
 qQH8MzFZiiSUzH34w72y9abeDjnwO1XHen9nRaTMCp/IOw8/RjfA3fVdi5kHVw7lu8GY
 NQQuFaph1Ywtgr/Bf7kXUvZFIHfJEPL+sOizvP+Du8nylE0MZD2iV0OdDobSfMA0zJIT
 xLh312Xaf1+RBHsos582MntpuKy8kjRapcAZlw/MjRwR4FsL4I4N+snJY0nSxSAUszI6
 uCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7F3Og0JarDaFh0GalDWtEP2RLU3dEgxDuKtjIClYhTA=;
 b=sXD2Na6MYT410/b+tHhpnUKd7y64RxccYRb2Bk7w947nAoPGdB+/Bm7WSi85UQgrgF
 o6ljimJg/QRY/ZqsybTO5Jw4vPDK0VW9DXcNEjoGU2pvqAVNfc+rCP86iIgEtYbIcCQA
 LXJsALs669Jzvpblg8sjGL0697wowmWtkirj9KTG3OCk5oGDRVfSAKqXQglwRvTk/cMz
 sv3ZaLhb6+AQlf3r86cdEdWjJAKszzJV3jHwoFBZI+RBHEgX7juSLuVhdpS502VzwRPG
 jXuylS/bgji2BnMYVt1K5yGZ5LNtTBGpa8D3ugG8GPeNRaktdqbFIxYiWc7O6x6QOwMi
 QbJw==
X-Gm-Message-State: AOAM533xDz54si/ZrwROk85JkzsCTu7DJRr3auRXGdtDK3UNKPqr4tZW
 bejvlPvRI1/0ZZCttA+JNTxGMA==
X-Google-Smtp-Source: ABdhPJxit9B34b9rMEJqww0nxDK3I2R7iwCqzpPR2kXseRig+Es4ExKw9DuwKiTvFLEc8RdDrXPPCw==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id
 l11-20020a056a00140b00b004e12cbd30bamr29780776pfu.46.1646173112749; 
 Tue, 01 Mar 2022 14:18:32 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p33-20020a056a000a2100b004dff55a7f08sm18589492pfh.21.2022.03.01.14.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 14:18:32 -0800 (PST)
Message-ID: <cc7a6071-ff52-9c56-e73e-ffc2e9050f2b@linaro.org>
Date: Tue, 1 Mar 2022 12:18:28 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] tests/tcg/s390x: Cleanup of mie3 tests.
Content-Language: en-US
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220301214305.2778-1-dmiller423@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220301214305.2778-1-dmiller423@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com, farman@linux.ibm.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/22 11:43, David Miller wrote:
> Adds clobbers and merges remaining separate asm statements.
> 
> v2 -> v3:
> * Removed all direct memory references in mie3-sel.c
> 
> v1 -> v2:
> * Corrected side in rebase conflict, removing older code.
> 
> Signed-off-by: David Miller<dmiller423@gmail.com>
> ---
>   tests/tcg/s390x/mie3-compl.c | 18 ++++++++++++-----
>   tests/tcg/s390x/mie3-mvcrl.c | 12 ++++++++----
>   tests/tcg/s390x/mie3-sel.c   | 38 ++++++++++++++++--------------------
>   3 files changed, 38 insertions(+), 30 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

PS: Those versioning comments should be after a --- line, so that standard tooling removes 
them.

