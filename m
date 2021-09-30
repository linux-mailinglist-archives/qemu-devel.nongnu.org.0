Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CA141D6C8
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 11:50:37 +0200 (CEST)
Received: from localhost ([::1]:32816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVsi4-0005CH-C8
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 05:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mVsgU-0003td-G6
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:48:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mVsgR-0004rO-Ev
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 05:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632995334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TTaffFfY1vrUfme7Hk0fW6AMVmcnRYzpqFbiH7obxBY=;
 b=Uz1aGYzhvGkY2rEpOF3ld4VBd7Lp48RZ+G6LXVX3TqnVeMbh2wjE0kWgEK+rmVGQ9gL011
 F8yJFbFLfFkhUJfCalgDC57Dra8ySJ7CgBVAF7Jmw+1uqRAVJzoy3rvYpjlVhG1rQl6l3Q
 qCDDsCIVxqxetxBzI/xI2eBzPCuaXBI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-qbeTnS_aNyWNc_UQsG6RXQ-1; Thu, 30 Sep 2021 05:48:48 -0400
X-MC-Unique: qbeTnS_aNyWNc_UQsG6RXQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r2-20020a7bc082000000b0030d2ab5c3a7so768144wmh.1
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 02:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TTaffFfY1vrUfme7Hk0fW6AMVmcnRYzpqFbiH7obxBY=;
 b=VavkG/+WMkyX1BtS6GLYjO9mDcXsNuylNl2s8AZ3K6f8vmWHDmX3Vkmis6g57yWmgk
 3SepjOZIwPYbjYPOvftE77tU6pG4EhCC8Ai2oIqYa+kmjNtRssymiCWo0F3BE3L9ux1A
 zePE3Z9TNdI6KSbKTWr5jx+H1nCKz3OcvM4V+lK5Ynuxr/uuMpOTJzYTbMefv1QzSzAH
 /EZWQifiykzT1seKaMosc4oIUjQyDKrzcFK711ddJTLyys0Hitz4sTq8IcP9S2ZxMS2V
 92G/HXoqlBcXctpi9dfsqN1bGEtPbbIEWLli1LjqCCiA83u+wqKuWX7W3As5hoTQpKxs
 /4pw==
X-Gm-Message-State: AOAM533y1t1qvUfiwl3xQgD1rYA048KVzpTaU/e90SOWbeEnKfqz4gVn
 tHsc6+eA/Ul7k7SBWDaKro3cKJPfAOdUv+nzCY0LLK3hhmrVW/Xu1gBHyzzLl+wRPfcIj4kG/j1
 a4yn6gKiUtXxDLjU=
X-Received: by 2002:adf:e44c:: with SMTP id t12mr5076021wrm.49.1632995327232; 
 Thu, 30 Sep 2021 02:48:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLtSxZ5VGA0yRN7+pAPmGGrXsg76JNh0AcFYl4438LBJ827BrP5mFlvklBZH5m5MgUGUUMFw==
X-Received: by 2002:adf:e44c:: with SMTP id t12mr5075995wrm.49.1632995327032; 
 Thu, 30 Sep 2021 02:48:47 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.21.142])
 by smtp.gmail.com with ESMTPSA id n26sm4276654wmi.43.2021.09.30.02.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Sep 2021 02:48:46 -0700 (PDT)
Message-ID: <ec216e3a-71a3-c7a5-628f-1871d063d2a2@redhat.com>
Date: Thu, 30 Sep 2021 11:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] failover: fix unplug pending detection
To: Ani Sinha <ani@anisinha.ca>
References: <20210930082032.1237812-1-lvivier@redhat.com>
 <alpine.DEB.2.22.394.2109301450580.579856@anisinha-lenovo>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <alpine.DEB.2.22.394.2109301450580.579856@anisinha-lenovo>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Jens Freimann <jfreimann@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/09/2021 11:24, Ani Sinha wrote:
> 
> 
> On Thu, 30 Sep 2021, Laurent Vivier wrote:
> 
>> Failover needs to detect the end of the PCI unplug to start migration
>> after the VFIO card has been unplugged.
>>
>> To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset in
>> pcie_unplug_device().
>>
>> But since
>>      17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35")
>> we have switched to ACPI unplug and these functions are not called anymore
>> and the flag not set. So failover migration is not able to detect if card
>> is really unplugged and acts as it's done as soon as it's started. So it
>> doesn't wait the end of the unplug to start the migration. We don't see any
>> problem when we test that because ACPI unplug is faster than PCIe native
>> hotplug and when the migration really starts the unplug operation is
>> already done.
>>
>> See c000a9bd06ea ("pci: mark device having guest unplug request pending")
>>      a99c4da9fc2a ("pci: mark devices partially unplugged")
> 
> Ok so I have a basic question about partially_hotplugged flag in the
> device struct (there were no comments added in a99c4da9fc2a39847
> explaining it). It seems we return early from pcie_unplug_device() when
> this flag is set from failover_unplug_primary() in virtio-net. What is the
> purpose of this flag? It seems we are not doing a full unplug of the
> primary device?

Yes, to be able to plug it back in case of migration failure we must keep all the data 
structures.

But reading the code again it seems this part should be in acpi_pcihp_eject_slot() rather 
than in acpi_pcihp_device_unplug_cb() to prevent the 
hotplug_handler_unplug()/object_unparent()  rather than the qdev_unrealize() (to be like 
in pcie.c).

Thanks,
Laurent


