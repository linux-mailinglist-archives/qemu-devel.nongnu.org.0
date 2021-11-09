Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4685744AF73
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:27:23 +0100 (CET)
Received: from localhost ([::1]:55308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkS5q-00059s-8X
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:27:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkS3x-0004LN-KF
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:25:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mkS3k-0004rg-Mg
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:25:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636467911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBLXAsmw+vE6JEng8EBhkE00EYquf/2GswvYpf3TUZw=;
 b=Pr33KsLC1jXSmkheD5T9cMHRFNsVLJqDjaQbtRNBN5LBHpFdRkMEoMIzB+2YCUBhwwnkkP
 JQA+fEY/j6iowgUGcJFbT4Q4d8YU7CwdUFnGRNUiqQoeM9pO7qxk4OPsffAaoJ9L5jQ8Mz
 kB6jJs96+RaUazP+uLlrp0EZPUqULCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-SXzNC8rXPsiNhvMiEP6VoQ-1; Tue, 09 Nov 2021 09:25:07 -0500
X-MC-Unique: SXzNC8rXPsiNhvMiEP6VoQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A7E98799EB;
 Tue,  9 Nov 2021 14:25:06 +0000 (UTC)
Received: from [10.39.194.213] (unknown [10.39.194.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB3195DA61;
 Tue,  9 Nov 2021 14:25:02 +0000 (UTC)
Message-ID: <32078e7f-608c-2c62-b92e-58efb6f6d241@redhat.com>
Date: Tue, 9 Nov 2021 15:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PULL 05/33] i386: Add 'sgx-epc' device to expose EPC sections to
 guest
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
 <20210928125116.183620-6-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20210928125116.183620-6-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.364, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/09/2021 14.50, Paolo Bonzini wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> SGX EPC is enumerated through CPUID, i.e. EPC "devices" need to be
> realized prior to realizing the vCPUs themselves, which occurs long
> before generic devices are parsed and realized.  Because of this,
> do not allow 'sgx-epc' devices to be instantiated after vCPUS have
> been created.
> 
> The 'sgx-epc' device is essentially a placholder at this time, it will
> be fully implemented in a future patch along with a dedicated command
> to create 'sgx-epc' devices.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Message-Id: <20210719112136.57018-5-yang.zhong@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   hw/i386/meson.build       |   1 +
>   hw/i386/sgx-epc.c         | 167 ++++++++++++++++++++++++++++++++++++++
>   include/hw/i386/sgx-epc.h |  44 ++++++++++
>   3 files changed, 212 insertions(+)
>   create mode 100644 hw/i386/sgx-epc.c
>   create mode 100644 include/hw/i386/sgx-epc.h
...
> +static void sgx_epc_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +    MemoryDeviceClass *mdc = MEMORY_DEVICE_CLASS(oc);
> +
> +    dc->hotpluggable = false;
> +    dc->realize = sgx_epc_realize;
> +    dc->unrealize = sgx_epc_unrealize;
> +    dc->desc = "SGX EPC section";
> +    device_class_set_props(dc, sgx_epc_properties);
> +
> +    mdc->get_addr = sgx_epc_md_get_addr;
> +    mdc->set_addr = sgx_epc_md_set_addr;
> +    mdc->get_plugged_size = sgx_epc_md_get_plugged_size;
> +    mdc->get_memory_region = sgx_epc_md_get_memory_region;
> +    mdc->fill_device_info = sgx_epc_md_fill_device_info;
> +}

  Hi!

Our device-crash-test script reports that this new device can be used to 
crash QEMU:

$ ./qemu-system-x86_64 -M none -device sgx-epc
/home/thuth/devel/qemu/include/hw/i386/pc.h:128:PC_MACHINE: Object 
0x55c80d332290 is not an instance of type generic-pc-machine

Should it be marked with:

     dc->user_creatable = false

?

   Thomas


