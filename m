Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391626D2330
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 16:54:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piG9H-0004EJ-RW; Fri, 31 Mar 2023 10:54:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piG9G-0004E1-BV
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:54:38 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piG9E-0001II-Uw
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 10:54:38 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c18so21431780ple.11
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 07:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274475;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=20RKCJv+oE1sswzhWlm+OQclkrNxey7/te23BWRGZh4=;
 b=Ja6GQMw5+r4W+MOU9145M0qL5JNwxMZ3H3fBmgGFNi3Ovx7V4wbpn1qHl3aY9/Q+2A
 nSx8i+xfPGRHfK0sgj9Agw2PKyXpMwq3r4zcYGt2lByEy4Dr+w6UnHF9VdxYBoZ7lkxU
 jq9aoenw2Azz8QwAIq24+wyqaANiY7GslMUFJRkgyfuaxKCg14IIpo96xyqWFYvUWUeB
 2MtELHQpP1NEhCzTderb6eK2PUw4XBqyvy5arI4BVnqCrBRpqYTzQNGMm2o65bcrBZ94
 JYgmPK5VO761L+cp7aGjCrqSxvmIBdVCfbtEMfGozuNJtBrNE7uFx3avI9IXlBxN4NPE
 Pxiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274475;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=20RKCJv+oE1sswzhWlm+OQclkrNxey7/te23BWRGZh4=;
 b=WeTV6cZhYSNS8L8BncWxbhmSXAOcDJEpXquKaQM/djfWrYBWf/CXiURPZ8R5s+IbNQ
 0pDo2RN0YdlJLwvS3yQABBUM2eW2d4nVwN1z3Iw1Q3SFWAAnsEeVuHrmilG/qLp4gRdL
 DLlps98qrLIXOX3MYUR0WVE+wfGSc6dF20OYV1GHATjt8X9WmgMAQ23aEaRCLGh1PTmO
 pCxozl87oVnF8dkV24FnhUFCqG9bt62JHqYAQ3t6AjLjTiNa3Z21t64okZDNxoBTS2FC
 ilV6sp9dwNVX+EnIYR2l8egE1Qai9FAiQ7pBd7i0cvjxlBcJg0AwhyD1CfCLDQpMjms8
 ou3g==
X-Gm-Message-State: AAQBX9fLoxGd17D6MrjEz+Hc3JHkIqyhkI1edd7ZguORZ1nrwOAh1wwX
 P11eepXG2CxMhY5DHnree6+wFQ==
X-Google-Smtp-Source: AKy350Z4WUVK+VM5abUiVgbZv0dmTejH1cPSAfBKreSZVMk9d7Kfs2ELJDv1z9NFvKDI3UeL8ROX5Q==
X-Received: by 2002:a17:902:daca:b0:19f:3d59:e0ac with SMTP id
 q10-20020a170902daca00b0019f3d59e0acmr33659066plx.44.1680274475152; 
 Fri, 31 Mar 2023 07:54:35 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a170903018100b001993a1fce7bsm1655764plg.196.2023.03.31.07.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 07:54:34 -0700 (PDT)
Message-ID: <543ac996-1be2-dd4b-d8cf-a92fc5ba53a6@linaro.org>
Date: Fri, 31 Mar 2023 07:54:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] meson: add more version numbers to the summary
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230330104622.29087-1-pbonzini@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230330104622.29087-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/30/23 03:46, Paolo Bonzini wrote:
> -        cc.find_library('gpg-error', required: true)])
> +        cc.find_library('gpg-error', required: true)],
> +        version: gcrypt.version())

Indentation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

