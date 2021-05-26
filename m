Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D750839116A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 09:30:26 +0200 (CEST)
Received: from localhost ([::1]:42258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llnzl-0004S1-3l
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 03:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llnyh-0003gg-5T
 for qemu-devel@nongnu.org; Wed, 26 May 2021 03:29:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llnyb-0004rt-2M
 for qemu-devel@nongnu.org; Wed, 26 May 2021 03:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622014151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U2ydOHfVdAxK6dKCx/E3rrH9gYdwYoznKduscE1iJ+Y=;
 b=HIZMJubMSOIw1jpwSA2Aq2yVeccrfpUAGcUfvhTbsU+FauYohHPwDk3C16rfMXk0LAOFRN
 5X8XmbrRNtVY1fYDC9AeTTEIwmrVdOOvg2cXCyOAzVBy/dwqI0CjVBKL0L4m+4iKF0EnSk
 VDhJfAxnApGHvZ3vTWeK1lhJ0CJXXQA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-5yR79BrAMiuJb5OUniYaPA-1; Wed, 26 May 2021 03:29:07 -0400
X-MC-Unique: 5yR79BrAMiuJb5OUniYaPA-1
Received: by mail-wr1-f72.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso12137946wrf.4
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 00:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U2ydOHfVdAxK6dKCx/E3rrH9gYdwYoznKduscE1iJ+Y=;
 b=LXUWLbOMIhG+MXlKX0N8h0ZUU5qEX4bQ3oztAbXHjJ3pvdVmmF9bic8TaFHxY2sReS
 4qWECJFqatjNQOHEvt1IqARyvhNFK7cYIXnuUWOXEA6NNH+KrPbajhZpMgJd26fmSSBr
 Ug47Z3iEfbbJLx65nWTokqZ79y2yl6Gab7VuPqdS0i5rVkKu+ww0VMWRO5QCrs/VpQxN
 XA7VlbGoeCPx5JjXkdlCCXTPoUPt6k/O4kuK0SOtLe3162WKdAMvb6X/1zPMDGNsJ/ZL
 AgodCiyIML6X6Ci4EZOcJ8GYKXfUCZSdug6wjCtMPe8NTJnIT7FKTcguczhLIuwTbEDQ
 3fwQ==
X-Gm-Message-State: AOAM531FBeNBI9gRoCEEKtEigouffF+RL0gX3HbF0YbfEOfKgaU5QqsN
 u4WNobCZnQQa7Y5BQnz2vU8sdGLVCa+BY4/dygGPgYGb4XsTKR/Lvqp6JHHZrqdMvzl0UOlSX+W
 y46Vhqyp7J3uLZJk=
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr1996704wmq.169.1622014146189; 
 Wed, 26 May 2021 00:29:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnBAP7LFB6idBna6O3cSQv43Srp3+kd9vhYzwKfGfEXnoyIpRDgeBboqKsHWzac4LAlTpn4w==
X-Received: by 2002:a05:600c:4f48:: with SMTP id
 m8mr1996686wmq.169.1622014145897; 
 Wed, 26 May 2021 00:29:05 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c7sm18743803wrs.23.2021.05.26.00.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 00:29:05 -0700 (PDT)
Subject: Re: [PATCH 3/3] meson: List modules built in summary
To: qemu-devel@nongnu.org
References: <20210525104648.4060904-1-philmd@redhat.com>
 <20210525104648.4060904-4-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8d8484c1-11f9-436c-6f59-0d79449b960e@redhat.com>
Date: Wed, 26 May 2021 09:29:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210525104648.4060904-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 12:46 PM, Philippe Mathieu-Daudé wrote:
> Instead of guessing the modules built, list them. Example:
> 
>   Modules
>     audio                        : spice
>     block                        : curl dmg-bz2 gluster iscsi rbd ssh
>     chardev                      : spice
>     hw-display                   :
>     hw-s390x                     : virtio-gpu-ccw
>     hw-usb                       : redirect smartcard
>     ui                           : egl-headless gtk opengl spice-app spice-core
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  meson.build | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 5ca1bd36292..54b97ace207 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2738,6 +2738,17 @@
>  summary_info += {'FUSE lseek':        fuse_lseek.found()}
>  summary(summary_info, bool_yn: true, section: 'Dependencies')
>  
> +# Modules
> +summary_info = {}
> +foreach d, list : modules
> +  k = []
> +    foreach m, _ : list
> +      k += [m]

Clearer renaming k -> mods, m -> mod and d -> k.

> +    endforeach
> +  summary_info += {d: ' '.join(k)}
> +endforeach
> +summary(summary_info, bool_yn: true, section: 'Modules')
> +
>  if not supported_cpus.contains(cpu)
>    message()
>    warning('SUPPORT FOR THIS HOST CPU WILL GO AWAY IN FUTURE RELEASES!')
> 


