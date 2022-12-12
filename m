Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E9564A2EB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:12:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jX1-00085a-Ur; Mon, 12 Dec 2022 09:11:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4jWz-00081d-PA
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:11:45 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4jWy-0003yf-2T
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:11:45 -0500
Received: by mail-wm1-x331.google.com with SMTP id ay40so5494410wmb.2
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=wvL3yP/YDvFpCEgA3N+/O8tHFYFBAZ458f9XsqZVp20=;
 b=A59g+wUbpE5JGuwCChJSvDtFAYBjigODFcMiWtaOk4nwKFX7baKZrk0TFPlHRLvkr+
 HJKX2BAPFytlm9SihP6TP5jg4I9znmU73PbBB3v3GEecdrb84Htks/bUrB/bOlkP7Zrb
 bzTmb3xnC/a1Z+rjHHFEgDwqIaMBT69paQfMVRrloaUlJ9iDe5wG7AHRDsD8qGgcEat0
 f+d4Yn96x7Yt3zwkFu0XOzAah/PjIk0qFsFjXYJWGMFetjcheu5hvcZBzSTrjK7BDZBQ
 vjBmCwRd8NJVRQ9b7fgBjaZi9lYyHRUZdbQ2oN3Jx/k0/PnyQSj+tp0QoAz8KZ/lTy6f
 Vg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wvL3yP/YDvFpCEgA3N+/O8tHFYFBAZ458f9XsqZVp20=;
 b=Czf4rdwrXwWaiPBeCCUm7HiXficqzMop/SNw6nUbALKcFu5pth1Zlvn8XD9pQ/W5ny
 /8ASPqt12eDwgWepESlfwsGiAuFzT7gyAMKBUt044BVYp+htftErCn+PdHuZM3hEsOp2
 fJY0/24gxzVFTP2Hc9jHaegRjM6iwNrldD8mPX7/WFh+2jYTO+VUhBvOZxQIommfPsi3
 rhHL/AkkLEu76n9oyacdn31waXcN0zYlqmkDX1YOam+wBvrjGtFJ4obQ0AL4X9QX2nun
 VUJwDZ/EJAFvt6P+nJ2nK5ZCSphBgvwHnTJgSXSstLSQ3TtW7am0oK3Cw+hZSYQChG/9
 I6kw==
X-Gm-Message-State: ANoB5pm8Q7a5pvce5lIQ6JH26BmDr3RflTrIQDnB4K8jA2kvUzXawKDE
 JSKKGeFQxa5NlsONiaU6xj0=
X-Google-Smtp-Source: AA0mqf6VD0fCFdWYuzM/HJA6pEBrCU8P9JMdGx0w4zCFXom6kdqGBNXGMiwxjOxxMJP2MysMgmsQhg==
X-Received: by 2002:a05:600c:4e90:b0:3d0:898e:9bab with SMTP id
 f16-20020a05600c4e9000b003d0898e9babmr12550116wmq.2.1670854302343; 
 Mon, 12 Dec 2022 06:11:42 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b003d07de1698asm10615976wmp.46.2022.12.12.06.11.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:11:41 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8b91d5ac-e3bb-20da-dcf0-a6902de6ebd7@xen.org>
Date: Mon, 12 Dec 2022 14:11:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 10/22] i386/xen: handle guest hypercalls
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-11-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-11-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 09/12/2022 09:56, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> This means handling the new exit reason for Xen but still
> crashing on purpose. As we implement each of the hypercalls
> we will then return the right return code.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Add CPL to hypercall tracing, disallow hypercalls from CPL > 0]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/kvm/kvm.c    |  5 +++++
>   target/i386/trace-events |  3 +++
>   target/i386/xen.c        | 39 +++++++++++++++++++++++++++++++++++++++
>   target/i386/xen.h        |  1 +
>   4 files changed, 48 insertions(+)
> 
[snip]
> +int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)
> +{
> +    if (exit->type != KVM_EXIT_XEN_HCALL)
> +        return -1;
> +
> +    if (!__kvm_xen_handle_exit(cpu, exit)) {
> +        /* Some hypercalls will be deliberately "implemented" by returning
> +         * -ENOSYS. This case is for hypercalls which are unexpected. */
> +        exit->u.hcall.result = -ENOSYS;
> +        qemu_log_mask(LOG_GUEST_ERROR, "Unimplemented Xen hypercall %"
> +                      PRId64 " (0x%" PRIx64 " 0x%" PRIx64 " 0x%" PRIx64 ")\n",
> +                      (uint64_t)exit->u.hcall.input, (uint64_t)exit->u.hcall.params[0],
> +                      (uint64_t)exit->u.hcall.params[1], (uint64_t)exit->u.hcall.params[1]);

This could get a little noisy; would a trace not be better? Then only 
those interested in it need be bothered by it. As we know, some ancient 
guests attempt to use some hypercalls which have long been consigned to 
the waste-bin of history.

   Paul

> +    }
> +
> +    trace_kvm_xen_hypercall(CPU(cpu)->cpu_index, exit->u.hcall.cpl,
> +                            exit->u.hcall.input, exit->u.hcall.params[0],
> +                            exit->u.hcall.params[1], exit->u.hcall.params[2],
> +                            exit->u.hcall.result);
> +    return 0;
> +}


