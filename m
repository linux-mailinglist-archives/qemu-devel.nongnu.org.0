Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E953FCCCC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 20:14:43 +0200 (CEST)
Received: from localhost ([::1]:54854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL8HJ-0004tK-Bz
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 14:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL8Fg-0003aT-TK
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 14:12:53 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mL8Fd-0005gR-8f
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 14:12:51 -0400
Received: by mail-pg1-x536.google.com with SMTP id k24so16695pgh.8
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 11:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zJxHaDQanM+YXDgTxr77fcvWmj6n5V2PJVLdvzCkeq4=;
 b=h88ahiztVJH9wNSyVscRembJSb5rYnJs1GPJKDENpGaQpxs6sJmnSYQq1NSZVl8uBB
 kTBSjBp3GDVSKnJoFqgAoXIMyHzXuHe2uWhWOqJjllcGJpZLXzs8e3srbdxkwrIAKC7x
 RJhF3sE/3MpVUg6ZNJOMxRBfa7Yp94lJc7NNf9lpgCZrxJ9h5hhYqRppLlNpwt4Ut2Dv
 AQCoJ2cv4YBQ8LvvYkLLlYN3M3VsGcVjp8XKEcCzxULduWD4b5D9GNTTXz3djCYgMiWO
 I9I8Hqlha/YKNNjtQmmZo7FmWtQj1W7qry6Xw6LVqdfntwiymhTqmlsysahi9Q3JRCdK
 A/9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zJxHaDQanM+YXDgTxr77fcvWmj6n5V2PJVLdvzCkeq4=;
 b=jn5iB5aAXUxIG2OIAQS/T1FzD6kDMfyBsqwMYPT//ahjq1SdMD7Dg5vnlX3RQhWLsa
 ZYLI7GoPn8lEO5IFRwvCzwRFVXLEGT3UHkGRAd7Sm66SCvW3xWdh/kmpyDof/Eo82rzh
 DbQogsqJzKueZo9t5AVtSBffNhng309HbkYZy9hDPQ1/URC45L7KawKBpnuyzrOVDLUH
 Vd5IwOepD6QKIls1R7jxK0yMSFG0O60oPufuSwVXEmfUwijUHHnKCHlNIFRi/1ZDlKK/
 uqq9iRv5yt2IgiUJ/GiWWpIMvnVDHD/491KOqOFyRDTKb/5sgX85uv4dp74s/Z8CQ5qc
 Oxcg==
X-Gm-Message-State: AOAM530mf1so8kUHPztxjr5sb9999jEqcwOi4uzS5xnDUrsT3weZ4k47
 bq3kfA7msDRWBTMXw0tciU3bPA==
X-Google-Smtp-Source: ABdhPJxe6f4kbGzzo/37YYPvskmJuyPRGwV74BQMNgngMOWsJwdf1S9AxHJViKnDbCQP0zSeRt6iSg==
X-Received: by 2002:a63:480b:: with SMTP id v11mr27910540pga.413.1630433567604; 
 Tue, 31 Aug 2021 11:12:47 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id u2sm3475133pjv.10.2021.08.31.11.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Aug 2021 11:12:47 -0700 (PDT)
Subject: Re: [PATCH v2 07/19] target/ppc: Move REQUIRE_ALTIVEC/VECTOR to
 translate.c
To: Luis Pires <luis.pires@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <20210831164007.297781-1-luis.pires@eldorado.org.br>
 <20210831164007.297781-8-luis.pires@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a40e0b16-8785-ed80-1382-01821721fe47@linaro.org>
Date: Tue, 31 Aug 2021 11:12:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210831164007.297781-8-luis.pires@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Cc: Bruno Larsen <bruno.larsen@eldorado.org.br>,
 Fernando Valle <fernando.valle@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>, groug@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/31/21 9:39 AM, Luis Pires wrote:
> From: Bruno Larsen<bruno.larsen@eldorado.org.br>
> 
> Move REQUIRE_ALTIVEC to translate.c and rename it to REQUIRE_VECTOR.
> 
> Signed-off-by: Bruno Larsen<bruno.larsen@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> Signed-off-by: Fernando Valle<fernando.valle@eldorado.org.br>
> Signed-off-by: Luis Pires<luis.pires@eldorado.org.br>
> ---
>   target/ppc/translate.c                 |  8 ++++++++
>   target/ppc/translate/vector-impl.c.inc | 10 +---------
>   2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

