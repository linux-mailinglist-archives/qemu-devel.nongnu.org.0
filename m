Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7191C3A44C9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 17:19:40 +0200 (CEST)
Received: from localhost ([::1]:58778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lriwd-0004QR-IN
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 11:19:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrivQ-0003ho-AY
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 11:18:24 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:39854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrivL-00029a-Sj
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 11:18:24 -0400
Received: by mail-pf1-x434.google.com with SMTP id k15so4713003pfp.6
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 08:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BU0ZsmNtZltCp3GDGhlmwh4pM0+QNAw9HvVhnk9gZfY=;
 b=d74lcOI7Jbrdjyjz4T2HPyvA8RwAUukfSFqkDKYJwRbfW4rd+Emzo3RvKMh1FU0/xk
 BG2JgtvzmYtYtNO1WaaGUtqaAIzPfXBddJlYnT5JKCrXAmBTkyHPLKchNRv0mg12WaK+
 OU/zV09/MieqXkAemOifPSq0dM506VNpjKfJTov9Tw66UKau67AADXFeTxI9bvtyQBrR
 NLOQ5aX9fJiX1lNuHDBe2JqRtZlOQvcLQozvxZ6IrCIRKGZWMTO1zeIXnmyP6/nH0/aO
 TXFecs1lPOPKOhEhqSTVWfLkCMRryUg+W2/ZRjuQV6AJJ8IgFSixXU7tUzF0CR+xnbxR
 Nqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BU0ZsmNtZltCp3GDGhlmwh4pM0+QNAw9HvVhnk9gZfY=;
 b=djdzwtWBDrgVjVIl8M6gjDE4ztiT0v4ggi+/UWrusToardtppV7o4cw6lhePPXefYr
 MKQAwJlwy0zTRb5pfL7JR8UTVlfWCSuuHVX/2uQ/zkZz1tdrBCKg1/qzU+i0HCkfQBnK
 fT72G8Z6Ry3FD+ufugNBBE7NGi2HV1kcmJhYSoDNSAMK7L7J6E7CBRbAn30oyG5z75by
 GJufmiX69i6ehhdqosfAiD1BROrZCYbTNjDQcyrNJRu/1aPOJf8/Ke2x49uKCW6lyYp3
 9Lcsfx2OjqvV2f8PBLbKzBMM5uK8e7wO0oNLrgc8sA9jnhf18Mj3Q8W347RrIQChJTjD
 LdoQ==
X-Gm-Message-State: AOAM5329QCe6SAnUbnqXtgAImSRhBDG45OxrwM4LJ9FELYGqAEKE+NHV
 bY5EvwRR4QJCAKyksmx4kEnrtg==
X-Google-Smtp-Source: ABdhPJzYS+Zo8yvB0nV78JG7Cv4+dQ8lqvN2/DHxvTnAHx/+h9NiO3aB4l184YSCNG+JDnVDXJE0gw==
X-Received: by 2002:a63:d08:: with SMTP id c8mr4248847pgl.248.1623424697308;
 Fri, 11 Jun 2021 08:18:17 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f12sm5343071pfn.161.2021.06.11.08.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 08:18:16 -0700 (PDT)
Subject: Re: [PATCH RFC 1/1] linux-user/s390x: save/restore condition code
 state during signal handling
To: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org
References: <20210610185823.14817-1-jonathan.albrecht@linux.vnet.ibm.com>
 <20210610185823.14817-2-jonathan.albrecht@linux.vnet.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7d3fcf31-bcf6-193d-4700-5cc3cf0fe90f@linaro.org>
Date: Fri, 11 Jun 2021 08:18:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610185823.14817-2-jonathan.albrecht@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: ruixin.bao@ibm.com, qemu-s390x@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, jonathan.albrecht@ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/10/21 11:58 AM, Jonathan Albrecht wrote:
> @@ -65,6 +65,10 @@ typedef struct {
>       uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
>       target_sigcontext sc;
>       target_sigregs sregs;
> +    uint32_t scc_op;
> +    uint64_t scc_src;
> +    uint64_t scc_dst;
> +    uint64_t scc_vr;
>       int signo;

Nope.  The layout of the stack frame is fixed by the kernel. Moreover, all of 
these variables are internal to qemu; you should only be exposing architectural 
state.

The bug is in save_sigregs:

>     __put_user(env->psw.mask, &sregs->regs.psw.mask);

This should use get_psw_mask(), currently declared in target/s390x/internal.h 
instead of cpu.h.

and correspondingly, in restore_sigregs:

>     __get_user(env->psw.mask, &sc->regs.psw.mask);
>     __get_user(env->psw.addr, &sc->regs.psw.addr);

this should use load_psw, and in addition it should not be allowing completely 
arbitrary changes to psw.mask.  From the kernel:

>         /* Use regs->psw.mask instead of PSW_USER_BITS to preserve PER bit. */
>         regs->psw.mask = (regs->psw.mask & ~(PSW_MASK_USER | PSW_MASK_RI)) |
>                 (user_sregs.regs.psw.mask & (PSW_MASK_USER | PSW_MASK_RI));
>         /* Check for invalid user address space control. */
>         if ((regs->psw.mask & PSW_MASK_ASC) == PSW_ASC_HOME)
>                 regs->psw.mask = PSW_ASC_PRIMARY |
>                         (regs->psw.mask & ~PSW_MASK_ASC);
>         /* Check for invalid amode */
>         if (regs->psw.mask & PSW_MASK_EA)
>                 regs->psw.mask |= PSW_MASK_BA;



r~

