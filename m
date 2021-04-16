Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B523625A5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:28:48 +0200 (CEST)
Received: from localhost ([::1]:39312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXRKp-0002QS-Ql
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lXRHd-0007ai-Kn
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:25:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lXRHZ-0008BG-67
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 12:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618590324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kVHGc/5TajC1Y3j9YAz3tlLtNlrFLPpUSMs3RXaTHbQ=;
 b=b/Ja/hkw/980Yu4ZzREdyzwA0pGWyhCWNniOvVhTuiMoG8vXur0SUIWVjUQVlVBpLsjzs9
 xTc9qEJNnKSngCmNSKFAk4xZC/yKcaTwudtEBsGU60TaeuBLFEgqKnbvwkcAbbjQRaKxes
 tMtKxQtffNXnYCm1X+n0XXD7oz6t4hU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-OxnF7hxnOeiF_D7cXqdtdw-1; Fri, 16 Apr 2021 12:25:22 -0400
X-MC-Unique: OxnF7hxnOeiF_D7cXqdtdw-1
Received: by mail-ej1-f69.google.com with SMTP id
 c18-20020a17090603d2b029037c77ad778eso2199838eja.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 09:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kVHGc/5TajC1Y3j9YAz3tlLtNlrFLPpUSMs3RXaTHbQ=;
 b=ppm+r0UCy/+z8XGoDAosd5H6r7Kz4fhmdnmf+/3IcJmCW5Ys07+5B0xd94mtK++czx
 iS8SQnrLbLdgCBfzyxxAJpJdB/uuJRo2O6JsNf3W/T3scqthdShypjf3ZGJa6APE5w4Z
 idv+a0pC0e3agv8FlKdJRWdU5rfedjAVvlm4E+/v0n/897tyhhcG1poVbgnanTK5ikho
 Y6cN2uTQt95YbNNUEcXop1ZRSt1TJJ7A40sYnlT0mSM5jdyrzuTM4OZKLVTK4XY0X5AV
 d9rbFjN4i740SEa6wl5+pzbF0afu9Z608i4ebcUbOB9SRiA6y5q4CYUaKZwvkaZh+Btg
 dd4w==
X-Gm-Message-State: AOAM5315sRxhdcBxaaJLE9OtQQ2qAIitvUageEeec+WevhGpmp+Q+k1b
 RWdAnW8v0GyLHSwjbV774nM4TTEQ2hacyYX+gHwy4oq1Zr7h/Edi9OlIv19Y874Q4xA3lEyHeoa
 yUCj/BTQzyZ6GXKA=
X-Received: by 2002:a17:906:eb09:: with SMTP id
 mb9mr8978390ejb.452.1618590321524; 
 Fri, 16 Apr 2021 09:25:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVHYeEJgTFSXlAYNs9CcEKFE+CCYV2vMQXnPcAqV6mXcTMhAGQ3lb1oaqnKEzoIVmY3YF5Tg==
X-Received: by 2002:a17:906:eb09:: with SMTP id
 mb9mr8978382ejb.452.1618590321390; 
 Fri, 16 Apr 2021 09:25:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f13sm4489003ejb.33.2021.04.16.09.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 09:25:20 -0700 (PDT)
Subject: Re: [PATCH for-6.0? 4/6] osdep: Make os-win32.h and os-posix.h handle
 'extern "C"' themselves
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210416135543.20382-1-peter.maydell@linaro.org>
 <20210416135543.20382-5-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <afc0e5bf-3d4f-e4c6-cd1e-f90f3686d2f1@redhat.com>
Date: Fri, 16 Apr 2021 18:25:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210416135543.20382-5-peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/04/21 15:55, Peter Maydell wrote:
>   #ifdef _WIN32
>   #include "sysemu/os-win32.h"
>   #endif
> @@ -143,6 +139,10 @@ extern "C" {
>   #include "sysemu/os-posix.h"
>   #endif
>   
> +#ifdef __cplusplus
> +extern "C" {
> +#endif
> +
>   #include "qemu/typedefs.h"
>   
>   /*
> diff --git a/include/sysemu/os-posix.h b/include/sysemu/os-posix.h
> index 629c8c648b7..2edf33658a4 100644
> --- a/include/sysemu/os-posix.h
> +++ b/include/sysemu/os-posix.h
> @@ -38,6 +38,10 @@
>   #include <sys/sysmacros.h>
>   #endif
>   
> +#ifdef __cplusplus
> +extern "C" {
> +#endif
> +

include/sysemu/ is also the wrong directory to have these headers, which 
probably should be split into a qemu/osdep-{win32,posix}.h part and an 
actual sysemu/os-{win32,posix}.h part.  But this is good enough for now.

Paolo


