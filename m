Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859194087AB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 10:58:18 +0200 (CEST)
Received: from localhost ([::1]:36008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPhn6-0002Vh-Hg
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 04:58:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPhje-0008JC-KH
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mPhjb-0001UX-4D
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 04:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631523277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5hFUVs24VYsA3vfOE9B0IObPKU5ObfXxWNqtDFASms=;
 b=BkwcIzGhDBZHOZWM+vlPjbFydQKY9x8Nb/oSDGmk+MGyyKTlDkoIbWNoKYmn1ooB5vsUuE
 5AAxAWpDE3PUshw1l6gsfy4+D88MX8JcQRuoT9MNq1zc1xHc14hrTZ+40GIi2K60nC46/E
 4CeH2Yj7e2SCjcQE32DlQeC4cSTFLLE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-Ubjlf10SP0WmxqiO-Z46PQ-1; Mon, 13 Sep 2021 04:54:36 -0400
X-MC-Unique: Ubjlf10SP0WmxqiO-Z46PQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 a144-20020a1c7f96000000b002fee1aceb6dso4627602wmd.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 01:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E5hFUVs24VYsA3vfOE9B0IObPKU5ObfXxWNqtDFASms=;
 b=RluFjPA0zisQsuwSETLtpbjRCsUH5rONwaccO6/D2DnB7yjeQAz/2rV+3Vcu0a/Gch
 IjohvwdwaDVB3zrMxBLeDWHaQaRpG0oqXIVCu8p9U3zchITXl16z5V+OJvd6NJsYSfKn
 A8minqpjm/C+k0dvTCxYNZHFymiZS75bABXQTivaLF3tUgiHQc09DwITqcDw5hLKYmit
 8+CJDP+gkGDoW8yw39lEHOXVpw5aBfvbOw2Ty0RWsoOcCcRD8KfSSg30DsWEg6X2UeGX
 zKFoqJRWcpgzqLkbOsRWjBYi7XEsgXsKvnzzJKCDXKXHH+89oamKkG74j367s0etLDl5
 x8gQ==
X-Gm-Message-State: AOAM532vpCcRNXC9M7LEFuYUsTfeFuQSfAPawLnsVWaaMld36VdAIANi
 zKIJVpKwXvYD9s18EWbT3JKewaEN5mB8Jn96Ow7xlZA954t3oLkGx8X18AlZH43TzLFoQzNBskR
 qqFZ6dSa53mDcYbQ=
X-Received: by 2002:a5d:5003:: with SMTP id e3mr11423659wrt.118.1631523275219; 
 Mon, 13 Sep 2021 01:54:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwd52IvSzE2LGi0bn3TSLdTsYZ3hjKXx3A8BNT3zpLp0qj/YrMQul+odQ7FvLbucFjIqedlw==
X-Received: by 2002:a5d:5003:: with SMTP id e3mr11423647wrt.118.1631523275029; 
 Mon, 13 Sep 2021 01:54:35 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id d24sm6223556wmb.35.2021.09.13.01.54.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 01:54:34 -0700 (PDT)
Subject: Re: [PATCH v9 06/11] hvf: arm: Implement -cpu host
To: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-7-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3a43615c-4367-86f0-f226-2be6eafad3cd@redhat.com>
Date: Mon, 13 Sep 2021 10:54:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912230757.41096-7-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.584, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm <qemu-arm@nongnu.org>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/21 1:07 AM, Alexander Graf wrote:
> Now that we have working system register sync, we push more target CPU
> properties into the virtual machine. That might be useful in some
> situations, but is not the typical case that users want.
> 
> So let's add a -cpu host option that allows them to explicitly pass all
> CPU capabilities of their host CPU into the guest.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Reviewed-by: Sergio Lopez <slp@redhat.com>

> ---
>  target/arm/cpu.c     |  9 ++++--
>  target/arm/cpu.h     |  2 ++
>  target/arm/hvf/hvf.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/hvf_arm.h | 19 +++++++++++
>  target/arm/kvm_arm.h |  2 --
>  5 files changed, 104 insertions(+), 4 deletions(-)
>  create mode 100644 target/arm/hvf_arm.h
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c

> @@ -2058,15 +2059,19 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>  #endif /* CONFIG_TCG */
>  }
>  
> -#ifdef CONFIG_KVM
> +#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>  static void arm_host_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
>  
> +#ifdef CONFIG_KVM
>      kvm_arm_set_cpu_features_from_host(cpu);
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>          aarch64_add_sve_properties(obj);
>      }
> +#else
> +    hvf_arm_set_cpu_features_from_host(cpu);
> +#endif

Could be cleaner as ARMCPUClass::set_cpu_features_from_host()?


