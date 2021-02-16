Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF54131CDC0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:14:59 +0100 (CET)
Received: from localhost ([::1]:49270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC306-0003ik-N0
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:14:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC2y5-00039y-17
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:12:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC2y0-0001OS-1J
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:12:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613491966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LO2iskZIu0OWG2sePmWxIUIb9+F29hbvH/s58iMpDmo=;
 b=jLggkx7p0d+NZDTJPlWeL+DwSobIqvEDci6aH61Qous6nLKPeo3tnhVw18UQKQ+P1BOrHL
 MMAYG5zyNWAhD/sxKzaWqaiV+n5AFSH44TXL2YK34eM1glyCZsuLHG9Bzw1HaIOSz5K9Lj
 UnN1IMqxhwuKzzy3veAHE7QOxkxrx84=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-_Sgg9HRCM1OqAw_QXek7OA-1; Tue, 16 Feb 2021 11:12:44 -0500
X-MC-Unique: _Sgg9HRCM1OqAw_QXek7OA-1
Received: by mail-wm1-f71.google.com with SMTP id k65so10728723wmb.3
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:12:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LO2iskZIu0OWG2sePmWxIUIb9+F29hbvH/s58iMpDmo=;
 b=T1rfHHWDkmNs1OmO/C9nNATlAHLQrBZIaLp8Eo4VqWTiQ2vOdluNY1FniUJUmVIXt4
 C1tjXI2TLQ/Xz9/mjvYT8jkYBTt03aolTvnsOSa2UveMyUWq00duoQWvwI8zMSLw1Lfu
 fl9V0G3WrqsX1KE/WUrlGQvd0Ym+WwpS53ubPuoNx4rH6p5MFBwvRehyL9zcd33yPS+S
 vu8jwA3D6nPAcBG45cFz6nyuhHOOAXgkejZEPNUVohFoMOIRLmSGZ19b2x7/FbDE2Ik1
 wOQM0KCCcsYtdzqtnVQNLTKJ78fLdJkzq9lYhmlpKv7xx5FSpJgF/aHB3ropAOlTwdWz
 T5Qg==
X-Gm-Message-State: AOAM531jNiZ0NRKPsYEmwz+zRsKv5YDSHrpTzkhM/nFUMvvaKOIG/CrM
 OiBaR9jWr7MliTgu/OvfXlsfZE6RT6DU3MQ6AE2ijezlCFz+8RhJDaBJUv6J8INdqN6CH38ooV+
 5jYBtgSKFxvPyYHg=
X-Received: by 2002:adf:e884:: with SMTP id d4mr23581805wrm.275.1613491962756; 
 Tue, 16 Feb 2021 08:12:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwR1yte4fPTBgupw/p+yJxAgqpsXIR/Axzz0t+XMH0dOZ7epkx5IeoUQNqo+WHQiu0J7ZFzZA==
X-Received: by 2002:adf:e884:: with SMTP id d4mr23581785wrm.275.1613491962558; 
 Tue, 16 Feb 2021 08:12:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm7236451wrx.82.2021.02.16.08.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 08:12:41 -0800 (PST)
Subject: Re: [PATCH] event_notifier: Set ->initialized earlier in
 event_notifier_init()
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20210216120247.1293569-1-groug@kaod.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bcb42e5b-7176-ddb3-4c23-a6006cdf7615@redhat.com>
Date: Tue, 16 Feb 2021 17:12:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210216120247.1293569-1-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/21 13:02, Greg Kurz wrote:
> Otherwise the call to event_notifier_set() is a nop, which causes
> the SLOF firmware on POWER to hang when booting from a virtio-scsi
> device:
> 
> virtio_scsi_dataplane_start()
>   virtio_scsi_vring_init()
>    virtio_bus_set_host_notifier() <- assign == true
>     event_notifier_init() <- active == 1
>      event_notifier_set() <- fails right away if !e->initialized
> 
> Fixes: e34e47eb28c0 ("event_notifier: handle initialization failure better")
> Cc: mlevitsk@redhat.com
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>   util/event_notifier-posix.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
> index 5b2110e86198..8307013c5df0 100644
> --- a/util/event_notifier-posix.c
> +++ b/util/event_notifier-posix.c
> @@ -66,10 +66,10 @@ int event_notifier_init(EventNotifier *e, int active)
>           e->rfd = fds[0];
>           e->wfd = fds[1];
>       }
> +    e->initialized = true;
>       if (active) {
>           event_notifier_set(e);
>       }
> -    e->initialized = true;
>       return 0;
>   
>   fail:
> 

Queued, thanks.

Paolo


