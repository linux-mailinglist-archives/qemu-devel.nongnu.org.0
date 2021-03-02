Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA535329A14
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:32:29 +0100 (CET)
Received: from localhost ([::1]:59378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2KK-0007Zr-OV
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH2Ia-0005re-Sr
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:30:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lH2IV-0001U4-FT
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:30:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614681034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=muMrpccMWZ0CZhWXnf1gr5KTpzHCBPaH2YXBn1ezcSc=;
 b=EuN9SN26nGzKuaxDoiOmY1KwzJHfvl0YmM8h04vqI4pgBFltkDWTKvt8m7GWVd98m+xeUX
 PzhYN7OcpKoXCcDTufCADGl9DyCe9BZdV5KcR88tIB1Q5u4+qilRkM94IjgG49GKiSBEBm
 rAN+YTh3HkhPOzqcrO6muVwrerjIhwQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-Lvja1cJyPI2CVv98mhp0Iw-1; Tue, 02 Mar 2021 05:30:33 -0500
X-MC-Unique: Lvja1cJyPI2CVv98mhp0Iw-1
Received: by mail-ej1-f72.google.com with SMTP id si4so5951142ejb.23
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 02:30:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=muMrpccMWZ0CZhWXnf1gr5KTpzHCBPaH2YXBn1ezcSc=;
 b=A+ckKU8AR3rylpq4q1URGTGskV18/7hZze792XtkLIMNyZab27/rzgRaXpv+ZQ8Ytl
 QeFtZqWn67t9KJCzWk0mAGUoIm7XBq9kO5obnPhpkC7SEFse2j4hx5K/QX6knkRgG6Mf
 2uX7XPrfWIdSWfv9d23tuDdWUB2c0rMjzz5UJ8BBfcgntSvriFM41Qvj1AKmutHQ38vM
 EjPIfwhEwKp3TEmEtgHI+vAQTPbr0L274fwGJg2hKdmqVCsNxhZaP0y9QmUwCgWM03vC
 RWp9khFEjVsFNHZTEGCwMJlGboquneCMrhTWKdvdqSseZRtQBO5d+UQJvO8GRQQYJwu5
 UA5g==
X-Gm-Message-State: AOAM530BnydkywJ3/BhSPHJ0eE4vIZulORHL/8SAm1HmCjYG9UGGuGvl
 9btzzHz1v6E0CenHcceh58tYwQwr7aYsQbGx95v7gGSH01LUb4Og37NCme/rRze9+shit3VVHDh
 iVVDARh4iOjF/LXM=
X-Received: by 2002:a05:6402:10ce:: with SMTP id
 p14mr19789296edu.348.1614681031870; 
 Tue, 02 Mar 2021 02:30:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkROnZsEzlIet3XWANRF+iNqrnur4bnocS08iG2s8e3WyoouYUt9BIrTiVa1Igom6lHWznQw==
X-Received: by 2002:a05:6402:10ce:: with SMTP id
 p14mr19789287edu.348.1614681031750; 
 Tue, 02 Mar 2021 02:30:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id sb4sm15259739ejb.71.2021.03.02.02.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 02:30:31 -0800 (PST)
Subject: Re: [PATCH 0/2] improve loading of 32 bit PVH kernels
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>
References: <20210302090315.3031492-1-david.edmondson@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <098e9e74-bfd3-a82a-5db0-5d0526f07c93@redhat.com>
Date: Tue, 2 Mar 2021 11:30:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302090315.3031492-1-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Stefano

On 3/2/21 10:03 AM, David Edmondson wrote:
> While testing a non-Linux 32 bit PVH "kernel" (it's really just a
> bunch of test code), I ran into some problems with the current PVH
> loader in QEMU, which seems to work somewhat by accident for 32 bit
> kernels today, having been fortunate in the layout of the object files
> it typically encounters.
> 
> Non-PAE 32 bit Linux kernels still don't appear to work even with this
> change, but I think that problem is somewhere else (the kernel is
> loaded and starts, but the VM resets when it attempts to enable PG/PE)
> and I haven't tracked it down yet.
> 
> David Edmondson (2):
>   elf_ops: correct loading of 32 bit PVH kernel
>   x86/pvh: extract only 4 bytes of start address for 32 bit kernels
> 
>  hw/i386/x86.c        | 6 ++++--
>  include/hw/elf_ops.h | 4 +---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 


