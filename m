Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEA33B4DD2
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 11:39:45 +0200 (CEST)
Received: from localhost ([::1]:47344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx4mu-0003eN-3l
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 05:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx4lq-0002sR-Tp
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 05:38:38 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx4lp-0001Fb-H0
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 05:38:38 -0400
Received: by mail-wm1-x32e.google.com with SMTP id w13so7771398wmc.3
 for <qemu-devel@nongnu.org>; Sat, 26 Jun 2021 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qT2eu2wJvQpCfd4WWhnJlAnC83y8KVoduFeBqjG8tUk=;
 b=AOC07Te0YxibQ4xr6yjyzAFkSd/S83Nb20iTmBh5DSdtqmr6QoNS71T2MOSFNn9LVA
 k6JBJESw+LJOaC5byDh2I+NupMbb2/fI8Oqmy8bOwCWYdzDlfMzWKVYXdfhhikyEtaAy
 ha/CeHzmmM6/YKF5jA7tPoIRMLsxesyLan2oC0grGt7ghiiFx6rcTWOa3FwYlcI2jTJR
 C/ZPNi9ppBU9HDy4AiLBaY9hWUax6zgAkt1+rlxPxaVKLufGb7foexJT7ofQMFt7xxsT
 Rphyi8whRoN2gNARlNYQbnvOw7RxtSPkuVKuhipVrvfLVUPBRCky2LlsNf6lw27j8Oo6
 iZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qT2eu2wJvQpCfd4WWhnJlAnC83y8KVoduFeBqjG8tUk=;
 b=js54uOn5vqJEsUr27HOawnJa4TTbDqaK7Gm8bBEs2R9expKlDIlZVhSZsInUdPLVYY
 pZlMQLiFv0XRe7MK1DRYgCSJRjOM/tdSYUHrWzzmTf9ALD9daf1Cxpt1lmoyYOupscy9
 Wbt2tMgpFaBfvli1K92rqya+ktrDMH2wCtNJP0YJtw+nvEFqTCRt6iiiLBmyM+m/Zg5C
 TWr3uQZQymV2VpTsHNVvcJgcVT4w7CMsPWfNzAq9YC/aVpXk6Ft+LsEhff+S8Y+p336G
 cNmV/5JpATm00I1PlJHfcPtgBjKVH3RMPDSCSkdPu2KEZ1FvhMNan8wgenEnw0iVA2jz
 kr5w==
X-Gm-Message-State: AOAM530u6r6D/3RHghpUA0QxjhcqXhUAmblFCVkK8nW79A6h/0/3WSCa
 NzyvtJXV/5hhfhkGZGjodjg=
X-Google-Smtp-Source: ABdhPJyG5uL0RVZfOtFWyEsCOw497+TRRjzLz1qsBk3b4O5YDIIVvgYiaWCywA9k0Y6slVXX7qF9Gw==
X-Received: by 2002:a05:600c:1c2a:: with SMTP id
 j42mr15186484wms.173.1624700315477; 
 Sat, 26 Jun 2021 02:38:35 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x10sm8353705wru.58.2021.06.26.02.38.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 02:38:34 -0700 (PDT)
Subject: Re: [PATCH v3 04/29] tcg/aarch64: Support bswap flags
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210626063631.2411938-1-richard.henderson@linaro.org>
 <20210626063631.2411938-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2572f2d7-eb9f-f57e-798c-a9974741f018@amsat.org>
Date: Sat, 26 Jun 2021 11:38:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626063631.2411938-5-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/26/21 8:36 AM, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

