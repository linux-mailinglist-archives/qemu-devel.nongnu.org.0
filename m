Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2387F334578
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:47:42 +0100 (CET)
Received: from localhost ([::1]:37616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2vt-0003Gv-4C
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:47:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2Yn-0007GQ-B1
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:23:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK2Yl-0005QX-BM
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 12:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615397026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=poRTymVaj0IqruSQFGhMfMaghbFfwd5ukaSVry40cYY=;
 b=Gao6JzRHpit95ikhrdKyKWsiNgucgfrEtjG4yd84lQBwwiar2oxRFH63fkucpy7aKSYKOF
 qHX+gOahCy8+wUvUF6V5X4kn4sdeURyvPzbZv2eis2nEBKzyveFUv2eX5ae8eSX9yCoRJ4
 raM4P2K0xjk+RGEOr2FbxFH+Dq0xIt0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-qDGPkxEINlelpfKYEsaGDA-1; Wed, 10 Mar 2021 12:23:43 -0500
X-MC-Unique: qDGPkxEINlelpfKYEsaGDA-1
Received: by mail-ej1-f70.google.com with SMTP id 11so7514507ejz.20
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 09:23:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=poRTymVaj0IqruSQFGhMfMaghbFfwd5ukaSVry40cYY=;
 b=Y8u1OQ6SfXXrVy9RY/drjOMRaoXfuJHIeG1/XOpJkD9WR0msIfrg4Om81quWvJCAG9
 DHdrofeyYYwUjH5cLprnSgXmhkjyhT1STLK60fvnHzOXP6U7GGKH0h+qc66pqSpcWArD
 2B9beRV5xVy+sUiBHQmin9nin2Yjjmc6RfhhPBAOZnC485De7Y8GQK+TkmAn2OL/LcJU
 0QMzi4dib/EvZs3h5KvNI0ml2TRgC4YrAdi6izA0QdAecQ4E8VVgrafP0UoxgkXLffa3
 icN7+gzqAR5+dWFf+uppPCbuzTqn2kKnRuA1RzcA5951M/M6GTucTCndY/i0KsHog9c7
 2bFQ==
X-Gm-Message-State: AOAM532XDbg6wqn4YPpMvRK0yh8Kg02fWY6EpKINGwUDXVN4gkGFIYNf
 OsLdotHI8SoWwWDAKakhifv60mlliImVJ9gO8skQSkHxbKgGVurFj/xCXh0XPiFzQ6IB9WcWxiE
 McKSShDUU2O3WbIo=
X-Received: by 2002:a17:906:1712:: with SMTP id
 c18mr4845855eje.417.1615397022643; 
 Wed, 10 Mar 2021 09:23:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxl25lHlP0Yh03CqV/vUdrYMFZC13DFyRsyi7YonD3IoZvoXeEqNKrrtQmVxBVRG4WXMifzuQ==
X-Received: by 2002:a17:906:1712:: with SMTP id
 c18mr4845816eje.417.1615397022268; 
 Wed, 10 Mar 2021 09:23:42 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v9sm59453ejc.37.2021.03.10.09.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 09:23:41 -0800 (PST)
Subject: Re: [PATCH] baum: Fix crash when Braille output is not available
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
References: <20210310160815.3411019-1-samuel.thibault@ens-lyon.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d37169ee-6cc5-2539-45e9-a19c121bbdd4@redhat.com>
Date: Wed, 10 Mar 2021 18:23:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210310160815.3411019-1-samuel.thibault@ens-lyon.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Samuel,

On 3/10/21 5:08 PM, Samuel Thibault wrote:
> When Braille output is not available, the backend properly reports being
> unable to be created, but 5f8e93c3e262 ("util/qemu-timer: Make timer_free()
> imply timer_del()") made the timer_free() call now refuse any NULL
> parameter. char_braille_finalize thus now has to be more careful with
> calling it on baum->cellCount_timer.
> 
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> ---
>  chardev/baum.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/chardev/baum.c b/chardev/baum.c
> index 5deca778bc..aca5bf12fb 100644
> --- a/chardev/baum.c
> +++ b/chardev/baum.c
> @@ -631,7 +631,9 @@ static void char_braille_finalize(Object *obj)
>  {
>      BaumChardev *baum = BAUM_CHARDEV(obj);
>  
> -    timer_free(baum->cellCount_timer);
> +    if (baum->cellCount_timer) {
> +        timer_free(baum->cellCount_timer);
> +    }

Paolo's approach is more generic:
https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg03457.html


