Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173DA2F1DB3
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 19:14:42 +0100 (CET)
Received: from localhost ([::1]:51868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz1iD-0000Oa-6y
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 13:14:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kz1h9-0008BC-QT
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:13:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kz1h8-0000EC-2f
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 13:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610388813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XMVqNDXhVBfgYasHU7WbnA7Bzjgx7oMA1MPdLnO9iGY=;
 b=da3GkfOm6GMoaiz5WVWzRS0sYGhskBOlPsIbzLJNGSpxnI8SoznC5jlPoS915J0Zl/S7Ql
 Ykxwaat5q1wYWaKp6YgXgvc1k0F9FxBtY2Xuhlnfpcq68B1WbScWeZIRQzGneakb7AviO3
 S05Gs86QrCm8EVmxTm8E+aCMyxGcXns=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-52QmIf3aOSqjLDm-xfYpdQ-1; Mon, 11 Jan 2021 13:13:31 -0500
X-MC-Unique: 52QmIf3aOSqjLDm-xfYpdQ-1
Received: by mail-ej1-f69.google.com with SMTP id m4so224398ejc.14
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 10:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XMVqNDXhVBfgYasHU7WbnA7Bzjgx7oMA1MPdLnO9iGY=;
 b=AaxsaTQWfrQ0kU9Me3xhUy08Ek+FjF2+KNSbCOY3CkXsrqUVxrG7MyznQAYMs2uZwT
 84ACmHpiPCnhwZ0KJnZ612QaUma+HOt1v3M1qPDxoiRSJqIGUp6SSiLaZx5MhCmJZk4m
 q2/yOb+H69NwuUENMadgEON8cyd3hAjkmOKL5yPxdTu+05oZQ4rXAG4lNYVEaDmhV5+F
 +lN+m6OQWGIE8nB/vWYjbZyhCznlmKhG8F6g1su/wsOO+crbrmpN+pgbWioL7/S5u2up
 EyY47Y4MVeGfM2+K58QNNFV0ANmq3D1tGxQWDRvTnmcCPLzf/gYj511E03jpz1AfmqXZ
 qSvw==
X-Gm-Message-State: AOAM533zr41VHIGQUiFDc/7j25+2aKxn386GyyHzpW/yvlbWdyZeCeIN
 gyzlUftYSUh+TNrbzwVeNaz+4MaVMIF/6u18SrqHBHd+UweD+oS69EvooxReRf6LLanRo3t+a/M
 zbsl7f6fqDqhKvZ0=
X-Received: by 2002:a17:906:234d:: with SMTP id
 m13mr507841eja.270.1610388810463; 
 Mon, 11 Jan 2021 10:13:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2VUws8bJTsf90eDubNx6PHzyPCAFdFVEZ+6itmXCzLLMigPo9Pqp3tf2gYBxIpCha9PLMow==
X-Received: by 2002:a17:906:234d:: with SMTP id
 m13mr507825eja.270.1610388810318; 
 Mon, 11 Jan 2021 10:13:30 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id h12sm137927eja.113.2021.01.11.10.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 10:13:29 -0800 (PST)
Subject: Re: [for-6.0 v5 06/13] securable guest memory: Decouple
 kvm_memcrypt_*() helpers from KVM
To: David Gibson <david@gibson.dropbear.id.au>, pair@us.ibm.com,
 pbonzini@redhat.com, frankja@linux.ibm.com, brijesh.singh@amd.com,
 dgilbert@redhat.com, qemu-devel@nongnu.org
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-7-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e8c1f2a7-e5b9-8181-2c7b-0287699ac9c9@redhat.com>
Date: Mon, 11 Jan 2021 19:13:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201204054415.579042-7-david@gibson.dropbear.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: thuth@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, mdroth@linux.vnet.ibm.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, david@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 6:44 AM, David Gibson wrote:
> The kvm_memcrypt_enabled() and kvm_memcrypt_encrypt_data() helper functions
> don't conceptually have any connection to KVM (although it's not possible
> in practice to use them without it).
> 
> They also rely on looking at the global KVMState.  But the same information
> is available from the machine, and the only existing callers have natural
> access to the machine state.
> 
> Therefore, move and rename them to helpers in securable-guest-memory.h,
> taking an explicit machine parameter.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/kvm/kvm-all.c                   | 27 --------------------
>  accel/stubs/kvm-stub.c                | 10 --------
>  hw/i386/pc_sysfw.c                    |  6 +++--
>  include/exec/securable-guest-memory.h | 36 +++++++++++++++++++++++++++
>  include/sysemu/kvm.h                  | 17 -------------
>  5 files changed, 40 insertions(+), 56 deletions(-)
...

> +static inline int securable_guest_memory_encrypt(MachineState *machine,
> +                                              uint8_t *ptr, uint64_t len)
> +{
> +    SecurableGuestMemory *sgm = machine->sgm;
> +
> +    if (sgm) {
> +        SecurableGuestMemoryClass *sgmc = SECURABLE_GUEST_MEMORY_GET_CLASS(sgm);
> +
> +        if (sgmc->encrypt_data) {

Can this ever happen? Maybe use assert(sgmc->encrypt_data) instead?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +            return sgmc->encrypt_data(sgm, ptr, len);
> +        }
> +    }
> +
> +    return 1;
> +}


