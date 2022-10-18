Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8673602BD2
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:33:42 +0200 (CEST)
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oklmv-0002IJ-83
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklKJ-0003Ew-Ma
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:04:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklKA-0004yF-9Y
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:04:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id a10so23048848wrm.12
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2pB7MLaMwtZiAw+lB130H/ds48QDnGznHStmV8XzoDE=;
 b=TyAwoL7rNbwHBMAQls47Bz2kTRUNoLa0n5P27D1rvKq92aoXAKf1kBeMCUkxDhN01S
 mGmp3AlWfH/t5gYH5AWpmVa0Uoz28xcdYkNWoRPeGLr7PhCuS/tcjy4yfBpVCI+tLS64
 qcM0RiNXIHzAnPCab0bB3UDLrWJriwcO1dVMjgYlce8sYlMUM3jkEc4zgcIAH6e/NTsh
 NeA2xmgXJrRlVhhx+3bi7HOSpGG27yN7J8lU8qJ4p4OaTVZhqVjK1osTzJoaKNqINwXr
 ZlWZBT4OKCq7E/1KLjfM5hLLZCxmG7qQ/L6CK38Fq46kBHneBrEz9RUU+Khj+1K8utc5
 Fbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2pB7MLaMwtZiAw+lB130H/ds48QDnGznHStmV8XzoDE=;
 b=tGQeKwO3Z3RHSI3plqj5Fp2WBJQ2tCDO4zWqjmaCUAjEx0b3wTHJ4DvrFiOFDg8SUO
 sKsdJFKXVx5VVXTYfxzIMsTxbZWb2tWOTxPJfYRyfdPp0HxSSM5VuK3ikqprOKsH8z60
 jjCiL0hx2emu/yc6eHxCdFW5FQp/JO1yUZO0uXKwdPkaslhSFaSvK5Ws//yNuZqQh6eh
 o9tbmG7wup0NSNfLL8kdKt+J2CXBBI/kyyZc2hLkLvp8WlTnDFYSEX+oqYf89TVOP4pI
 Ax5GZKjA8+7lzBf6IXQVBHoFQ++pSpC3qSvwp/w+VDQ+BmbX6mp2e5dl93DgqrdclYBg
 /TpA==
X-Gm-Message-State: ACrzQf20UCacaXOycXbwy840xQ6L34khQv/dle/5wTvsyJfgfV9PWIXi
 nbzibx1YyAktGlRKEUZzeOjYjg==
X-Google-Smtp-Source: AMsMyM7iqTQ1hlgfRduSGbP24nFnuMaVSS9+hz1NxSGTs/3J0HfBnAVLPmILTZlbmzVIpvUlwEM0pw==
X-Received: by 2002:a5d:4cc2:0:b0:22f:593f:ba9a with SMTP id
 c2-20020a5d4cc2000000b0022f593fba9amr1701967wrt.31.1666094635170; 
 Tue, 18 Oct 2022 05:03:55 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a05600c46cd00b003c6f426467fsm8384447wmo.40.2022.10.18.05.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 05:03:54 -0700 (PDT)
Message-ID: <23492891-ad8d-bdd8-2e09-e5b7a010a4f5@linaro.org>
Date: Tue, 18 Oct 2022 14:03:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 28/28] qapi: Drop temporary logic to support conversion
 step by step
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-29-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018062849.3420573-29-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/22 08:28, Markus Armbruster wrote:
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   scripts/qapi/schema.py | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


