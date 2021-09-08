Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3C240383A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 12:51:27 +0200 (CEST)
Received: from localhost ([::1]:34796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNvAs-0001ud-Kj
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 06:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNuhz-0002H4-0P
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:21:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNuhw-0008Ji-5g
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 06:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631096491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7R2+9165t8TzJRVxCYlxVAdmMUI8gAazfYQcFYFxQcc=;
 b=JJD5tvh5a20ehtIbnePdE07N+hCxF+zoaaj0lNIwZIQBF+TzCUVF5Jwl64MMOZoxuIziKO
 HkhBW+QjqRMmZhpYEDu2Fv9wRsMUxa6tHCnlvfGohgTHRXTQ2ALCOgtDPA9HiiMm2wrEhi
 nlxafb+xUF+akDO2iEdduHTdkpYEt9s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-FawUWhrtPNSBy5J2UAnrBg-1; Wed, 08 Sep 2021 06:21:29 -0400
X-MC-Unique: FawUWhrtPNSBy5J2UAnrBg-1
Received: by mail-wr1-f72.google.com with SMTP id
 z16-20020adfdf90000000b00159083b5966so353725wrl.23
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 03:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7R2+9165t8TzJRVxCYlxVAdmMUI8gAazfYQcFYFxQcc=;
 b=qGsqFje48RoP+TN+DxQPYZ0Ed7yR1kW3WGD6c1sy4RDTJBXnd4OrgG8OtwTaMksjVg
 cZcpoH1ga5DMPlw0Y8Xs0dcR6cYt7OTOBNcJ7r438gwI07uZhRBA2eZQQ2Tt7FuvsBdE
 QvF+PJd8O5uEAUm+AyaJgXWPylRwW1pDcQlHzYSAy0NymtnFHS+SolR93r83FCbEvvaX
 Nxrv1A4nPownlugs9SFGNIHf4bTHJViKCehsE0hzhZ7l8oYDxnqcgBtEyIdzRqdfmkxq
 gVj0+HsDn/6LdXR80W059H1/+C7ri4q6DfY1/ruGXjJXCiJhAaucjhZdluEP7SMyZSuC
 aYfA==
X-Gm-Message-State: AOAM531p6Z8/zebLOY+56bVRZbHZuLVvyhLQdD4SM21kTSyb9Ci8UW1u
 THtSGs83qlKuRWcSMg4NKJHDtlV6rZU5d9zYjkpedxt+9NgB68EsrCHOfQwE9w36j3nyrDxCrrn
 jaqiKiTvTuNBL1y0=
X-Received: by 2002:a05:600c:19ca:: with SMTP id
 u10mr2733900wmq.178.1631096487884; 
 Wed, 08 Sep 2021 03:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhx9bsGTbSPBOrSv8bttR6GRJ4WSVPADsTWV7wCGn3Ujr1e8yvfsr6+9wgS4hKm3rJmxpomQ==
X-Received: by 2002:a05:600c:19ca:: with SMTP id
 u10mr2733876wmq.178.1631096487678; 
 Wed, 08 Sep 2021 03:21:27 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id g5sm1701363wrq.80.2021.09.08.03.21.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 03:21:27 -0700 (PDT)
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi pci
 hotplug
To: Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210908041139.2219253-1-ani@anisinha.ca>
 <20210908084256.6077f7a3@redhat.com>
 <alpine.DEB.2.22.394.2109081229250.2227929@anisinha-lenovo>
 <20210908104351.72d0bb19@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <55495984-43ba-0b93-db74-e7f8602be178@redhat.com>
Date: Wed, 8 Sep 2021 12:21:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908104351.72d0bb19@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: jusual@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 10:43 AM, Igor Mammedov wrote:
> On Wed, 8 Sep 2021 12:51:04 +0530 (IST)
> Ani Sinha <ani@anisinha.ca> wrote:
> 
>> On Wed, 8 Sep 2021, Igor Mammedov wrote:
>>
>>> On Wed,  8 Sep 2021 09:41:39 +0530
>>> Ani Sinha <ani@anisinha.ca> wrote:
>>>  
>>>> Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
>>>> selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
>>>> starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that this address
>>>> range was free and available. However, upon more testing, it seems this address
>>>> range to be not available for some latest versions of windows.  
>>>
>>> The range is something assigned by QEMU, and guest has no say where it should be.
>>> but perhaps we failed to describe it properly or something similar, so one gets
>>> 'no resource' error.  
>>
>> OK dug deeper. The existing range of IO address conflicts with the CPU
>> hotplug range.
>>
>> CPU hotplug range (ICH9_CPU_HOTPLUG_IO_BASE) is 0x0cd8 to 0x0ce3
>>
>> This intersects with range 0x0cc4 to 0x0cdb for ACPI_PCIHP_ADDR_ICH9 .
> 
> Looking at 'info mtree' it's indeed wrong:
> 
>     0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
>     0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug
> 
> which of them eventually handles IO request in intersection range?

(qemu) info mtree -f
FlatView #0
 AS "I/O", root: io
 Root memory region: io
  0000000000000cc4-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
  0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug

> 
> Please, add to commit message your findings, so it would point out
> where problem comes from and what it breaks(doesn't work as expect).
> 
> Given it's broken to begin with (and possibly regression if it broke cpu hotplug),
> I'm inclined to fix it without adding compat stuff.
> Michael, what do you think?


