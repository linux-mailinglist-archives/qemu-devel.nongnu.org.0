Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1027037A469
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 12:14:54 +0200 (CEST)
Received: from localhost ([::1]:46990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgPPh-0000DZ-5h
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 06:14:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPLG-0004vE-28
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:10:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgPLB-0000sk-KU
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620727812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v98Rq+UH8N4bjZIAvNpD5T8ON7qWYl1h9N/J/6Xw3Yk=;
 b=YglzXSIFjdLPUlaf9SRVU8xvOE2Rgvh3J8JtHgdIGcN/jU4LBZEYPuczYwpMfi2pERn+rB
 A+JiUKgOdLy+muu3sMFZ87B4wQLawOYpk63FW7BlWbecJ1//H0n9nWtVgP3CY+P4C/VJrn
 AH7wcvunAV3qds2VhoID+DF2eZ0j2oE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-S7AjvHb5OVeUsnF-cXvUlg-1; Tue, 11 May 2021 06:10:10 -0400
X-MC-Unique: S7AjvHb5OVeUsnF-cXvUlg-1
Received: by mail-wm1-f72.google.com with SMTP id
 g17-20020a05600c0011b029014399f816a3so544227wmc.7
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 03:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=v98Rq+UH8N4bjZIAvNpD5T8ON7qWYl1h9N/J/6Xw3Yk=;
 b=HanR558Pxp56buocS8aTupyqHTZEjqRXyd9eDl8ihF9DJGXTu+AhZBVwvGeLdUxCy7
 LaRS2haS+o7gNFC4CpeFxuXzdxda6fkXR0XEq5/UFAd+eQGY+UsvbRMQCWka4dce6q3Y
 KxXW1GZf0WcBh1LRi05XSi5J/uY+0hcEdUZ0RBul23cLZ/9UEo29wOccA+KlRjhHkXk2
 jTqL5LCs2dcCNRDGsqZ31bML78ztgzqyJRpTN5edOIvrLgY3BrO2eN7y1vi900LNJTWu
 wPAXNqAqO/48CQf1GxwDperNIGdut+aNvDNE0WinGzbda792+hHvGNhX6cBqFVEjleU3
 iCXw==
X-Gm-Message-State: AOAM532JYDRzblRIF5f9HUL/OSZj7UxJMCAuw8MQ75+hL09Tnv9urJQ1
 HvrTIU3gGoomPN6suOfwPsRastsrb0/ALlnTXEAV5QoRS/rgRHKgfY8l8me3qQXpt9usVFfEqX9
 +ViBe+1yGWoNW1V4=
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr36162018wri.257.1620727809304; 
 Tue, 11 May 2021 03:10:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzd02UcvISQ5rxqTjkOXrqS4xRhci3P5bCH3vlpCgIkgxAVY1TeUsFZ4gb2wZXQHFMjY/vYpg==
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr36162001wri.257.1620727809117; 
 Tue, 11 May 2021 03:10:09 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id
 s18sm27522596wro.95.2021.05.11.03.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 03:10:08 -0700 (PDT)
Subject: Re: [PATCH 11/72] softfloat: Use return_nan in float_to_float
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-12-richard.henderson@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <67c323c3-d2e2-2f5c-81a4-9632648b333a@redhat.com>
Date: Tue, 11 May 2021 12:10:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210508014802.892561-12-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08.05.21 03:47, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   fpu/softfloat.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 64edb23793..b694e38522 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -1931,13 +1931,7 @@ static FloatParts float_to_float(FloatParts a, const FloatFmt *dstf,
>               break;
>           }
>       } else if (is_nan(a.cls)) {
> -        if (is_snan(a.cls)) {
> -            float_raise(float_flag_invalid, s);
> -            a = parts_silence_nan(a, s);
> -        }
> -        if (s->default_nan_mode) {
> -            return parts_default_nan(s);
> -        }
> +        return return_nan(a, s);
>       }
>       return a;
>   }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


