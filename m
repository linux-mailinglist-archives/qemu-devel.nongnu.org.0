Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F0E5B5948
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 13:28:25 +0200 (CEST)
Received: from localhost ([::1]:39554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXhc0-0005s3-Cm
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 07:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhLq-0000ly-DS
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:11:48 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:36619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXhLd-0007Y5-Fl
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 07:11:41 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-127ba06d03fso22408411fac.3
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 04:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=6fv9gZEmFzSI53mK+kA+QnKFD6nbIuRFR4wV5Na8uyg=;
 b=RfZlrilcrYHC4Zg/oZRg24G3GCODjSSbdwEdrFUwskiyUd5PMjuRu0lxJX8ONnwkd9
 nDfbEUNLeP5Yuar+QfwIW4sfS3BWB87uH1SHcER/BhY5sWZXyqRjZqL8kK4CDsenaDJO
 qNFUqGU0Wlm93BHpzV424lDRaKJuwqgKbM/beIQMM5Cegc8l8ivC+i2kE3HMnzKMMs5n
 j74dC4VBgqj8ZrkH2bUZtL1T66Z7rBoAr9tmGzOhiCnvbcCzi0kWhEgrI716d/G4u8WM
 8QBju4Aa3woYpJVktqerouq21bdlvNF7WqEaNm+9MMtSfCPPdUh+xQQbG96RXz3oG4dV
 1UQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6fv9gZEmFzSI53mK+kA+QnKFD6nbIuRFR4wV5Na8uyg=;
 b=qkC9VYCY8nF5O1qO5CbOZmu+CGOtwXjc4fm4AlMVdssi+V2oeA3WMqoeu+ruXvY5Dv
 YfTXyPDse0NV2BnRww+qZiAFvcy+3mtxFQs81EsVXqK9+qgZb89Gite9khDZB/4ebrNd
 r+KO2W77xbkPcCucOpmTmDbducEpIJ/8HYXmoujBwpubLWb38EDOgXFFuog7/bcVUKe0
 aZsKcTw/flTz3V5gI0s6PiXjRMoJtoSSUiNLCBSW+MKvUSCaADqTbRJ8Lx24nlryTbUJ
 AjjVDHy2WpISqeoMD/k6M0jOxHyG1Ouj15TEikWQQPphp0mDBoe6hSerYQgAJcXSpFKo
 z/mw==
X-Gm-Message-State: ACgBeo3IJps6dA8Z9HW/yk7sH8+lV+Nsu/YLJLPoMwrj5gYIDYIwTF5q
 NIsKYjNFJRecXX8Z1Scsi/Lb+GKCTUeiz+hz
X-Google-Smtp-Source: AA6agR5bkYT9DfXSiBgrheZsOLdSfTd4qvqlZ87B+T69IDxoBHnoZ4qNwtOXEYoYzlvFYehzCbqBrA==
X-Received: by 2002:a05:6870:8907:b0:12b:78e9:6574 with SMTP id
 i7-20020a056870890700b0012b78e96574mr2900797oao.57.1662981088288; 
 Mon, 12 Sep 2022 04:11:28 -0700 (PDT)
Received: from [192.168.44.231] ([172.102.14.47])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a9d66d0000000b0061c9ab1032dsm4405942otm.18.2022.09.12.04.11.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 04:11:27 -0700 (PDT)
Message-ID: <7fd4352e-43d6-141a-bfe7-a2fc03a770be@linaro.org>
Date: Mon, 12 Sep 2022 12:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 15/37] target/i386: extend helpers to support VEX.V 3- and
 4- operand encodings
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-16-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-16-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.153,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/12/22 00:03, Paolo Bonzini wrote:
> Add to the helpers all the operands that are needed to implement AVX.
> 
> Extracted from a patch by Paul Brook<paul@nowt.org>.
> 
> Message-Id:<20220424220204.2493824-26-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h        | 173 +++++++++++++--------------------
>   target/i386/ops_sse_header.h | 149 ++++++++++++++--------------
>   target/i386/tcg/translate.c  | 181 ++++++++++++++++++++++++-----------
>   3 files changed, 265 insertions(+), 238 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

