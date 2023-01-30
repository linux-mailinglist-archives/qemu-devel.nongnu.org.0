Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533CF68079D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 09:41:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMPjO-00064c-RC; Mon, 30 Jan 2023 03:41:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMPjD-0005lv-R6
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:41:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMPj4-0006ue-1u
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 03:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675068076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q/2dH41M5dYn+ulaxDisylLcclPkvOpIAFKPHRwEV7E=;
 b=Gq7QDM9pfR9s2xvpm1BzrA4lTophOiElUeZwgsPzq+dRiKkVbrFvAirCHq2mNIN0tFd9tx
 agHLySHe5Xxy5WhO3Ekko5e8CAO2ip9yEJjvzcm4xl0wt6ac9IXDQM19Ph8X0TFPhom3fU
 pQWgsxEQGFaPUn0qCm3SdBD+KGfuvR8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-459-wz-6LlU4M5eT-49tfI-adA-1; Mon, 30 Jan 2023 03:41:15 -0500
X-MC-Unique: wz-6LlU4M5eT-49tfI-adA-1
Received: by mail-qv1-f69.google.com with SMTP id
 mx2-20020a0562142e0200b0053807f3eb76so5328150qvb.15
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 00:41:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/2dH41M5dYn+ulaxDisylLcclPkvOpIAFKPHRwEV7E=;
 b=IrcuOD7Bxym/9wVeo2khph/p6t1YyuZ7kw194oGQmO72deh41fMUTeTJMkf7BnidbU
 vtwzrSwsZiHqR7XKsLHNA+VYmgC48FuzX7Hjs7k5/YEqNeotusUD7lgCfcoKTd2UXu+P
 5kqb8Sn8+RmkXsjvsdzxbfkhcV2vH1b5gcjbgt0ayQUVZI2/Q4SkANs7RlE3vId1qrWI
 VNNWkgvahUiFuEPSkcmWKqQkPCvWNoGor0mZqpVSm223SkXWhG7YlTtoRRNlzjJfMwLH
 u4EKlgm6EbVCVUqFirdYKZZY/kQ/6oq/Ze2838Nvm2QpG8YHWHizcdaK+a2Vh5/nQ0Gl
 z5vQ==
X-Gm-Message-State: AO0yUKUHepJZ7e3yb/c9D/zkbNkgR20bE4R7tJY2UrYPA63S8idUdDCg
 Qi9uZOIKx29nKhthTn2+FqCBzVFTXJ1Baj8CepvL9trHnE4LzKXDSaSiT+3+9xd07ZgxV2Fkvwc
 VESD4MqcIzKLyk/A=
X-Received: by 2002:a05:622a:610:b0:3b8:5ad9:3fe8 with SMTP id
 z16-20020a05622a061000b003b85ad93fe8mr8840115qta.48.1675068074836; 
 Mon, 30 Jan 2023 00:41:14 -0800 (PST)
X-Google-Smtp-Source: AK7set9AYSyMVaarCqa0XljXRWBv5dPawRsElnaE0VpFd0yMotrQWR4OFT1+G2VBDiYQu5S58Z25tw==
X-Received: by 2002:a05:622a:610:b0:3b8:5ad9:3fe8 with SMTP id
 z16-20020a05622a061000b003b85ad93fe8mr8840103qta.48.1675068074569; 
 Mon, 30 Jan 2023 00:41:14 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-178-179.web.vodafone.de.
 [109.43.178.179]) by smtp.gmail.com with ESMTPSA id
 j20-20020ac85514000000b003b86a6449b8sm1736937qtq.85.2023.01.30.00.41.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 00:41:13 -0800 (PST)
Message-ID: <2e9f39c7-16cc-9f0f-fce6-24b140ea7472@redhat.com>
Date: Mon, 30 Jan 2023 09:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9 01/58] include: import Xen public headers to
 include/standard-headers/
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Julien Grall <julien@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, armbru@redhat.com
References: <20230128081113.1615111-1-dwmw2@infradead.org>
 <20230128081113.1615111-2-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230128081113.1615111-2-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.092, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28/01/2023 09.10, David Woodhouse wrote:
> From: Joao Martins <joao.m.martins@oracle.com>
> 
> There are already some partial headers in include/hw/xen/interface/
> which will be removed once we migrate users to the new location.
> 
> To start with, define __XEN_TOOLS__ in hw/xen/xen.h to ensure that any
> internal definitions needed by Xen toolstack libraries are present
> regardless of the order in which the headers are included. A reckoning
> will come later, once we make the PV backends work in emulation and
> untangle the headers for Xen-native vs. generic parts.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> [dwmw2: Update to Xen public headers from 4.16.2 release, add some in io/,
>          define __XEN_TOOLS__ in hw/xen/xen.h]
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Reviewed-by: Paul Durrant <paul@xen.org>
> ---
>   include/hw/xen/xen.h                          |   16 +-
>   include/standard-headers/xen/arch-x86/cpuid.h |  118 ++
>   .../xen/arch-x86/xen-x86_32.h                 |  194 +++
>   .../xen/arch-x86/xen-x86_64.h                 |  241 ++++
>   include/standard-headers/xen/arch-x86/xen.h   |  398 ++++++
>   include/standard-headers/xen/event_channel.h  |  388 ++++++
>   include/standard-headers/xen/features.h       |  143 +++
>   include/standard-headers/xen/grant_table.h    |  686 ++++++++++
>   include/standard-headers/xen/hvm/hvm_op.h     |  395 ++++++
>   include/standard-headers/xen/hvm/params.h     |  318 +++++
>   include/standard-headers/xen/io/blkif.h       |  722 +++++++++++
>   include/standard-headers/xen/io/console.h     |   56 +
>   include/standard-headers/xen/io/fbif.h        |  176 +++
>   include/standard-headers/xen/io/kbdif.h       |  576 +++++++++
>   include/standard-headers/xen/io/netif.h       | 1102 +++++++++++++++++
>   include/standard-headers/xen/io/protocols.h   |   42 +
>   include/standard-headers/xen/io/ring.h        |  495 ++++++++
>   include/standard-headers/xen/io/usbif.h       |  425 +++++++
>   include/standard-headers/xen/io/xenbus.h      |   80 ++
>   include/standard-headers/xen/io/xs_wire.h     |  153 +++
>   include/standard-headers/xen/memory.h         |  754 +++++++++++
>   include/standard-headers/xen/physdev.h        |  383 ++++++
>   include/standard-headers/xen/sched.h          |  202 +++
>   include/standard-headers/xen/trace.h          |  341 +++++
>   include/standard-headers/xen/vcpu.h           |  248 ++++
>   include/standard-headers/xen/version.h        |  113 ++
>   include/standard-headers/xen/xen-compat.h     |   46 +
>   include/standard-headers/xen/xen.h            | 1049 ++++++++++++++++

The files in include/standard-headers are created automatically by the 
scripts/update-linux-headers.sh script, so I was a little bit surprised that 
you don't provide an update to that script first ... if you copy new headers 
there manually, that might  cause troubles later for the next person who 
runs the update-linux-headers.sh script. So I suggest to either adapt the 
script for your needs, or put the xen headers in a different location.

  Thomas



