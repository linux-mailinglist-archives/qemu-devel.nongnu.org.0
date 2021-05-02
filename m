Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37381370EB7
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 21:07:15 +0200 (CEST)
Received: from localhost ([::1]:44766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldHQw-0000iS-24
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 15:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldHHE-0001mm-Gu
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldHHB-00015U-1v
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619981827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpHBge6e3XggRfa3jrWIO5iO4TqQSRYX7H2ipRiS/tQ=;
 b=hJRG+agS+fdlMO/292EFsWhK7MoxOgF5QqKqEThV0V0XUZ5AKBl97/dWGcKC/PRFiRt0hB
 CHu+Wincnv3GGV6JZYcvzpqK/LQyeLPM6K5xkbqCezUrQaHm5DTh4mLWrpI49h5uu5co0D
 IJJIyT3pmsXsAnbppUBi+tKl7nGpgMI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-ApSnG0pwPG-D1qILwwjI8A-1; Sun, 02 May 2021 14:57:06 -0400
X-MC-Unique: ApSnG0pwPG-D1qILwwjI8A-1
Received: by mail-wm1-f71.google.com with SMTP id
 h128-20020a1cb7860000b0290148da43c895so229449wmf.4
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 11:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CpHBge6e3XggRfa3jrWIO5iO4TqQSRYX7H2ipRiS/tQ=;
 b=MV5hpg4n4pOD6YD12FMoLEDBZ6HLyxeOXqza8MiW3LpU85mLniOv+RvppiWR4Xd1Gc
 aGvicm08Rf0B61m4ZHTdplz2H0ZxUp2XVOSoGumFJz9/janp6AmfHYqVHEindtmGbfRg
 eucNwPcfXrOi8d5Rx/RzH83A8InuZrj9sCJGRpONuAGfNrAN4HNuSl0W4NuYkiwl7w0G
 69/BOgcQvPFG4/MhcJimfuT0l+bobwtXjiYDJz9VDiMxD1h7XDVbgjNaJr5RFaOV7YgQ
 qCifwoqVnnszdwmTlCagw/hYTlXVmZjTjoBwDGolQ6ghh4Cb9lwvudOsudgr5UxUUOXX
 HuZQ==
X-Gm-Message-State: AOAM532u467RE6jIq844T/6cDllT5ugvqhKESil+5JJvexJ1Ip5M+1yV
 R0PYD0WWmHgmLMYAb4WBLhvM18vKAK9Pq0hQC1XKy99K5N7TH/rQT12IacJG3LnVR5Sskm1roVP
 qhd0Ne+0ML6mPoMRuO5EUnpItfw9Wz1YH9U6nQoCarsV+iEbO162BzjXfAhnrXZex
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr17804739wmc.137.1619981824950; 
 Sun, 02 May 2021 11:57:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsqNmexJuEG6cmk3KI0ChqOULE3qFp/dJjpcBr+A2odqIND/twEMvaOihP69G8TcuF/0gZFw==
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr17804716wmc.137.1619981824694; 
 Sun, 02 May 2021 11:57:04 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id q12sm9627592wrx.17.2021.05.02.11.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 May 2021 11:57:03 -0700 (PDT)
Subject: Re: [PATCH 1/4] pc-bios/s390-ccw: Silence warning from Clang by
 marking panic() as noreturn
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210502174836.838816-1-thuth@redhat.com>
 <20210502174836.838816-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <04140977-282c-2579-3073-42b6bb4148ee@redhat.com>
Date: Sun, 2 May 2021 20:57:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502174836.838816-2-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/21 7:48 PM, Thomas Huth wrote:
> When compiling the s390-ccw bios with Clang, the compiler emits a warning:
> 
>  pc-bios/s390-ccw/main.c:210:5: warning: variable 'found' is used uninitialized
>   whenever switch default is taken [-Wsometimes-uninitialized]
>      default:
>      ^~~~~~~
>  pc-bios/s390-ccw/main.c:214:16: note: uninitialized use occurs here
>      IPL_assert(found, "Boot device not found\n");
>                 ^~~~~
> 
> It's a false positive, it only happens because Clang is not smart enough
> to see that the panic() function in the "default:" case can never return.
> 
> Anyway, let's explicitely mark panic() with "noreturn" to shut up the
> warning.

Why not simply initialize the variable instead?

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  pc-bios/s390-ccw/s390-ccw.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-ccw.h
> index 6cd92669e9..79db69ff54 100644
> --- a/pc-bios/s390-ccw/s390-ccw.h
> +++ b/pc-bios/s390-ccw/s390-ccw.h
> @@ -89,6 +89,7 @@ bool menu_is_enabled_enum(void);
>  
>  #define MAX_BOOT_ENTRIES  31
>  
> +__attribute__ ((__noreturn__))
>  static inline void panic(const char *string)
>  {
>      sclp_print(string);
> 


