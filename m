Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E44453004
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 12:12:50 +0100 (CET)
Received: from localhost ([::1]:41988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmwOP-0003Ft-Mj
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 06:12:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mmwNH-0002CX-3X
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:11:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mmwNE-0005mn-Hb
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 06:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637061095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CkolIweQscYOPDXfCjJTBsMGMCH+H0slToqry6VpWZU=;
 b=NbwggVMq29Hhabs5Qo0c5lfFl7vN8eYRxidOXbJFMbVsUil24gNQ3N1WNy9Krp+kY29lFj
 h6rm57v5MUA2qsp937/z4Xxmg3HCRLQmqzVVP7vSjb9FJk8k64R7D/+FESnaOZ5vHwkoSk
 Yf4oCayS8NBrco3t8b7VtduYLtMpwCQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-_pYW0B43PZqDqvcvaj1WMg-1; Tue, 16 Nov 2021 06:11:32 -0500
X-MC-Unique: _pYW0B43PZqDqvcvaj1WMg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1312215wms.1
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 03:11:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=CkolIweQscYOPDXfCjJTBsMGMCH+H0slToqry6VpWZU=;
 b=6XWUyklgwfPZTUXOnvBNMXddw7MFkcWgMu5Vh0J7cqEVIegLI+eW2QoA1YRc+nsVSy
 gV5XwT3S+ZI/JBWWNw++gkLKIbdBIPlRCXbyfbM39eyEiWnLUtyb8WInlzqd9p9EENpi
 241EtnIQuV0tvaMl71jAF6cBxY572VfbRvWrZojvZyuQqWLi3iqRoveqSxDt+2aQcG3l
 gFxFODo/AMS3LOsbTaBfqemw6pSnhfSoYSUNw3UIlSoJv1ppw+NjsIO1hOce7JILW4J3
 mqEGgCl4j5LRylcaee8s8PvlnSX61moM/eGD8gs2Awfl63cTsWhk8uxYRkkbHM37eXYA
 Y97Q==
X-Gm-Message-State: AOAM530fL9tdksEkVrEs0OWnRLqhca5MGdhkZ5Ffvy0FInNnHasga6NC
 8AXH5rmvAJLJZlyecdhBvobIYXOkaOfRZdVd1RAUHbGi6BNNMMk9cWHJ8kCxGNwm8KWADs3snhI
 52UfGjprXN67LqBU=
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr8283433wrw.104.1637061090919; 
 Tue, 16 Nov 2021 03:11:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfr62iFz4BAaHt6KVQbF78gWn0gzSfyyNjhrq24fqrm7f1E7N5t8GbEB7udv9T5j3cEidpBg==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr8283394wrw.104.1637061090728; 
 Tue, 16 Nov 2021 03:11:30 -0800 (PST)
Received: from [192.168.3.132] (p4ff23d3a.dip0.t-ipconnect.de. [79.242.61.58])
 by smtp.gmail.com with ESMTPSA id
 m20sm2353656wmq.11.2021.11.16.03.11.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 03:11:30 -0800 (PST)
Message-ID: <188faab7-1e57-2bc1-846f-9457433c2f9d@redhat.com>
Date: Tue, 16 Nov 2021 12:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
To: Igor Mammedov <imammedo@redhat.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
 <20211110113304.2d713d4a@redhat.com>
 <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
 <20211112142751.4807ab50@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211112142751.4807ab50@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 Gavin Shan <gshan@redhat.com>, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>
>> Examples include exposing HBM or PMEM to the VM. Just like on real HW,
>> this memory is exposed via cpu-less, special nodes. In contrast to real
>> HW, the memory is hotplugged later (I don't think HW supports hotplug
>> like that yet, but it might just be a matter of time).
> 
> I suppose some of that maybe covered by GENERIC_AFFINITY entries in SRAT
> some by MEMORY entries. Or nodes created dynamically like with normal
> hotplug memory.
> 

I'm certainly no SRAT expert, but seems like under VMWare something
similar can happen:

https://lkml.kernel.org/r/BAE95F0C-FAA7-40C6-A0D6-5049B1207A27@vmware.com

"VM was powered on with 4 vCPUs (4 NUMA nodes) and 4GB memory.
ACPI SRAT reports 128 possible CPUs and 128 possible NUMA nodes."

Note that that discussion is about hotplugging CPUs to memory-less,
hotplugged nodes.

But there seems to be some way to expose possible NUMA nodes. Maybe
that's via GENERIC_AFFINITY.

-- 
Thanks,

David / dhildenb


