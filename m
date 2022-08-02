Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFC5587C1E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 14:14:11 +0200 (CEST)
Received: from localhost ([::1]:49394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIqmn-0001d6-7v
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 08:14:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIqjc-00063U-Th
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:10:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1oIqjY-0007Vm-8q
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 08:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659442247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpA5237/0R5XllHtYKelBe1siNACiUEnLhZWzbQCqQ4=;
 b=Uvxb8o916nj6Wyc0W7jHeAoS6zVKg0XuU5SxX3itUwUS3LjGVpjcPFTR1uTYa7pdCKnK+I
 2jPfOMXnKIL4eA20RquGJuKgMIG/ASRgqI0Y4fGMC7seAgMhYdZ9RDrfic7qtP8DFWsPRH
 OgoqUvGj2FkX7kQTfJryxpjTQtaKln4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-7Cb2T7RAOM6YRm_-SAVPNw-1; Tue, 02 Aug 2022 08:10:46 -0400
X-MC-Unique: 7Cb2T7RAOM6YRm_-SAVPNw-1
Received: by mail-wm1-f72.google.com with SMTP id
 r81-20020a1c4454000000b003a4ef3d710aso527704wma.2
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 05:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MpA5237/0R5XllHtYKelBe1siNACiUEnLhZWzbQCqQ4=;
 b=lTk7spbcLHhH4250mR4pB5hN29b90WWLWCcP2YsWOFHx+2/nZuH88RDq7mmYXRh/E4
 bqydIGRLVJASBXYDo6LPhuPrd12RWpu2ivqEFn/vKYEMnSX5s1ohi9K9ZickU35LUesP
 JPMWCNsP8kpv+HDZKCfyyvg2twVKl/3eypbTUJ+CFXhfAglQyy94/fG190DQdRKnj1d/
 IpyLCRZ4y+nnalJlzznSbwCvK1hhmHjytgWNAnXgi7VFvfWIZC1VHSkP3O3aRw0EachD
 /W5NBwEYb2VsTTfN4H2c/dvl87VKmXD4jPWXeR97wKB58HWo9V3ydb+ssgdZXqwbQg/6
 2HBg==
X-Gm-Message-State: AJIora8OU52FfnQn4rHMc0lHrLh67hAh6PwC8zTan8nDzfkAUL7AL+Hg
 G25p8Agrqerav++5DVhyjzxxPbqppKTNRGMinIQRAhCCgjP3eXWE4ZpVgec1/8zkCmZsFf5CoEP
 u7F27gKL01SDzBV4=
X-Received: by 2002:a05:600c:114e:b0:3a3:6cd6:1d3e with SMTP id
 z14-20020a05600c114e00b003a36cd61d3emr13506129wmz.124.1659442244994; 
 Tue, 02 Aug 2022 05:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uJQvFO+ugqwFKfMs6ZLy1fhbz/TLdX67tYjwZcpluwU+3Zp5tGIRzy6kygfxkFoiGj+U8BFA==
X-Received: by 2002:a05:600c:114e:b0:3a3:6cd6:1d3e with SMTP id
 z14-20020a05600c114e00b003a36cd61d3emr13506110wmz.124.1659442244734; 
 Tue, 02 Aug 2022 05:10:44 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 bi9-20020a05600c3d8900b003a0375c4f73sm17568190wmb.44.2022.08.02.05.10.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 05:10:44 -0700 (PDT)
Message-ID: <72375be5-36d8-155c-9df8-da76c1d820c0@redhat.com>
Date: Tue, 2 Aug 2022 14:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] vdpa: Merge all net_init_vhost_vdpa error goto
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
References: <20220802112447.249436-1-eperezma@redhat.com>
 <20220802112447.249436-3-eperezma@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220802112447.249436-3-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/08/2022 13:24, Eugenio Pérez wrote:
> Few steps allocate new resources, and all of the allocated can be
> checked to avoid trying to free an invalid one.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   net/vhost-vdpa.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 303447a68e..ac1810723c 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -588,8 +588,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>       queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd, features,
>                                                    &has_cvq, errp);
>       if (queue_pairs < 0) {
> -        qemu_close(vdpa_device_fd);
> -        return queue_pairs;
> +        goto err;
>       }
>   
>       if (opts->x_svq) {
> @@ -604,7 +603,7 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>           if (invalid_dev_features) {
>               error_setg(errp, "vdpa svq does not work with features 0x%" PRIx64,
>                          invalid_dev_features);
> -            goto err_svq;
> +            goto err;
>           }
>   
>           vhost_vdpa_get_iova_range(vdpa_device_fd, &iova_range);
> @@ -640,7 +639,6 @@ err:
>           }
>       }
>   
> -err_svq:
>       qemu_close(vdpa_device_fd);
>   
>       return -1;

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


