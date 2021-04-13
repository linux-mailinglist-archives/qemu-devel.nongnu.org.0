Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF8A35DD15
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 13:01:33 +0200 (CEST)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWGnT-0004gK-IH
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 07:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWGlp-00048x-TG
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:59:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWGlm-00084h-Td
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 06:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618311581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LF6Mxg2QFBE2Rb3FefHs5AS+13F0VKddZCUHXREC+xo=;
 b=P4k9ssCBsJFsaUFi9EXn3/+wM4dUmfOzAwDDaI94rdhzwgHMV6KIo2iwnRDdeX/aJeYVNU
 AABUb915wkbN2BqcM2v5xdeUCm8orUKOBsyWcTEbJuf28wPLoXpE4GiUg0xZPk0jGgbxl1
 8Ba5aluLxqCWf80phqN4uu49vt4XEnY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-pB4a2PvwPqKXqUUTVEtT9Q-1; Tue, 13 Apr 2021 06:59:39 -0400
X-MC-Unique: pB4a2PvwPqKXqUUTVEtT9Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 b20-20020a7bc2540000b029010f7732a35fso691452wmj.1
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 03:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LF6Mxg2QFBE2Rb3FefHs5AS+13F0VKddZCUHXREC+xo=;
 b=ExL5aNF8dnU4jlfwUoeuWBOekp64bVAlVuQWn1RwEd0DbH+6bMUzYWOdDsdndcSU5u
 FISXgkiYO3CitvYIvhiEqOWxV4lUFy6E3jcnsXLr9KfTX2n/bAe+/WuODNaN79Y+Dqzd
 1lUQcy1JHfy8b+HbH6iuV4K+Vg3gvgHAAobC2x1Vc10jIo4yJ2tnSc+qMi5Lk0t76b7h
 bzKKcIx5fCPMeFNgyg95qPeWHI4VE2DYeBoHgrEHQ/W3N8rUywfxOoNUDb6mzmmbEDBV
 vg8cP1rJdNJnH3ABqXIMqjk/sOHOa4EiBr4vbaUQEfX23zqhSvCSTYU1OAqyU6Pk0ELB
 x9Yg==
X-Gm-Message-State: AOAM533es+NQCjGmufhmhYUiafsnh5H7FwVxAlM9VJZFcqMblafwo2Sw
 VYTy5hYi96F5qJUr3bgqJUh04/r836d1/I6yBknfsx4/K+bzJRMhACsVhNBgksKCNbo8XOGCrbe
 pui1i8q5nP0crTck=
X-Received: by 2002:a05:600c:3796:: with SMTP id
 o22mr3487060wmr.139.1618311578094; 
 Tue, 13 Apr 2021 03:59:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIy6wBrWtk1yezc+KNVccVEtlHxtJP87mBfysK2TAmdsVHTiRaRehPVzD601FuNvNklKT1Hg==
X-Received: by 2002:a05:600c:3796:: with SMTP id
 o22mr3487046wmr.139.1618311577871; 
 Tue, 13 Apr 2021 03:59:37 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j14sm19293777wrw.69.2021.04.13.03.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 03:59:37 -0700 (PDT)
Subject: Re: [PATCH] cutils: fix memory leak in get_relocated_path()
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20210412170255.231406-1-sgarzare@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <22828e2d-2c8e-c753-31e5-7588f9064b10@redhat.com>
Date: Tue, 13 Apr 2021 12:59:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210412170255.231406-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is this fix aiming at 6.0 release?

On 4/12/21 7:02 PM, Stefano Garzarella wrote:
> get_relocated_path() allocates a GString object and returns the
> character data (C string) to the caller without freeing the memory
> allocated for that object as reported by valgrind:
> 
>   24 bytes in 1 blocks are definitely lost in loss record 2,805 of 6,532
>      at 0x4839809: malloc (vg_replace_malloc.c:307)
>      by 0x55AABB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x55C2481: g_slice_alloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x55C4827: g_string_sized_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x55C4CEA: g_string_new (in /usr/lib64/libglib-2.0.so.0.6600.8)
>      by 0x906314: get_relocated_path (cutils.c:1036)
>      by 0x6E1F77: qemu_read_default_config_file (vl.c:2122)
>      by 0x6E1F77: qemu_init (vl.c:2687)
>      by 0x3E3AF8: main (main.c:49)
> 
> Let's use g_string_free(gstring, false) to free only the GString object
> and transfer the ownership of the character data to the caller.
> 
> Fixes: f4f5ed2cbd ("cutils: introduce get_relocated_path")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  util/cutils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/cutils.c b/util/cutils.c
> index ee908486da..c9b91e7535 100644
> --- a/util/cutils.c
> +++ b/util/cutils.c
> @@ -1055,5 +1055,5 @@ char *get_relocated_path(const char *dir)
>          assert(G_IS_DIR_SEPARATOR(dir[-1]));
>          g_string_append(result, dir - 1);
>      }
> -    return result->str;
> +    return g_string_free(result, false);
>  }
> 


