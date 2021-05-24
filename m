Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4CD38ECC2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 17:22:15 +0200 (CEST)
Received: from localhost ([::1]:55238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llCPG-0006q5-J2
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 11:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llCOV-00068Q-If
 for qemu-devel@nongnu.org; Mon, 24 May 2021 11:21:27 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:44021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llCOR-00083Q-R9
 for qemu-devel@nongnu.org; Mon, 24 May 2021 11:21:27 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 ep16-20020a17090ae650b029015d00f578a8so11327386pjb.2
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 08:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=YiyFi5tqzZjVk+SKvZrMqCuPBH1GjFpR+NdP3Hbg9Oo=;
 b=Oy//n7oQP0viSyeOGqKvSsL7nBASzqwXnQI2Een3XShH7pey2yiW6kva/NMyO+JE9G
 R4IvNDpn18nKsc+ozx5zRlCLjas2wVOS7oaoHW5ufx2e91jM4ENvawYjooW+1MkiyxaV
 1aNkW2uwvbTpW7oPp9/i5rSdj4c+n8SfkoswM5n56j1ab45q+BThzwx4T8uaUPNmhjvg
 jRBcAt9o8EoPjiypoR33dAXTyzbBlK1bkdomo8SYc4Wccb0pf+of1snZqGtLhObPpfOp
 /EadnQdwc7Ca9ABvPgkL8sBKLM2HSgO/uZwKB28PZ9gsbQ2dexIMLeEU+I3MgpX1iox1
 Jt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YiyFi5tqzZjVk+SKvZrMqCuPBH1GjFpR+NdP3Hbg9Oo=;
 b=b7yfeGzy+uVi5rjRMqTCgBn+R9k+DM7nhuRWEWX2lokM19xs2hwTEFYNujEMACwWLT
 oH5O3c/z72HAPoaxWVXpMRBVXuST7H7RSejvTJi1as0FDDDhXtTd02yUPqTh2QOnBCiR
 TO8TXfIWYgprmzHrgLXtG42syuLMpqPnHg2lpsUt39arl+4BGav+g2xeLR+3sXMABB0Z
 GG2sNOKV0z608JrF2YcRdWQN1nldPIxPEti7mzkqoWiy1MYp9PTfO7aRe0q1EciaoDha
 zHSSTSvASKBzx4I6ArbDDGKugCkUqAFJxnEVKIvLm1rbtVeMXKj8JlWva9fNTAlxfyfR
 +egA==
X-Gm-Message-State: AOAM530UcisalblHjg3VgVqlk21L8bo/0NZglFwyj7U5FmMbCxSsCOu4
 yiqqZrKLg5DMpM2EDdnCROpoHMSLucU9Cw==
X-Google-Smtp-Source: ABdhPJzXpTO/2gDNATYEG8NHVI2CxQgafP2NP0TqLPVuAGoX/NcKOthnN9yRYljlwpPhO3whdKbRtA==
X-Received: by 2002:a17:90a:8911:: with SMTP id
 u17mr25394423pjn.165.1621869682269; 
 Mon, 24 May 2021 08:21:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j20sm9368506pfj.40.2021.05.24.08.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 08:21:22 -0700 (PDT)
Subject: Re: [PATCH 1/9] target/arm: Add isar feature check functions for MVE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210520152840.24453-1-peter.maydell@linaro.org>
 <20210520152840.24453-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bca110b4-220e-88b2-7d34-05d0475077ee@linaro.org>
Date: Mon, 24 May 2021 08:21:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520152840.24453-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/20/21 8:28 AM, Peter Maydell wrote:
> Add the isar feature check functions we will need for v8.1M MVE:
>   * a check for MVE present: this corresponds to the pseudocode's
>     CheckDecodeFaults(ExtType_Mve)
>   * a check for the optional floating-point part of MVE: this
>     corresponds to CheckDecodeFaults(ExtType_MveFp)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

