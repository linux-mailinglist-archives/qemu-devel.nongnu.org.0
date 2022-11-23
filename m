Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F2D634D9D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 03:10:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxfCL-0003y9-BM; Tue, 22 Nov 2022 21:09:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxfCJ-0003xv-9C
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 21:09:11 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxfCH-0006m1-LE
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 21:09:11 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 j10-20020a17090aeb0a00b00218dfce36e5so757417pjz.1
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 18:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=18FF5STPye/r0OD1qWLMcrz74YXsCQN28bD1eDzydK8=;
 b=P9WOyqd3dgbZKEgnApohfDDv7AnZ2jwnnBTMjDgYntH9JlxXmmLqETynyVzZCTPMOg
 zZocaTp3L735xy+KYTSMHv5PRX0kCXcpgs+m66ile9X1QlayrWPoFA6mW+G6ZxmYEaWb
 2Ktb4EpJBLIU87lsFY/PDqA8sdGPphhNo36NXRdCrS01VotrKrDyWzl9p3xvbqCjRGaV
 Nz1PTNq2Ox3L3Ua7ovIQdqh29ajuQiYE+Bn6zgJbfMYbv9bmVCLX4vpd8ZfxDIA2qcOt
 pEFUt6NLHjedehSl9kSBT5KyOCp5GN3+hS1MJOcexbA73/YrXmNsY7nWaolWozYVDmod
 PILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=18FF5STPye/r0OD1qWLMcrz74YXsCQN28bD1eDzydK8=;
 b=6eC8o0njg5cQxWJlariiQfaGTRlZWMSIB4x0iO6rnEO6bG0KXNr8sw1U1ZRwRP9AJi
 fgVHU/mNovqzY5yWrn1sO+ia7oyC2xRFzteQk3uvh+i/aojUhVwxQ4ek1TudtxxDuqhU
 /CcqP4v9kLIAbh8sE2rYsy1+T1G8kGQgBVLJJvFMh8zxdnPa72AfYITl+CYp7WWhFGrR
 5WtIeEhE5T4TBGBzbk2UHf1eLSfudZi2akPrl19KEloeSVlYyMKQiaWXlSWJGB8pRJoZ
 DyfSMl3pJ2vpoSj3oF8s57AeBMK/4Ah+5DEcEtT4kAWKHyyMBZhkAtsz37yOmVsr0RYO
 1ZQA==
X-Gm-Message-State: ANoB5pkHREz7yw9rcX6EsR1Bf6pps+xF/mG0/sjcKWuZRoMNTND5I72J
 lFnk15mUhBc2YmVrLIhK27qpWNyOVThQ+w==
X-Google-Smtp-Source: AA0mqf5DZmOTtHnvASLDflNKmM/3HD1pn8R7luPuqdO68SSSAqoaF3IgwEWhTX3+Nni+VvPEJypfGQ==
X-Received: by 2002:a17:90b:2d90:b0:212:ca73:4d6b with SMTP id
 sj16-20020a17090b2d9000b00212ca734d6bmr33971487pjb.16.1669169347807; 
 Tue, 22 Nov 2022 18:09:07 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:8fe6:a8f4:74f0:fe76?
 ([2602:47:d48a:1201:8fe6:a8f4:74f0:fe76])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a63ef07000000b0046f56534d9fsm9731996pgh.21.2022.11.22.18.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 18:09:07 -0800 (PST)
Message-ID: <a0a9e5af-285a-ac18-f6d9-b71b283c33cb@linaro.org>
Date: Tue, 22 Nov 2022 18:09:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/7] qemu/main-loop: Introduce
 QEMU_IOTHREAD_LOCK_GUARD, WITH_QEMU_IOTHREAD_LOCK
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20221122205739.603510-1-richard.henderson@linaro.org>
 <20221122205739.603510-2-richard.henderson@linaro.org>
In-Reply-To: <20221122205739.603510-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 11/22/22 12:57, Richard Henderson wrote:
> +#define QEMU_IOTHREAD_LOCK_GUARD()                              \
> +    g_auto(IOThreadLockAuto) _iothread_lock_auto                \
> +        = qemu_iothread_auto_lock(__FILE__, __LINE__)           \

Need an extra G_GNUC_UNUSED for (some versions of?) clang.
Which is really a bug, because it's always used via the cleanup.


r~

