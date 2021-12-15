Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CA475826
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:47:37 +0100 (CET)
Received: from localhost ([::1]:45286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSky-0002QY-IL
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:47:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mxRz6-0005U4-9n
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:58:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mxRz4-0007Jx-2E
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:58:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639565885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+sLWq9yZy6/TOfJauAd/B3Y4SZxmrkkuZczrFiGc20k=;
 b=R1O7vtUX6DQzcPG1ce6ep+OC2ejblkdGIJn3HIHXAXQZ5tU2uL//jkl0OX4izUoT4DVQtB
 VzLXp4vCPOFrATiRD7XunciXvfjKKVOX3AUhbJOt+Bx4Uc4dLKJ2hHDDsKKqxHm0DFcXaa
 g5rArQPbxpqfVIVEgQgJPJEEvx3x7ic=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-gyGy7PScPtKrDSmF-bU2Jw-1; Wed, 15 Dec 2021 05:58:04 -0500
X-MC-Unique: gyGy7PScPtKrDSmF-bU2Jw-1
Received: by mail-wm1-f71.google.com with SMTP id
 b75-20020a1c804e000000b0034569bde713so591310wmd.9
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:58:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+sLWq9yZy6/TOfJauAd/B3Y4SZxmrkkuZczrFiGc20k=;
 b=AMUeGX+xL/inAcCMDscHAFWMfem8koweEBlBubLZokh+c8hJRkvigNbgNnv8flMP5A
 p4EvOj1ExjYGY8TVK9SYJsJYbv/1jqIOAW47lY7OPs7DOAEF2A1ormNZoiqAm1pfjsi2
 33uuIGbClxYnsCOd5d2lWBOmauykF+17qdpZD9c+n2KktaN/EqN2KB45Z4cApJZaApD+
 DFdMsKdciv8bb0Mh2s2ZWlgx+cWOk3P8yJ5eLIy9Q23AccQa+YDAIS5Yp8ma5m7t75qO
 5O61VKtstu4PwbhavgMLryWLOWqkMnaSAXAJrUTLt38xbkWZ/HOfpU0v88fQHVGBn5QH
 y+bA==
X-Gm-Message-State: AOAM533O9IYWahUgtvj8Au4iF2SUrgcBmYEhjC7XjzWLIFr/myrErAzD
 6t0lI6HjziSgT+dLMZagIVQin9t8dXShm+xobGDkG26nPA4USO063MU67rrEg3w+xfVT9zHoECo
 8urdePVSpvOUzpgA=
X-Received: by 2002:a1c:f018:: with SMTP id a24mr4089474wmb.51.1639565882711; 
 Wed, 15 Dec 2021 02:58:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoGcGssZavOfUyjTVcpAysLADub3bjDt0gtfwIFiVxRa2HsPLEJm9IH2A60FT83wbDUiaipg==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr4089464wmb.51.1639565882457; 
 Wed, 15 Dec 2021 02:58:02 -0800 (PST)
Received: from [192.168.100.42] ([82.142.9.98])
 by smtp.gmail.com with ESMTPSA id l26sm1419504wms.15.2021.12.15.02.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:58:02 -0800 (PST)
Message-ID: <e5011077-3285-cb70-9948-27f84b407dba@redhat.com>
Date: Wed, 15 Dec 2021 11:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] trace-events,pci: unify trace events format
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211105192541.655831-1-lvivier@redhat.com>
 <20211107033751-mutt-send-email-mst@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20211107033751-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.64, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/11/2021 09:38, Michael S. Tsirkin wrote:
> On Fri, Nov 05, 2021 at 08:25:41PM +0100, Laurent Vivier wrote:
>> Unify format used by trace_pci_update_mappings_del(),
>> trace_pci_update_mappings_add(), trace_pci_cfg_write() and
>> trace_pci_cfg_read() to print the device name and bus number,
>> slot number and function number.
>>
>> For instance:
>>
>>    pci_cfg_read virtio-net-pci 00:0 @0x20 -> 0xffffc00c
>>    pci_cfg_write virtio-net-pci 00:0 @0x20 <- 0xfea0000c
>>    pci_update_mappings_del d=0x555810b92330 01:00.0 4,0xffffc000+0x4000
>>    pci_update_mappings_add d=0x555810b92330 01:00.0 4,0xfea00000+0x4000
>>
>> becomes
>>
>>    pci_cfg_read virtio-net-pci 01:00.0 @0x20 -> 0xffffc00c
>>    pci_cfg_write virtio-net-pci 01:00.0 @0x20 <- 0xfea0000c
>>    pci_update_mappings_del virtio-net-pci 01:00.0 4,0xffffc000+0x4000
>>    pci_update_mappings_add virtio-net-pci 01:00.0 4,0xfea00000+0x4000
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>
> Looks good to me. We are in freeze, will queue. Pls ping after
> the release to make sure it's not lost.

Ping ?

Thanks,

Laurent


