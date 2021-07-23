Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF3D3D3725
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 10:56:52 +0200 (CEST)
Received: from localhost ([::1]:53378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6qzD-0000hT-Ri
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 04:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6qy6-00089o-Jz
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6qy2-0005tn-NM
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 04:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627030534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3aNKE5imqLeDXSxGIumV2gEUBOgFz9Imgzr12p0vh1E=;
 b=AiaCB2YXGxZuc9287VAKuXWHVANVlA43jG2EfdeN33vdpQg0a229i86WR6uojPW15RdPi7
 XjzuiiQqk1eLiwJpd83VmORXF9jheDSkT9Jiqzi3e30Ks6PoPzxjcJ+TxwQRWdyo5kUxfL
 0j2tXxwANV3D8mFt4XS7Sid/tbxXqW4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-X87zrqcoOgSuk6QBtVxMFQ-1; Fri, 23 Jul 2021 04:55:32 -0400
X-MC-Unique: X87zrqcoOgSuk6QBtVxMFQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 q132-20020a1ca78a0000b029023448cbd285so571805wme.2
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 01:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3aNKE5imqLeDXSxGIumV2gEUBOgFz9Imgzr12p0vh1E=;
 b=bAeNzfu38W8W+Ycqv+qnCo1Jt+S2M9MKd0b6l/O+r3sBN/0YvEn2icCs+5G5EoHhKg
 FfQcfPmsh1bH0ktssmfKH1SE9aZsmHuQRYNajRJMcFTcnxP7i5CT1AS6L92A/eyAv00g
 Y1Ni+NmWfEBJbqGPVysJmKR9VgwkTCVbrkF8cAYoRP142wlMMtYxLwQP3FQHMqeDDEL4
 90ekS7jmlIOWXlcF1SHfst3NmFarBumvpwD0DtUtUPmMiUG8JKmQ63wAQzQf45Zu662b
 uBkXqICNntMYRB0f7l17jjqryUyvAlYgLXIra9V6qGVFZLFudGTZQRQ9kIbQaTG8uQe3
 x5yQ==
X-Gm-Message-State: AOAM5317pkfwjcpv71dhEJ47ULp7q6Xlqnf+uKCSL5uSsVbZMIqDJRXA
 hmACslwYlhEfUWdseocg6/SI/g1BNFgg5/r2o9ExElorrE3QewBmaNFnbBwPr1Kq6xypScs6YCh
 XHIEKZwbK1eCSOcs=
X-Received: by 2002:a5d:6481:: with SMTP id o1mr4237230wri.164.1627030531739; 
 Fri, 23 Jul 2021 01:55:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZQCtoET4rgd0UmkKnDBskPLcCNqrIvUFLhrOlcMS6ryyv5IQPeZfqPRVK5w0QiNz56YVOvQ==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr4237207wri.164.1627030531542; 
 Fri, 23 Jul 2021 01:55:31 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.2.134])
 by smtp.gmail.com with ESMTPSA id n23sm27058125wmc.38.2021.07.23.01.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 01:55:31 -0700 (PDT)
Subject: Re: [PATCH v4] failover: unregister ROM on unplug
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210721160905.234915-1-lvivier@redhat.com>
 <20210721121922-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <ded25268-597e-e697-8e24-690929652064@redhat.com>
Date: Fri, 23 Jul 2021 10:55:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721121922-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/2021 18:19, Michael S. Tsirkin wrote:
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
> And does failover_replug_primary roll it all back then?

In fact, I think we cannot roll it back because we don't have all the information to do
the vmstate_register() again. Perhaps we can implement a
vmstate_disable()/vmstate_enable() to disable the state migration without removing the
information from the list?

Thanks,
Laurent


