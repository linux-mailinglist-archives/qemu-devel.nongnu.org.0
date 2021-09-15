Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA1A40C66D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 15:29:34 +0200 (CEST)
Received: from localhost ([::1]:45370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQUyj-000566-VH
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 09:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQUv9-000181-Pf
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:25:53 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:42689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQUv6-0007k9-7R
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 09:25:51 -0400
Received: by mail-pg1-x535.google.com with SMTP id q68so2696480pga.9
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 06:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gHnfUhizXm/af2SQesKRHaj3Wf9BShyfeTflXtfJuM0=;
 b=pBPTw8TBTn1FDFkwuLclEkyHHxJ59cHHCQgZxiYHRy57R8eUxdVlC6GMyfVuKBu8tB
 JfAcmOQaIxts88ata3F2E79TPVD75HBgf34MQZFxudB6vxM1I91GOJyHr/RF861lvqwv
 st6pGf11O12eJ8DdYGgJ+u6cBw/Xx70vAG0wqyHA7k4erLpzo/05/jovHfKxYfRLAplV
 pRCJRRqB6pO2Abhobi8yS4b++hlT+fIMe2Yl68SuDtbU1R3OmsdPJAN7sZszeT2WiKA4
 6cWmV+YNdJE+dlOfyLg8+/gxycG+8IhwkARWK+4+pvt03x3oYU1f+djZLt0P81tU24jb
 C6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gHnfUhizXm/af2SQesKRHaj3Wf9BShyfeTflXtfJuM0=;
 b=4MEz220rJAdLh/Ex4SH3a+H6rTmha+6poWHNKLbYTK3qsCioumMOe4YvgTKzqbcNLL
 VBeYoe2xbDlAUxtSflLSoW+aeksZkaTQmxqsoKVjEBNRlWFygqH+OmgPUH1RTYefiTly
 bLuFcVcgUAYMDShr4lznC7jK0ed1bUSAPpcrxN4vTU0JtXovkSRKj2eO2/wKwooaNqGU
 sViFmSc15IomzMUGqNaIUwpzk10n9x8yYQgwEIEtNAvm96uNO1LyRnsENW6Rq8Qx7e5e
 dtWse23az5Q0wdhDLnY1HHgCbSjyz1DQVaaYq/AVRFso20Kg8VBLcIz32pNHGlOe0jSh
 jLtg==
X-Gm-Message-State: AOAM5312lASWzL0G5G5u2sDdQsn3ED7w0OVnM/CTGOjR5VGTxMLMsZw9
 ffsNNaR6NvrvR3rOaW5Owv0uIg==
X-Google-Smtp-Source: ABdhPJwbD6M9B/Pbe31iKMejT0t7Rz9u8Uiakhl5pC8wEsmOuQmMEoVjF2jmtlnFzN/0aCEZGLtM5A==
X-Received: by 2002:a63:b34a:: with SMTP id x10mr20500027pgt.473.1631712345642; 
 Wed, 15 Sep 2021 06:25:45 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g4sm4864509pjt.56.2021.09.15.06.25.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 06:25:45 -0700 (PDT)
Subject: Re: [PATCH 2/2] gitlab: fix passing of TEST_TARGETS env to cirrus
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210915125452.1704899-1-berrange@redhat.com>
 <20210915125452.1704899-3-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ceec60eb-9f46-59dc-7cb6-4428e8f8c4b4@linaro.org>
Date: Wed, 15 Sep 2021 06:25:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915125452.1704899-3-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.698,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 5:54 AM, Daniel P. Berrangé wrote:
> A typo meant the substitution would not work, and the placeholder in the
> target file didn't even exist.
> 
> The result was that tests were never run on the FreeBSD and macOS jobs,
> only a basic build.
> 
> Signed-off-by: Daniel P. Berrangé<berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus.yml       | 2 +-
>   .gitlab-ci.d/cirrus/build.yml | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

