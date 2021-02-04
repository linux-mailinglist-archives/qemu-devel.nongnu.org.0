Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A00030F216
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:28:56 +0100 (CET)
Received: from localhost ([::1]:36520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7coh-0004NK-FE
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7cmj-0003Rt-Eu
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:26:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7cmh-00065C-Jp
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612438010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04WXk89cXikXn8ogopBOmUR13z3UIvOjmVnfSzLYrWg=;
 b=WqNu70+wy6V/p81a3rMVSXRsP+tZ+D5q+lGEvFLKD+5hnY3YZrjGqHxelW07RNAXcVVmOM
 FLkYzQp0n6/IfjI1eFqDf0utcKfHHjWUyLOP+vAmdM0VGxhVimh+ZKKuvCV3+YOCC6/Xsx
 b9NVDvfB6tJUNW5TjNzUqPISfXjsZeU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-iAvwfdOvPCeilynvLtYXrg-1; Thu, 04 Feb 2021 06:26:48 -0500
X-MC-Unique: iAvwfdOvPCeilynvLtYXrg-1
Received: by mail-ed1-f69.google.com with SMTP id b1so2615171edt.22
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 03:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=04WXk89cXikXn8ogopBOmUR13z3UIvOjmVnfSzLYrWg=;
 b=nDkA+m8Mi/x1YtmYmo/fps2X0R82TMBZ+kgiFo6L0izaEA5YfbRqv2FTj5G8c8r2ha
 m3nbP5Mjcv/DXTo0XFXzxHXyVKvbYfZ1SWdQW+HAPIo8+RFr1YQbbB2mwWnvqGJVqD4J
 zb+PF4KYSpNWXPdffN0lLNoRTY549nSVjCGgeyrt5Xzh7vvr4YS55rf1JHUI4SB8KcX7
 rRiKMnKrSokUP7OIQAeIqWKaeiHBjbQxetMb78g5V7zpTbt2CJCWYj3iL/LbBIf5taVl
 m5XJEpBBeQlOC0r0TUA9MNf/g+WFCzrWs/B9/76SGvILx75nxyE0Ejl3emvfGbmquA/c
 KELw==
X-Gm-Message-State: AOAM533dy63Gswe+yA9as60tKueLwPSMvv4QyUUnlmn8F9TjIwd0377V
 87zI4YYXMJHMVCj0MSPsih2c2so3UAD0DOk2IOSvIxATnpf2yBwbhieXlcbDJ4Yak+wgfbBCRt9
 +3xHX1OdK4pWf28w=
X-Received: by 2002:a17:906:6087:: with SMTP id
 t7mr7634130ejj.90.1612438007613; 
 Thu, 04 Feb 2021 03:26:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPwNd3xUAttv80mtVags3LjYkGGJP7sglNixMu/AlBn57BV7WsP1ZTrA0hObALXA62Q3hScA==
X-Received: by 2002:a17:906:6087:: with SMTP id
 t7mr7634121ejj.90.1612438007442; 
 Thu, 04 Feb 2021 03:26:47 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id v20sm2324066edt.3.2021.02.04.03.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 03:26:46 -0800 (PST)
Subject: Re: [PATCH v2 03/20] vhost-user-gpu: use an extandable state enum for
 commands
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210204105232.834642-1-marcandre.lureau@redhat.com>
 <20210204105232.834642-4-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b820bcfc-4e98-8a33-23ab-f76548443a51@redhat.com>
Date: Thu, 4 Feb 2021 12:26:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204105232.834642-4-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 11:52 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Introduce a pending state for commands which aren't finished yet, but
> are being handled. See following patch.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  contrib/vhost-user-gpu/vugpu.h          | 8 +++++++-
>  contrib/vhost-user-gpu/vhost-user-gpu.c | 8 ++++----
>  contrib/vhost-user-gpu/virgl.c          | 2 +-
>  3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
> index 86f3ac86aa..04d5615812 100644
> --- a/contrib/vhost-user-gpu/vugpu.h
> +++ b/contrib/vhost-user-gpu/vugpu.h
> @@ -129,12 +129,18 @@ typedef struct VuGpu {
>      QTAILQ_HEAD(, virtio_gpu_ctrl_command) fenceq;
>  } VuGpu;
>  
> +enum {
> +    VG_CMD_STATE_NEW,

Maybe VG_CMD_STATE_STARTING?

> +    VG_CMD_STATE_PENDING,

Maybe introduce VG_CMD_STATE_PENDING in the
patch using it.

> +    VG_CMD_STATE_FINISHED,
> +};

Can we use a typedef ...

> +
>  struct virtio_gpu_ctrl_command {
>      VuVirtqElement elem;
>      VuVirtq *vq;
>      struct virtio_gpu_ctrl_hdr cmd_hdr;
>      uint32_t error;
> -    bool finished;
> +    int state;

... and use it here?

Or directly declare in place:

       enum {
           VG_CMD_STATE_STARTING,
           VG_CMD_STATE_PENDING,
           VG_CMD_STATE_FINISHED,
       } state;

>      QTAILQ_ENTRY(virtio_gpu_ctrl_command) next;
>  };
>  

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


