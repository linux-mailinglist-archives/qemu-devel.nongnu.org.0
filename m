Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9926F68F4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 12:14:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puVxd-0004YC-QO; Thu, 04 May 2023 06:13:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puVxb-0004Wa-2G
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:13:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1puVxZ-0001dw-7i
 for qemu-devel@nongnu.org; Thu, 04 May 2023 06:13:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683195191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qQf+kAVlvo6dBX6/siuR8zNFMxVApQOHky6Id+syWcU=;
 b=fQ49K0kibq9F3EFRx7395eN9EleVMtA3XQg9HTFAXYthenxZYNboNgl+UAE7aPww4Yb32m
 jweoYyB+ew98UsiMvxFCaSwlg0yDyTI8UO3gTEVzkyhBKTTWABoNWXwO8xyTfwwKD0DOke
 BpbWkqf2l9UKOfzs4x9BYGtnLg006gU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-xAbjKqapPnyD4NET-lghlQ-1; Thu, 04 May 2023 06:13:09 -0400
X-MC-Unique: xAbjKqapPnyD4NET-lghlQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f18c2b2110so1110525e9.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 03:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683195188; x=1685787188;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qQf+kAVlvo6dBX6/siuR8zNFMxVApQOHky6Id+syWcU=;
 b=eo+QRfBMkD1gojNUfqVaqQANbI1DwW2eUVVrnfcNZvrfhAUz2VgrW13hlD1oi1A+PW
 2MLsHqz0/QEby4fOhv2AqUADTwcHMdTeaaxnEL6tX1x3mk9My8lLLlOWfczA987azc9w
 W9etubMdUAPFjdq7Rgeq92/7hCj2O3o2np+08YzlZVCeRMI3w+dtbGT10PfK5txj9xsT
 7oFwVvyZq/KdOen2W+DbAImY6znQ9b0KlJwBquS72L78+niD3O5WwW3ud3qfb4G4aIrK
 +ffMD5XP/+BbF8HHW/nVG2smYgTHaero/epGVplc5dQhZnum9jAxd8lrDJEnDc9rl9hp
 1x9Q==
X-Gm-Message-State: AC+VfDyT2+5QhMUoJ+fKgOjYdh5GhVNWF2oRnk+j6N8OtKuhTiS+U7VT
 EtUWABrWr7aC3A4PnM51Fod3WFOZTctHOMnJHVZZPvtp1UJRo8AUni89U5X7vNR4b2CHBohWoPC
 UNH7ozB7CeMywWBE=
X-Received: by 2002:a1c:cc13:0:b0:3f3:468c:a783 with SMTP id
 h19-20020a1ccc13000000b003f3468ca783mr5792405wmb.8.1683195188661; 
 Thu, 04 May 2023 03:13:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7vG7BXPL6rvFR8zGiwqsg4FiTjt9WdzMvsfs1C6ZFdABVirVtLvGnSMVH+jIjxK4ucccZ15g==
X-Received: by 2002:a1c:cc13:0:b0:3f3:468c:a783 with SMTP id
 h19-20020a1ccc13000000b003f3468ca783mr5792387wmb.8.1683195188401; 
 Thu, 04 May 2023 03:13:08 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-91.web.vodafone.de.
 [109.43.179.91]) by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003e91b9a92c9sm4455054wmc.24.2023.05.04.03.13.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 May 2023 03:13:07 -0700 (PDT)
Message-ID: <1873652a-6dac-2851-e09d-474ba9071731@redhat.com>
Date: Thu, 4 May 2023 12:13:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/2] Add mformat and xorriso dependencies in containers
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Cc: alex.bennee@linaro.org, philmd@linaro.org, wainersm@redhat.com,
 bleal@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
References: <20230503145547.202251-1-anisinha@redhat.com>
 <8d7e46ec-95c0-5c4a-a843-20106576e9ba@redhat.com>
 <ZFNmhT9Fosay1bee@redhat.com>
 <550DF0FD-701E-408D-924B-C33ABC0BFF10@redhat.com>
 <ZFN8YBO9MXM0qiKi@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZFN8YBO9MXM0qiKi@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/05/2023 11.35, Daniel P. Berrangé wrote:
> On Thu, May 04, 2023 at 02:19:21PM +0530, Ani Sinha wrote:
>>
>>
>>> On 04-May-2023, at 1:32 PM, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>
>>> On Thu, May 04, 2023 at 08:35:53AM +0200, Thomas Huth wrote:
>>>> On 03/05/2023 16.55, Ani Sinha wrote:
>>>>> mformat and xorriso tools are needed by biosbits avocado tests. This patchset
>>>>> adds those two tools in the docker container images.
>>>>
>>>> tests/qtest/cdrom-test.c already uses genisoimage to create ISO images, and
>>>> the containers already have that tool installed. Could you maybe switch the
>>>> biosbits test to use that tool? Or the other way round? ... at least having
>>>> two tools to create ISO images in our containers sounds IMHO excessive.
>>>
>>> It looks like this series wasn't tested, because it doesn't even install
>>> the alpine image:
>>>
>>> ERROR: unable to select packages:
>>>   cdrkit-1.1.11-r3:
>>>     conflicts: xorriso-1.5.4-r2[cmd:mkisofs=1.1.11-r3]
>>>     satisfies: world[cdrkit]
>>>   xorriso-1.5.4-r2:
>>>     conflicts: cdrkit-1.1.11-r3[cmd:mkisofs=1.5.4-r2]
>>>     satisfies: world[xorriso]
>>>
>>>
>>> We definitely need to have either biosbits or cdrom-test.c changed to
>>> use the same tool.
>>
>> Wait, it seems xorriso package also provides geninsoimage?
>>
>> xorriso-1.5.4-4.el9.x86_64 : ISO-9660 and Rock Ridge image manipulation tool
>> Repo        : @System
>> Matched from:
>> Filename    : /usr/bin/genisoimage
>>
>> xorriso-1.5.4-4.el9.x86_64 : ISO-9660 and Rock Ridge image manipulation tool
>> Repo        : rhel-9-for-x86_64-appstream-rpms
>> Matched from:
>> Filename    : /usr/bin/genisoimage
>>
>> $ rpm -ql  xorriso-1.5.4-4.el9.x86_64 | grep bin
>> /usr/bin/cdrecord
>> /usr/bin/genisoimage
>> /usr/bin/mkisofs
>> /usr/bin/osirrox
>> /usr/bin/wodim
>> /usr/bin/xorrecord
>> /usr/bin/xorriso
>> /usr/bin/xorriso-dd-target
>> /usr/bin/xorrisofs
> 
> That is not the case in Fedora.  xorriso does not provide any
> genisoimage binary, that's provided by a 'genisoimage' RPM
> which was created from cdrkit src RPM.
> 
> Alpine likewise has no 'genisoimage' binary provided by
> xorriso.
> 
> For even more fun, xorriso is now a sub-RPM of the libisoburn
> source RPM
> 
> 
> If we could make cdrom-test  use 'mkisofs' binary then we could
> likely use the xorriso package on all platforms IIUC.

I assume it shoul be pretty easy to replace it in crom-test.c ... genisofs 
is a successor of the old mkisofs, so the commandd line parameter should be 
very similar or even the same.
Ani, could you add a patch to your series to replace it there?

  Thanks,
   Thomas


