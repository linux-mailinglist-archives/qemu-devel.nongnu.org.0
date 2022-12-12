Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D86064A471
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:53:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4l6Z-0002ky-1w; Mon, 12 Dec 2022 10:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4l6W-0002kj-Kj
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:52:32 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4l6U-0003Bb-AK
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:52:32 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so5558890wmb.5
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 07:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+en8icqADZ119cbjha03YxsmQXhiwtk//0tsBlhjX20=;
 b=VPvBdCvKTE9yu7bzrbUjSlqO/s4UgD8ictoSeaLpXUyCYLAP/7VSHWfF3kNw97eELh
 q16NZ2/ihDcH209HLUv+avdWn1owDlFICqZM0hCW6LAguXqs1ORlySxcPiROtfXUBtRf
 TNu+6zUXfosW8jlT5RGQxylFvMtUClbsRqbfPbox+1g9D8EydysiBc/HNvY9RrbWX1a7
 Qm2UWo4PBty77JkjA/mAEdDym26b39YmIV6sd5/Ru0gDeC66cscze1BLD0aGpIsrNM/u
 G0EJE05wCbaDoU1n7sXRUj6x0SZfclI/a0n4mbKu3PJ+kPq4VTlekyd1yld/2wZNcAne
 z/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+en8icqADZ119cbjha03YxsmQXhiwtk//0tsBlhjX20=;
 b=dF5sbZjDkjbEFsxW7UT4L3EOq30gEtlGLupTyZvdGxEHrKG/84pBaPfpUHZKK+7pv0
 wtBE5IlndgRmzsKvcDOrWSO3O12lFuUjquGvLFhv3xZ1kqr3+vEQPgTX6+Us7Uw5rqTj
 jlQz7tDpHD6Fk3DcvpJ03H+eTpswqilCxKGhj1Nq/Z7kzV4qxI6vH2ah4NinLK3JTGvA
 RRIpPTXOJRUEI5Ra7vJFU+NybFWlogwcJSGAH3iE/dj9rT+c/W1olE2s7f+YTHvo3zm6
 ldQ/24dBSUoGewcNH2o6ownR9e5EMN5W8PTnnQ8JfGKXgv6x/nTuPP78dQ/AEaHO8Pgh
 Fn6w==
X-Gm-Message-State: ANoB5plPrE9K51IhAwqF6cNGf2kCf5uCyxFLp/vZf5LZT5x6PXHwSuvB
 1cWF4V40vjsr2xvVmpWTIhQ=
X-Google-Smtp-Source: AA0mqf7xgrjFstJAF3l5MXe7uC4Qm1Xpos/IGo/RMDxls8oAKpo5JaUGBjvhOwq74T77FEJlV28q6g==
X-Received: by 2002:a05:600c:1ca2:b0:3d2:d72:e8fa with SMTP id
 k34-20020a05600c1ca200b003d20d72e8famr9628450wms.22.1670860348403; 
 Mon, 12 Dec 2022 07:52:28 -0800 (PST)
Received: from [192.168.4.46] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c228d00b003d1b4d957aasm9559553wmf.36.2022.12.12.07.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 07:52:28 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <912fdb09-b32d-7030-3c7e-d00935cc0fcf@xen.org>
Date: Mon, 12 Dec 2022 15:52:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 19/22] i386/xen: implement
 HVMOP_set_evtchn_upcall_vector
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
 <20221209095612.689243-20-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-20-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32e.google.com
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
> From: Ankur Arora <ankur.a.arora@oracle.com>
> 
> The HVMOP_set_evtchn_upcall_vector hypercall sets the per-vCPU upcall
> vector, to be delivered to the local APIC just like an MSI (with an EOI).
> 
> This takes precedence over the system-wide delivery method set by the
> HVMOP_set_param hypercall with HVM_PARAM_CALLBACK_IRQ. It's used by
> Windows and Xen (PV shim) guests but normally not by Linux.
> 
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Rework for upstream kernel changes and split from HVMOP_set_param]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/cpu.h        |  1 +
>   target/i386/kvm/kvm.c    |  7 ++++
>   target/i386/machine.c    |  4 ++-
>   target/i386/trace-events |  1 +
>   target/i386/xen.c        | 69 +++++++++++++++++++++++++++++++++++++---
>   target/i386/xen.h        |  1 +
>   6 files changed, 77 insertions(+), 6 deletions(-)
> 
[snip]
> +static bool kvm_xen_hcall_hvm_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>                                    int cmd, uint64_t arg)
>   {
> +    int ret = -ENOSYS;
>       switch (cmd) {
> +    case HVMOP_set_evtchn_upcall_vector:
> +            ret = kvm_xen_hcall_evtchn_upcall_vector(exit, cpu,
> +                                                     exit->u.hcall.params[0]);
> +            break;
>       case HVMOP_pagetable_dying:
> -            exit->u.hcall.result = -ENOSYS;
> -            return true;
> +            ret = -ENOSYS;
> +            break;

Handling HVMOP_pagetable_dying could now be folded in as a foot-note 
since it's a rather uninteresting relic of shadow paging. But otherwise...

Reviewed-by: Paul Durrant <paul@xen.org>


