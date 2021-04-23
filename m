Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEED369D89
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:44:54 +0200 (CEST)
Received: from localhost ([::1]:45702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la5Th-0007Xj-5y
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:44:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la5So-00072Q-Rq
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:43:58 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:43684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la5Sn-0003KH-9r
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:43:58 -0400
Received: by mail-pg1-x536.google.com with SMTP id p12so36222098pgj.10
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cF/AUUN/2VvZtz5W5IPMixo50cBl8sRy6PQ9mYw0BKQ=;
 b=V0Z0GtVbYb2AGlhE4kXa+Nnne9FElcPunmDxDQelWbBN+RdlZdEpr9pCdH2MAY38vY
 jmba8tf8QVrLrIAYZan5nY72veLahAc/WSVhpo5Q+u0Tqo/HBm2F7hAih3jbGaHaXYtt
 ItBTgiXqFqc3PSEUBwxqJ/l/7Xq/tIkLfk+7wJR7MHmLXVmYnH/OoUcmidZYH6+SID+l
 vd6b8vYpnvpwwaOzVuQnq6ePfojSKzspaYKFII6kpRZegDYIccndJILomFP//YcZD5pF
 CjeUSmfr2S7lnvmOrYRNq1NavvcFEKKj7sRsKDKWpeZd/fFrjUz3PR+h5KAPe1zjY0QG
 gAjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cF/AUUN/2VvZtz5W5IPMixo50cBl8sRy6PQ9mYw0BKQ=;
 b=TfJswfhvA+OFBFN4nKxN+o5pveLDBRmmsUfY/ErqmPuGRsQGCjIrQ6a8qsKZq8Dj/B
 gt/hGkXKGmnpCsi3caVH5NQmeYPUGbne220X0RNkMFdtWP5OXb8O6UcIuGDBiLX8Ua7s
 roIkMWV1ThJdmJ241Uv6aY9280J4txYZCThUEZXNg1DkKvoi6afHkYLplNlh8yd02ciz
 HrvzsnD22ngtiQmNSManZtnSFNhLzG6EbZib5C6hTbTqPQ8ue93jjiU0XOyEt7B9/t9A
 TlF4ui7+D9J9HLVNYg9IiFrXojre0d8PqmjFWhI5vRIhXWbqmbmbJ53/Znb85mdOuE8N
 1yqQ==
X-Gm-Message-State: AOAM533iNwM0SgkxiqRy2wEY05YvEYyO1QjhW7ZxBshXgG4F7JzjXpgI
 u84exWa9A7Q5+jOxqHRRDyyriQ==
X-Google-Smtp-Source: ABdhPJyR2jpkqXln6iiOekG8V1RyqLyDL2eg3eJcGTxwOgX2obutSTqJzbQ6GOfqs1u/RyvILkZ+BA==
X-Received: by 2002:aa7:9394:0:b029:264:82c4:34ce with SMTP id
 t20-20020aa793940000b029026482c434cemr6331312pfe.34.1619221435606; 
 Fri, 23 Apr 2021 16:43:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id l18sm8031216pjq.33.2021.04.23.16.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:43:55 -0700 (PDT)
Subject: Re: [RFC PATCH 0/4] target/ppc: code motion to compile translate_init
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c68d5932-fa77-4521-3860-ab471f834386@linaro.org>
Date: Fri, 23 Apr 2021 16:43:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: farosas@linux.ibm.com, lucas.araujo@eldorado.org.br,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 12:18 PM, Bruno Larsen (billionai) wrote:
> The current patch series aims to isolate common code from translation-related
> code. This isolation is required to disable TCG at build time, and the
> final system still work.
> 
> This patch series is still WIP, so comments are welcome
> 
> Bruno Larsen (billionai) (4):
>    target/ppc: move opcode table logic to translate.c
>    target/ppc: isolated SPR read/write callbacks
>    target/ppc: Move SPR generation to separate file
>    target/ppc: isolated cpu init from translation logic

This does not apply to master.  You should say what the patch requirements are.


r~

