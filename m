Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F6066C846
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 17:37:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHSTO-0008CD-TZ; Mon, 16 Jan 2023 11:36:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHSTM-0008Bx-Vy
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:36:37 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pHSTL-00036y-3Q
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 11:36:36 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 h12-20020a05600c314c00b003da50afcb33so4064019wmo.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EF298z8dTNKQred1oJjmsY04jhdPKq20HE7AcwqH33A=;
 b=ocsY3WWVnFOYL6BnhpABoM7yw4AcB7X6GBil1PyahtE16LHBEylvNnURwXn67iD4P3
 ULHMObNjd113F8h1pqH7G6zkAvFPp4trF0IYPbEJehj4AL7NcBo3dDdua77x6y41bUDx
 gLiVso+7aimCic1B3+AbgeGS73z9JQAYJy+l7rHM+sDEh1k9Jt0hr+QvrZlAWrcQ34x9
 iw0vhjwVP+EHWBKCsGyZDun7AvZxtt1S51e1nBQfEeRlZj5G/ftKxNHgqcPpAMiVYiLg
 jP8CqMO3RmaZxcLZDfrMv1ldkSuPUMRT6BwevCp/kOShl3J4WdnSYnmfhYUxGEBJ4isZ
 E8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EF298z8dTNKQred1oJjmsY04jhdPKq20HE7AcwqH33A=;
 b=jEKPIQQPP9e5r87+VG5+8xcGgsF6bQcWYRIwwNgcJ2HzUfLVWg1LcMnYPkPV33cYuS
 3mv8deLIY2ItS5D2dQDPwCiCn1qhJkkDPbGML4QIaRDPLDF5OlLo6CFslj6yUI2pU3Ho
 zgEZ9ZwdbvpZtG0Nyw+9RMEDF4dsURXW9rgvs/HBYCK7VBea43ySRsoXpYEg/KFDOWsA
 QPjy8XVz6mKcjVsf6/BvbecsE9pxTuS8jE5bsxZc4Kzq5aou89UVjsDI0XuL6QjXXny8
 EgB8VQvL7i1KYlKVgPQuomaZwqAZFAnegMJMqy6NiFndcwIoba+5wBmRgTVZF6pl1yoB
 FqeA==
X-Gm-Message-State: AFqh2kpKVzZi6HlImgslZy7uOB4mLfsc0l7my1LiTDO3nspumtozaSOJ
 2/be22st2PtBpm6isbG2e0hqPgqE5UPF1A==
X-Google-Smtp-Source: AMrXdXuFs8HE6x4L6gVTCgmfXL+sM7dpRgjdNJkWYCqM4yimh2VN6iQL9CuQvX6+c31krVMq5KP/zw==
X-Received: by 2002:a05:600c:33a8:b0:3d9:ed3b:5b3e with SMTP id
 o40-20020a05600c33a800b003d9ed3b5b3emr112548wmp.19.1673886993472; 
 Mon, 16 Jan 2023 08:36:33 -0800 (PST)
Received: from [192.168.6.176] (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id
 s18-20020adfecd2000000b002bdfcd8c77csm4507833wro.101.2023.01.16.08.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 08:36:33 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e50250ab-feee-1c11-df8f-478d1314600a@xen.org>
Date: Mon, 16 Jan 2023 16:36:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 12/51] i386/xen: Implement SCHEDOP_poll and
 SCHEDOP_yield
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>
References: <20230110122042.1562155-1-dwmw2@infradead.org>
 <20230110122042.1562155-13-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230110122042.1562155-13-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=xadimgnik@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/01/2023 12:20, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> They both do the same thing and just call sched_yield. This is enough to
> stop the Linux guest panicking when running on a host kernel which doesn't
> intercept SCHEDOP_poll and lets it reach userspace.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Paul Durrant <paul@xen.org>

... with some observations...

> ---
>   target/i386/kvm/xen-emu.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
> index 5f2b55ef10..80005ea527 100644
> --- a/target/i386/kvm/xen-emu.c
> +++ b/target/i386/kvm/xen-emu.c
> @@ -227,6 +227,18 @@ static bool kvm_xen_hcall_sched_op(struct kvm_xen_exit *exit, X86CPU *cpu,
>           err = schedop_shutdown(cs, arg);
>           break;
>   
> +    case SCHEDOP_poll:
> +        /*
> +         * Linux will panic if this doesn't work. Just yield; it's not
> +         * worth overthinking it because wWith event channel handling

Typo 'wWith'. Also possibly worth mentioning that the reason a yield is 
ok is because the semantics of the hypercall allow for spurious wake-up.

> +         * in KVM, the kernel will intercept this and it will never
> +         * reach QEMU anyway.
> +         */
> +    case SCHEDOP_yield:
> +        sched_yield();
> +        err = 0;
> +        break;
> +
>       default:
>           return false;
>       }


