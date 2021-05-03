Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5738371E6A
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:22:15 +0200 (CEST)
Received: from localhost ([::1]:35726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcGs-0001AN-Rf
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldc44-00075m-9B
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ldc42-0001qK-Kg
 for qemu-devel@nongnu.org; Mon, 03 May 2021 13:09:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620061738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gd+BN3ry12W4r407xGPmdPjm+fUGkvw1phyihUkoEvg=;
 b=jJFwn51KqqAgbP/xTPr5aEdEm4G3NR4UBTzpm6JLr+RBRrP1dKs699TncP3iZglEt5OKhl
 RatkI1eA8SgUnnf0e/oRb3a9iSOnaQjNtpJUlWp5eGvdj0tvad7v7p+re94vwaiVqsUtY7
 JEOLqq56bFwVXIEo02EOI7U2zLDra6k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-u9jSlnxBON2GdxgLPvWvbw-1; Mon, 03 May 2021 13:08:56 -0400
X-MC-Unique: u9jSlnxBON2GdxgLPvWvbw-1
Received: by mail-ed1-f69.google.com with SMTP id
 w20-20020aa7dcd40000b02903886b9b0013so4915850edu.22
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 10:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Gd+BN3ry12W4r407xGPmdPjm+fUGkvw1phyihUkoEvg=;
 b=POgYoZF7wtEBT2dtl8pbKbJ0kQgWgaexozEV6myUt+iBhr8gjN7V78YC/ev/YRboEg
 ec0cCLXsxcnAcO/fKFtWj2O6k9yBWuNiwHw/lmtU/VxEVzJkHJxfUdpCQ9/E7RjxfzoP
 h7QQwLGY1xhyCa2osmEZIsE0tcmHtQhcIZ284wIYvXFI+mWEmrJUgkEy7nvq7o16YK0z
 TFYwaEjxyvAmYKVM2+IhMhVDtiDSbktxOg6RvJ3L1JutZvwILcEMMRn0jvm19iuBA7gX
 XJyngbTdW2TcZKs6O5idZIrkhv+rIxvZtoHamBQ5XAOiAzlxhfHRR6hC4K/9PFYKu9JP
 du0g==
X-Gm-Message-State: AOAM533n1VChVe0ywYZI0D4zeWYy2aiAWM9IZv+eKgQ51AdNu1LxcRna
 tL7AFyoBDPU4FxWpZ43RWfYdF/N5PSf2KmwRkg9CjD/+hMgRirjdTInrQgg3pnrYGd9J59jgcvl
 rSjlqmBRABOQWe4s=
X-Received: by 2002:a17:906:7209:: with SMTP id
 m9mr18018891ejk.223.1620061735206; 
 Mon, 03 May 2021 10:08:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykytOHaZNFsvntby+lzG8sUGEc9LBgs+oFBSHxfp0WAOGxtEv6lsKCPhLCo1sR7wtQ+xuEjQ==
X-Received: by 2002:a17:906:7209:: with SMTP id
 m9mr18018786ejk.223.1620061733970; 
 Mon, 03 May 2021 10:08:53 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x7sm12980255eds.11.2021.05.03.10.08.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 10:08:53 -0700 (PDT)
Subject: Re: [RESEND PATCH 05/32] vl: Add "sgx-epc" option to expose SGX EPC
 sections to guest
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210430062455.8117-1-yang.zhong@intel.com>
 <20210430062455.8117-6-yang.zhong@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d772cdd1-69fa-b48f-b8ff-c07cd383b04e@redhat.com>
Date: Mon, 3 May 2021 19:08:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430062455.8117-6-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: seanjc@google.com, kai.huang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/04/21 08:24, Yang Zhong wrote:
> +void pc_machine_init_sgx_epc(PCMachineState *pcms)
> +{
> +    SGXEPCState *sgx_epc;
> +    X86MachineState *x86ms = X86_MACHINE(pcms);
> +
> +    sgx_epc = g_malloc0(sizeof(*sgx_epc));
> +    pcms->sgx_epc = sgx_epc;
> +
> +    sgx_epc->base = 0x100000000ULL + x86ms->above_4g_mem_size;
> +
> +    memory_region_init(&sgx_epc->mr, OBJECT(pcms), "sgx-epc", UINT64_MAX);
> +    memory_region_add_subregion(get_system_memory(), sgx_epc->base,
> +                                &sgx_epc->mr);
> +
> +    qemu_opts_foreach(qemu_find_opts("sgx-epc"), sgx_epc_init_func, NULL,
> +                      &error_fatal);
> +
> +    if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
> +        error_report("Size of all 'sgx-epc' =0x%"PRIu64" causes EPC to wrap",
> +                     sgx_epc->size);
> +        exit(EXIT_FAILURE);

Or perhaps even drop completely the options and just do "-device 
sgx-epc,backend=epc1"?

Paolo


