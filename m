Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F265264A39E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 15:43:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4jwc-0005PC-Qy; Mon, 12 Dec 2022 09:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4jwa-0005OO-7g
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:38:12 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1p4jwY-0003Pa-H3
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 09:38:11 -0500
Received: by mail-wr1-x430.google.com with SMTP id h16so3341856wrz.12
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 06:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=WdyUBncrOgqQK8UyZLpCx0/I08vn7RmlANTua+8rRzI=;
 b=N/M0UIGOzhM5i9j0bU0RhKvYyIm4H/euKq6ZMNlQiaE97Vj1udqpLJ02XBLRLJRGEn
 ZF4wXK1IbFVuSaPcMckPZiMnSHPdV49XFiOVG3r6EPOhJLPqvfMdqFq9Nsut8dXaAnlW
 x+YnUoLT7iVgpPGmI+ubLGCfrwqr8rauXLEY8vPVId5lVMTX2W/erUfb0vldzvBILNrm
 gwCLtnMIbgIWf55zjchLIOLc3vGkA97gypYj8SJbbQ7jR00jm1RULeubHDYiinAKX+ef
 ZsQStnKq0bcu8UMFmgRxo1+JWdh4a35cpX8ZZh4/oQiycExxGEUIaRpLMj6OVkNaBW4I
 o/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WdyUBncrOgqQK8UyZLpCx0/I08vn7RmlANTua+8rRzI=;
 b=h26GbKO7kP2wFTGZgIUznLWREFWmsJuODZTVpHN2N7D7EqCaagqznEl2Zig8/WSRqJ
 WcjlpB4PhrbRR6ofnekkIMsZmGhHRNawZi4oQA2cqtao6A5NsyMHuhr9+/M6rFWAlBtB
 17m/sHOGxzOG1BJbKXuGZqqvsq0FmCOJJ9JBBD5FpJj8KRpkPcciY37GO9s2OUuhekuE
 DKeqSveeU4/4zWLE4PDIZg1eODrbP5/IzLsGVFMk4Hv2uj0mIBdxNWTNz/98hPPBMeHQ
 vkbkOj6i143/bzuLGR4CyZoD9zL/71SnvcnhaRPB6o6JkfG0I6HLci6OIiLkecDAXivk
 l2cA==
X-Gm-Message-State: ANoB5pm3bLCzrJ2AbE08wlrKeHNM6gI+NZtajjx9qDMfuwMksJ6Pq1Dk
 KQbycYGyEJbNpRMQp54qt3c=
X-Google-Smtp-Source: AA0mqf4WmEKh8fsdrd84+wOj5qCT6sw6Q7rv7oUzXZgop72YXUDjoFdCoJN94hUk/wnKLNeMXHsifw==
X-Received: by 2002:a5d:6407:0:b0:242:2cb4:6fa2 with SMTP id
 z7-20020a5d6407000000b002422cb46fa2mr10253130wru.31.1670855887578; 
 Mon, 12 Dec 2022 06:38:07 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:a16d:8ab1:4623:169?
 ([2a00:23c5:5785:9a01:a16d:8ab1:4623:169])
 by smtp.gmail.com with ESMTPSA id
 q12-20020adfcd8c000000b0024216d2e386sm9130487wrj.16.2022.12.12.06.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 06:38:07 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e6b1859e-e006-a859-d598-7d75b6c33fd7@xen.org>
Date: Mon, 12 Dec 2022 14:38:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 13/22] i386/xen: implement HYPERVISOR_memory_op
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
 <20221209095612.689243-14-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20221209095612.689243-14-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x430.google.com
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
> Specifically XENMEM_add_to_physmap with space XENMAPSPACE_shared_info to
> allow the guest to set its shared_info page.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Use the xen_overlay device]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   target/i386/trace-events |  1 +
>   target/i386/xen.c        | 59 +++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 59 insertions(+), 1 deletion(-)
>
[snip]
> +static bool kvm_xen_hcall_memory_op(struct kvm_xen_exit *exit,
> +                                   int cmd, uint64_t arg, X86CPU *cpu)
> +{
> +    CPUState *cs = CPU(cpu);
> +    int err = 0;
> +
> +    switch (cmd) {
> +    case XENMEM_add_to_physmap: {
> +            struct xen_add_to_physmap xatp;
> +
> +            err = kvm_copy_from_gva(cs, arg, &xatp, sizeof(xatp));
> +            if (err) {
> +                break;
> +            }
> +
> +            switch (xatp.space) {
> +            case XENMAPSPACE_shared_info:
> +                break;
> +            default:
> +                err = -ENOSYS;
> +                break;

Don't you want to return false here?

   Paul

> +            }
> +
> +            err = xen_set_shared_info(cs, xatp.gpfn);
> +            break;
> +         }
> +
> +    default:
> +            return false;
> +    }
> +
> +    exit->u.hcall.result = err;
> +    return true;
> +}
> +


