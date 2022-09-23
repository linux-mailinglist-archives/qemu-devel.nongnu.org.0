Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272A95E81BC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 20:27:46 +0200 (CEST)
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obnOq-0004pl-Oq
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 14:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obnCT-0005ju-Dm
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:14:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1obnCQ-0007LO-HD
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 14:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663956892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xlpsA1hVsAoy9jBxMFE7nv+cMfSPTOZYBG8PCVZGKL8=;
 b=J2jZKhgas5hJ53W/w3TMicvumDl1Yiv1Lm5Q4IMqCewnXpqu4zMWLqG7OPtUtTi+6IfOvx
 zYC1Ng5Xx6BlonZcR3aBtF+LZF+Ix9xQ6DXRcKOcy10PdO3NztlUeZxynLv8LjQwafOMWQ
 mWVKDE+fqkb/MuKxOjeUOXSQ3hO4dB4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-279-yYn6Gur5P_S0YHIyHIOLcw-1; Fri, 23 Sep 2022 14:14:51 -0400
X-MC-Unique: yYn6Gur5P_S0YHIyHIOLcw-1
Received: by mail-wm1-f70.google.com with SMTP id
 62-20020a1c0241000000b003b4922046e5so453407wmc.1
 for <qemu-devel@nongnu.org>; Fri, 23 Sep 2022 11:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xlpsA1hVsAoy9jBxMFE7nv+cMfSPTOZYBG8PCVZGKL8=;
 b=IoD5goJyu2UZcqekxru5LsadaQ6yaPCcdd8kQCo15FB6SzEuYLFRujygM03rnIuMbY
 Lae2fX3UlWTfgruhvhAxd4QilzmyvN0ckjsEswXPv+KkporMVMAEN7ZKgq4v3/xod7Nl
 gfttXmsysTC3cCkVCDz/Nx+O/g77LYEuxhANtlaXCplmSLnlt/XzymiEgDtAxEiKpbex
 KJXzpZXpf/GTltM07rom5Z+CRtNWuXXdIUSKV0RCJMLvNKzcITfV7qgqPPr4YJ6v761x
 6yQXqYuQ5R3dxKETqphnbYVlNWqmp37XZ9oCPRQh8p3v0TKyS7rhyluFg99494wKMxj2
 kQWw==
X-Gm-Message-State: ACrzQf0fhQXo2PUhBJN/EsiwRHZUoE+WrOuk1bWFY10BWy5uwKt34PGR
 h9cKCnb+STeHWrxyoPnO9A3WbKdHyPyIL4Omf2BE1X4MGO7pPITHRHFin8SwK4ea8WX+SOJdGnG
 E1U8EQ12OtRS9a7c=
X-Received: by 2002:adf:f911:0:b0:21e:c0f6:fd26 with SMTP id
 b17-20020adff911000000b0021ec0f6fd26mr5978833wrr.361.1663956889923; 
 Fri, 23 Sep 2022 11:14:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM66NypFqpfKGADDGoJyIEOtRO5ige+1TpLluYDTcbS7M5oV76CxDKtlUBV4OPgiyPPGazx8+Q==
X-Received: by 2002:adf:f911:0:b0:21e:c0f6:fd26 with SMTP id
 b17-20020adff911000000b0021ec0f6fd26mr5978798wrr.361.1663956889503; 
 Fri, 23 Sep 2022 11:14:49 -0700 (PDT)
Received: from [192.168.8.103] (tmo-097-189.customers.d1-online.com.
 [80.187.97.189]) by smtp.gmail.com with ESMTPSA id
 x8-20020adff0c8000000b00228c483128dsm9309204wro.90.2022.09.23.11.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 11:14:48 -0700 (PDT)
Message-ID: <1bfedded-d245-f842-e793-c078fbab8947@redhat.com>
Date: Fri, 23 Sep 2022 20:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v8 3/8] s390x/pci: enable for load/store intepretation
Content-Language: en-US
To: Matthew Rosato <mjrosato@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 farman@linux.ibm.com, pmorel@linux.ibm.com, richard.henderson@linaro.org,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com,
 mst@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20220902172737.170349-1-mjrosato@linux.ibm.com>
 <20220902172737.170349-4-mjrosato@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220902172737.170349-4-mjrosato@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/09/2022 19.27, Matthew Rosato wrote:
> If the ZPCI_OP ioctl reports that is is available and usable, then the
> underlying KVM host will enable load/store intepretation for any guest
> device without a SHM bit in the guest function handle.  For a device that
> will be using interpretation support, ensure the guest function handle
> matches the host function handle; this value is re-checked every time the
> guest issues a SET PCI FN to enable the guest device as it is the only
> opportunity to reflect function handle changes.
> 
> By default, unless interpret=off is specified, interpretation support will
> always be assumed and exploited if the necessary ioctl and features are
> available on the host kernel.  When these are unavailable, we will silently
> revert to the interception model; this allows existing guest configurations
> to work unmodified on hosts with and without zPCI interpretation support,
> allowing QEMU to choose the best support model available.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>   hw/s390x/meson.build            |  1 +
>   hw/s390x/s390-pci-bus.c         | 66 ++++++++++++++++++++++++++++++++-
>   hw/s390x/s390-pci-inst.c        | 16 ++++++++
>   hw/s390x/s390-pci-kvm.c         | 22 +++++++++++
>   include/hw/s390x/s390-pci-bus.h |  1 +
>   include/hw/s390x/s390-pci-kvm.h | 24 ++++++++++++
>   target/s390x/kvm/kvm.c          |  7 ++++
>   target/s390x/kvm/kvm_s390x.h    |  1 +
>   8 files changed, 137 insertions(+), 1 deletion(-)
>   create mode 100644 hw/s390x/s390-pci-kvm.c
>   create mode 100644 include/hw/s390x/s390-pci-kvm.h

Looks sane to me.

Acked-by: Thomas Huth <thuth@redhat.com>


