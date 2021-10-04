Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBB420748
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:26:23 +0200 (CEST)
Received: from localhost ([::1]:59058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJIk-0008HW-II
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:26:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXIzO-0007i5-LX
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXIzM-0004M5-6g
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633334778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NaecXq8hUt75hzJc1rXTl5u5ap4zeFZ5kxrq2jxmrrw=;
 b=FJ0kgKS8Q1XhAoBeIL4tUl7EcT8ztwR/RYXP+z340NhOTuR+xJSIPNKZ0HeOxw5R1F/7rw
 P+PVUdmjceKd5IdnyXyzqEVDR/VydI7yToHqvDjXra9R4QzyKfa5Ecr1JXhiVbxa41dAcS
 tpKIwiI7FLjc33dvYgXXKsWaSWpseIs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-VSRNbkAkNFyMMTzZq3FsmQ-1; Mon, 04 Oct 2021 04:06:15 -0400
X-MC-Unique: VSRNbkAkNFyMMTzZq3FsmQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 d23-20020a50f697000000b003daf215e1efso2018584edn.23
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NaecXq8hUt75hzJc1rXTl5u5ap4zeFZ5kxrq2jxmrrw=;
 b=Se0qVaEfrgvwQ8fw6c7wnRFNjn9rfDGJUBYG+qe4Ut+ERghU7nzs20J/hBAM0f7GBG
 XjyueScFxqZnuG12xUrPFjIh1XC+x4hMjBDFb6gJTYgF664bjwcSP5KV/drQnnJ9kv30
 P5b22W5BZOhdUgTGYObwASFxQ3XO94fevPgfr0Z067Ue/ph1BNEkXcCHilFAsDRPRdHU
 pITUJ1xIcVHS5m/HH/+mzpYyTnCIxUCJQ53EJDVpsv04BhTUC5QDA2TuXrpJjBmO2C9g
 Y0jRhPXvYPDQgMws6ZoGajTUrYFC33kWOb8Yt12/G8TWNvO20yZmjfcWndHjGN+gTXjI
 u3Yw==
X-Gm-Message-State: AOAM5327Wcj6PKrd8xKt9pRZk2iTu3I3yYI5+SKrtA4j13xmog7ZoSe5
 hjy1YeaRepw2IFg43Ja9pQ6Rc+uuP0jdBfgQj1TowMnSBJGmQq/95sRALznSuGiUo1CpKooFWA7
 rOKODfyV1Wr1d0ww=
X-Received: by 2002:aa7:d802:: with SMTP id v2mr13077968edq.271.1633334774260; 
 Mon, 04 Oct 2021 01:06:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRap4GsemYDe+jkC9FNA31zg4spvFSlq5R7Ec4FD2PjRhZOOGlg+Xoy68MiO2XlqhngDUFZA==
X-Received: by 2002:aa7:d802:: with SMTP id v2mr13077946edq.271.1633334774074; 
 Mon, 04 Oct 2021 01:06:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id j3sm1933542ejy.65.2021.10.04.01.06.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:06:13 -0700 (PDT)
Message-ID: <66641be2-04c7-7c48-1ba9-46efff6f84da@redhat.com>
Date: Mon, 4 Oct 2021 10:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 03/22] target/i386/kvm: Introduce i386_softmmu_kvm
 Meson source set
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-4-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/10/21 14:52, Philippe Mathieu-Daudé wrote:
> Introduce the i386_softmmu_kvm Meson source set to be able to
> add features dependent on CONFIG_KVM.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   target/i386/kvm/meson.build | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
> index 0a533411cab..b1c76957c76 100644
> --- a/target/i386/kvm/meson.build
> +++ b/target/i386/kvm/meson.build
> @@ -1,8 +1,12 @@
>   i386_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
>   
> -i386_softmmu_ss.add(when: 'CONFIG_KVM', if_true: files(
> +i386_softmmu_kvm_ss = ss.source_set()
> +
> +i386_softmmu_kvm_ss.add(files(
>     'kvm.c',
>     'kvm-cpu.c',
>   ))
>   
>   i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
> +
> +i386_softmmu_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


