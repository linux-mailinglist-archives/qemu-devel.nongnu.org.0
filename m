Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B82A626746
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Nov 2022 07:04:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otjbd-0002xE-Qg; Sat, 12 Nov 2022 01:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjbO-0002wd-Uk
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 01:02:53 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otjbN-0007ri-4M
 for qemu-devel@nongnu.org; Sat, 12 Nov 2022 01:02:50 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so9464814pji.1
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 22:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JOZP8f+8wbzXMKgM2Ozbg1RnNg5GQlZy3GsYpt7lY64=;
 b=sUrv8NR1x0INJMG2RXuT9ZH//sF+UI9qjxy/tKJs+Ah+kwaMjD+X+CB2NahTct1g3U
 0ZKyJFeuR0AISAzpobGQPwno7a6XEA/KAoWsUFnFiiyp340nD3VZFVd4jpYUe2kD0t9i
 pqzeAQLKdMlE1MARnWHspPIZcgv+SoGh33QXeHA3sYwby91UVY8juUHqQ2XBoccZDdKc
 vdRhl1YIZ9wRSHDG6P2czzRR7Fm/UCBBcy4d0RTHN02z3vNhlsneU+a4U0qidG+1Kk4o
 VGMsMEzVBBnIHM8I7vlHDG1mIsviBO7Ja5xMHhQPRb5DUXzwgDcHhbjCAQX0TuvId925
 k5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JOZP8f+8wbzXMKgM2Ozbg1RnNg5GQlZy3GsYpt7lY64=;
 b=HBqndja+aIZ5a7Fd+AYstzL0VA0MAQCgMrrPaYAloVeofAv2pQuKSVGuOA4/bYhv4E
 TkWEAtbOVpEQxUW61XEVpOKQDq+m8pqMSD33Ik3jsi/07nPaWmcKjpcYtsr18y6FF8LM
 35mHJ22CL5YAr3VwinABnbiskbWxsjXqZwomJM/1cVXTgfyQZKFvApfEOCVPJfUBZpqt
 w3Y0oeWTLFuXw8NBHUodCqao3+qMtgz4+hcfDFsXVNzzaSb0dDaiLE60RfqQ1ZrboMsi
 57m+ZEz0+u/ViG4Zk7JFhbx+SAYBb5ET3ojt8wU/C8DjNfMoBmZ1jz5+pw3OhTlilJ2O
 eSng==
X-Gm-Message-State: ANoB5pmlzcbGv556Qps2I1DxoG40yooRkhSz30sQmDqDgDxBJKl52l2v
 n27j364ePlB1ilWwg2DTUssj1g==
X-Google-Smtp-Source: AA0mqf7KJseiDXiYbMQNEGeNHEvJ9uU7sImjwH9Nh1hAHJl0u48pLWbw5vOOHW5oPpS6GTtr/sIifA==
X-Received: by 2002:a17:90a:343:b0:213:ba14:3032 with SMTP id
 3-20020a17090a034300b00213ba143032mr5250085pjf.111.1668232967235; 
 Fri, 11 Nov 2022 22:02:47 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:8228:b676:fb42:ee07?
 (2001-44b8-2176-c800-8228-b676-fb42-ee07.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:8228:b676:fb42:ee07])
 by smtp.gmail.com with ESMTPSA id
 i4-20020a056a00004400b0056b1ecef957sm2556750pfk.37.2022.11.11.22.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 22:02:46 -0800 (PST)
Message-ID: <8422b442-bc07-5732-fc02-de31441270b1@linaro.org>
Date: Sat, 12 Nov 2022 16:02:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 18/20] hw/i386: convert apic access to use MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
 <20221111182535.64844-19-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221111182535.64844-19-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 11/12/22 04:25, Alex Bennée wrote:
> +        switch (attrs.requester_type) {
> +        case MTRT_MACHINE: /* MEMTX_IOPIC */

Not checking the id?

> +        case MTRT_PCI:     /* PCI signalled MSI */
> +            break;
> +        default:
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: rejecting write from %d",
> +                          __func__, attrs.requester_id);
> +            return MEMTX_ACCESS_ERROR;
> +        }

Logging the requester_id by itself isn't great -- you need the type to know what you're 
looking at.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

