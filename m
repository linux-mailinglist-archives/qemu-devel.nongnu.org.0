Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF34047C0C0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 14:29:14 +0100 (CET)
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzfCb-0007S1-Ch
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 08:29:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzfAS-0006kp-J2
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzfAO-0000H8-He
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 08:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640093215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VuT/vVWvpx5asRFGF651PP5zN4vSO+/2N+1YC1gVJ/k=;
 b=OOA5ndXUfdJcdghzZCACwhgnXOD00flOea72nrY6hp10iknpewKJHuEyaXV8K98KihPwum
 dOAj95PBitOR974n+tE3hV+kjTWxo8BxWd2IxKQkBx3uyP7LEqW1XNJ2OXiyRhkoLUlWnZ
 hl1dsKSiA0Kms/MG8CQ7dq5Q0lLX3Ug=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-HMl5UhTfNeKtbqpW_3tIxQ-1; Tue, 21 Dec 2021 08:26:54 -0500
X-MC-Unique: HMl5UhTfNeKtbqpW_3tIxQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 n22-20020adf8b16000000b001a22f61b29cso4661044wra.23
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 05:26:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VuT/vVWvpx5asRFGF651PP5zN4vSO+/2N+1YC1gVJ/k=;
 b=MhUNxyBf25SbV7kndkLCryFxOwjLE2Xq50kGiWsB/Wn5yQrVD/OFoqRsWh/PfW9oQU
 2z+6OYMmhPI3vjbuOtJrRbqdrXoSNGxortkAKq7MKiNd3mCpauxh2KuY+ChM32KHoMXm
 vxnFvFiyrrq2rmONX7oOVJdpRRYkPmIwbufX2iqkt50iC+5R6TJMhCgqEhx5oNtrz3eJ
 Mjx1GgaWsy21E1ndLUXxix+sE96rh6cqJdodTfXkYmpVkNLKVeNw6t7O0ijPv1n+Apct
 zLwAEj86j0Jp0tDrBCflGFQOJHfrBJAq6nPpgWPrLWTuyUFrsLG3OHPOp2ri3MlOMiiH
 rRVg==
X-Gm-Message-State: AOAM531V3/wBiH1wa2dbKSHquRCl7pvD7ZwfRtj7bu0qAZte/Y5ofKGH
 ExSKEfn4pk/NgeCyCkaC57+xgeeas0sL3KXo4Tw+Fh4HQ3YLMk1SRVcu0YpCb91eNSni17i3FIq
 Hnkac674slJn05gI=
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr2656973wrq.273.1640093212113; 
 Tue, 21 Dec 2021 05:26:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+Z2EMrsC8AKzZOjRZ3ArZWdmINOv2QsWQ44jwK3lgrRFj3+0w+zqVCaTFFabHjl+ScZyLTg==
X-Received: by 2002:a5d:6d06:: with SMTP id e6mr2656958wrq.273.1640093211916; 
 Tue, 21 Dec 2021 05:26:51 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id x8sm2259500wmj.44.2021.12.21.05.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 05:26:51 -0800 (PST)
Message-ID: <42a61ff0-1622-ddf7-942d-c9428e7c1b5c@redhat.com>
Date: Tue, 21 Dec 2021 14:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] failover: Silence warning messages during qtest
To: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org
References: <20211220145314.390697-1-lvivier@redhat.com>
 <bac44c19-7e63-919e-6491-9c50f1933abc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <bac44c19-7e63-919e-6491-9c50f1933abc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.012, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/21/21 13:30, Thomas Huth wrote:
> On 20/12/2021 15.53, Laurent Vivier wrote:
>> virtio-net-failover test tries several device combinations that produces
>> some expected warnings.
>> These warning can be confusing, so we disable them during the qtest
>> sequence.
>>
>> Reported-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>>   hw/net/virtio-net.c   | 3 ++-
>>   migration/migration.c | 4 +++-
>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index f2014d5ea0b3..c64a6b9d1745 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -44,6 +44,7 @@
>>   #include "hw/pci/pci.h"
>>   #include "net_rx_pkt.h"
>>   #include "hw/virtio/vhost.h"
>> +#include "sysemu/qtest.h"
>>     #define VIRTIO_NET_VM_VERSION    11
>>   @@ -925,7 +926,7 @@ static void virtio_net_set_features(VirtIODevice
>> *vdev, uint64_t features)
>>           qapi_event_send_failover_negotiated(n->netclient_name);
>>           qatomic_set(&n->failover_primary_hidden, false);
>>           failover_add_primary(n, &err);
>> -        if (err) {
>> +        if (err && !qtest_enabled()) {
>>               warn_report_err(err);
>>           }
> 
> This trips the sanitizer build now:
> 
>  https://gitlab.com/thuth/qemu/-/jobs/1907374419
> 
> I think you have to error_free(err) in case qtest_enabled() ?

Indeed. In that case it might be better to add a
warn_report_err_except_qtest() helper...


