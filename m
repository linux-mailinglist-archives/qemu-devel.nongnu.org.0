Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6BE6A429B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:27:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdWt-00031b-Pc; Mon, 27 Feb 2023 08:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWdWo-0002vw-4O
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:26:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWdWm-00065O-Jf
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677504411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGqh4Ik+oRbmAsuqw2wIJX12fd2+4f+6hgrcZKwbZPM=;
 b=gn/jkCe7E33Nd5FQmqSGORZYIinHgT+no4gjDbOmYlW9EfAwpq6SfmAQl8KJbpiyMA4pfp
 mQdAMOwDkvXLj37k/djQ2o1inwt+PhFgxFbHXF7VF+gWXMsrAhnuxZamCJUZS/rCHzP58A
 F7Tbq7pKrRtQSkQmPI2mAuqSZOpbKOs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-557-Uh2nqDoZMM2WNqumjMO2ag-1; Mon, 27 Feb 2023 08:26:50 -0500
X-MC-Unique: Uh2nqDoZMM2WNqumjMO2ag-1
Received: by mail-wm1-f69.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so2890479wmj.4
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 05:26:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sGqh4Ik+oRbmAsuqw2wIJX12fd2+4f+6hgrcZKwbZPM=;
 b=dZtMOWWYt66cwldxeuyqbger7itviqjVoa3Ab8/7CXjAS4ca8u9CXivVLiMKSDfLNF
 c+EFrFI77Hudah4H61erC65tGQAbT1gl1S6Z3YZmpz6S+75QcQvfsFROmtOqgxoisqqA
 0z456041UkWKsl5Y+QvCVp5t+DoTVdjAsx2s1JcCgkKyDdPxBE+hWpRqMlguvvq6ZQVZ
 ok0dSLsgj4Jdh7g3+5igJfQ9EMegvWmb7M1S4HmdBvyCTMTe7dPI4hjukKvrB9T+r0Ib
 AsWNO8myw2z0Wja87e5CNPrbrWaA30vXeGSbOmhRqtuUGpD5GxFsoHdUet/mXSxHo4VG
 xSpA==
X-Gm-Message-State: AO0yUKUtXuYDWKBkdbilq8Q45p5lF8qIpTACp/iIoHrcSgxRlJKLYLmd
 N+P6vmAezyD4qttLcGiMV2ljulo8JSGSLTMuB1GUovHD4FJ52MfjeWO2OdjtuHWeyVC61JAQ5Tg
 9zc0eLIfCxgLkPl0=
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac1a with SMTP id
 i48-20020a05600c4b3000b003e2147fac1amr16979589wmp.21.1677504409145; 
 Mon, 27 Feb 2023 05:26:49 -0800 (PST)
X-Google-Smtp-Source: AK7set+1Avf/Yrs1gCObx/1C7m2Kv9QB7PbtYi2lYA8hdBhRrl2VrOlIf0xJ6+wmmfRF04u3VOB9Eg==
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac1a with SMTP id
 i48-20020a05600c4b3000b003e2147fac1amr16979576wmp.21.1677504408926; 
 Mon, 27 Feb 2023 05:26:48 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-150.web.vodafone.de.
 [109.43.176.150]) by smtp.gmail.com with ESMTPSA id
 iz10-20020a05600c554a00b003e2243cfe15sm9095089wmb.39.2023.02.27.05.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 05:26:48 -0800 (PST)
Message-ID: <b90a748c-e56c-840a-e983-6fc608a10e13@redhat.com>
Date: Mon, 27 Feb 2023 14:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v16 07/11] target/s390x/cpu topology: activating CPU
 topology
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-8-pmorel@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230222142105.84700-8-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 22/02/2023 15.21, Pierre Morel wrote:
> The KVM capability KVM_CAP_S390_CPU_TOPOLOGY is used to
> activate the S390_FEAT_CONFIGURATION_TOPOLOGY feature and
> the topology facility in the host CPU model for the guest
> in the case the topology is available in QEMU and in KVM.
> 
> The feature is disabled by default and fenced for SE
> (secure execution).
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>   hw/s390x/cpu-topology.c   | 2 +-
>   target/s390x/cpu_models.c | 1 +
>   target/s390x/kvm/kvm.c    | 9 +++++++++
>   3 files changed, 11 insertions(+), 1 deletion(-)

Maybe s/activating/activate/ in the subject?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


