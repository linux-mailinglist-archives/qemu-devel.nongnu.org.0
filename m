Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3642369787A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 09:49:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSDSu-00070Q-2X; Wed, 15 Feb 2023 03:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSDSr-000700-Fd
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:48:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSDSp-00074m-KT
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 03:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676450910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLWOe3R1JIu3c80dMmpT3j/ucYf8JEjmJE+FzN3zb1s=;
 b=gqSEU9PHnLtPfLurWrTXKnrZbMMkh0GjS6g/vVvW5D0j2iIn8AvR/OBmfU/+mkoSrTqwFK
 WzF+i4F3Gb5eJ6k/WJaCZXVP9YCmMtnT8s7uxElQUHHJyveS4JuH6w49svcuUFm682lMgr
 99ETlBBP6U/Kccx0tuKofjpLqxPiz7U=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-z2tAN9ExMHG1lyZpJneNog-1; Wed, 15 Feb 2023 03:48:28 -0500
X-MC-Unique: z2tAN9ExMHG1lyZpJneNog-1
Received: by mail-qt1-f199.google.com with SMTP id
 t5-20020a05622a180500b003b9c03cd525so10917314qtc.20
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 00:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fLWOe3R1JIu3c80dMmpT3j/ucYf8JEjmJE+FzN3zb1s=;
 b=amORhdAvI2H0X4awPRgZc91v9oXlU9ppicJvH9H+K7OFZ7V/QAqsIINOT+0dk5P9Pm
 Lymc3d08+nRAyMF48gHSPiWejH7a8/RsOoKsE5XpxnH0k0Tphjk6AItJwvNYnGIkpDwG
 blziJ44Y3Z9a9IO/h7k91HvCafxUWKNpHDXJhzh43qA6+/S0ErRiCnD/IC7TcElsqJRd
 r1TSJ5MBIybvAOY+yrnepkBJ90ibj2dw63Bnv1p5SydIR0iki6tMJbzNU8yT7sE/N7b1
 Yf08pplzsP0lU4alxC3KzqyHzci0xAJ+bdt3bLds5hdIPn6jcJ15jCYFj/PPQWhmFOqY
 O1gw==
X-Gm-Message-State: AO0yUKW4ER5VTFoimP6xDKnUftXHqQUeXBCFqj50OSD7gVoGzHgKl85D
 pZh8TFkHbkGTDJ7OnsFXeZfczePUm5ELAF33bxbHwCntRIci25/ckmXJZltR347rVqjzn3/1kas
 eH7OlLhzNCXQ00mI=
X-Received: by 2002:a05:6214:29e6:b0:56e:aeb3:52be with SMTP id
 jv6-20020a05621429e600b0056eaeb352bemr2570537qvb.8.1676450908513; 
 Wed, 15 Feb 2023 00:48:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/gX5QljE1TmIvvAwYLjfnntVgZMHcOEu7gjW5WLJdRkEoMUnfipxY/Qnvtfi6ca+6/9JQjLA==
X-Received: by 2002:a05:6214:29e6:b0:56e:aeb3:52be with SMTP id
 jv6-20020a05621429e600b0056eaeb352bemr2570521qvb.8.1676450908276; 
 Wed, 15 Feb 2023 00:48:28 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-79.web.vodafone.de.
 [109.43.176.79]) by smtp.gmail.com with ESMTPSA id
 s184-20020ae9dec1000000b0073b38652b9csm6530728qkf.122.2023.02.15.00.48.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 00:48:27 -0800 (PST)
Message-ID: <0a6b239e-c8df-92fe-5c14-9a0a2abb1823@redhat.com>
Date: Wed, 15 Feb 2023 09:48:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] target/s390x/arch_dump: Simplify memory allocation in
 s390x_write_elf64_notes()
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 frankja@linux.ibm.com, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230215054834.726355-1-thuth@redhat.com>
In-Reply-To: <20230215054834.726355-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.35, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/02/2023 06.48, Thomas Huth wrote:
> We are not on a hot path here, so there is no real need for the logic
> here with the split heap and stack space allocation. Simplify it by
> always allocating memory from the heap.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   Based-on: <20230214141056.680969-1-thuth@redhat.com>
> 
>   target/s390x/arch_dump.c | 20 ++++++--------------
>   1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
> index a7c44ba49d..84e17effda 100644
> --- a/target/s390x/arch_dump.c
> +++ b/target/s390x/arch_dump.c
> @@ -227,25 +227,23 @@ static int s390x_write_elf64_notes(const char *note_name,
>                                          DumpState *s,
>                                          const NoteFuncDesc *funcs)
>   {
> -    Note note, *notep;
> +    g_autofree Note *notep = NULL;
>       const NoteFuncDesc *nf;
> -    int note_size, content_size;
> +    int note_size, prev_size = 0, content_size;
>       int ret = -1;
>   
> -    assert(strlen(note_name) < sizeof(note.name));
> +    assert(strlen(note_name) < sizeof(notep->name));
>   
>       for (nf = funcs; nf->note_contents_func; nf++) {
> -        notep = &note;
>           if (nf->pvonly && !s390_is_pv()) {
>               continue;
>           }
>   
>           content_size = nf->note_size_func ? nf->note_size_func() : nf->contents_size;
> -        note_size = sizeof(note) - sizeof(notep->contents) + content_size;
> +        note_size = sizeof(Note) - sizeof(notep->contents) + content_size;
>   
> -        /* Notes with dynamic sizes need to allocate a note */
> -        if (nf->note_size_func) {
> -            notep = g_malloc(note_size);
> +        if (prev_size < note_size) {
> +            notep = g_realloc(notep, note_size);
>           }

-ENOTENOUGHCOFFEEYET

Janosch just told me that there is a prev_size = note_size missing here ... 
sorry for that, I'll send a v2.

  Thomas


