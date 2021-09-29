Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23ED41BEF8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 08:10:16 +0200 (CEST)
Received: from localhost ([::1]:52938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVSnH-0004rk-7h
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 02:10:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVSln-0003mm-0m
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 02:08:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mVSlf-0004vA-M2
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 02:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632895712;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQPZqDFANOsGcemQpx9mJzNNSIfQgmzfx+75RmSnW9c=;
 b=KPDzwVLXw6nh7RrfjV8Zwm8rokwyeK5QEDo4Wk7Eot9p9CXZLWdQQMw4geNGU7/JzYx9VM
 Zc24Q+c6jKBCYaor+VfxxX+OopzG7PVcTr5S0wGTT2qcnllHF2YaRRKT+zeIp026SjMc+g
 Hdw/XfANnx1YLwcrGDb+iECVvdh44E8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407--F14FvUqNuiw9ONkCdkfoA-1; Wed, 29 Sep 2021 02:08:30 -0400
X-MC-Unique: -F14FvUqNuiw9ONkCdkfoA-1
Received: by mail-wr1-f71.google.com with SMTP id
 r7-20020a5d6947000000b0015e0f68a63bso258621wrw.22
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 23:08:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=jQPZqDFANOsGcemQpx9mJzNNSIfQgmzfx+75RmSnW9c=;
 b=NLgkr1TsztI41QBtMnbtNACUDsMBakF8oL3tG1EVyrnHa/IhrY4EkJGsqkeD3tlChy
 okJ4e861GnLmic5QMFo5yM2xJVVZOBYwFgcXY0akLmLoQfBP8BX8wrOFSHqMLUUxJQGT
 8D5+wknIPz+eywmNfpkhW/CehRDwL/1dbPE9GX6hn6e+1OlxrX5atwKDA5pBhZaGO8uu
 gFMhcEKRmHA4Bp/1Fwj92sExTXAIF6PauKCL+ahUyZtKomKW2/UhnZdnvO9/ONdPbRew
 1vR2p7rJmpJS69rNx2ArvYYlgz6aIguWgZ+03d38QewKSSPsDU5DRiRPkfanloZOM+1S
 UuHg==
X-Gm-Message-State: AOAM532yMLVlfo9AwD/maStCN+HTjDV/yTu0ioit2NI2Ci/0jdHOvd1e
 fKjKAsI+1MGQ1wBT4emMazjPAhPbc95jbtfTBqSkkLlm8mVjX2yw6lDfByVFx2hb6Mgg4Dfy0ON
 gkFG9sQogTp7JDvI=
X-Received: by 2002:adf:e101:: with SMTP id t1mr4460104wrz.395.1632895709840; 
 Tue, 28 Sep 2021 23:08:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT6AfOlkOoyYxv4xanU3q/MOC5LQIcKnqpjz0D909kjCSPbMCXV2hM4keMsv9qjrtZycX3BA==
X-Received: by 2002:adf:e101:: with SMTP id t1mr4460073wrz.395.1632895709562; 
 Tue, 28 Sep 2021 23:08:29 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id k11sm1131656wrn.84.2021.09.28.23.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 23:08:28 -0700 (PDT)
Subject: Re: [PATCH 2/3] hw/arm/virt-acpi-build: IORT upgrade up to revision
 E.b
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 eric.auger.pro@gmail.com, imammedo@redhat.com, jean-philippe@linaro.org,
 peter.maydell@linaro.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, drjones@redhat.com
References: <20210928172133.79665-1-eric.auger@redhat.com>
 <20210928172133.79665-3-eric.auger@redhat.com>
 <9e20c38f-4d93-0658-c309-499c8976adc9@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <bb8c5097-bdb2-7437-cf8d-35acd6a0c46c@redhat.com>
Date: Wed, 29 Sep 2021 08:08:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9e20c38f-4d93-0658-c309-499c8976adc9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 9/28/21 7:56 PM, Philippe Mathieu-Daudé wrote:
> Hi Eric,
>
> On 9/28/21 19:21, Eric Auger wrote:
>> Upgrade the IORT table from B to E.b specification
>> revision (ARM DEN 0049E.b).
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 47 ++++++++++++++++++++++++----------------
>>  1 file changed, 28 insertions(+), 19 deletions(-)
>> -    /* 3.1.1.3 ITS group node */
>> +    /* Table 12 ITS Group Format */
>>      build_append_int_noprefix(table_data, 0 /* ITS Group */, 1); /* Type */
>>      node_size =  20 /* fixed header size */ + 4 /* 1 GIC ITS Identifier */;
>>      build_append_int_noprefix(table_data, node_size, 2); /* Length */
>> -    build_append_int_noprefix(table_data, 0, 1); /* Revision */
>> -    build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>> +    build_append_int_noprefix(table_data, 3, 1); /* Revision */
> Why 3? Shouldn't it be 1?
you're right, read the SMMUv1 rev and saw it was 3. Thought it was
aligned with the IORT global rev. Will fix here and below
>
>> +    build_append_int_noprefix(table_data, 0, 4); /* Identifier */
>>      build_append_int_noprefix(table_data, 0, 4); /* Number of ID mappings */
>>      build_append_int_noprefix(table_data, 0, 4); /* Reference to ID Array */
>>      build_append_int_noprefix(table_data, 1, 4); /* Number of ITSs */
>> @@ -374,19 +375,19 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          int irq =  vms->irqmap[VIRT_SMMU] + ARM_SPI_BASE;
>>  
>>          smmu_offset = table_data->len - table.table_offset;
>> -        /* 3.1.1.2 SMMUv3 */
>> +        /* Table 9 SMMUv3 Format */
>>          build_append_int_noprefix(table_data, 4 /* SMMUv3 */, 1); /* Type */
>>          node_size =  SMMU_V3_ENTRY_SIZE + ID_MAPPING_ENTRY_SIZE;
>>          build_append_int_noprefix(table_data, node_size, 2); /* Length */
>> -        build_append_int_noprefix(table_data, 0, 1); /* Revision */
>> -        build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>> +        build_append_int_noprefix(table_data, 3, 1); /* Revision */
> And here 3 -> 4?
>
>> +        build_append_int_noprefix(table_data, 1, 4); /* Identifier */
>>          build_append_int_noprefix(table_data, 1, 4); /* Number of ID mappings */
>>          /* Reference to ID Array */
>>          build_append_int_noprefix(table_data, SMMU_V3_ENTRY_SIZE, 4);
>>          /* Base address */
>>          build_append_int_noprefix(table_data, vms->memmap[VIRT_SMMU].base, 8);
>>          /* Flags */
>> -        build_append_int_noprefix(table_data, 1 /* COHACC OverrideNote */, 4);
>> +        build_append_int_noprefix(table_data, 1 /* COHACC Override */, 4);
>>          build_append_int_noprefix(table_data, 0, 4); /* Reserved */
>>          build_append_int_noprefix(table_data, 0, 8); /* VATOS address */
>>          /* Model */
>> @@ -395,35 +396,43 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>>          build_append_int_noprefix(table_data, irq + 1, 4); /* PRI */
>>          build_append_int_noprefix(table_data, irq + 3, 4); /* GERR */
>>          build_append_int_noprefix(table_data, irq + 2, 4); /* Sync */
>> +        build_append_int_noprefix(table_data, 0, 4); /* Proximity domain */
>> +        /* DeviceID mapping index (ignored since interrupts are GSIV based) */
>> +        build_append_int_noprefix(table_data, 0, 4);
>>  
>>          /* output IORT node is the ITS group node (the first node) */
>>          build_iort_id_mapping(table_data, 0, 0xFFFF, IORT_NODE_OFFSET);
>>      }
> Also, could the node identifier be a variable we increment?
Yes I will do that.

Thanks!

Eric
>


