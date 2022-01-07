Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4947A4871F7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 06:04:50 +0100 (CET)
Received: from localhost ([::1]:46846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5hQn-00030r-DE
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 00:04:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5hPH-0001Zx-VQ
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 00:03:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n5hPD-0005Vg-Gw
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 00:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641531789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VgI4UIzGA8YuP/zN8RgWeyP3XY5gpvw1FEqiKFmHBVE=;
 b=FfoOnVHHwXZZmdqKQ1RosuBpZ2yhIj2nrWFMhy9OzlkNDPwxp1kXR7DGElObxokN65vSxx
 WXckSzr1LRYQu5J5iC65CcSGE1ngjIi6fKtuPwe4PCsMSaReFZ++/iHysFU/9P0+xL+a+y
 ONz8Ii1HWVTJE0Wx8TrZB/KkBM8yvcg=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543--jDcvl3zPTizINMWm08y9w-1; Fri, 07 Jan 2022 00:03:04 -0500
X-MC-Unique: -jDcvl3zPTizINMWm08y9w-1
Received: by mail-pf1-f197.google.com with SMTP id
 b17-20020aa78ed1000000b004badf95ccd9so3103744pfr.8
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 21:03:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=VgI4UIzGA8YuP/zN8RgWeyP3XY5gpvw1FEqiKFmHBVE=;
 b=H+99Xg9uTjlpowdkJgwkApY7miVY/GO3wR03bCnP6zQJBq5LWVWOcKaFOkzCVcyOk9
 /r4/quE1DwZs/LjzIW6OHel4gqfuWVy7qyI5D+KYhZCXNdJae88q1gBYDu+iaOP6v2+L
 pKbxQNs0IWrGUXtitlaIejKKLj0qWl81mrJzNEtvPBFi0ZCiiNBUPJBZQVNAPmUojPD5
 NFW8s7zNSQiy/wqastJdj2uYhBsAaqmCjnSQJiFkQquE2YgKpcY4hf3F8PuPar8vzaAg
 ve13EIJjsYm3pz3ghQJmQ2lCxMqGMIlCLx5c7kj4pC37keNGDEOPvxm36j0MlPTN9I6c
 5WPA==
X-Gm-Message-State: AOAM533vCeq5gJews94i8paw1W+afXPCBCQOBsIXqP/XFS/etkHdIWZR
 IOuMeXI0FqQGG5sygD2mlj4ptC4ROY8j4Ux3qELH+ztMITvQHPzcx+MLdviFKCvMo7wNwI4VAJ1
 UFanqBZ9+5hnN2Jg=
X-Received: by 2002:a05:6a00:1509:b0:4ba:f004:e3af with SMTP id
 q9-20020a056a00150900b004baf004e3afmr63581503pfu.32.1641531783374; 
 Thu, 06 Jan 2022 21:03:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+F0n93OZ+/HdgH/fA8PtoHYagZPMhy6YTvaZCJ+yIwBj5xTChepID6jnkVz/8M+hHlqUTMQ==
X-Received: by 2002:a05:6a00:1509:b0:4ba:f004:e3af with SMTP id
 q9-20020a056a00150900b004baf004e3afmr63581483pfu.32.1641531783078; 
 Thu, 06 Jan 2022 21:03:03 -0800 (PST)
Received: from [10.72.13.245] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id o11sm3317124pgk.36.2022.01.06.21.02.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 21:03:02 -0800 (PST)
Message-ID: <cf5dc700-e0ae-6de9-f4c3-53ce5528accf@redhat.com>
Date: Fri, 7 Jan 2022 13:02:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v8 0/7] Add vmnet.framework based network backend
From: Jason Wang <jasowang@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>, qemu-devel@nongnu.org
References: <20211211104413.50524-1-yaroshchuk2000@gmail.com>
 <89b1a68f-7eae-30a6-dba0-ed86e6638ce9@redhat.com>
In-Reply-To: <89b1a68f-7eae-30a6-dba0-ed86e6638ce9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.691, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: phillip.ennen@gmail.com, armbru@redhat.com, r.bolshakov@yadro.com,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/1/6 下午12:18, Jason Wang 写道:
>
> 在 2021/12/11 下午6:44, Vladislav Yaroshchuk 写道:
>> macOS provides networking API for VMs called 'vmnet.framework':
>> https://developer.apple.com/documentation/vmnet
>>
>> We can provide its support as the new QEMU network backends which
>> represent three different vmnet.framework interface usage modes:
>>
>>    * `vmnet-shared`:
>>      allows the guest to communicate with other guests in shared mode 
>> and
>>      also with external network (Internet) via NAT. Has (macOS-provided)
>>      DHCP server; subnet mask and IP range can be configured;
>>
>>    * `vmnet-host`:
>>      allows the guest to communicate with other guests in host mode.
>>      By default has enabled DHCP as `vmnet-shared`, but providing
>>      network unique id (uuid) can make `vmnet-host` interfaces isolated
>>      from each other and also disables DHCP.
>>
>>    * `vmnet-bridged`:
>>      bridges the guest with a physical network interface.
>>
>> This backends cannot work on macOS Catalina 10.15 cause we use
>> vmnet.framework API provided only with macOS 11 and newer. Seems
>> that it is not a problem, because QEMU guarantees to work on two most
>> recent versions of macOS which now are Big Sur (11) and Monterey (12).
>>
>> Also, we have one inconvenient restriction: vmnet.framework interfaces
>> can create only privileged user:
>> `$ sudo qemu-system-x86_64 -nic vmnet-shared`
>>
>> Attempt of `vmnet-*` netdev creation being unprivileged user fails with
>> vmnet's 'general failure'.
>>
>> This happens because vmnet.framework requires `com.apple.vm.networking`
>> entitlement which is: "restricted to developers of virtualization 
>> software.
>> To request this entitlement, contact your Apple representative." as 
>> Apple
>> documentation says:
>> https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_vm_networking 
>>
>>
>> One more note: we still have quite useful but not supported
>> 'vmnet.framework' features as creating port forwarding rules, IPv6
>> NAT prefix specifying and so on.
>>
>> Nevertheless, new backends work fine and tested within 
>> `qemu-system-x86-64`
>> on macOS Bir Sur 11.5.2 host with such nic models:
>>    * e1000-82545em
>>    * virtio-net-pci
>>    * vmxnet3
>>
>> The guests were:
>>    * macOS 10.15.7
>>    * Ubuntu Bionic (server cloudimg)
>>
>>
>> This series partially reuses patches by Phillip Tennen:
>> https://patchew.org/QEMU/20210218134947.1860-1-phillip.ennen@gmail.com/
>> So I included them signed-off line into one of the commit messages and
>> also here.
>
>
> Applied.
>
> Thanks


Reverted actually, though it can be built on macos but not Linux. I see 
thing like:

In file included from qapi/qapi-types-net.c:15:
qapi/qapi-types-net.h:411:9: error: unknown type name 
‘NetdevVmnetHostOptions’
   411 |         NetdevVmnetHostOptions vmnet_host;
       |         ^~~~~~~~~~~~~~~~~~~~~~
qapi/qapi-types-net.h:412:9: error: unknown type name 
‘NetdevVmnetSharedOptions’
   412 |         NetdevVmnetSharedOptions vmnet_shared;
       |         ^~~~~~~~~~~~~~~~~~~~~~~~
qapi/qapi-types-net.h:413:9: error: unknown type name 
‘NetdevVmnetBridgedOptions’
   413 |         NetdevVmnetBridgedOptions vmnet_bridged;
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~

....

Thanks



