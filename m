Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE06C232631
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 22:31:18 +0200 (CEST)
Received: from localhost ([::1]:36956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0sjO-00026c-3L
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 16:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k0siN-0001bE-TN
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 16:30:15 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k0siM-00040m-2Z
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 16:30:15 -0400
Received: by mail-pf1-x42e.google.com with SMTP id f193so3220747pfa.12
 for <qemu-devel@nongnu.org>; Wed, 29 Jul 2020 13:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p+aqaaXHAQ8uEWbVmX1DMlJXBwCvw5T6O78rpXaT0HE=;
 b=t+hVH4UCLwDttH9X3DqDgT9gLKsYl/pzaLj3aF+EkHfjNAehY6lULLNrQCQpTew4ds
 6qjpik1MkiYcz28iDb4kF6kSjg/gLe8wV3O2w+nPAa+EPmlhn0gBuX28M9S2WHp3WwS0
 3cbxzLocr+5RRKAzCB86U4KW9XLsFgXnkgLvBxKZMldMI/3GQg/56ApkWnFCrashMv1p
 aPUnDdB2eXjBCNWucZassqplqvlLRQyRZECnsdayYylI7FYTL0SBbGb8eG26pwG9dq4F
 WffsneoyJzQzhl8LmviCiFqhDNQ/si74LIQFnekkxnSg+v7ND+NNPhXAbm1Xxqs1ABjT
 qfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p+aqaaXHAQ8uEWbVmX1DMlJXBwCvw5T6O78rpXaT0HE=;
 b=ud+GqqD0PC0fCg/yjzM6EoP1hbez8fHvX6WC7n8Y32MW0YpSlPGjTRBF4OmQU7V3fY
 5BqBXoQ3QB7B3fM81u6fsd0LldkpvDBV1YqTnFeVUbw2FxCe1TCKafwc4Nbe4WGmA4HE
 7gw5e+ocSl9cGzJnoN74WLVjSnuZFo08aWkDVQ04kgVj/N0zPnjdKSoczqrvK7z86nzK
 tzE7OnJ+rgOILHAHzZ+guoGe4JQA1v35IqF1GEWqf6GMeltgYdsfhesNM0dLcIFGLqAn
 oZUqnaKRpqmOY79hYaAoKuAD5iGtrERo9gZ7O11XwZpxn6MXag/BIDHy0cUwkZ6ccXCh
 BfUw==
X-Gm-Message-State: AOAM533VxviVgWGHG0yeRffl6iPLkD2n89RzAtOQyKymMQRX/fQPdWzb
 JOdG0TiuL/rsHA5j3dfDIoNAfw==
X-Google-Smtp-Source: ABdhPJwF+XD4L9LKg/OlGXp1It8ivylvxd7yRmLHoIlr1rSPkmaVlKL/MC/7+jSZ1TCvg8GN39uB3w==
X-Received: by 2002:a62:7b4e:: with SMTP id w75mr71390pfc.130.1596054611869;
 Wed, 29 Jul 2020 13:30:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id z3sm3062497pjn.32.2020.07.29.13.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jul 2020 13:30:11 -0700 (PDT)
Subject: Re: [RFC v2 27/76] target/riscv: rvv-0.9: load/store whole register
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-28-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d1e2f533-9107-3e43-cb65-22125d2eb396@linaro.org>
Date: Wed, 29 Jul 2020 13:30:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-28-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/20 2:15 AM, frank.chang@sifive.com wrote:
> +static void
> +vext_ldst_whole(void *vd, target_ulong base, CPURISCVState *env, uint32_t desc,
> +                vext_ldst_elem_fn *ldst_elem, uint32_t esz, uintptr_t ra,
> +                MMUAccessType access_type)
> +{
> +    uint32_t i, k;
> +    uint32_t nf = vext_nf(desc);
> +    uint32_t vlmax = vext_maxsz(desc) / esz;
> +    uint32_t vlenb = env_archcpu(env)->cfg.vlen >> 3;
> +
> +    /* probe every access */
> +    probe_pages(env, base, vlenb * nf * esz, ra, access_type);
> +
> +    /* load bytes from guest memory */
> +    for (i = 0; i < vlenb; i++) {
> +        k = 0;
> +        while (k < nf) {
> +            target_ulong addr = base + (i * nf + k) * esz;
> +            ldst_elem(env, addr, i + k * vlmax, vd, ra);
> +            k++;
> +        }
> +    }
> +}

First, nf != 0 is reserved, so you shouldn't attempt to support it here.

Second, even then the note in the spec suggests that these two loops should be
interchanged -- but I'll also grant that the language could use improvement.

Indeed, the whole vector load/store section seems to need improvement.  For
instance, no where does it say how EEW < SEW load operations are extended.
>From reading Spike source code I can infer that it's sign-extended.  But that's
something a spec should explicitly say.


r~

