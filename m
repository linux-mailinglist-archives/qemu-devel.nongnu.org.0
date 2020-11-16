Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE962B4308
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 12:41:19 +0100 (CET)
Received: from localhost ([::1]:43054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kecsp-0005p5-11
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 06:41:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecrU-00056I-S6
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:39:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kecrS-00044x-MJ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 06:39:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605526794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ECDe36RhlwpinFxGcPWSNTAEDPdrJhyMm6bgtlujNuA=;
 b=aFM35+O2DhaxxG8zcM3FVFyTJwRorlnLKDACSG1rnQvQYDitJcx2llKMMt3Cab44enTSc8
 GYW0iyjyi8DOudlaKRCp0RKWAPEekkaKni+88I/pmldF0Pu7NArvi8p2z9FW1rQJrlAqOQ
 c4htr900gb2q13amdMjYDdYlNfwerdk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-_9XU07V-NTGxobWvET4bXg-1; Mon, 16 Nov 2020 06:39:50 -0500
X-MC-Unique: _9XU07V-NTGxobWvET4bXg-1
Received: by mail-wr1-f70.google.com with SMTP id 91so10697403wrk.17
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 03:39:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ECDe36RhlwpinFxGcPWSNTAEDPdrJhyMm6bgtlujNuA=;
 b=RPzYtu7ecqv2VU/Y3Lpw+OgjZC4eWbqZ3bfB45vyZIXR7HEGtefuEPfmDbZRUUlhZ4
 O6JAOD9GlPcE4EGeLl9iRE9s/TSluNnZPmRhWMfKL6jv1e3Nk3Ji/CPQAwvSVTNtFDh8
 17XSI8sT2PfzNHjBnLmOo9krMcdtYUDM0uBe5P7JhN/3aPJ52v3iag+h8GWykEvi3JSO
 6ROjZbGaI+iqcKjwHchDx0sNN1QA8liwfw3/r0YN5a0aWZ1ZiYaeAvc1yBlxz6ZKYJHx
 S4vj1/5uHk5s3oDiXXSkEycFyYAly/1AI71AfW1g8ah9DxjhoDP5d6GnlPB6QAH8PjlX
 ERhA==
X-Gm-Message-State: AOAM533RhS31sESLfN7FZjUNjSH5/kGUaIl/zGOlHKPaiiasQ4VzRP6j
 nUNUEeRs36mv7A8U01TVEMNqo93ARrOyzSitTL8M31zgYgEH+i5ZiyT4pt/A7ok4EXUr3q+6Tmg
 bE2BPz1Wtc1D9pJg=
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr20088722wrn.56.1605526789272; 
 Mon, 16 Nov 2020 03:39:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8ucECMblb/uS2paoD1+VOnCB8SMD/0GeDOmxYZX4fgHoPZqTd0Uz1i7SakdtnAp5fn+3BmA==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr20088691wrn.56.1605526789023; 
 Mon, 16 Nov 2020 03:39:49 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 6sm16641350wrn.72.2020.11.16.03.39.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Nov 2020 03:39:48 -0800 (PST)
Subject: Re: [RFC PATCH 0/5] ARM: reduce the memory consumed when mapping UEFI
 flash images
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20201116104216.439650-1-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3da830b6-8200-6df9-9ba3-1f51bf887c4e@redhat.com>
Date: Mon, 16 Nov 2020 12:39:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201116104216.439650-1-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On 11/16/20 11:42 AM, David Edmondson wrote:
> Currently ARM UEFI images are typically built as 2MB/768kB flash
> images for code and variables respectively. These images are both then
> padded out to 64MB before being loaded by QEMU.
> 
> Because the images are 64MB each, QEMU allocates 128MB of memory to
> read them, and then proceeds to read all 128MB from disk (dirtying the
> memory). Of this 128MB less than 3MB is useful - the rest is zero
> padding.

2 years ago I commented the same problem, and suggested to access the
underlying storage by "block", as this is a "block storage".

Back then the response was "do not try to fix something that works".
This is why we choose the big hammer "do not accept image size not
matching device size" way.

While your series seems to help, it only postpone the same
implementation problem. If what you want is use the least memory
required, I still believe accessing the device by block is the
best approach.

Regards,

Phil.

> 
> On a machine with 100 VMs this wastes over 12GB of memory.
> 
> This set of patches aims to reclaim the wasted memory by allowing QEMU
> to respect the size of the flash images and allocate only the
> necessary memory. This will, of course, require that the flash build
> process be modified to avoid padding the images to 64MB.
> 
> Because existing machine types expect the full 128MB reserved for
> flash to be occupied, do so for machine types older than virt-5.2. The
> changes are beneficial even in this case, because while the full 128MB
> of memory is allocated, only that required to actually load the flash
> images from disk is touched.
> 
> David Edmondson (5):
>   hw/block: blk_check_size_and_read_all should report backend name
>   hw/block: Flash images can be smaller than the device
>   hw/arm: Convert assertions about flash image size to error_report
>   hw/arm: Flash image mapping follows image size
>   hw/arm: Only minimise flash size on older machines
> 
>  hw/arm/trace-events      |  2 +
>  hw/arm/virt-acpi-build.c | 30 ++++++++------
>  hw/arm/virt.c            | 86 +++++++++++++++++++++++++++++-----------
>  hw/block/block.c         | 26 ++++++------
>  include/hw/arm/virt.h    |  2 +
>  5 files changed, 97 insertions(+), 49 deletions(-)
> 


