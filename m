Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E0D418EE3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 08:07:51 +0200 (CEST)
Received: from localhost ([::1]:41170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUjnp-0003H8-QD
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 02:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUjLO-0003x5-Pn
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 01:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUjLL-000882-Ne
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 01:38:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632721101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iDdoRqv/XSUemGrXVqZigbzVEOiuyy3kk4HfP8WXbPs=;
 b=X4uLuZeonfncYatuJblpKY7h7yjXbNsiE0P3XapP11g5uPXrjCpHCwHwTn0myRz9sTSh8c
 FivdaeDykPzHhWPz+cSmpP72hFwJvG81nrHfAf+hjzf4zcozQHuK7QdLxcM+2pl5obbJo1
 dRY3wUMti9twgUndtKYnoCrtwfJRqYc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-dZ_n29DbOHSnsQSCjRyz0Q-1; Mon, 27 Sep 2021 01:38:20 -0400
X-MC-Unique: dZ_n29DbOHSnsQSCjRyz0Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 e1-20020adfa741000000b0015e424fdd01so13354297wrd.11
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 22:38:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iDdoRqv/XSUemGrXVqZigbzVEOiuyy3kk4HfP8WXbPs=;
 b=qCEtL8xzXVHu8jo9MD82Kj5905DirFevow/kzxAlBWQvMsqLbkHG1yBnWQB8ot0v1T
 9MZoGbF51xOQuUrTyQ6d1M1aMCTbM0pVWg02wlteLoNBUypTukPsPreCCChNbpDHb56k
 v+z9Z3o64TpolsSrE+s2oCMrjufGcG6HOxkH/yZz+lWpVxfarSzOfgr3f50qae5vnmsr
 GYexBs2JxPVZdU4wD0Ul7oo7RwchIrlDZiCmFyFV9V63QbD9LbONdTdKMUl/UicmsuRg
 fiU1E52QEAKXbyU8YanmhGmvUuYMhb2XZOnK6weKSqaoEwbxqm2C3rDm8/2Va0zsAbY4
 XyRg==
X-Gm-Message-State: AOAM531h5FR4QthFh5/Ujp/uozk79VBPWSln8UyOFVQZs/sTPS9av819
 drrGQe+cOcHW0igM3Qmx7RIAOZ75+gOxRhS1CI8jU1hWauYl2VKvfVIG2kjyEsW5pfzXcP1qY7T
 dY8f4oQx6mvs9HKg=
X-Received: by 2002:a05:6000:1103:: with SMTP id
 z3mr2766536wrw.312.1632721099117; 
 Sun, 26 Sep 2021 22:38:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjIXgCSnoyg9ePWBAAbIJQN5S+iO+Mhv2Z5jjpNwi4mmtzbt34wHxpZoiUtXJS95k0IXVmBw==
X-Received: by 2002:a05:6000:1103:: with SMTP id
 z3mr2766525wrw.312.1632721098964; 
 Sun, 26 Sep 2021 22:38:18 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id u13sm15543358wrt.41.2021.09.26.22.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 22:38:18 -0700 (PDT)
Message-ID: <fc85899d-242c-ad0d-00ca-af60b44f6ea6@redhat.com>
Date: Mon, 27 Sep 2021 07:38:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v5 03/26] hostmem: Add hostmem-epc as a backend for SGX EPC
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210924112509.25061-1-pbonzini@redhat.com>
 <20210924112509.25061-4-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210924112509.25061-4-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.478, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: yang.zhong@intel.com, eblake@redhat.com,
 Sean Christopherson <sean.j.christopherson@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 13:24, Paolo Bonzini wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> EPC (Enclave Page Cahe) is a specialized type of memory used by Intel

Typo "Enclave Page Cache".

> SGX (Software Guard Extensions).  The SDM desribes EPC as:
> 
>     The Enclave Page Cache (EPC) is the secure storage used to store
>     enclave pages when they are a part of an executing enclave. For an
>     EPC page, hardware performs additional access control checks to
>     restrict access to the page. After the current page access checks
>     and translations are performed, the hardware checks that the EPC
>     page is accessible to the program currently executing. Generally an
>     EPC page is only accessed by the owner of the executing enclave or
>     an instruction which is setting up an EPC page.
> 
> Because of its unique requirements, Linux manages EPC separately from
> normal memory.  Similar to memfd, the device /dev/sgx_vepc can be
> opened to obtain a file descriptor which can in turn be used to mmap()
> EPC memory.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Message-Id: <20210719112136.57018-3-yang.zhong@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  backends/hostmem-epc.c        | 82 +++++++++++++++++++++++++++++++++++
>  backends/meson.build          |  1 +
>  include/hw/i386/hostmem-epc.h | 28 ++++++++++++
>  3 files changed, 111 insertions(+)
>  create mode 100644 backends/hostmem-epc.c
>  create mode 100644 include/hw/i386/hostmem-epc.h


