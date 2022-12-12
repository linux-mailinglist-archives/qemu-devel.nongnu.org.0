Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8224D64A593
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 18:09:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4mHX-0005CZ-Av; Mon, 12 Dec 2022 12:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4mHP-00058C-34
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:07:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4mHN-0006sL-CT
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 12:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670864868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P12ADqQq6CsvXOERp9a6ENzvMlVG+UkKTZf5tWlsc+A=;
 b=NT2/clbMM2I4d11Bsn3LMnIDVN7nPH6CgVnA3gYiJRZv5ABjydvF5F40UKIIcgcv/SVjE/
 5wRAqwV20PFhBsNWElzfwsHTYRS/u1bIyVxhMGKI0sns5LrpMQbNJQisMSXfV1uGNJUScH
 eBiAsHrdnkjilv1ZC9f8vWFX5pw6oRo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-97-p9Ghzz0FMheFc-n_f9NVOQ-1; Mon, 12 Dec 2022 12:07:46 -0500
X-MC-Unique: p9Ghzz0FMheFc-n_f9NVOQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d6-20020adfa346000000b0024211c0f988so2383296wrb.9
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 09:07:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P12ADqQq6CsvXOERp9a6ENzvMlVG+UkKTZf5tWlsc+A=;
 b=zBxv4ESL0vr/zIwRdDFaxnP1BVydZkhMo5pqZoFn74qfusSKKULYaDoQYETob04Jmk
 JIlRzMFtzLgfXdoHxzaNAu92viTIjWqEBcy9HF3EUgU7/X+KdxZQP5VjbvUVCnKrOgCz
 iS+jR6v2sdq1wcDjK7WqtcCqk0Pw3SaDp5Pfg7+88w8+8Ci9b+eLjvNceT9zH/REEiVS
 DGku/k5HKgPQ9HsOKFC/tjDwcvP5H20wHMI0AmO5IQ6rH+seMrJzoQRUm92rORTKaGqv
 l2BTWQsMrs1UMj79PHec45OeebWRlQghHkoP3E4A6vD7a86JKthC14ANdJAmu5BRUcNt
 broA==
X-Gm-Message-State: ANoB5pmzA1BzPPotdhe3HEip6J8vvHTmNNr0tECcrUwGENaio2stlTRy
 mH+NtRdzQAqUrGqdvyRql9YldKMJKvgylfn1gCJ06xfGFECF36+n5D4lbhyT9iGaMVO+wmwwDgO
 RwETUX8glg1Vv0/g=
X-Received: by 2002:a5d:5187:0:b0:242:9e8:84b6 with SMTP id
 k7-20020a5d5187000000b0024209e884b6mr10380220wrv.13.1670864865908; 
 Mon, 12 Dec 2022 09:07:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf62izvnxad7JQFik0TjhDbu+jSNrRvAX/WRbOiY0QdG7aBoN5voD67zoIulhOD+ur1SbEOYjw==
X-Received: by 2002:a5d:5187:0:b0:242:9e8:84b6 with SMTP id
 k7-20020a5d5187000000b0024209e884b6mr10380210wrv.13.1670864865727; 
 Mon, 12 Dec 2022 09:07:45 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 b4-20020a5d4b84000000b00236c1f2cecesm11379287wrt.81.2022.12.12.09.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 09:07:45 -0800 (PST)
Message-ID: <9379ed84-2ef1-5c3c-25e3-84cb909eccfe@redhat.com>
Date: Mon, 12 Dec 2022 18:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v2 10/22] i386/xen: handle guest hypercalls
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-11-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221209095612.689243-11-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/9/22 10:56, David Woodhouse wrote:
> +static bool __kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)

No double underscores in userspace.

> +{
> +    uint16_t code = exit->u.hcall.input;
> +
> +    if (exit->u.hcall.cpl > 0) {
> +        exit->u.hcall.result = -EPERM;
> +        return true;
> +    }
> +
> +    switch (code) {
> +    default:
> +        return false;
> +    }
> +}
> +
> +int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit)

BTW, please name this file either target/i386/xen-emu.c or 
target/i386/kvm/xen-emu.c (probably the latter is better, since XEN_EMU 
depends on KVM.)

Paolo


