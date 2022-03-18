Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808F54DDF2D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 17:38:46 +0100 (CET)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVFcj-0007sw-Kn
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 12:38:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nVFbP-0007D4-C5
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:37:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nVFbN-0001XO-Tx
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 12:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647621441;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IeoNTpU75sd3LVccAQSmzO5Pk+N1bABL3/AV4AeW+Ak=;
 b=RPdaSt9TO1EqIsJcZ6xhkFfuJRzgB62/KDd21WUmxkH4m9TDomI5V5sum6CT6k5FcNPbUS
 pKPF+GStJLkvsg43NuSiDOG6OKos96ds0CQo1/ascQkVxZMhj1ntQTXPhM2wS8TaEeRDMx
 ejF/w4M4lRIRmAzHLI84BLq+FdDL7ho=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-8VRZ8zStMISq5rjY9GIwSw-1; Fri, 18 Mar 2022 12:37:19 -0400
X-MC-Unique: 8VRZ8zStMISq5rjY9GIwSw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r64-20020a1c2b43000000b0038b59eb1940so4390106wmr.0
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 09:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=IeoNTpU75sd3LVccAQSmzO5Pk+N1bABL3/AV4AeW+Ak=;
 b=HzrZUsPdztcWRW7NpZhnyYYo/gGMN3VLfntirNw+Rn27Fx3wSxsvB9V184NvV9WFWx
 7NPTZCcLFHnH+nE7FA6wfz2kfzgyd+3q0d91YUbnZvmF+GfgJkvhXYy1c8ThMWJExKda
 /yudTg2jd4ke9RZDZo5bhTYDBwHGnywCMWyloDlgLthtiTybzJjwVFOshcR0VNeEr33H
 kK1etXT7H0qinKVopGYBiYIhULoKSbq1xOetvIhXGRic+fWc6ZO/Hs5Y0f02yeRi3AFZ
 6a609KGsE4unERAmkdPCyGQq1njLglfc8y8TkUkQa2ZyyTKkv9SYQU2IYup98Q4PROwh
 Hl/Q==
X-Gm-Message-State: AOAM533bFPHQYXc4I18h4twEqAnBW+FnQnTc4FHYfr0viIuvpaARgpc7
 np9k4nLII4FUlgcFcFj3Q4JZI3cTUK+5JvsTqzS2YA/sah/WOsf48O9EhQDPZMIjYOmH2bztnho
 zYH2jIWVkbYLkl2A=
X-Received: by 2002:adf:d218:0:b0:203:eb11:e2f0 with SMTP id
 j24-20020adfd218000000b00203eb11e2f0mr7080011wrh.181.1647621438494; 
 Fri, 18 Mar 2022 09:37:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ8OmVr/cc1B9a5MahnjJtPltqGr9vbPgsIBn9ohpyDw4RYIzurDhna8LpR5QxM4x5UTWy2Q==
X-Received: by 2002:adf:d218:0:b0:203:eb11:e2f0 with SMTP id
 j24-20020adfd218000000b00203eb11e2f0mr7080002wrh.181.1647621438295; 
 Fri, 18 Mar 2022 09:37:18 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a5d6648000000b00203e64e3637sm4761478wrw.89.2022.03.18.09.37.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 09:37:17 -0700 (PDT)
Subject: Re: [PATCH v2 for-7.1] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com
References: <20220318150135.308623-1-eric.auger@redhat.com>
 <b3f40e00-ab03-0815-4ba8-61e3763e9edd@gmail.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <9da053bc-125b-dacf-6b62-d05a62744a71@redhat.com>
Date: Fri, 18 Mar 2022 17:37:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b3f40e00-ab03-0815-4ba8-61e3763e9edd@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: peter.maydell@linaro.org, cohuck@redhat.com, stefanb@linux.vnet.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 3/18/22 5:18 PM, Philippe Mathieu-Daudé wrote:
> On 18/3/22 16:01, Eric Auger wrote:
>> The CRB command buffer currently is a RAM MemoryRegion and given
>> its base address alignment, it causes an error report on
>> vfio_listener_region_add(). This region could have been a RAM device
>> region, easing the detection of such safe situation but this option
>> was not well received. So let's add a helper function that uses the
>> memory region owner type to detect the situation is safe wrt
>> the assignment. Other device types can be checked here if such kind
>> of problem occurs again.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - do not check the MR name but rather the owner type
>> ---
>>   hw/vfio/common.c     | 27 ++++++++++++++++++++++++++-
>>   hw/vfio/trace-events |  1 +
>>   2 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 080046e3f51..98b0b6fb8c7 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -40,6 +40,7 @@
>>   #include "trace.h"
>>   #include "qapi/error.h"
>>   #include "migration/migration.h"
>> +#include "sysemu/tpm.h"
>
>> +static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
>> +{
>> +    MemoryRegion *mr = section->mr;
>> +
>> +    if (!object_dynamic_cast(mr->owner, TYPE_TPM_CRB)) {
>
> Using TPM_IS_CRB() instead:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Hum yes, missed that define. Alex, with that fix, does it match your
expectation. Do we really want to add the dynamic trace point for safe
misalignments or don't we care?

Thanks

Eric


