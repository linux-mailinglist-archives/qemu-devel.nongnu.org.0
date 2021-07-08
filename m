Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714EC3C1839
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:34:25 +0200 (CEST)
Received: from localhost ([::1]:52314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Xuq-00051P-FQ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1XR2-0001um-Jk
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:03:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1XQy-000755-4o
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625763811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NM+N4JyWP8MQ9GJok3TR7PmYFcIzeOA7qkL+asddKtI=;
 b=PdTpc4KhA32FjFdwKfp/CLXuvkNSdSyR/NA83wtoexHPppkoQDhdVFPCSRLEIu87P8J7SO
 bMhIG/NpTIEoajJkieTG8eqcOR4zIFoN+WORqFPsLE/l7/xHj1oycplwX8mqtvN4GGFtqV
 Acza4sCa/UIyIQjrVD6vLmU7ZciT4hI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-Sn2_bJh_NKGQk-HVnW1Lxg-1; Thu, 08 Jul 2021 13:03:27 -0400
X-MC-Unique: Sn2_bJh_NKGQk-HVnW1Lxg-1
Received: by mail-wr1-f71.google.com with SMTP id
 l21-20020a0560000235b029013564642c78so2189284wrz.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NM+N4JyWP8MQ9GJok3TR7PmYFcIzeOA7qkL+asddKtI=;
 b=f1HS1z4EbsE6iUCqt2ngSP1Q8KdpG3iO6ExmNYsKLCeOY0wfAOBJ6mCbSDOv2kebO4
 E78tCxTzc/YXgfC9oTQPTd4yEmuAPUVyEUlYcaHjswpQtk6JeMZMCvvkQy99lnMx1Etw
 XSK8CFFARarA5zH8h8glHmarPJ1QCFFusN5+vsdoU645oNslCnAFxY0PEVYqoSagEgoW
 E9ERKxQPnrwA8R7amb51i5r1opyQ0m7GOrYkn1BJbkiXTos+jqX9yAQqakxoxI89DNJP
 0n6w9m79+PcLiKVwS44dRkCa2YbRCQI/afI4V9skpKPiP012kJPZkrLhR8199Z+djJTn
 QiAw==
X-Gm-Message-State: AOAM531U5r8A+TTWU6MX6FwI2VSuj1zTiyOiQw4RDV6fVs3nt3/Xqbn0
 /v503nBUFQ3SDjZIdW14JXV6CB4vec5gNs8zElzB71ZHYs7ibMlzbqPZEO8US0U5uyotnlzE+R5
 tj30KLW/god3KZYw=
X-Received: by 2002:a05:6000:1379:: with SMTP id
 q25mr34965205wrz.188.1625763806609; 
 Thu, 08 Jul 2021 10:03:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTnWGHS65DBLH1X8BkUeR6OakIWkcpNC4FVG+ABADl0ZpHCVIbZiBYRfpT35ISvui1yRr/wg==
X-Received: by 2002:a05:6000:1379:: with SMTP id
 q25mr34965158wrz.188.1625763806331; 
 Thu, 08 Jul 2021 10:03:26 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j12sm2682723wro.82.2021.07.08.10.03.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:03:25 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
To: Connor Kuehl <ckuehl@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
 <2dc6c60e-48f8-7c6f-6131-0bc1020e106f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fbf2dd1f-150e-beb5-bf17-fc5dc787ab0d@redhat.com>
Date: Thu, 8 Jul 2021 19:03:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2dc6c60e-48f8-7c6f-6131-0bc1020e106f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 6:41 PM, Connor Kuehl wrote:
> Hi Paolo,
> 
> Please consider this series[1] for inclusion into your next pull request.
> 
> Just a note that this series has a companion series that is getting
> upstreamed into OVMF[2]

Shouldn't we get the OVMF part merged first?

> 
> [1] Patchwork link, if convenient: https://patchwork.kernel.org/project/qemu-devel/cover/20210624102040.2015280-1-dovmurik@linux.ibm.com/
> [2] https://bugzilla.tianocore.org/show_bug.cgi?id=3457#c6
> 
> Thank you,
> 
> Connor
> 
> On 6/24/21 3:20 AM, Dov Murik wrote:
>> Currently booting with -kernel/-initrd/-append is not supported in SEV
>> confidential guests, because the content of these blobs is not measured
>> and therefore not trusted by the SEV guest.
>>
>> However, in some cases the kernel, initrd, and cmdline are not secret
>> but should not be modified by the host.  In such a case, we want to
>> verify inside the trusted VM that the kernel, initrd, and cmdline are
>> indeed the ones expected by the Guest Owner, and only if that is the
>> case go on and boot them up (removing the need for grub inside OVMF in
>> that mode).
>>
>> To support that, OVMF adds a special area for hashes of
>> kernel/initrd/cmdline; that area is expected to be filled by QEMU and
>> encrypted as part of the initial SEV guest launch.  This in turn makes
>> the hashes part of the PSP measured content, and OVMF can trust these
>> inputs if they match the hashes.
>>
>> This series adds an SEV function to generate the table of hashes for
>> OVMF and encrypt it (patch 1/2), and calls this function if SEV is
>> enabled when the kernel/initrd/cmdline are prepared (patch 2/2).
>>
>> Corresponding OVMF support was submitted to edk2-devel [1] (patch series
>> "Measured SEV boot with kernel/initrd/cmdline"); it's still under
>> review.
>>
>> [1] https://edk2.groups.io/g/devel/topic/patch_v1_0_8_measured_sev/83074450
>>
>> ---


