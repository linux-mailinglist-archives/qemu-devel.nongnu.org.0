Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3F375478
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 15:11:22 +0200 (CEST)
Received: from localhost ([::1]:56188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ledmi-0004Et-V2
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 09:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ledlD-0002v9-Bx
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ledlC-00064E-0L
 for qemu-devel@nongnu.org; Thu, 06 May 2021 09:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620306585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpgqQ0cIy127Bc1vNVkXau+Shvx8VY5BV4kLbZ9pBXM=;
 b=MiQhD7ECEdrK/gm0FhHRETCP87ZK+SjuZCeb/hidrmf6z2UtV7S1clBsI1LrqY57A40XNi
 QFdoeiz3IQmxhP39M7+SauGcUJh2wspBmTCuqM9aIFmVXFJG1wvliAWd6v7LLelCBsaOpN
 5fBeD6Azwaru8LfgcOwQzpk0jUugFXw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-R9JzyMEUMdmMtHgve4yHkg-1; Thu, 06 May 2021 09:09:37 -0400
X-MC-Unique: R9JzyMEUMdmMtHgve4yHkg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o8-20020a1c41080000b0290145d961cdc4so985801wma.6
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 06:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kpgqQ0cIy127Bc1vNVkXau+Shvx8VY5BV4kLbZ9pBXM=;
 b=KW3cTd27CoajXQ27UWuUIzONg9FQbkx/ZjPvY7XfFuX2r9+3Bkg0qvzWgFjEkUxAHs
 ul6ADZIeZb257GZnI07a2Q3oRhjNYc+1Bk3nHblDyKkm4+kxvFh+8HXxz+T9bDiPzxtx
 +dSaBi5YPPUHaNUceJgk8oWV7hUe2spdzNc+uOGiTHOvjU9Kos0WsOYfsFADKCmHswu6
 YyF0iNn8OzG/FBQcR3heSA9NkuUCCLAp+rlugcBpUVb4IW1IYvBUT6x2M22KnxqcaD6K
 mW9U/dQmxHNdWyEbJq3Lb+4INpw9IlxiWc+PjAnPjSZNmd0CNSQlZ1yUQ4mjB1WUV9QV
 zbiw==
X-Gm-Message-State: AOAM530jK8z+p0dRAklvAI5FoFImIZO1CN/nnQdUxsjLCxrcafqqLdkE
 wlMqQGTAvryf/SD6sHDcjWAhoJAA/EB2uzaKyHRBHjwk3/YA58vLwwlJvRw5Cs3zXMr5HOeCa5q
 xe7S/0oTaluLwFgA=
X-Received: by 2002:a1c:a5cb:: with SMTP id o194mr3910891wme.91.1620306576788; 
 Thu, 06 May 2021 06:09:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp5w8PqMyRSZxJNykUGJoYMgKsTUuWMKnjxrmA/6+xEfnfnshU6AgG2I3BTMsrsSE/eoOWPw==
X-Received: by 2002:a1c:a5cb:: with SMTP id o194mr3910842wme.91.1620306576410; 
 Thu, 06 May 2021 06:09:36 -0700 (PDT)
Received: from [192.168.1.19] (astrasbourg-652-1-219-60.w90-40.abo.wanadoo.fr.
 [90.40.114.60])
 by smtp.gmail.com with ESMTPSA id s5sm3535667wmh.37.2021.05.06.06.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 May 2021 06:09:35 -0700 (PDT)
Subject: Re: [PATCH 5/5] target/ppc/kvm: Replace alloca() by g_malloc()
To: Greg Kurz <groug@kaod.org>
References: <20210505170055.1415360-1-philmd@redhat.com>
 <20210505170055.1415360-6-philmd@redhat.com>
 <20210506104130.5f617359@bahia.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3405dbc2-caf3-0da6-25aa-fe54f8ac8e11@redhat.com>
Date: Thu, 6 May 2021 15:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210506104130.5f617359@bahia.lan>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/6/21 10:41 AM, Greg Kurz wrote:
> On Wed,  5 May 2021 19:00:55 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> The ALLOCA(3) man-page mentions its "use is discouraged".
>>
>> Replace it by a g_malloc() call.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  target/ppc/kvm.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>> index 104a308abb5..ae62daddf7d 100644
>> --- a/target/ppc/kvm.c
>> +++ b/target/ppc/kvm.c
>> @@ -2698,11 +2698,11 @@ int kvmppc_save_htab(QEMUFile *f, int fd, size_t bufsize, int64_t max_ns)
>>  int kvmppc_load_htab_chunk(QEMUFile *f, int fd, uint32_t index,
>>                             uint16_t n_valid, uint16_t n_invalid, Error **errp)
>>  {
>> -    struct kvm_get_htab_header *buf;
>> -    size_t chunksize = sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
>> +    size_t chunksize = sizeof(struct kvm_get_htab_header)
> 
> It is a bit unfortunate to introduce a new dependency on the struct type.
> 
> What about the following ?
> 
> -    struct kvm_get_htab_header *buf;
> +    g_autofree struct kvm_get_htab_header *buf = NULL;
>      size_t chunksize = sizeof(*buf) + n_valid * HASH_PTE_SIZE_64;
>      ssize_t rc;
>  
> -    buf = alloca(chunksize);
> +    buf = g_malloc(chunksize);

OK.


