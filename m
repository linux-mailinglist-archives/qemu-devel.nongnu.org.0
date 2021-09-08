Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3413D40366C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 10:56:25 +0200 (CEST)
Received: from localhost ([::1]:42618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNtNY-00042A-9M
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 04:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNtL8-0001jC-Tl
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:53:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNtL7-0002Qk-DV
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 04:53:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631091232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Xjm35xCRc6Jm47gTzai2wD4k9AlLefOWX9iM2UHAJY=;
 b=U//+ujUC5gCbwj5dDQOXTGp4bGaHATapbyrcVrnQxuF7qhe+is2wEQSlorgRsNSt+Z6/lu
 7GbdQf4q1R3YMsL/UNgOoYyWEciiW3d8524Rffyic09WQIHBklMx/TKZmfoMAZ70oD3yT9
 /VFCR+W0q0jePuI0q49SJdZocvVhplU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-Tepksfp8OJm1N-PXmHw4dA-1; Wed, 08 Sep 2021 04:53:51 -0400
X-MC-Unique: Tepksfp8OJm1N-PXmHw4dA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u30-20020adfa19e000000b00159aba4fe42so297536wru.9
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 01:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1Xjm35xCRc6Jm47gTzai2wD4k9AlLefOWX9iM2UHAJY=;
 b=YhiF92K+sQVNE1BmFx6v2QKxagaynF1iJd7Z+Xz78WC5ODXp6v8HpcyEjcEzvJUeTy
 l56tlVUD4fl9jlVaBLd3xh0D9pXJBbM7pGFm1yFtvO/B7gUvnJr+Xdn5LYkUEQCNfxeV
 d0SB16Y28KdJIMwQRJui9t5Fe/GKDd+hjihXbvNg6HjME5ml0VLfkooOLGpMv4yYFQvt
 vrHAchYXpsIkXnAz5NvIaTroGgC+Ez5Y5BO9Rzjw8uF9Xf9PJkvJFv7RZxLKDv+omtv3
 fVp/23iFPAXKh3TBpc49N8ZZJGbh0CdM0vBJcBRlQ6IyP+zw/TEAvojNzHtIDpsdPmF1
 /kAg==
X-Gm-Message-State: AOAM533Lpt9AXG4FoAGFXYdvUktwcKwEaSJwKGW4OS7B+Zdz8Hbeg512
 C2PzYAGXKDsG+rpa/E0m73NdoZlD2iUXAYUw2/ML6ZGBPVWOXJBx3HJQBCiZJ4m6wENpoXsTV8S
 eJgI7CW/3VcK4x5Y=
X-Received: by 2002:a5d:526a:: with SMTP id l10mr2767709wrc.279.1631091230051; 
 Wed, 08 Sep 2021 01:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwukSBOtv0FPcdN0zPWjwKlnEs6KsK3M+Iu48YT9yKqoWc3NrQDgDykGRW3f5TOzmqF2JSk1g==
X-Received: by 2002:a5d:526a:: with SMTP id l10mr2767694wrc.279.1631091229908; 
 Wed, 08 Sep 2021 01:53:49 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j20sm1471595wrb.5.2021.09.08.01.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 01:53:49 -0700 (PDT)
Subject: Re: [PATCH 6/7] monitor: Fix coredump issue in non-x86 platform
To: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
References: <20210908081937.77254-1-yang.zhong@intel.com>
 <20210908081937.77254-7-yang.zhong@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <fe225574-3b4c-1969-6ed0-3a9103608c12@redhat.com>
Date: Wed, 8 Sep 2021 10:53:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908081937.77254-7-yang.zhong@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: pbonzini@redhat.com, eblake@redhat.com, seanjc@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/8/21 10:19 AM, Yang Zhong wrote:
> The monitor will coredump if we use 'info sgx' in the '-machine none' or
> other non-x86 platform, add the sgx_enabled bool variable to avoid this
> coredump issue.

But this code is only built for x86...

> 
> ./qemu-system-x86_64 -S -no-user-config -nodefaults -nographic -machine none,accel=kvm -monitor stdio
> QEMU 6.1.50 monitor - type 'help' for more information
> (qemu) info sgx
> /home/vmm/project/upstream/9-8/qemu/include/hw/i386/x86.h:93:X86_MACHINE: Object 0x5615d71a6fd0 is not an instance of type x86-machine
> Aborted (core dumped)

Paolo suggested on IRC to use object_class_dynamic_cast().

> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  hw/i386/sgx.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)


