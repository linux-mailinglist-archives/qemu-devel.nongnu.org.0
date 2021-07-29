Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2983D9F18
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:03:10 +0200 (CEST)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m910X-0005Ry-Nc
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:03:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m90yx-0004cR-P4
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m90yu-0001fp-Ov
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627545687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQNv1hB4X15649c3CwWDEaVKUrC3iK2xpEZFH5PDqMY=;
 b=TRvwrytuGgPpvh27p6nn05JqvjKJj98VsKXqU+ppqbCChsKnpjulwUd1EzlIFR5XvnsVMS
 JkFbD0q9Rwy1BVt3unhCtxceJaqhK2QJP045919S16c4vpz3sEGNMcJC2Zp07SViDj6dGm
 FYyJZjaJA4JvCxyN/1oQcY/Xdh+QY7g=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-AVG33j1lOs6_V8w0Fdpd8w-1; Thu, 29 Jul 2021 04:01:25 -0400
X-MC-Unique: AVG33j1lOs6_V8w0Fdpd8w-1
Received: by mail-ej1-f71.google.com with SMTP id
 kq12-20020a170906abccb0290591922761bdso412955ejb.7
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 01:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UQNv1hB4X15649c3CwWDEaVKUrC3iK2xpEZFH5PDqMY=;
 b=bhHLJ02UJi2KN4Qba8AI5JBUVj91F07qVWTI24mPDbnTJvJ+3L5yXAU+4GyCeF3VPT
 S7pt+7ZSHTZOkelIsL6V4Mx41dbzM0InoHrPx5To+hhLsKvGs1hOYeyZGq8PENHKHEvE
 CcyTbQ2JgkZasI3iilrBjYfD26VSPOKa3rMwu2LnkXTwkOtBSX3AVH2TlG8Uh5E7lncm
 ZnnShJj+AUAEvPZ7rILLJG2gmyCmlQkx4VVS5k7kWezRW3iJCUFmToXsMj+HaELTgLJ/
 bsElFWh9XRJnYp4jQqsudzrw9H5KIScGQplpxVOc72Dt6RzmLgs2jcgvSwt6UZOMKbK2
 IWNg==
X-Gm-Message-State: AOAM532vyLse9ZiCzQFj1pAaNBDZVcd33gfehAhqut8WGQVZ7QEFul6Z
 wNetvAnqjL9gpF+OXdUMe6ULp5eT5JXq0WsMg0ibsf0lLXNhdjMbevK6NO8ed1gP0flPEHnabst
 j5/fa84VGVgGxSqN/iSdRNA3tTSG//4sz4i7BWEv5GYn1x6fcu7lO96S1ZDf6rgeEkb4=
X-Received: by 2002:a05:6402:78f:: with SMTP id
 d15mr4517078edy.233.1627545684462; 
 Thu, 29 Jul 2021 01:01:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhwiPEb/LnbEFjDf9QJeBVL0oqmlvklVkm6t4CdQJvSLDgUppznO9RjKSqVVNcGaP4IhwT8w==
X-Received: by 2002:a05:6402:78f:: with SMTP id
 d15mr4517055edy.233.1627545684255; 
 Thu, 29 Jul 2021 01:01:24 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id i10sm853310edf.12.2021.07.29.01.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 01:01:23 -0700 (PDT)
Subject: Re: [PATCH v2] target/i386: Added VGIF feature
To: Lara Lazier <laramglazier@gmail.com>, qemu-devel@nongnu.org
References: <20210728113742.41464-1-laramglazier@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1c07bcfd-b240-92ef-03b9-a87d6deff61c@redhat.com>
Date: Thu, 29 Jul 2021 10:01:22 +0200
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> +    uint32_t int_ctl = x86_ldl_phys(cs,
> +                       env->vm_vmcb + offsetof(struct vmcb, control.int_ctl));
> +    if (virtual_gif_enabled(env, int_ctl) && likely(env->hflags & HF_GUEST_MASK)) {
> +        x86_stl_phys(cs, env->vm_vmcb + offsetof(struct vmcb, control.int_ctl),
> +                        int_ctl & ~V_GIF_MASK);
> +    } else {

Sorry for the double reply.  env->vm_vmcb is not guaranteed to be valid 
if not in guest mode, so there are two possibilities.

1) Keep the HF_GUEST_MASK check directly in the helpers, but do it 
before x86_ldl_phys

2) Move x86_ldl_phys to virtual_gif_enabled, with a prototype like

bool virtual_gif_enabled(CPUX86State *env, uint32_t *int_ctl)

i.e. returning int_ctl from virtual_gif_enabled via pass-by-reference.

Thanks,

Paolo


