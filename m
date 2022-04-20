Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9C6508BCE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:11:25 +0200 (CEST)
Received: from localhost ([::1]:36064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBzI-0003GC-Ja
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBMI-0001e7-ST
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:31:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nhBMF-0006p0-Mq
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650465063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8GdYvFh0O1Joi7NZf1kaCwPL8mwKdgbfJlX5X2GITk=;
 b=D+wcm67gMWXSmPHlWILYNy5PZ+kR5UH5RaigwqgAh+LYQWpuCvK+rPZLQKMEW3AQrh23nX
 eKmMk1LYWZIInJKl9RaRwzrlfFzxNj9seV8nnOpAQtiDQizFNoOJmp91ogZ3sA3aUH4f7G
 +FjbNPWL5kYUT5KMLpp+bvKX9XGPvgI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-qn8ovQZDN3C8Yfm735EFXg-1; Wed, 20 Apr 2022 10:31:00 -0400
X-MC-Unique: qn8ovQZDN3C8Yfm735EFXg-1
Received: by mail-wm1-f72.google.com with SMTP id
 125-20020a1c0283000000b003928cd3853aso2551756wmc.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 07:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=I8GdYvFh0O1Joi7NZf1kaCwPL8mwKdgbfJlX5X2GITk=;
 b=UOFFxpIVhrZnE9CKRNI19/s7tJHWRFC8A7pFQEkbRgsS0CdnVUBU5yKpS9CXO/qwAC
 kb5QwNzoJR1x/y9tYLW1qCDrGUNyCt9GwJDXOKqUNwbDs90izXHKqYfeUwozg+yu/kzC
 bOKX23DVZq0ZlKTXHwJqI1lT6YX8rI6eUu0hADnXCJFMT1QSWIksrP/rJhWQhVfYBzvC
 p7cyaT3tAFZ7PPWhPZa3YrJkFhvjPU4gdBKcAmqmV9kaflnJ5JGfJPWPTE5dBQUcyo1X
 TpUddzoJPHYV3cgvsw9LpaFeCiIDWx1yz2rTh/L/ex+MwenN2i60pIex9MTrVseftG8o
 IdNg==
X-Gm-Message-State: AOAM530cFdPrgczfsPSMXREQV38F22tEBOnEczI/ztZK7xX6JLmK9fMz
 Emk4SxgNyTFWPinXHHI/mbkbY7IdLVMJy+1E7pT9UvNaHhcORn+Q5q5aaJyX5q8lNpRRe9nc9wn
 ylt/2DjaYJ0bQUuc=
X-Received: by 2002:a05:600c:3596:b0:38e:e9bf:5bfa with SMTP id
 p22-20020a05600c359600b0038ee9bf5bfamr4027754wmq.63.1650465058558; 
 Wed, 20 Apr 2022 07:30:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCh/RWWIOfptZuNyq/iP7gICHRo9EtIQjakQ7WjaEnDiIFIpkqbErZMNpCyKQ23OLviHN9DQ==
X-Received: by 2002:a05:600c:3596:b0:38e:e9bf:5bfa with SMTP id
 p22-20020a05600c359600b0038ee9bf5bfamr4027736wmq.63.1650465058338; 
 Wed, 20 Apr 2022 07:30:58 -0700 (PDT)
Received: from [192.168.8.102]
 (dynamic-046-114-174-058.46.114.pool.telefonica.de. [46.114.174.58])
 by smtp.gmail.com with ESMTPSA id
 n10-20020a5d588a000000b002052e4aaf89sm20461wrf.80.2022.04.20.07.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 07:30:57 -0700 (PDT)
Message-ID: <b715e529-ada0-cf65-1e48-2d7b8f0e0a8c@redhat.com>
Date: Wed, 20 Apr 2022 16:30:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 41/41] tests/fuzz: fix warning
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-42-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220420132624.2439741-42-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/04/2022 15.26, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> ../tests/qtest/fuzz/generic_fuzz.c:746:17: warning: variable 'name' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/qtest/fuzz/generic_fuzz.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index dd7e25851cb6..bce83604825e 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -743,14 +743,12 @@ static void usage(void)
>   
>   static int locate_fuzz_memory_regions(Object *child, void *opaque)
>   {
> -    const char *name;
>       MemoryRegion *mr;
>       if (object_dynamic_cast(child, TYPE_MEMORY_REGION)) {
>           mr = MEMORY_REGION(child);
>           if ((memory_region_is_ram(mr) ||
>               memory_region_is_ram_device(mr) ||
>               memory_region_is_rom(mr)) == false) {
> -            name = object_get_canonical_path_component(child);
>               /*
>                * We don't want duplicate pointers to the same MemoryRegion, so
>                * try to remove copies of the pointer, before adding it.

Reviewed-by: Thomas Huth <thuth@redhat.com>


