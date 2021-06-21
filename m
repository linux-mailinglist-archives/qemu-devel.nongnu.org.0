Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6223AE5C9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 11:17:08 +0200 (CEST)
Received: from localhost ([::1]:37978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvG3H-0008WP-MD
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 05:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvG2H-0007fL-Bc
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:16:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lvG2E-0004Ql-Hg
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 05:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624266961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jY7FrcI0nGqcPJfecyA5RJpYcj+kudmzXwy3Xanm7HI=;
 b=c56694XgvV+AfMaFwLVxfZ2tATs8CHCcXvMmDrpMjkopZ5K/H96n1HmoSi82q2hr72FYck
 V00rYA5REtmTI2sfVR8U2hQiIBZz4LRQcVXfmH/vb09yJ9vFaDZNZP39UTitcM0myKddGN
 RMjI6Trww/yBkaU7705JgEsO1ZLZB9k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-4NWzBjppPzKt2DHyLkdGuw-1; Mon, 21 Jun 2021 05:15:59 -0400
X-MC-Unique: 4NWzBjppPzKt2DHyLkdGuw-1
Received: by mail-wr1-f71.google.com with SMTP id
 u16-20020a5d51500000b029011a6a17cf62so7839463wrt.13
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 02:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jY7FrcI0nGqcPJfecyA5RJpYcj+kudmzXwy3Xanm7HI=;
 b=mVGqHmLZd1dFUfdlgo8BVHa/25NabMlA+fSJxqrbbMw+CSkzqEYbH9aNo9k5Z0lAJN
 B1EOABMp6RbQPyKOStmw2FOg4IcEg0DLaKQymhQ6v1S1BxnLHtRGUpsSS+owNovn9bmt
 ARQqtkMCKUb2i8umXXdGalQENS8gFA/NsZNE/GCZJ7OY0cFQjqBUic6zyD9aGGZJ835/
 0a4ivCzkC72ykhrfPobxxmXOcOmZmbZXLBV9jWWp7sqfFhZDkRtHY8hL4IjBEWl4Oxn6
 bjQwsuqqLFOaOUT/h9iVC8YFLjqgg4kldraD9TqgXuS9NEDehQY15NWcNv1VROo50QH4
 C5jA==
X-Gm-Message-State: AOAM530gg/erzHZwxSLCVHLWUcqEDJcNUahGVImyN/jsHhMDE4/lJnIH
 zFFUoaSm97W+rkbMOR+vGbvbTfEI3p1dNh1Rr4aJ61RFdMysCqKrWQbvlgXtGJJYnQPgu+b4dTq
 ZXTesKuWIudfGZTU=
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr1987986wrt.132.1624266958651; 
 Mon, 21 Jun 2021 02:15:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGjJeo7U3HNZTVW+0VvIXmYNm1hKdUB6kHThsK9LGg/Kgwycles+2Kiqs8xt8IeUcJM2xakw==
X-Received: by 2002:a5d:4e0b:: with SMTP id p11mr1987950wrt.132.1624266958427; 
 Mon, 21 Jun 2021 02:15:58 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l16sm18215078wmq.28.2021.06.21.02.15.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 02:15:58 -0700 (PDT)
Subject: Re: [PATCH] x86: add SEV hashing to fw_cfg for kernel/initrd/cmdline
To: Thomas Huth <thuth@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 James Bottomley <jejb@linux.ibm.com>, Connor Kuehl <ckuehl@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210525065931.1628554-1-dovmurik@linux.ibm.com>
 <20210615152033.czhsaz44yxtc5ext@habkost.net>
 <1cff8347-ee38-a0a8-f089-36b28a40b828@redhat.com>
 <06b28ac7-19ed-edd8-a555-2858e976d964@linux.ibm.com>
 <649abfe3-e799-3535-c56a-ad55ca5df947@redhat.com>
 <29a0541d-64f2-1c55-ccf2-776d41f09c95@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <081fe816-da9d-2df3-de46-34d3235eee40@redhat.com>
Date: Mon, 21 Jun 2021 11:15:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <29a0541d-64f2-1c55-ccf2-776d41f09c95@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>, qemu-devel@nongnu.org,
 Hubertus Franke <frankeh@us.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/21/21 10:44 AM, Thomas Huth wrote:
> On 17/06/2021 17.48, Philippe Mathieu-Daudé wrote:
> [...]
>> This works, but I'd rather use:
>>
>>    if (sev_enabled()) {
>>        sev_kernel_loader_calc_cmdline_hash(&sev_loader_context,
>>                                            kernel_cmdline);
>>    }
>>
>> And have sev_enabled() defined as:
>>
>> #ifdef CONFIG_SEV
>> bool sev_enabled(void);
>> #else
>> #define sev_enabled() false
>> #endif
>>
>> So the compiler could elide the statement if SEV is disabled,
>> and stub is not necessary.
>>
>> But that means we'd need to add "#include CONFIG_DEVICES" in
>> a sysemu/ header, which looks like an anti-pattern.
>>
>> Thomas / Paolo, what do you think?
> 
> I'd only do that if you are very, very sure that the header file is 
> only included from target-specific files. Otherwise this will of course
> cause more trouble than benefit.

Hmm it could be clearer to rearrange the target-specific sysemu/
headers. For this example, eventually sysemu/i386/sev.h?

Phil.


