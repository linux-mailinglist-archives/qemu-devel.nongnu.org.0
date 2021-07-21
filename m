Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251DC3D0B84
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:38:24 +0200 (CEST)
Received: from localhost ([::1]:53364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68gJ-0000NJ-7p
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m68Zq-0005JZ-AT
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:31:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m68Zn-0004Z4-ND
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626859899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rRSaVGNS4aw7daLSk86rhfZzzLGxCGQ0vIp9ZtOI9lg=;
 b=eH1hbj/8k50wXTtBMl7FncrykSFsOeZLKFKlOTgDUYAJHCzE+wMKoDnmjeWwmGTPeduOKS
 hQyZDSvqfX/uPc8kyvlaIC3WlDYenjJKnDc4W/XxYRDDeLXx4/hNtDnDBWumekHicXFGyi
 jeILeER054uu1r5GXCzUwQsuGwuDNoU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-QTO5dYXXOh-bN41x0ZRhyg-1; Wed, 21 Jul 2021 05:31:37 -0400
X-MC-Unique: QTO5dYXXOh-bN41x0ZRhyg-1
Received: by mail-wr1-f70.google.com with SMTP id
 k3-20020a5d52430000b0290138092aea94so744289wrc.20
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 02:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rRSaVGNS4aw7daLSk86rhfZzzLGxCGQ0vIp9ZtOI9lg=;
 b=oLlcBnaPdHsF/Jkf618g8t6yejYgxe7gbXAh314+S3OaH/dzor+HVvEE6y3sB4qUql
 xEJ8bMZpe1HoqeJjKjx+YNNu8f0tzHRnNIvE2wcMmBei2fWNm/3eF1pcGTl0mqwRQsPU
 K6dhiAhLZpQWifQzC2mZDHOgyKxYy5UbY8oTEaNYUIovU5GS1fazQIphTcahDJHLfQuj
 hrksP6fSkkp+vlBRQ+63AZ0olD22x0YLtlm/ZKyd5LZTeZZ3yuWjkdNrEh+ImDfP/hOD
 qWtH3RzpU69cXRAxCnqr+04/PQBmF3JDx/WJYANC58WCwAioTQkm8tQMM2XbfUGopSlt
 IVyw==
X-Gm-Message-State: AOAM531JCyf6ZvMkDwvylUEaN2henNJEAKPhwdaGSURlOTOPPu5TXzTj
 r9lRzfV4Fn53UfGXppFzh2Mz8wGSNPXvssCAo/3LxUgLJ6g6EKGSYqRttox0sSSGwrDRR7QEUNI
 3MJMfD2487yEJbmA=
X-Received: by 2002:a05:6000:1001:: with SMTP id
 a1mr41990506wrx.121.1626859896769; 
 Wed, 21 Jul 2021 02:31:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp6win5zFe/4Xiqr4ASYIfpsZ+gGG++ccadPe8Ndp1CgTfB5s0IubJ920wdNr5DeFRALTy9Q==
X-Received: by 2002:a05:6000:1001:: with SMTP id
 a1mr41990480wrx.121.1626859896558; 
 Wed, 21 Jul 2021 02:31:36 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.17.146])
 by smtp.gmail.com with ESMTPSA id b6sm4615656wmj.34.2021.07.21.02.31.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 02:31:35 -0700 (PDT)
Subject: Re: [PATCH] failover: unregister ram on unplug
To: qemu-devel@nongnu.org
References: <20210720181644.196315-1-lvivier@redhat.com>
 <20210721105817.0a4afc21@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <ce3dbcd0-6ddf-4d3a-4a42-59f347455476@redhat.com>
Date: Wed, 21 Jul 2021 11:31:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721105817.0a4afc21@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/07/2021 10:58, Igor Mammedov wrote:
> On Tue, 20 Jul 2021 20:16:44 +0200
> Laurent Vivier <lvivier@redhat.com> wrote:
> 
>> This simple change allows to test failover with a simulated device
>> like e1000e rather than a vfio device.
>>
>> This is interesting to developers that want to test failover on
>> a system with no vfio device. Moreover it simplifies host networking
>> configuration as we can use the same bridge for virtio-net and
>> the other failover networking device.
>>
>> Without this change the migration of a system configured with failover
>> fails with:
>>
>>   Unknown ramblock "0000:00:01.1:00.0/e1000e.rom", cannot accept migration
>>   error while loading state for instance 0x0 of device 'ram'
>>   load of migration failed: Invalid argument
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 

I've sent a v2 of this patch to reset has_rom to false.

I've updated the commit log message and the subject of the email to "failover: unregister
ROM on unplug" (that is more correct).

Thanks,
Laurent


