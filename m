Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3653D6539
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 19:12:10 +0200 (CEST)
Received: from localhost ([::1]:51818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m849A-0007Qu-OQ
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 13:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m847u-0006gK-0Y
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 13:10:50 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:42733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m847s-0004cD-FY
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 13:10:49 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 o44-20020a17090a0a2fb0290176ca3e5a2fso993489pjo.1
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 10:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=wm2fjCefRH2ZOtSOAmyH7LaqIb9pQK/O4ZqMWJXvito=;
 b=PCjNkOSmAEjS+RPmW+PGnKYcHyfuDTc7fE6uvFCioGIFxROpAWkX2BIn5O3Daaw+xT
 UgK2101Txb7WMnNJOLox8wSGtlokbuXYjKro0uI/wBeyC3XToe3SZ81T6kZdhbLwOsn+
 tRxqDMsIFGGJbov609fXmIxTZ1Bmz/YxGIupBsX2ALN8e65uVq04PmA0ubpWWfI+c3it
 yjV4ljeGA8mcsbct9KG/hSSBcRUgmFSPK81PucKQBzFGz0YhfbfoSsqrDw7YoUJz6rsn
 pBrxiXWy84xKyMBvsw8ograpTnWeWcOprnf16FEGTkKkyzH2CwXHUMAfJE7uAViXX79E
 CZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wm2fjCefRH2ZOtSOAmyH7LaqIb9pQK/O4ZqMWJXvito=;
 b=bgXgn+w5h4YjKaNZ4Zqpc9OusJOmGRqyXIQe2X+v70j9KDiHsRMnVRR0Hj1F+rue5A
 iOIm+3LoymefuHILWd4Twkw3K0DzZhrd32aPwrFDptaQL+RhkMovtR1xZ4uartaYhWAC
 ot1+6EuW4cC6gN4kHZ18YcyzwKBGyvRIBDoZzvf+6ea+u061EXYxE23WbLDTc9tADV8S
 EsfK89b7JNbYGxBjhd6N7KGe7RqJlF1fpcEju43BOU8bn73lO8NpA6BdGCyS7/ehoeOD
 HLUWOmDdvfEEdMwXK7jjCsgCE457utzJioUv2iCPUTVfoy0MenL7RqD9Qwu2qpmWsw8f
 RGMQ==
X-Gm-Message-State: AOAM531BmfTNWKvn+hg1/jDth6a9VeSWjr1OV4Dr+tjhDxoi0Kby+3Ok
 Kp4HbAx/1qlPpi45Ob8CMN+Syqpld5ZXQg==
X-Google-Smtp-Source: ABdhPJzEW+kpx5IFe//ChqPPmd/oukgno5iLlEHxhYL2Yw3KxEqWqwJMEyc7psCoYM5yLRlAL9T7/A==
X-Received: by 2002:a17:902:d48a:b029:12c:2142:6702 with SMTP id
 c10-20020a170902d48ab029012c21426702mr5317385plg.53.1627319446895; 
 Mon, 26 Jul 2021 10:10:46 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:497b:6ae4:953c:7ad1?
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id w10sm273841pgl.46.2021.07.26.10.10.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 10:10:46 -0700 (PDT)
Subject: Re: [PATCH for-6.1? v2 0/9] Fixes for clang-13
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
Message-ID: <e9481343-96f9-e713-33bc-dc1adc75f317@linaro.org>
Date: Mon, 26 Jul 2021 07:10:43 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725122416.1391332-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.438,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/25/21 2:24 AM, Richard Henderson wrote:
> 
> Richard Henderson (9):
>    nbd/server: Mark variable unused in nbd_negotiate_meta_queries
>    accel/tcg: Remove unused variable in cpu_exec
>    util/selfmap: Discard mapping on error
>    net/checksum: Remove unused variable in net_checksum_add_iov
>    hw/audio/adlib: Remove unused variable in adlib_callback
>    hw/ppc/spapr_events: Remove unused variable from check_exception
>    hw/pci-hist/pnv_phb4: Fix typo in pnv_phb4_ioda_write
>    linux-user/syscall: Remove unused variable from execve
>    tests/unit: Remove unused variable from test_io

Queued for 6.1.
Thanks for the reviews, all.

r~

