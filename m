Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D4D3F21AC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 22:35:40 +0200 (CEST)
Received: from localhost ([::1]:41964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGolH-0003Vj-3Z
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 16:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGokO-0002dv-D2
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 16:34:44 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGokM-0005RT-IV
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 16:34:43 -0400
Received: by mail-pg1-x529.google.com with SMTP id q2so6985795pgt.6
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 13:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jz3xrUvFVw0PU4oFrwDLmoESy2zbq1WED94qTn9AmsM=;
 b=zrp1SPq8HGwW16ZUEtdlv0jSrgYa+Y6zMZ0YwZ0lvwRThUnPQLbumjEgBCZUPpgedU
 pbJoQUFwFrRbl7BKL0XDcIBA1LLlggDKv3oE6LtsL03LMsmFg0sx9QADEx4VGTl9RFGO
 6qehaIjapiX1kcxA1UBbPrXnx4AQWxOfCbfBs0AOwSExdVuFSrrmCAQ9fgP/7vCSv21O
 dv7H9hRMa1Rte+V5CDw7PgJvS4q7JXsRFLZ9ixUh4fYeo4Kob+gvXFTX9pe67qfIYdDE
 OWVPcPZ56gP3ektmzkAbMh4tkNHTucLNETANjVpiie2qQ8JQ+PpBxOI7Y8oFwn/x8Ikn
 pr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jz3xrUvFVw0PU4oFrwDLmoESy2zbq1WED94qTn9AmsM=;
 b=Q+GCwk/aYkxrKZPug2Cj/luzJ48jxh8nF2mLWGe9gEmj8QI2M7WVOFzUZtnYs2yKt0
 RswHAU243Afbr988rRyir+9vc37Y0X7JonayC5bFLPUDnp0x0IvUaV58zQgcHSsW1Rqs
 LzyyksDlh31f1YHxdGhwzU71XdiVc1zSLCEz7fjm2Cg0l4AHULmENGuSpsLjMzS+cbBG
 khx/YXxMyIbAn8WicddH0D9WeKLGIPi7rPbS9Ft8VZdUNYc8PVTZBfpq6agCrsw26tFj
 FIM7Fp/CjQhHkB393vRZh+l55uQFWRVsPMi3rF8FunoPg6BlHWzhv/GINoFwhV5iOB7G
 eBTA==
X-Gm-Message-State: AOAM531Ho6XT+b/I9vAIy4W6u1OncuqrcEZPy953ayYgU29wGx/W2lK/
 Pie88Kcm4IHXvbDItvMlv9EJuw==
X-Google-Smtp-Source: ABdhPJxgGlvXXeD04bxhs8rn3VoM6VY04pYT0tR2GQeGyFMe6cy86Glc7A/3G7Qy/Uv1KRu8w/YZ/g==
X-Received: by 2002:a63:ba59:: with SMTP id l25mr15442702pgu.394.1629405280955; 
 Thu, 19 Aug 2021 13:34:40 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id o15sm5245355pgr.64.2021.08.19.13.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 13:34:40 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
 <CAFEAcA-v6z9UTbmdHqMugbtqv1n92SJ7EFGM8Gnk+_90FMyoBg@mail.gmail.com>
 <bb739396-f8d1-a5a8-ab1a-61892d9c84e6@linaro.org>
 <b6754a17-7b6a-201d-6c33-7759ea8ea270@linaro.org>
 <CAFEAcA_p_sUJF2PFkmxS7LcB0ed_BtRC_VbF2WDP-eAPsZukNQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <32debfaf-667e-a3cd-f4e8-e283139d60f1@linaro.org>
Date: Thu, 19 Aug 2021 10:34:36 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_p_sUJF2PFkmxS7LcB0ed_BtRC_VbF2WDP-eAPsZukNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 9:24 AM, Peter Maydell wrote:
> (Did you check the M-profile code too? That also architecturally I think
> should never let PC have the low bit set; hopefully the code I wrote
> actually ensures that...)

Exception handling in m-profile is much harder to follow, but certainly normal updates to 
_NextInstrAddr are all force aligned.

r~

