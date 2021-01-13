Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28392F4D69
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:42:42 +0100 (CET)
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhM9-0001Fx-Tu
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzhHz-0005PI-5r
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:38:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzhHx-0000OF-FK
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610548700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e2XpUVRrklAmYO99DP+KqGsYVdiryaxPncQig1yHtpU=;
 b=ZdTlYrCDVp6VYl9KjvyijfyZ0kJJnqMkw6wpCIae9d294mlPCYHZ6WUxJg+W2/iw01mjW5
 81CKODYV0YAoR8NHKmT2vSDl6F7FhZvjUqjp/b/mN5Z+FhD0cZ1rxmYn5LHM4zbglProy9
 zspOLxqJPF7TpPpzUxQe1pbuE3lfLBc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-DoZVqlENM5upjxD8bb-28A-1; Wed, 13 Jan 2021 09:38:19 -0500
X-MC-Unique: DoZVqlENM5upjxD8bb-28A-1
Received: by mail-ej1-f71.google.com with SMTP id u15so938867ejg.17
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 06:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e2XpUVRrklAmYO99DP+KqGsYVdiryaxPncQig1yHtpU=;
 b=F/LOx84pu9C8lA4GiRNlc7cCWFVlDaxG08S9Fb3L+zY7EyMEc6iz1NuHFUNobwR7vs
 c1PN69dGU9zY+gud24EEAxkbs8b9X8wecqYcqomv4QuVGTTvKUaKP0eGqMMY4xGu8X/g
 1ohnOEsHQVwhfm6O7ijYX03kWm/ZAXC05JdrNqs24YHGVnX6SdL5f+4NmUErV/5vjWyh
 5rOU2V5qxsmJsQQ3nO2U4t1n3IjLlFaETVDHc+G/KPgZ+TxTaRNbn7zVyL8bnhGh6Jw8
 pBykssGPiSjUMrxL3jsgymIkfOn5PjaKV7xyNo1oXnjJeCaC3enYt3pSyC9kBZdbbzRe
 9VMQ==
X-Gm-Message-State: AOAM531IR6b9/5tHQlBTRsOWWYfX8I3el3gvRc5YFN4vhKhUKr5HSsfG
 tqkEUUK3rPbe6KyirOmVnwWXlFMoYPYmUdHWgBl5oH56XyGYwE/Vt93MN2scJnnIq4x2GtrUJVT
 7zAGCrgRzVTJm82g=
X-Received: by 2002:aa7:c64e:: with SMTP id z14mr2053643edr.69.1610548698198; 
 Wed, 13 Jan 2021 06:38:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLwFQ3+hwC14z/YAI/tAiYIEwYAqoa7ISKdsL/CWpCHZXBUROS9mBv0chCVO0DPlwWj1SoKQ==
X-Received: by 2002:aa7:c64e:: with SMTP id z14mr2053630edr.69.1610548698002; 
 Wed, 13 Jan 2021 06:38:18 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cb4sm777692ejb.82.2021.01.13.06.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 06:38:17 -0800 (PST)
Subject: Re: [PATCH 0/3] RFC: few random hacks to improve eventfd fallback path
To: Maxim Levitsky <mlevitsk@redhat.com>, qemu-devel@nongnu.org
References: <20201217150040.906961-1-mlevitsk@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <789d85a9-89eb-eea3-0f77-59c00add173d@redhat.com>
Date: Wed, 13 Jan 2021 15:38:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201217150040.906961-1-mlevitsk@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/20 16:00, Maxim Levitsky wrote:
> These few patches are the result of a random hacking I did to make the qemu
> cope with eventfd allocation failure, when using an iothread,
> as it happened in bz #1897550.
> 
> I am not 100% sure which patches in this series are worth to merge, or if
> this can be fixed in a better way.
> 
> After this patch series applied, qemu still hangs while running reproducer for
> this BZ due to ABBA lock inversion which needs some heavy rework to get rid of.
> I explained all the (gory) details in the bugzilla.
> 
> This patch series was (lightly) tested with make check, iotests and with
> the reproducer.
> 
> Best regards,
> 	Maxim Levitsky
> 
> Maxim Levitsky (3):
>    scsi: virtio-scsi: don't process IO on fenced dataplane
>    virtio-scsi: don't uninitialize queues that we didn't initialize
>    event_notifier: handle initialization failure better
> 
>   hw/scsi/virtio-scsi-dataplane.c | 26 +++++++++++++++++++-------
>   include/qemu/event_notifier.h   |  1 +
>   util/event_notifier-posix.c     | 16 ++++++++++++++++
>   3 files changed, 36 insertions(+), 7 deletions(-)
> 

Queued, thanks.

Paolo


