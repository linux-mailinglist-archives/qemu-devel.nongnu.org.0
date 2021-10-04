Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A438420756
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 10:30:01 +0200 (CEST)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXJMG-0005tg-HC
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 04:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXIzz-0008AD-3a
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mXIzv-0004r6-Kp
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 04:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633334811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJXy9qbxdg2C9dmRq5ZlX/rnrXy4McozWIE5caJXRxA=;
 b=A64NoceB+iQ3Lgj7w++WwIRp9G/gZCNAYxRLOo2yjrsQZ2D1fECK4vrSLJHUtD5faMjIQa
 q9QPWURjXoff843oZ7/TKmccRQC4XlDKN7Bzny4MFOKEhrTrDarmKZxP2ldhSrBCnByDXM
 L6OIyrBgNMc6HuuUKkSpdDF8ZeyUDDI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-KePOCSRrPwyFSbqrSaNd-g-1; Mon, 04 Oct 2021 04:06:50 -0400
X-MC-Unique: KePOCSRrPwyFSbqrSaNd-g-1
Received: by mail-ed1-f70.google.com with SMTP id
 n19-20020a509353000000b003dad185759bso8434340eda.6
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 01:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jJXy9qbxdg2C9dmRq5ZlX/rnrXy4McozWIE5caJXRxA=;
 b=E+0zhfHzpDYAqGwHrx9lNCTsf1/COJs3P8V4JPxK/RCgSabp8jIcOxKmQ1J0UUrTGV
 M8Ok6XYTS0jDnqSYIm068N0s6E7q+HckUmVc6F/rCBufmC3e2mDUubHGYA9Rao+h1Y35
 sy4svbUzfpiEWyVEpNrI832qBt8wviu0A6JhumEeKM/NvzL15ne52ysPiTZxmzKKs6t2
 jBVFhD3gvs2hkqOtlQqt173MVf4LRbi/0fJAxisC5y8/C6kkYsI6ukB2o+Si7o+XPdWd
 xenvpRPbBRxpTBpRGIEb2P5A7RRXc1n3JJf9xqmhDxjj9bn+QF5kZyYcJhWQssx8tCmv
 FxDw==
X-Gm-Message-State: AOAM531wPxTun+GW4R2vayn7duh53cCR5eAc1mZ2Wdw5SYWdwn8Vvkem
 wMiLEHdri3Dm+M6tJzfcZpLtJPNqDYOWmsvE84hErloMfDUX1E4TNx+nJcfub0hsUGEN8kphU6g
 SV0XbeLtm/dG8rRQ=
X-Received: by 2002:a17:906:f243:: with SMTP id
 gy3mr16135275ejb.327.1633334809287; 
 Mon, 04 Oct 2021 01:06:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIdzjTETW0eIAZHOkvEUoCw26rTuKoDHhEwXT7qa+YxQdbudEEtT1b0Ob2PmkGUciWfWArWQ==
X-Received: by 2002:a17:906:f243:: with SMTP id
 gy3mr16135251ejb.327.1633334809109; 
 Mon, 04 Oct 2021 01:06:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z5sm6980558edm.82.2021.10.04.01.06.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 01:06:48 -0700 (PDT)
Message-ID: <6e9b4ea1-177e-00e6-d43a-0d316222be6e@redhat.com>
Date: Mon, 4 Oct 2021 10:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 04/22] target/i386/kvm: Restrict SEV stubs to x86
 architecture
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-5-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211002125317.3418648-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
> SEV is x86-specific, no need to add its stub to other
> architectures. Move the stub file to target/i386/kvm/.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   {accel => target/i386}/kvm/sev-stub.c | 0
>   accel/kvm/meson.build                 | 1 -
>   target/i386/kvm/meson.build           | 2 ++
>   3 files changed, 2 insertions(+), 1 deletion(-)
>   rename {accel => target/i386}/kvm/sev-stub.c (100%)
> 
> diff --git a/accel/kvm/sev-stub.c b/target/i386/kvm/sev-stub.c
> similarity index 100%
> rename from accel/kvm/sev-stub.c
> rename to target/i386/kvm/sev-stub.c
> diff --git a/accel/kvm/meson.build b/accel/kvm/meson.build
> index 8d219bea507..397a1fe1fd1 100644
> --- a/accel/kvm/meson.build
> +++ b/accel/kvm/meson.build
> @@ -3,6 +3,5 @@
>     'kvm-all.c',
>     'kvm-accel-ops.c',
>   ))
> -kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
>   
>   specific_ss.add_all(when: 'CONFIG_KVM', if_true: kvm_ss)
> diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
> index b1c76957c76..736df8b72e3 100644
> --- a/target/i386/kvm/meson.build
> +++ b/target/i386/kvm/meson.build
> @@ -7,6 +7,8 @@
>     'kvm-cpu.c',
>   ))
>   
> +i386_softmmu_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
> +
>   i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
>   
>   i386_softmmu_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


