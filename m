Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0EB32A23F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 15:17:36 +0100 (CET)
Received: from localhost ([::1]:46746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5qB-0001NS-KM
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 09:17:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH5kG-0003Mi-N0
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:11:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lH5kF-0007H8-3G
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 09:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614694286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OC0fjYanS6d9LTKXWSROqSOVhhQ7Ro5iP9VvdR0IxZo=;
 b=HCfceX6JWRqvuw+PPUTeT77OWQ46kf4hZ9f2Clb39bag7KQqaYUqjLCDvCtjLU6z7O/mdt
 vT3EudYQ77gjE7eGjJ31HT2dVkjgBbaaAXqYIjYgK4FAL1fMF621PK1xIbkLLvzsEDINpm
 6oPTYVTsAOiMqy22JDfR0014YTyNhtQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-YzFRVnQHMdWGTVJHRab40Q-1; Tue, 02 Mar 2021 09:11:24 -0500
X-MC-Unique: YzFRVnQHMdWGTVJHRab40Q-1
Received: by mail-wr1-f69.google.com with SMTP id i5so9574528wrp.8
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 06:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OC0fjYanS6d9LTKXWSROqSOVhhQ7Ro5iP9VvdR0IxZo=;
 b=WnL2mxTznh990H7T//8CoyT274r+lAavXAgRWt61eecdOAzDYXaVuRR7SwEwFbphHm
 fbgT3/KUDAEMXoHvhdOfbOiAMueojG+TCuA/Ba/ov5REX7iwG+uHWLIMcPKnWIRzXWcd
 THghVUOTU3ImHGzQXZ/HF0BhAkbsjPu3VGf3IdoxkkSQLKKZEwOFcir2D8sdzEwSTLKP
 ksMKS3sklTplxMlgC2rtkpilUOUayfDNp8UrvY8onFJF9NbrA55M6Tx7y5USFSfJqOL3
 oB30XejFozlGKU2Grb8X8C5HWzjMnwBCE0r/2Lqz3Um/AaQ+cYYo6uoN5YNeUQ1RYjDp
 2iQg==
X-Gm-Message-State: AOAM531j+JNSl0L+rpWgYw6fohaAUit5OLTwaRoXR9BnB29/FAyd4p+N
 SKCfAfyPnEFr82hSI41A3yPBa+5zVPmaMgIBIGohlC9pJNKbB/CW3/OWmEN7vR3LDkUW7JZ+lf2
 sFx69YKI2pDOipYo=
X-Received: by 2002:a5d:550b:: with SMTP id b11mr18422005wrv.313.1614694283454; 
 Tue, 02 Mar 2021 06:11:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNyZq3zjaaMV0D6ENdYLmuiIcoveBJ6a0srSYLecWDlieBChsHw8hk9oeThJizHyri41afYQ==
X-Received: by 2002:a5d:550b:: with SMTP id b11mr18421974wrv.313.1614694283291; 
 Tue, 02 Mar 2021 06:11:23 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p6sm14850174wru.2.2021.03.02.06.11.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 06:11:22 -0800 (PST)
Subject: Re: [PATCH 0/2] improve loading of 32 bit PVH kernels
To: David Edmondson <david.edmondson@oracle.com>, qemu-devel@nongnu.org
References: <20210302090315.3031492-1-david.edmondson@oracle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <21983cdb-e124-3242-6867-b97e9c4ff454@redhat.com>
Date: Tue, 2 Mar 2021 15:11:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302090315.3031492-1-david.edmondson@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/21 10:03, David Edmondson wrote:
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
>    elf_ops: correct loading of 32 bit PVH kernel
>    x86/pvh: extract only 4 bytes of start address for 32 bit kernels
> 
>   hw/i386/x86.c        | 6 ++++--
>   include/hw/elf_ops.h | 4 +---
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 

Queued, thanks.

Paolo


