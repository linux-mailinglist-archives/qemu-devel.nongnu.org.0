Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5BD64ABEF
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 01:04:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4skk-0002bF-Hc; Mon, 12 Dec 2022 19:02:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4ski-0002at-Sc
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 19:02:32 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4skh-0000Zc-4G
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 19:02:32 -0500
Received: by mail-oi1-x236.google.com with SMTP id k189so12806140oif.7
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 16:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CVrgMaO9SGBHrDgf7rSujtcB546u/N7hW8jJ9Vy++tc=;
 b=xAX8KKDPhCZsQmL8Th/EekgSmBkcHOjyVyN1WDhrtKKt3ooSIHMZzCnDcZPm0u+CRm
 1MBOAzNtWKf+NTSozemS2DydsPwgW77CDnETR9thig0SbmTRxVYhC53nxuv0irRDArKT
 1UQP0wdA0EZhXHKj4FR1bJ+gr9K62BQT/QeHe4WWH3qVHFnZRlQuqmur4+FmnXoL5bPk
 6jVZucm6Gu9T4sKFZ1OSY8lx72CJrPM0+qo2QCcMo/S1vbqGepQMjYuM4XeITgRBWunx
 UzAWB2CFU3ahzo0Ky0qpYVK4EBugxJTQtZjb1rQzby+lQf4eWG3nlDGwMdth5vGChEEq
 7naA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CVrgMaO9SGBHrDgf7rSujtcB546u/N7hW8jJ9Vy++tc=;
 b=51wlIRm6msSh4RR1GAboRu+Iwhf3UmZu321CK4Cv1Jm13kgJ5G6U81sMHJKsRosOe+
 2YTOHgjRTBRKNMocvQsrUXMrOHaG1LbNJuhZh7YpeVUJ48DtekyIx7alKC3bAYqneiVf
 GPz0MTjErd6fqx6jxMeta/NnAYMXevp4vFPGsPOZXQpmBpgdzLBIbwpI4vVRtTu/lymR
 Ebzxo6AS9bp/fXEBm1doUX7/nQxntXvEI90znyVrZ6vnIltNY1ctShooS3dYlpZTcyns
 0tzKE37zDkhphcqbTK7Ych9jg8SJeOkOvWv3wgCEhZCBb1rk+dk6B51tg0jcEsP3OCfK
 WQaw==
X-Gm-Message-State: ANoB5pnSYuf1YrwkPUCDEIlCaU4NleR9McfEpN5HXgvfcRaO6mbnP3+P
 EdieA7xVELZVPbUUXlGUejg5OA==
X-Google-Smtp-Source: AA0mqf5LkE/NUbp3c5enWXSljJYEx8x5dLb0+z2SxlvVFQMbuX7iHBujldhhVJTKHgG+AOVKJgejcA==
X-Received: by 2002:aca:b1c1:0:b0:35c:3a60:6ab7 with SMTP id
 a184-20020acab1c1000000b0035c3a606ab7mr7346311oif.49.1670889749552; 
 Mon, 12 Dec 2022 16:02:29 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:71d1:c9fb:8efe:ce5d?
 ([2806:102e:18:2efc:71d1:c9fb:8efe:ce5d])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a0568301bc300b006705e35c4e2sm551209ota.35.2022.12.12.16.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 16:02:29 -0800 (PST)
Message-ID: <09673dfc-1cc9-e5e4-97f5-9539abe92cb2@linaro.org>
Date: Mon, 12 Dec 2022 18:02:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 03/10] hw/virtio: Constify
 qmp_virtio_feature_map_t[]
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20221212230517.28872-1-philmd@linaro.org>
 <20221212230517.28872-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221212230517.28872-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/12/22 17:05, Philippe Mathieu-Daudé wrote:
> @@ -161,7 +161,7 @@ static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
>   };
>   
>   /* virtio device configuration statuses */
> -static qmp_virtio_feature_map_t virtio_config_status_map[] = {
> +static const qmp_virtio_feature_map_t virtio_config_status_map[] = {
>       FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
>               "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"),
>       FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
> @@ -179,7 +179,7 @@ static qmp_virtio_feature_map_t virtio_config_status_map[] = {
>   };
>   
>   /* virtio-blk features mapping */
> -qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
> +const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
>       FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
>               "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
>       FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \

It appears all of the ones not marked static can be?
Otherwise you should have needed to adjust some header file as well.


r~

