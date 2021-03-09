Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE06332199
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 10:09:09 +0100 (CET)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJYMW-000184-2J
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 04:09:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJYLh-0000h1-Iz
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:08:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJYLe-0000xm-TX
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 04:08:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615280893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rrj/VOe4Melh+TADD/fVfav2ObnBwe4VywvBA66pCMM=;
 b=R760By/FlVvkK0UJnrKrVT2STLqLdHP+0FzFhcM40F4PexFghWKo03fQjLFj98QRAIyucZ
 BSrADMP+HtN+cyOW21esWIRSttPciHfwxTeDipFLSz0S8oE2Uvnt6cTviR5voS7FntwujN
 QmDcW9qLtg8OJYKkihoYEjqr1iIVLU0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-i7jz2R9nPgOg787ge6EgNA-1; Tue, 09 Mar 2021 04:08:12 -0500
X-MC-Unique: i7jz2R9nPgOg787ge6EgNA-1
Received: by mail-wm1-f72.google.com with SMTP id i14so850251wmq.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 01:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rrj/VOe4Melh+TADD/fVfav2ObnBwe4VywvBA66pCMM=;
 b=J/LAuuK7Dzh+jcU1H/YOHEGzApCmD5QrRRBKkT7eRZXkDlAW5Oz2rWMigRmXAVwz5A
 MBpOQjxWzSslidrq9CBBOOUB06yimyxqdlAoZGckVkb3b47cLBDzmoOiKEdAE+oWcA6j
 R9Q9ABgMW2z7am7wrG8Z7T0maXf2hJsutovacZ1Nk9dUnEIEp340/Z7qMi2nddWRXeP2
 YdGm5nVqzHYN4zYnQW4yzP1mx/JQZrmyfH8N3pNI1/EIb8RUdHMJ9/sz25DhQTnVXwDh
 BeJ5XLpxhXob42l/cRA1YIXVqAVbWRbbtWzvbmPvMYkGVYaM6FKmU22rvWK3c56b2oAS
 SnLg==
X-Gm-Message-State: AOAM530xTQUznfsLx6KZpCOzrT/Ao3ENfStrjXOfa2QNcbLH29bFtxWd
 2+GPIMHR/6d0MGbfFbZuoCkAAYTCJ/DHVty1D8aNsRLQ4PSxOO2pkH2zJnYY6cXLS6ZmgQ7RgOx
 AjFYU7qAtj3lIeve4HvyqomcswoHliWHFgnZCeQyGljoiDUwTMXS1FpYPTHu5dk78
X-Received: by 2002:a1c:2390:: with SMTP id j138mr2854086wmj.72.1615280890825; 
 Tue, 09 Mar 2021 01:08:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbTROAIX/k1KhJWkdhiKq9rw42uG11HJleWGFHMD2rYz+5E7hyTPfWmCsSXQpjGt6NNoiX1w==
X-Received: by 2002:a1c:2390:: with SMTP id j138mr2854062wmj.72.1615280890525; 
 Tue, 09 Mar 2021 01:08:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v6sm23163637wrx.32.2021.03.09.01.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 01:08:09 -0800 (PST)
Subject: Re: [PATCH] virtio-gpu: Add spaces around operator
To: lijiejun <a_lijiejun@163.com>, kraxel@redhat.com,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <1615275756-129881-1-git-send-email-a_lijiejun@163.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c7918046-a99e-663e-355c-0b9b1c4d817c@redhat.com>
Date: Tue, 9 Mar 2021 10:08:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1615275756-129881-1-git-send-email-a_lijiejun@163.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Cc'ing qemu-trivial@)

On 3/9/21 8:42 AM, lijiejun wrote:
> Fix code style. Operator needs spaces forend sides, and delete line space.

"forend"?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
> Signed-off-by: lijiejun <a_lijiejun@163.com>
> ---
>  hw/display/virtio-gpu-3d.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-3d.c b/hw/display/virtio-gpu-3d.c
> index 9eb4890..d989648 100644
> --- a/hw/display/virtio-gpu-3d.c
> +++ b/hw/display/virtio-gpu-3d.c
> @@ -438,7 +438,7 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>          break;
>      case VIRTIO_GPU_CMD_RESOURCE_FLUSH:
>          virgl_cmd_resource_flush(g, cmd);
> -       break;
> +        break;
>      case VIRTIO_GPU_CMD_RESOURCE_UNREF:
>          virgl_cmd_resource_unref(g, cmd);
>          break;
> @@ -456,7 +456,6 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
>      case VIRTIO_GPU_CMD_GET_CAPSET:
>          virgl_cmd_get_capset(g, cmd);
>          break;
> -
>      case VIRTIO_GPU_CMD_GET_DISPLAY_INFO:
>          virtio_gpu_get_display_info(g, cmd);
>          break;
> 


