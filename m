Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A005F4CA7
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 01:35:20 +0200 (CEST)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofrRX-0002nA-Ee
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 19:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofrQB-0000od-F0
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 19:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofrQ8-0001Ke-44
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 19:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664926430;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8nk6AKM5qASVrLpO/fvj8lJbZqTBl9t2Lsty+w04oc=;
 b=HahvZRuuPWOXsDvyStj9PUc9oZ++jtQLnBw2KLuVhQAZSwcJwkVv2VZA6wy0CbW90AAnrA
 KU497lyNOal+EFv9FTQrW6BJHLyuWldbNqNITEiq8LQ5p6a6xkzxb+TUY9xK0FXnc5sFCF
 Ev29VU5SP7PQTgvlqcaUXlgSeta1PlA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-qH7lBzK7NNKJZeyUAtkDqg-1; Tue, 04 Oct 2022 19:33:47 -0400
X-MC-Unique: qH7lBzK7NNKJZeyUAtkDqg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51CE2101A528;
 Tue,  4 Oct 2022 23:33:47 +0000 (UTC)
Received: from [10.64.54.56] (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 222B7492CA2;
 Tue,  4 Oct 2022 23:33:43 +0000 (UTC)
Subject: Re: [PATCH v4 6/6] hw/arm/virt: Add 'compact-highmem' property
To: Marc Zyngier <maz@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
References: <20221004002627.59172-1-gshan@redhat.com>
 <20221004002627.59172-7-gshan@redhat.com> <86bkqr8p3r.wl-maz@kernel.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <0f8e6a58-0dde-fb80-6966-7bb32c4df552@redhat.com>
Date: Wed, 5 Oct 2022 07:33:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <86bkqr8p3r.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.449, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Marc,

On 10/5/22 1:39 AM, Marc Zyngier wrote:
> On Tue, 04 Oct 2022 01:26:27 +0100,
> Gavin Shan <gshan@redhat.com> wrote:
>>
>> After the improvement to high memory region address assignment is
>> applied, the memory layout can be changed, introducing possible
>> migration breakage. For example, VIRT_HIGH_PCIE_MMIO memory region
>> is disabled or enabled when the optimization is applied or not, with
>> the following configuration.
>>
>>    pa_bits              = 40;
>>    vms->highmem_redists = false;
>>    vms->highmem_ecam    = false;
>>    vms->highmem_mmio    = true;
> 
> The question is how are these parameters specified by a user? Short of
> hacking the code, this isn't really possible.
> 

Yeah, It's impossible to have false for vms->highmem_redists unless
the code is hacked.

>>
>>    # qemu-system-aarch64 -accel kvm -cpu host    \
>>      -machine virt-7.2,compact-highmem={on, off} \
>>      -m 4G,maxmem=511G -monitor stdio
>>
>>    Region            compact-highmem=off         compact-highmem=on
>>    ----------------------------------------------------------------
>>    RAM               [1GB         512GB]        [1GB         512GB]
>>    HIGH_GIC_REDISTS  [512GB       512GB+64MB]   [disabled]
>>    HIGH_PCIE_ECAM    [512GB+256MB 512GB+512MB]  [disabled]
>>    HIGH_PCIE_MMIO    [disabled]                 [512GB       1TB]
>>
>> In order to keep backwords compatibility, we need to disable the
>> optimization on machines, which is virt-7.1 or ealier than it. It
>> means the optimization is enabled by default from virt-7.2. Besides,
>> 'compact-highmem' property is added so that the optimization can be
>> explicitly enabled or disabled on all machine types by users.
> 
> Not directly related to this series, but it seems to me that we should
> be aiming at reproducible results across HW implementations (at least
> with KVM). Depending on how many PA bits the HW implements, we end-up
> with a set of devices or another, which is likely to be confusing for
> a user.
> 
> I think we should consider an additional set of changes to allow a
> user to specify the PA bits as well as the devices they want to see
> enabled.
> 

I think the idea to selectively enable devices (high memory regions)
is sensible. For example, users may needn't HIGH_PCIE_MMIO at all
in some systems, where they have limited PCI devices.

I'm not sure about PA bits because it has been discovered from hardware
and configure the automatically optimized value/bits back to KVM. The
optimized value/bits is automatically calculated based on the enabled
high memory regions.

Thanks,
Gavin


