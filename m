Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DEB3ED8CC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 16:17:33 +0200 (CEST)
Received: from localhost ([::1]:49804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFdQi-0000uN-Jm
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 10:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFdPC-0007jK-CG
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:15:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mFdP9-0003ia-07
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 10:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629123353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOn24gv5e1xoPCk04ah2Ne2U0/ni1ZgUlD/hdOrggBQ=;
 b=Z4OYv94Pvzl3Tl7QWpEYce4DsD9KvllVdA3Y08Eeeavl+20b8y8jhNnL2JSNgNo7sHkpTd
 qMWqFtr+OiusBJNPBHgtqAjjL7bLHkh7Y8VADgF3nGvQwVn1RtMM0yo7r0EfWeXi4oKIse
 WxG7TpT9jxNcDb+Z9RQPyOE6PSqjUlo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-FNnwPQuVNySS2QsgcNke0Q-1; Mon, 16 Aug 2021 10:15:50 -0400
X-MC-Unique: FNnwPQuVNySS2QsgcNke0Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 y22-20020a0564023596b02903bd9452ad5cso8895101edc.20
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 07:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wOn24gv5e1xoPCk04ah2Ne2U0/ni1ZgUlD/hdOrggBQ=;
 b=H5+gOzBoZ8w/tA5szDOnUyUvl1N/1kgvlVGsj6mAYWwyZqp2kE0UdEPx8WUSmNIpsT
 L2e99PP7TA3bxgRGZjwYJZ5wEzxcDhkazuPlaC+V0vRn7GzPHE8MnAuP4tLdgweBPU97
 JH3PFxzebPCw+zYxRLVd17plWIhihzzRF1V7exTZuNt5LFz3h/eSRWjhR0tv4z/FOQ15
 ZcRRcEeZC6TEoWiLNdErYY+3x8yVwPb91X2lripuH06/eE9bTEGLUv+RSiRhCkRlO05w
 79uG6zPyaKqkc0qN44YpYivI5jyHLXMH9kHyAQbxR8seo/9F3sMsZmKXeKi1Uplrpxhw
 OFUQ==
X-Gm-Message-State: AOAM531Rs8soCSC4kFh1YHyfhK87IeL0m4Q5M2YG/lwpq/fupQKpHuQZ
 tAxMEGzFHB9C/ppBsG/GR/lz/nPimoIDqsLIi8IvfrFZGTVc4Ob/pWSN7KnG9WnG4ayjDkvSZv1
 8GMK6mT9P0IDIaic=
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr16169605ejf.482.1629123348751; 
 Mon, 16 Aug 2021 07:15:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb5EmaR+mgEUjRJGcJI5nwJ5mNoC0z4vG5b/1TWnbaRlUpnXPhmAfE4J4X07o1IJpivTwMkw==
X-Received: by 2002:a17:906:3bc3:: with SMTP id
 v3mr16169582ejf.482.1629123348545; 
 Mon, 16 Aug 2021 07:15:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id ay3sm3760956ejb.0.2021.08.16.07.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 07:15:48 -0700 (PDT)
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: Ashish Kalra <Ashish.Kalra@amd.com>, qemu-devel@nongnu.org
References: <cover.1629118207.git.ashish.kalra@amd.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fb737cf0-3d96-173f-333b-876dfd59d32b@redhat.com>
Date: Mon, 16 Aug 2021 16:15:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1629118207.git.ashish.kalra@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.71, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: thomas.lendacky@amd.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, tobin@ibm.com, jejb@linux.ibm.com,
 richard.henderson@linaro.org, frankeh@us.ibm.com, dgilbert@redhat.com,
 dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/08/21 15:25, Ashish Kalra wrote:
> From: Ashish Kalra<ashish.kalra@amd.com>
> 
> This is an RFC series for Mirror VM support that are
> essentially secondary VMs sharing the encryption context
> (ASID) with a primary VM. The patch-set creates a new
> VM and shares the primary VM's encryption context
> with it using the KVM_CAP_VM_COPY_ENC_CONTEXT_FROM capability.
> The mirror VM uses a separate pair of VM + vCPU file
> descriptors and also uses a simplified KVM run loop,
> for example, it does not support any interrupt vmexit's. etc.
> Currently the mirror VM shares the address space of the
> primary VM.
> 
> The mirror VM can be used for running an in-guest migration
> helper (MH). It also might have future uses for other in-guest
> operations.

Hi,

first of all, thanks for posting this work and starting the discussion.

However, I am not sure if the in-guest migration helper vCPUs should use 
the existing KVM support code.  For example, they probably can just 
always work with host CPUID (copied directly from 
KVM_GET_SUPPORTED_CPUID), and they do not need to interface with QEMU's 
MMIO logic.  They would just sit on a "HLT" instruction and communicate 
with the main migration loop using some kind of standardized ring buffer 
protocol; the migration loop then executes KVM_RUN in order to start the 
processing of pages, and expects a KVM_EXIT_HLT when the VM has nothing 
to do or requires processing on the host.

The migration helper can then also use its own address space, for 
example operating directly on ram_addr_t values with the helper running 
at very high virtual addresses.  Migration code can use a 
RAMBlockNotifier to invoke KVM_SET_USER_MEMORY_REGION on the mirror VM 
(and never enable dirty memory logging on the mirror VM, too, which has 
better performance).

With this implementation, the number of mirror vCPUs does not even have 
to be indicated on the command line.  The VM and its vCPUs can simply be 
created when migration starts.  In the SEV-ES case, the guest can even 
provide the VMSA that starts the migration helper.

The disadvantage is that, as you point out, in the future some of the 
infrastructure you introduce might be useful for VMPL0 operation on 
SEV-SNP.  My proposal above might require some code duplication. 
However, it might even be that VMPL0 operation works best with a model 
more similar to my sketch of the migration helper; it's really too early 
to say.

Paolo


