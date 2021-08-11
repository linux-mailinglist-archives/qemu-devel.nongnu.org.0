Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4AC3E8D91
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:52:55 +0200 (CEST)
Received: from localhost ([::1]:42508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDkus-0005OC-80
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mDkti-0004f3-91
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:51:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mDktf-0006R5-6s
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628675495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5F8qDSrdM6n6I48WOw9yUFo7OhL0sY2ViO4yegu/pA=;
 b=iQNsN4fcW8Mbpqu4wHgUSy/hoccf6yusifOKGBJsZHVdLcUdqoxFFcbY+UIMmz7FBHm6T6
 r5MiYpUiziG7OeB6zI/vnEkzsXjRXdCytAvR1Lvv6goG58NiPvnFFPcFUiCbUxxllVq6wg
 OgmoyI2469ZNsit2CzJFFyB+YJDlZSE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-J9XbvQoBPqG2IlaCbbvIig-1; Wed, 11 Aug 2021 05:51:34 -0400
X-MC-Unique: J9XbvQoBPqG2IlaCbbvIig-1
Received: by mail-wr1-f69.google.com with SMTP id
 o4-20020a5d47c40000b0290154ad228388so532311wrc.9
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 02:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I5F8qDSrdM6n6I48WOw9yUFo7OhL0sY2ViO4yegu/pA=;
 b=EMj0es5zKtry7Gj8+9RDcJV7lzHwL7d7Fj0gdDviqJSzyp4Q7wJvZkFKNkJZ9137ta
 zcM5AQK9/uvY/p9L2OGqRysAKmiyL96/zWbUgF1eD7BMnHfC8i9p73I1N1g0+qTVj86K
 jLBX32YwWyvhzNHwAvPm+ALsBkzwLPileTYvQvJJCbagLiTelN3FAX/pWyHmYQ5O5HaN
 wp+/7Q+VdeVB2PahqhbVuIUvjNv2G+2wqrf4M4IL9yy95ImA5mduLANdUUaLaa2doPYR
 0ZUqcsWKB/D6dvD4crw1P1dRykiYP2Uu+lhIg9HTXx8Gn7GXHAbjJNotvmXtKTWPkJCN
 jp3g==
X-Gm-Message-State: AOAM532hmkok/6N6+Omj0GYFGUWs/vtW/ipu+rQF99JQHcrA4MAjVp+e
 jmfI+tIX4Mq8kYagKaVUS9v73zxwtNNJR9oPupWmzDYC5FtPs8o1TSNrOkRPaBBJOUeAshwvy1o
 S6Zt09YuaYmwC+Sw=
X-Received: by 2002:a5d:456a:: with SMTP id a10mr13330549wrc.339.1628675493496; 
 Wed, 11 Aug 2021 02:51:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXBBy9d0RsSMi8zs+GaNidcBOq5KSenBAf9RJ5HyZGqvfllBRZ9ng4VeUgQOExAUb/1gq7fg==
X-Received: by 2002:a5d:456a:: with SMTP id a10mr13330523wrc.339.1628675493272; 
 Wed, 11 Aug 2021 02:51:33 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.5.86])
 by smtp.gmail.com with ESMTPSA id e10sm8712267wrt.82.2021.08.11.02.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 02:51:32 -0700 (PDT)
Subject: Re: [PATCH v4] failover: unregister ROM on unplug
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20210721160905.234915-1-lvivier@redhat.com>
 <20210811024801-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <d54eac44-4b26-1121-9ca8-de4d11ba8aad@redhat.com>
Date: Wed, 11 Aug 2021 11:51:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210811024801-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/08/2021 08:50, Michael S. Tsirkin wrote:
> On Wed, Jul 21, 2021 at 06:09:05PM +0200, Laurent Vivier wrote:
>> The intend of failover is to allow to migrate a VM with a VFIO
>> networking card without disrupting the network operation by switching
>> to a virtio-net device during the migration.
>>
>> This simple change allows to test failover with a simulated device
>> like e1000e rather than a vfio device, even if it's useless in real
>> life it can help to debug failover.
>>
>> This is interesting to developers that want to test failover on
>> a system with no vfio device. Moreover it simplifies host networking
>> configuration as we can use the same bridge for virtio-net and
>> the other failover networking device.
>>
>> Without this change the migration of a system configured with failover
>> fails with:
>>
>>   ...
>>   -device virtio-net-pci,id=virtionet0,failover=on,...  \
>>   -device e1000,failover_pair_id=virtionet0,... \
>>   ...
>>
>>   (qemu) migrate ...
>>
>>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>>   error while loading state for instance 0x0 of device 'ram'
>>   load of migration failed: Invalid argument
>>
>> This happens because QEMU correctly unregisters the interface vmstate but
>> not the ROM one. This patch fixes that.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> I began to wonder about this. Why are we sending the option ROM at all?
> I think there's no need to do it for the primary ...

I think there is no way to check the ROM is the same on source and destination, and it has
to be.

By sending the ROM:
- we can check the size is the same, otherwise the migration fails,
- after the migration, even if a different ROM was provided on the destination side, the
guest executes the ROM provided by the source.

Thanks,
Laurent


