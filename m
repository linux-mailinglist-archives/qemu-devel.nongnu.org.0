Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75162D5DEE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 15:36:08 +0100 (CET)
Received: from localhost ([::1]:55406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knN39-0005hN-TX
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 09:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knMu6-0000ns-Pv
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:26:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knMu5-0007N9-0k
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 09:26:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607610402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwzUYSWq/h6EtaDoCvUeshJJpFiXqC6zBbdC+3h4P3k=;
 b=ObcYTDTIsjrndrXDCMY/Z9vy+79A3rXj3IBLPBvnjyAN3s7W35GwheIsxRQA64DGxcQT7v
 FUm+ryOu9TOu9LHiFqmU9msUwrgZhNmQBhPiKdt3a9d+W42Agc51yQUGEwffeSLOYA4aZV
 0wWAUTiBLqmcero+bqayY7F67hiw+/g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-YBVf7XBIPsmpQS5qVrB24A-1; Thu, 10 Dec 2020 09:26:40 -0500
X-MC-Unique: YBVf7XBIPsmpQS5qVrB24A-1
Received: by mail-wm1-f71.google.com with SMTP id r1so2090306wmn.8
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 06:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wwzUYSWq/h6EtaDoCvUeshJJpFiXqC6zBbdC+3h4P3k=;
 b=NXFUtRKM2ahpVwhhbm0TCY8OjmAF7KzE+TH9naUYpoLT9erRPMfrJCcW9nbIa3CkZo
 udGXdqpZ7YV+rTi4e0du2cL8M0w8MKQdJnBk7VwVn5MFlmjRr1oL7n/a2gkzkbHtCcLc
 QZw9P4BbnV+odeoAfwDes8sPUlrgiHw9bNQVLJqyagng16j+ILGEC8ABGF8JZMK1Bx2x
 FjTwR0SU0mrKIgASGM2Rs59/IsochuzfY41NEjmkvECm3IDBpwkBkBSE1hsmWbGzEdTI
 EYpy0SQJbLULAd5vN89NOnVn+jrVqeQZ+t4tKKRIgdbuHfqkE/BLwLTkSBXVHDFL3rry
 ojRg==
X-Gm-Message-State: AOAM532m9DDrGltF6dKUH4o5nc2UyozxhwOXlnRkkPWTe+X/T/OvoDoo
 Oubz4bCfVwjN1ZHWVxf9ZxRyuC4hN9eppmysi/a4y5I/sCdxXMNyZKaGdd9WyB7pXDxozrOs1Ys
 Q9CRN33q7x0y+IHo=
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr8646307wmf.149.1607610398620; 
 Thu, 10 Dec 2020 06:26:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzaUj7tpOFO2508Lw7v7CE5X685qxDLYndPVRSbnJIXc50ft6ZIJ81hdHJIppshYmFGwc18AA==
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr8646296wmf.149.1607610398481; 
 Thu, 10 Dec 2020 06:26:38 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id b9sm9483846wmd.32.2020.12.10.06.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 06:26:37 -0800 (PST)
Subject: Re: [PATCH v3 08/13] audio: remove GNUC & MSVC check
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-9-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a162ec7c-4dc3-5784-866e-dc95f6919b1f@redhat.com>
Date: Thu, 10 Dec 2020 15:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-9-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 2:47 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> QEMU requires either GCC or Clang, which both advertize __GNUC__.
> Drop MSVC fallback path.
> 
> Note: I intentionally left further cleanups for a later work.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  audio/audio.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/audio/audio.c b/audio/audio.c
> index 46578e4a58..d7a00294de 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
>  
>  #if defined AUDIO_BREAKPOINT_ON_BUG
>  #  if defined HOST_I386
> -#    if defined __GNUC__
> -        __asm__ ("int3");
> -#    elif defined _MSC_VER
> -        _asm _emit 0xcc;
> -#    else
> -        abort ();
> -#    endif
> +      __asm__ ("int3");

This was 15 years ago... Why not simply use abort() today?

>  #  else
>          abort ();
>  #  endif
> 


