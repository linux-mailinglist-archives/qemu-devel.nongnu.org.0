Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC23A789E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:58:00 +0200 (CEST)
Received: from localhost ([::1]:52336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3xP-0005MG-22
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3vw-0003lx-Ie
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:56:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lt3vs-0004PO-T8
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:56:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623743783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQWGux5+eSAKgepMWXuNFn6nrayyF+nBZaN7u29IZYU=;
 b=WDst+sQ8FR1fdU4JtvBopr6fPkb8a1PzLewT1LrFygTnUB6Tlj6C5snnrWTeq/mtuMSOFo
 ceYr91p+ZZcPWviLmTV+LkeUTDquuwZKsKMcSMIf3UFzx9dUVBxEn98EE9TPftaLQUTHA7
 0SFzwcsEtjtAJvVfyc9KLGsu4+sYf7k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-xGR54PVjNI6wtSM-zG9PSA-1; Tue, 15 Jun 2021 03:56:21 -0400
X-MC-Unique: xGR54PVjNI6wtSM-zG9PSA-1
Received: by mail-wr1-f71.google.com with SMTP id
 n4-20020a5d42040000b0290119fef97609so8210748wrq.18
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FQWGux5+eSAKgepMWXuNFn6nrayyF+nBZaN7u29IZYU=;
 b=VGKBD8EvGu6CxBeP4FiVb+lgWg1vi1+w/vifLw3kDs3H3IIRiJ+z4b67XYKAf4K28Y
 1cQhvN2lLnqzPOFJ9yO5geTfuihnMDhdhWqaeRIhwxl5XVrkN4vcxrnyk2zIBptMGOTA
 pIsyAYYm/BRGLa6/WGBhXINHJ4EloTySgvMb3BYZpcdCmmPheI8uVVy23J3CSmPKQvx+
 Hl6goOdOXbUf15Oy9ASfp8Lz6zABsb6fnokLQGDl9uZBuYldUlpA3xbavGPhwaUoq+ri
 SDg1BBvrB/ICISITdkUeIFUadDgNdeCue1ZAPZhFYOS/NtLDN3crzbUywgc/bm3F7P9z
 B6JA==
X-Gm-Message-State: AOAM533dlS3Ug3BXZGLLvrsPeshI3V6inWObfwQtm1bzqzoNy+zV2BvN
 R1X71ekKDqzo1dw50i58etqdj50a+hmm2FWj8+KrHWHvU0bF+p/0ZL7phf3DEeoIuo5Y3jkl2hS
 YkJ9Ru85UStWXsGk=
X-Received: by 2002:adf:f842:: with SMTP id d2mr23387515wrq.52.1623743779655; 
 Tue, 15 Jun 2021 00:56:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvimVKmC8qUfs7GB8kDoPh3O9Smmpa4s8k2XoBmg39WfqU5D9AYPeSPOLpUXM6iNkhEIYx0Q==
X-Received: by 2002:adf:f842:: with SMTP id d2mr23387490wrq.52.1623743779423; 
 Tue, 15 Jun 2021 00:56:19 -0700 (PDT)
Received: from thuth.remote.csb (pd9e831d2.dip0.t-ipconnect.de.
 [217.232.49.210])
 by smtp.gmail.com with ESMTPSA id r7sm1763541wma.9.2021.06.15.00.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:56:19 -0700 (PDT)
Subject: Re: [PATCH v2 5/8] util: Use unique type for QemuRecMutex in
 thread-posix.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210614233143.1221879-1-richard.henderson@linaro.org>
 <20210614233143.1221879-6-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d75a3193-ad3c-7deb-4528-96383a4cd816@redhat.com>
Date: Tue, 15 Jun 2021 09:56:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210614233143.1221879-6-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/06/2021 01.31, Richard Henderson wrote:
> We will shortly convert lockable.h to _Generic, and we cannot
> have two compatible types in the same expansion.  Wrap QemuMutex
> in a struct, and unwrap in qemu-thread-posix.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/qemu/thread-posix.h | 10 ++++++++--
>   util/qemu-thread-posix.c    | 12 ++++++------
>   2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/include/qemu/thread-posix.h b/include/qemu/thread-posix.h
> index cf8bc90468..b792e6ef37 100644
> --- a/include/qemu/thread-posix.h
> +++ b/include/qemu/thread-posix.h
> @@ -4,8 +4,6 @@
>   #include <pthread.h>
>   #include <semaphore.h>
>   
> -typedef QemuMutex QemuRecMutex;
> -
>   struct QemuMutex {
>       pthread_mutex_t lock;
>   #ifdef CONFIG_DEBUG_MUTEX
> @@ -15,6 +13,14 @@ struct QemuMutex {
>       bool initialized;
>   };
>   
> +/*
> + * QemuRecMutex cannot be a typedef of QemuMutex lest we have two
> + * compatible cases in _Generic.  See qemu/lockable.h.
> + */
> +typedef struct QemuRecMutex {
> +    QemuMutex m;
> +} QemuRecMutex;
> +
>   struct QemuCond {
>       pthread_cond_t cond;
>       bool initialized;
> diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
> index d990826ed8..fd9d714038 100644
> --- a/util/qemu-thread-posix.c
> +++ b/util/qemu-thread-posix.c
> @@ -116,32 +116,32 @@ void qemu_rec_mutex_init(QemuRecMutex *mutex)
>   
>       pthread_mutexattr_init(&attr);
>       pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
> -    err = pthread_mutex_init(&mutex->lock, &attr);
> +    err = pthread_mutex_init(&mutex->m.lock, &attr);
>       pthread_mutexattr_destroy(&attr);
>       if (err) {
>           error_exit(err, __func__);
>       }
> -    mutex->initialized = true;
> +    mutex->m.initialized = true;
>   }
>   
>   void qemu_rec_mutex_destroy(QemuRecMutex *mutex)
>   {
> -    qemu_mutex_destroy(mutex);
> +    qemu_mutex_destroy(&mutex->m);
>   }
>   
>   void qemu_rec_mutex_lock_impl(QemuRecMutex *mutex, const char *file, int line)
>   {
> -    qemu_mutex_lock_impl(mutex, file, line);
> +    qemu_mutex_lock_impl(&mutex->m, file, line);
>   }
>   
>   int qemu_rec_mutex_trylock_impl(QemuRecMutex *mutex, const char *file, int line)
>   {
> -    return qemu_mutex_trylock_impl(mutex, file, line);
> +    return qemu_mutex_trylock_impl(&mutex->m, file, line);
>   }
>   
>   void qemu_rec_mutex_unlock_impl(QemuRecMutex *mutex, const char *file, int line)
>   {
> -    qemu_mutex_unlock_impl(mutex, file, line);
> +    qemu_mutex_unlock_impl(&mutex->m, file, line);
>   }
>   
>   void qemu_cond_init(QemuCond *cond)
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


