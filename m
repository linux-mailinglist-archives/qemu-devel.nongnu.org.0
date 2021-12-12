Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3C471BE6
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 18:33:03 +0100 (CET)
Received: from localhost ([::1]:50114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwSib-00007F-Me
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 12:33:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwShL-0007WW-Oh
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 12:31:43 -0500
Received: from [2607:f8b0:4864:20::102f] (port=44897
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwShJ-0002bH-Pe
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 12:31:43 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 k6-20020a17090a7f0600b001ad9d73b20bso11531359pjl.3
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 09:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hv5YrBursWBGRKklo2pQgpOF49HdwnDxYVuUOO9BGxQ=;
 b=x4nr3u2/FGoEdlExKbZxUiKEOQkmkySZL4xvsbNkhaeqGxgMhQZB2hcMsOTjj34jWV
 eq0r9w63HV3aoVZEjz4rMyNZ9wosJ0PHQghsA/ZVi31evUyK7bL8isNDlP5keq97wqsY
 xLjlDRTGI4SNno/cEKtqOTLUWqmgPHyMNaTxATHHHUPLB6wIeXs0omzhJSKjuEYUU9Ox
 WXAkf2uZG1V/i5x7rMF/nqZAmt/i7ciRr0bUKQMzWUr7n6D3B0i+PTduahF1Su8EGhM5
 Bu6ku31iyHXVYeW8vQLPIOkKRLhrzHQg0aR0q8FcrIFANiyCADfv1q4RdoGg+0sjgXHf
 3TfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hv5YrBursWBGRKklo2pQgpOF49HdwnDxYVuUOO9BGxQ=;
 b=4/gQH4VBekN8GrIYZeJUWYKUQ/L5zpH0pCOU/4DelrgzE6J2EgVgykjKi3TNjYPKBK
 wqcgXebzMsiKYxdRrLnmVfUqk+Op3kNLeLuiSnzyWt5dyZt2fbdVFyf9glEdQ3a53mGc
 yNjxLcMjCef70wZNO3WJAOv0zIOaFl11ShPDU+Cu5pvDTNYNirw1pM7kxtMJ6W97N8+P
 cupIpq/Xksk8rAqYxWNbItIZ9fKNn49Wpbm3GiICxuk5srfuviXIxkH4zVvJkvd4SdSI
 SyFGZTPvWRF6wFPD7CYq+MKxMJ4QjT9CL2tJVbC2SQCl73Uat/LfemASpOHicOrYr1Y9
 74og==
X-Gm-Message-State: AOAM531a0dbxuIuFp1r8HdyVzJmEn7nMMe6mvV8UfVu5Bvr+rUsEfwcq
 zhQVDSx2/IVVbxCf8mLV+EnZig==
X-Google-Smtp-Source: ABdhPJzf4L7EJDP1ilxVe7yKdGRqSRnRo+wC1vw8/s9TEA1NdGP6Uzx7FknxGIzYFYaix2mV4xDekg==
X-Received: by 2002:a17:90a:4b03:: with SMTP id
 g3mr38672451pjh.167.1639330299917; 
 Sun, 12 Dec 2021 09:31:39 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id f124sm1970531pgc.32.2021.12.12.09.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 09:31:39 -0800 (PST)
Subject: Re: [PATCH 01/26] hw/intc: clean-up error reporting for failed ITS cmd
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <212e570d-b1c1-73eb-bfe7-10a216b637ea@linaro.org>
Date: Sun, 12 Dec 2021 09:31:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> From: Alex Bennée<alex.bennee@linaro.org>
> 
> While trying to debug a GIC ITS failure I saw some guest errors that
> had poor formatting as well as leaving me confused as to what failed.
> As most of the checks aren't possible without a valid dte split that
> check apart and then check the other conditions in steps. This avoids
> us relying on undefined data.
> 
> I still get a failure with the current kvm-unit-tests but at least I
> know (partially) why now:
> 
>    Exception return from AArch64 EL1 to AArch64 EL1 PC 0x40080588
>    PASS: gicv3: its-trigger: inv/invall: dev2/eventid=20 now triggers an LPI
>    ITS: MAPD devid=2 size = 0x8 itt=0x40430000 valid=0
>    INT dev_id=2 event_id=20
>    process_its_cmd: invalid command attributes: invalid dte: 0 for 2 (MEM_TX: 0)
>    PASS: gicv3: its-trigger: mapd valid=false: no LPI after device unmap
>    SUMMARY: 6 tests, 1 unexpected failures
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Shashi Mallela<shashi.mallela@linaro.org>
> Cc: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Peter Maydell<peter.maydell@linaro.org>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 39 +++++++++++++++++++++++++++------------
>   1 file changed, 27 insertions(+), 12 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

