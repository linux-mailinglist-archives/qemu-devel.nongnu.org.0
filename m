Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729703D9F14
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:00:07 +0200 (CEST)
Received: from localhost ([::1]:58606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90xV-0003f1-Af
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:00:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m90wd-0002ym-Ro
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m90wc-0008HY-C8
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627545545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dfst6QK9vLfrARuP6vrTtOOdVzart9vXTvA4a0MdZgQ=;
 b=Z+ZMR7FGKDJwH98H9JtjZIb66rIQ8rP76UYGoH/tkFhWIHkc5G7h90XmDqLL6oOQXAHdcB
 n1h7rjQso4NZ32I7/cuRSd0tm14Ppl6sA5kB8M6eGVL4HdNArXWDghFZE4JPNCIoaCLaWg
 EqzvPBJXkqRZWJy9+nZj+iN43HuhDx4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-LoxmamtRPyae7XxkzzlO1Q-1; Thu, 29 Jul 2021 03:59:04 -0400
X-MC-Unique: LoxmamtRPyae7XxkzzlO1Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 r21-20020a1709067055b02904be5f536463so1712178ejj.0
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 00:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dfst6QK9vLfrARuP6vrTtOOdVzart9vXTvA4a0MdZgQ=;
 b=lWubJm+D0FoLY33RizUnoO8cP/MoejrH7H6lNxuJ/mgx1yr6QuHMAXDtAKUZohygYX
 m+Vi++KOhGH6wTu2HfQ/y231m7z0kkzUUs7q8maDFIEXDPCbNqkKBkrmvmkoPtpSXtUe
 M8JrNOjWfoNcegIpGWdbnva3BRLvEHP2ng752KAw//5ocBP2ydaXzTKf8GmgFEvKgGFy
 UBqgYr7W5u9ybqfggxa/6BhptfkaDPca4Whx3KF8zzSZV9nMLCmgDml58CN+kSTYtn3F
 VCGbkJS9QYWza6W16I8X1mDH2ma/d51GMRQjAQ34P2zJBhltosnq99fipL84weU2wFCa
 3ehw==
X-Gm-Message-State: AOAM533rKS56VTPqrpHpaOCsYPbd1x2K/meqnk+i0JpiKMRtKWzNSqcb
 OG0ytprMNYzHmPV/pLFizi/4msJGrVRrRJAUXdkmgXqioT2vFQLmYOuWHQd7YW/ieIbokbwYPkt
 NmOU9rgT7sA7uNGrRcRLUumUXPBkBmiDDOsBVIiIySfKoKdf3+kTEBZ1cDFHhhk2LgGA=
X-Received: by 2002:a17:906:4a59:: with SMTP id
 a25mr3401888ejv.483.1627545542593; 
 Thu, 29 Jul 2021 00:59:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAS3s32Cmn8gN8f2WsIoX9S8jjgQO9174c/CcxTMZaQzSgR1eOpVf6ITRiV+MQjmFulsjH5Q==
X-Received: by 2002:a17:906:4a59:: with SMTP id
 a25mr3401869ejv.483.1627545542297; 
 Thu, 29 Jul 2021 00:59:02 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id e27sm682590ejc.41.2021.07.29.00.59.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 00:59:01 -0700 (PDT)
Subject: Re: [PATCH v2] target/i386: Added VGIF feature
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210728113742.41464-1-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a2e00340-0506-4d37-05e2-3cc6f4179d4a@redhat.com>
Date: Thu, 29 Jul 2021 09:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728113742.41464-1-laramglazier@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/07/21 13:37, Lara Lazier wrote:
> +    if (virtual_gif_enabled(env, int_ctl) && likely(env->hflags & HF_GUEST_MASK)) {
> +        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
> +                        int_ctl | V_GIF_MASK);
> +    } else {

I would put the HF_GUEST_MASK check in virtual_gif_enabled.

In fact, the more logical order for the three checks is:

- am I in guest mode? (if not, the VMCB and thus int_ctl is unused)

- is the CPUID bit set? (if not, bit 9 has no effect)

- is bit 9 of int_ctl set?

Thanks,

Paolo


