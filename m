Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 161CC447E56
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 11:56:11 +0100 (CET)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk2Jt-00043M-Gt
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 05:56:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk2HV-0001Ez-DQ
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 05:53:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mk2HT-0007St-6d
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 05:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636368818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RENGpIN8DCrSIdYAk8pti8qCs3McD0jpLFk1klrv8c0=;
 b=ADVBXDuS+zOqYlvhzK/7WC73gNcjm031WPPjvrRlfR/qpjW8tXIMZTM/yJDg2OADzxiGIZ
 LTlGYvbG3G2+Mp4M3+RRSXUFcU/ryV7D5lonDQ5s9bXqg+bT3jMH7j55i0TSt8JI585vxh
 7Me87ooarjD1zBJG/RtfjJIVgP8LOa8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-2h0t4XeLMKqkNKUtfsEdXg-1; Mon, 08 Nov 2021 05:53:37 -0500
X-MC-Unique: 2h0t4XeLMKqkNKUtfsEdXg-1
Received: by mail-ed1-f69.google.com with SMTP id
 s6-20020a056402520600b003e2dea4f9b4so11498228edd.12
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 02:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RENGpIN8DCrSIdYAk8pti8qCs3McD0jpLFk1klrv8c0=;
 b=LRgeSjJpZ5e3CBN5eZj14SP0IxDw+HRlieBGoaS3tK5x/fsRhXVNwhEynf6/OZ202d
 YAdL3Zt8gQosKLP4u1+53jSULcj3u77TiOdNQe4lGTNb0MhYqqaBrH0iJ3KK3lWBebN/
 LU0fRqHJyCjf1Pw5coMfcBygZGkhN1EIgomQZan5utwJR9qS5erQsFCJGORIpSXMJVl7
 HNP1xpjuepqUfI9jPIQaFT/qmjsme/zr5fs6CbXiwxt4v+aPzQohzV34C90imOSICFK7
 xF+SPEF48Io+7gt8OdERVbWHijM1GVyThKbfad8I/RtF7wAjoRI118UyV2hGeQ5yxmvK
 0yIw==
X-Gm-Message-State: AOAM531L/OQgS9fZJFrKug6P0rqnGvwJFroYOV4vRCKypi1foIK86iYs
 Tj8gIpkqbXebuR9kj/rvDpSJBGHrhJqbaMlDtf4sz5KzY4TBZUz7Mq5C3k30T//aGUi7Nf9u0He
 rqYk2jqX6jUE02u0=
X-Received: by 2002:a17:907:1b0a:: with SMTP id
 mp10mr97657173ejc.29.1636368816194; 
 Mon, 08 Nov 2021 02:53:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrvjegcTPizvoyMNxp+nIfjEHKCXBH3eWSROlCVLmtPQP62NtPV0aJfuGR/gm46vitbPmBEQ==
X-Received: by 2002:a17:907:1b0a:: with SMTP id
 mp10mr97657144ejc.29.1636368815973; 
 Mon, 08 Nov 2021 02:53:35 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w7sm5925021edc.4.2021.11.08.02.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 02:53:35 -0800 (PST)
Message-ID: <8ca321c4-a28c-cefd-eda7-525c0bd715fc@redhat.com>
Date: Mon, 8 Nov 2021 11:53:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] vhost-user-scsi: fix Kconfig dependencies
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211108094705.554350-1-pbonzini@redhat.com>
 <2a587f18-ac3f-0125-9685-b860b731c84d@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <2a587f18-ac3f-0125-9685-b860b731c84d@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: felipe@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 10:53, Philippe Mathieu-Daudé wrote:
>>   config VHOST_USER_SCSI
>>       bool
>> +    default y
>>       # Only PCI devices are provided for now
>> -    default y if VIRTIO_PCI
>> -    depends on VIRTIO && VHOST_USER && LINUX
>> +    depends on VIRTIO_PCI && VHOST_USER && LINUX
> But there is no PCI call there:

Yeah, you're right.  You can still access the device on virtio-mmio via 
-device vhost-user-scsi.

> $ git grep pci hw/scsi/vhost*scsi*
> $
> 
> Don't we want to add VHOST_USER_SCSI_PCI in
> hw/virtio/Kconfig instead?

In practice you already have hw/virtio/vhost-user-scsi.pci conditional 
on "CONFIG_VHOST_USER_SCSI && CONFIG_VIRTIO_PCI", and further 
configuration is not too useful.

I think the best option is to either make it "default y if VIRTIO_PCI || 
VIRTIO_MMIO", or bite the bullet and add the ccw proxy devices.

Paolo


