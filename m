Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31829602BAC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:27:10 +0200 (CEST)
Received: from localhost ([::1]:38992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oklgZ-0001Fo-T6
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklEN-0000Ee-MI
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 07:57:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklE9-0003jh-RQ
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 07:57:59 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r13so23048080wrj.11
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 04:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J1ViY6aQvVjxWszuDvi/cXx0c7rGrYWia+ha8nPhRCg=;
 b=EScDB3HSNpZOjqnu3XOj6+4lrY+3D9yYn+wkKVICocR+MlCftf9Iecy2oD4QGaZ2+a
 iA4q4KmWWyqG6/B216H/kyvUYdWK5NY15J+xgKjIXKEbGg0cO0nVdPknozgvHUJm6dWk
 ikRyQNV4fgZoJYmWRKdGNKcT6ic7FduySYg2EWdTHpdDThhjjTpSbhQEi2Sn6KyCZZVZ
 /Q9Sif8AcVCWhP9U1psE5zHRfegcFHA62XczbRXypJXmG3s4waJJbdtldaMLcv4BwHRy
 h90pB+D3qHyQSfwk42hTV/25cPGQfWlm3Cj4ayzBho4pXS341CJQC9GkrUVtsxt5Dq7i
 ngMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J1ViY6aQvVjxWszuDvi/cXx0c7rGrYWia+ha8nPhRCg=;
 b=pfXUL4R+6Xsd7c0HlNiY1apEwtXBi9lakKc3AzvucFFeRGWyd4VvALB9yu6vqojzcR
 MOs+ZnEzdls9HCA1Vt/y9E6s3Do0rhuIgGs6HHxH5KEP+ZntvHEWzpQzQp1riLsoiHi+
 XpCAP6jYoCwr/hU3PCTfx3MQoI078JKim1yrM5n0znsRljQcAcq2xpy/l3Wo/8/0s3M9
 KPJwY6tg47Eh/vh6Ok4WhM6Hggxnzz+QcXAAp1oWDKprBdXkRrH7ipd5Ls+NXJDAw/VR
 kRVGENRya/TPW1AOyV99dzINCqNOpkJL+6xAwRyyUieWDhrSq2c4Tay+kmgBlXGlaTL4
 c7qA==
X-Gm-Message-State: ACrzQf1jDitcQE5OvOQmsCrf/+/DfBKINS3o5rfnkeD9O/fOQMmkNRcq
 tBdzxU1YjTVs81UusXhF4+BXLg==
X-Google-Smtp-Source: AMsMyM6/VsgrBplAEcVYVwdeGiuS82KRnoFl7CUFWvrYGLrX8E+L2SKwyA+qDs6vPfcZHS2fYANB3g==
X-Received: by 2002:a5d:6e82:0:b0:22f:a27c:c964 with SMTP id
 k2-20020a5d6e82000000b0022fa27cc964mr1677757wrz.699.1666094263994; 
 Tue, 18 Oct 2022 04:57:43 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a7bc4d8000000b003b4935f04a4sm15579610wmk.5.2022.10.18.04.57.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 04:57:43 -0700 (PDT)
Message-ID: <ee08eef7-8f65-4a99-a204-a424ba820496@linaro.org>
Date: Tue, 18 Oct 2022 13:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 10/28] qapi crypto: Elide redundant has_FOO in
 generated C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-11-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018062849.3420573-11-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/crypto.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Cc: Daniel P. Berrangé" <berrange@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   crypto/block-luks.c            | 16 ++++++++--------
>   tests/unit/test-crypto-block.c |  6 ------
>   scripts/qapi/schema.py         |  1 -
>   3 files changed, 8 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

