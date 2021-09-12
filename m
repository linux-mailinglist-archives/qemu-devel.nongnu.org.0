Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF968407F8D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 20:50:27 +0200 (CEST)
Received: from localhost ([::1]:38334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPUYc-00086r-UD
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 14:50:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPUXZ-0007RH-9d
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 14:49:21 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPUXX-0007lv-P0
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 14:49:20 -0400
Received: by mail-pj1-x102a.google.com with SMTP id dw14so3858729pjb.1
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 11:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CoAAhkGROdlZMvWzvmxdxnxK65/00Fo0EkZ4uG/0HEw=;
 b=fFWqANdP26vXIIId3ms26WMhtd8xy4xYSk2mxZYp3rGs7Nuz7Ch84Dvx8p9cYH+n/+
 JrpS92V2OMJ/g+IKe11ZXaW4C2HCejYN6t2MnmegGNaqPdGDJZD2o0B+j/MJey2IOvUa
 nUVcLTBmuAguBLfHWdjs1MEFX4WOmFGNsDt06iMcpiZr9G5JQUrDG5m0ckByR2LbwKgX
 keHHlBjJyuRCpQAgMGT30VuTZZ59D2M/qvcbSwxJkFgyUFS0L8hPIK5L8IVkNpRdnP62
 mGWMmoV17BM0lCEnQCU6T53AAPcwlBpy17+tvSL024aA0uydqb3mWUXDz7kJMOFqu1XH
 OTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CoAAhkGROdlZMvWzvmxdxnxK65/00Fo0EkZ4uG/0HEw=;
 b=0Bi2P9y+5k22ZDSM2Ts0BuoBAgCEhHWvui6hu3Qycob6yIjItrNGlIrqZhtCNTAxVO
 i+7cmDyLThtBjD9PO899cuj2zIwfObjXpgObiZur8LgvTALLAXXOabYEbBVa9mlKmG7U
 KsnPKIjXyYrsHjT6mR8WET6cMK1fViSlLTt5gG+TScQ2/PrvMZF/pWW1x5SKm6ta0qgl
 GjZafvqGRSED6dFEFRCtmtdsli+l6FaRTr8hwk18hlzGE4TJAyOjI3I7pzXhWJmSnmLp
 WeN2hubqRAGn5GI45PHSGDY99akEmC+f9REiAN/6tnWI+U9Y9sXscm17mmIXwQiKAo6a
 pk+A==
X-Gm-Message-State: AOAM531z4sH3Chb1pWLNw8Bhn7q5B2viJfJhRvKGtO7aS5lBOmZ9loDx
 2K/fZfIzsTCcO2Gvb0cj1ZNvwA==
X-Google-Smtp-Source: ABdhPJy5K0gFEKO52PgYItZwZYGddeReQbSDRxY2TeagjJw+o3oiZkB8d5WJgmVeo3exGjiZRCD83Q==
X-Received: by 2002:a17:90b:1b44:: with SMTP id
 nv4mr8683623pjb.192.1631472558555; 
 Sun, 12 Sep 2021 11:49:18 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ch19sm4530010pjb.33.2021.09.12.11.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 11:49:17 -0700 (PDT)
Subject: Re: [PATCH v4 21/30] target/ppc: Restrict has_work() handlers to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210912172731.789788-1-f4bug@amsat.org>
 <20210912172731.789788-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b651e28-16f5-6b6a-6069-90d1a2545feb@linaro.org>
Date: Sun, 12 Sep 2021 11:49:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210912172731.789788-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.584,
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
Cc: David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/21 10:27 AM, Philippe Mathieu-Daudé wrote:
> Restrict PowerPCCPUClass::has_work() and ppc_cpu_has_work()
> - SysemuCPUOps::has_work() implementation - to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/ppc/cpu-qom.h  |  4 +++-
>   target/ppc/cpu_init.c | 24 ++++++++++++++++++------
>   2 files changed, 21 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

