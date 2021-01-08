Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4432EF459
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:02:46 +0100 (CET)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxtHp-0004sA-Cu
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:02:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxtFg-0003jA-Vw
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:00:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxtFe-0006sV-LO
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610118028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u1IuKbwLYNthmDCpstB8q4tYrc/MLEOUH7OdfYyOI9k=;
 b=EqHu83Bxoqk1CzQ/m91TCwSiLtt4ij3tlUYO72r/SJLRmn9obOW8v/PDr3qYOUik1+LwTj
 FXYSUMqv2yNk2rTnaIJgnNnuqXgOOyKMF0Zb1QQsJhB66uUiqj94YppmefzGpVQecoSwfI
 OTK6U2cZnLXlOnd3Zni8xD5o05nPCFo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-aChwQANMPYe67r9HKufCkQ-1; Fri, 08 Jan 2021 10:00:25 -0500
X-MC-Unique: aChwQANMPYe67r9HKufCkQ-1
Received: by mail-wm1-f70.google.com with SMTP id f187so3322603wme.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u1IuKbwLYNthmDCpstB8q4tYrc/MLEOUH7OdfYyOI9k=;
 b=Ozefa7OCrdXfnG6eUPP6AWcH2fLrpa5mw522udcjkRpSaWjtaZ477Afe1FQQy+GXCr
 x1DT4RmLPBiVcJoR7EOdMv3jUnB7ebgDOziGHaIgPGXOVufsRIAAP0pcrt0XXOkCGtWU
 np5+Pjk9acWKtlAQyZ6aOL6udFb3p9IHvMiI7LjHGpDlsFOMqpWhxCsk9zq9tmftqqZ5
 Ogd414tNTongf2WKa3Ha8ydWKTlUnJX8OVPuA1UWzXXosJ0wGLHdFUhSHdid+3i2hr/v
 ImuabbYe2LFr9+wjvP7mNj28k5ohxGpJFt75BhjPpgHNLQPjmBIeE6t2araEg1wRh/fB
 MIdg==
X-Gm-Message-State: AOAM530/gMAacuVY8nX49M1NwX1kk5lf8PJCX5Rl09FoI2yGKsDAlN/9
 +2VZB2qMrMdv1vid8n6Ij3m1PMnF43ZkTfVo3VoyT8vdkQavP0RZ/8W0lwLlXbyKqV7pb9v7GLV
 cOJWsFfhi8E7g61o=
X-Received: by 2002:adf:f707:: with SMTP id r7mr4200376wrp.113.1610118024480; 
 Fri, 08 Jan 2021 07:00:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOZspFgPpk0J7OmXILVYXThdzMf+DzDIRjDFqhlyLcxSraWJiPxRluComdGgPffI/zNeC4dw==
X-Received: by 2002:adf:f707:: with SMTP id r7mr4200359wrp.113.1610118024309; 
 Fri, 08 Jan 2021 07:00:24 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id k1sm13725297wrn.46.2021.01.08.07.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 07:00:23 -0800 (PST)
Subject: Re: [PATCH] hw/virtio-pci: Replace error_report() by
 qemu_log_mask(GUEST_ERROR)
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20201210172834.178052-1-philmd@redhat.com>
 <20210108120243.zgajoyust5n56l5m@steredhat>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <990898ff-a225-0548-690a-f7bab039ca08@redhat.com>
Date: Fri, 8 Jan 2021 16:00:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108120243.zgajoyust5n56l5m@steredhat>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/8/21 1:02 PM, Stefano Garzarella wrote:
> On Thu, Dec 10, 2020 at 06:28:34PM +0100, Philippe Mathieu-DaudÃƒÂ© wrote:
>> Replace I/O write error reported with error_report() by
>> qemu_log_mask(GUEST_ERROR) which allow filtering.
>>
>> Signed-off-by: Philippe Mathieu-DaudÃƒÂ© <philmd@redhat.com>
>> ---
>> hw/virtio/virtio-pci.c | 6 ++++--
>> 1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
>> index f863f69ede4..094c36aa3ea 100644
>> --- a/hw/virtio/virtio-pci.c
>> +++ b/hw/virtio/virtio-pci.c
>> @@ -27,6 +27,7 @@
>> #include "hw/qdev-properties.h"
>> #include "qapi/error.h"
>> #include "qemu/error-report.h"
>             ^
> Just a little thing, could we remove this inclusion since we are not
> using error_report() anymore in this file?

We can't because virtio_pci_device_plugged() calls
warn_report() twice :/

> Anyway the patch LGTM:
> 
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks!

Phil.


