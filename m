Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D336693F4E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 09:05:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRTpI-0002Lf-Dc; Mon, 13 Feb 2023 03:04:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRTpE-0002Fg-AO
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRTpC-00014d-Sk
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 03:04:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676275474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t7JjOAt5zC/6UobAE8ewOg3NSBkoogYLHNe9rs4o5Vs=;
 b=Qe/5Q4ssSDxr5geKDnIOQbQcGDhLHIrqdisUBJ4dfVrIgSY9oTK8KDXXncd0UperWWlJ05
 sL9CRkRCAbCe3pQwPd5fCxBTnzjqeIpQwpjoK/5scKHfF7nq4hwHcls9EKvdgi3ygNpIMk
 vrwwy+MUbtmQXHaapNzRdoDzID8I70k=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-166-6X9sbgUOMde1VRkofF1hqA-1; Mon, 13 Feb 2023 03:04:32 -0500
X-MC-Unique: 6X9sbgUOMde1VRkofF1hqA-1
Received: by mail-qk1-f200.google.com with SMTP id
 w17-20020a05620a425100b00706bf3b459eso7097669qko.11
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 00:04:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7JjOAt5zC/6UobAE8ewOg3NSBkoogYLHNe9rs4o5Vs=;
 b=FQc/qtlwyuf/mxpVkZ9MiHDM0za62kZFAkT5pUei9k8vBgpKS/29iAL+G/jSGmyM8M
 1Bt/gELPWKx/K+dYZn9X+r1cdbG8U4j/9HSTREU9evIQygPSJ3HPmqlxISsbOcMP4AXt
 GwcjloyAD6Oc2fJ2IIuRqUsW4qupauQBH1HJTLwSLsySIYKWt1ygSijgbrYuvgehgZPH
 PuCiGfJ/Ly+7yY9o+xo+P9CktoESYsxx8/cYuUAxs2qN0DWcywCrpIAMPbm2T7YPhnmn
 MkS/tl1VhugQG7xxBh2EuuxBmJErJHlWlzigJFXi62NuwE8AiPg7ix1Fbriib0VIskYR
 eTLw==
X-Gm-Message-State: AO0yUKWUzXEF0TZtqCJYUlUKIiwjjFXJGAMyYLJQX96u0kWsi1aizspi
 j65HtjQIqIpVSBH4dG7RCdqQOI7kW0qGEEQJA+B357cjmk+dIjh+TIagfjZYXHaDhBwEHoDTjsl
 x2ZIZIWTvrLfRs9g=
X-Received: by 2002:a05:622a:4c14:b0:3b9:bc8c:c1ff with SMTP id
 ey20-20020a05622a4c1400b003b9bc8cc1ffmr24807130qtb.10.1676275471968; 
 Mon, 13 Feb 2023 00:04:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/uvt9P8SRqibuCuh4rWujIs7pqNYFrvjMFVh0OXUNuQzG9ciGRWCcpBXDO7yfywiy4wIdjJg==
X-Received: by 2002:a05:622a:4c14:b0:3b9:bc8c:c1ff with SMTP id
 ey20-20020a05622a4c1400b003b9bc8cc1ffmr24807107qtb.10.1676275471755; 
 Mon, 13 Feb 2023 00:04:31 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-185.web.vodafone.de.
 [109.43.177.185]) by smtp.gmail.com with ESMTPSA id
 t187-20020ae9dfc4000000b0073902217c00sm8082433qkf.23.2023.02.13.00.04.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 00:04:31 -0800 (PST)
Message-ID: <5f068ef1-87af-4f9a-43c3-6388e1c041c8@redhat.com>
Date: Mon, 13 Feb 2023 09:04:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] io: use closesocket()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-3-marcandre.lureau@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230212204942.1905959-3-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.348, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/02/2023 21.49, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Because they are actually sockets...
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   io/channel-socket.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 7aca84f61a..2040297d2b 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -159,7 +159,7 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>   
>       trace_qio_channel_socket_connect_complete(ioc, fd);
>       if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
> -        close(fd);
> +        closesocket(fd);
>           return -1;
>       }
>   
> @@ -233,7 +233,7 @@ int qio_channel_socket_listen_sync(QIOChannelSocket *ioc,
>   
>       trace_qio_channel_socket_listen_complete(ioc, fd);
>       if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
> -        close(fd);
> +        closesocket(fd);
>           return -1;
>       }
>       qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_LISTEN);
> @@ -310,7 +310,7 @@ int qio_channel_socket_dgram_sync(QIOChannelSocket *ioc,
>   
>       trace_qio_channel_socket_dgram_complete(ioc, fd);
>       if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
> -        close(fd);
> +        closesocket(fd);
>           return -1;
>       }
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


