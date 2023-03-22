Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4F86C4E62
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:47:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezjB-00018d-22; Wed, 22 Mar 2023 10:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pezj8-00017L-04
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:46:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pezj3-00046l-DO
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679496363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5A4fzI2wy9Fyj/M+jQBaxTraVlIeONgnyGL9TwAZ2c=;
 b=D13pF4oWwMztf9iFK4cs12RMfGsYaxLZqeQzJXC2uCmYzTnuOqLOBDw8aQLHzYGAMa/is8
 ckQCvealkAG8VaXLmJ1gY7F1WPre2qBwimqIi5/dzV1/eJzeL/UfSrTXBCIwuLovfz0ULI
 CZPs9D1Mr9+RMOYdtzKKLZW+LIP6cUo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-O1DVrakRMFqMSG4lPVSHfA-1; Wed, 22 Mar 2023 10:45:59 -0400
X-MC-Unique: O1DVrakRMFqMSG4lPVSHfA-1
Received: by mail-qv1-f71.google.com with SMTP id
 z14-20020a0cd78e000000b005adc8684170so9311022qvi.3
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679496359;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D5A4fzI2wy9Fyj/M+jQBaxTraVlIeONgnyGL9TwAZ2c=;
 b=ycJh/Odtwm6dAN4/IybnfL4rxQbiCqSit9qdvaj6vxGa+dnxTSC7TVnnTkMZcq6I/g
 6eju6pJPDntOCvnPddcoCbk34NT/R2lTzBaYO58o4KaQVI7Uzld+m0HTTKRJKRM1VqTQ
 YsjeUze2vqk+0pFjMQhjkQKWPmz7zxujqBW+/7dNxfQQPK6qkijob+BydVKqJhFvI6G/
 G91roMVe3rKtVux8s6OCWrt1XZZfQCT+5N8xDzIPrVlyfeE9ikvQPUt3RYv9Xv+Z52io
 RAkVMuBTwC4vyK8OvlYk5bw9Cz8AhnQ/LqzcWR6hvxa1hHXtR/erW7SibVO3vkfEAXR+
 NXAw==
X-Gm-Message-State: AO0yUKWukZ1NjUaegDQiClqKi74uLeJ4o6FTP702Gn1RKVuWWWV/oA2K
 t2TeoOSyhHsI5SzvPuK4pfGhUX7L9+eXmF5QzTSaO9ByxYz/Q13V1ZxCq+79RGuAt6+EonYAKTd
 k41c9pY4Yns7+NUo=
X-Received: by 2002:ac8:4e42:0:b0:3bf:e415:5cc3 with SMTP id
 e2-20020ac84e42000000b003bfe4155cc3mr7389494qtw.58.1679496359246; 
 Wed, 22 Mar 2023 07:45:59 -0700 (PDT)
X-Google-Smtp-Source: AK7set9F9gjR7A52VLZUoNW8Dh4YqCvSKBdGlv43+TnDKbd0zkHaaB7MKyESwbUDBQS0k5Ch2viXWA==
X-Received: by 2002:ac8:4e42:0:b0:3bf:e415:5cc3 with SMTP id
 e2-20020ac84e42000000b003bfe4155cc3mr7389460qtw.58.1679496359021; 
 Wed, 22 Mar 2023 07:45:59 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-177-44.web.vodafone.de.
 [109.43.177.44]) by smtp.gmail.com with ESMTPSA id
 w9-20020ac843c9000000b003d8f78b82besm2710125qtn.70.2023.03.22.07.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 07:45:58 -0700 (PDT)
Message-ID: <d2562114-ba21-a1ad-ab84-17693e2d3f24@redhat.com>
Date: Wed, 22 Mar 2023 15:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 02/12] MAINTAINERS: Add virtio-video section
Content-Language: en-US
To: Albert Esteve <aesteve@redhat.com>, qemu-devel@nongnu.org
Cc: fmartine@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 eballetb@redhat.com, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, peter.griffin@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230322142132.22909-1-aesteve@redhat.com>
 <20230322142132.22909-3-aesteve@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230322142132.22909-3-aesteve@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22/03/2023 15.21, Albert Esteve wrote:
> From: Peter Griffin <peter.griffin@linaro.org>
> 
> Add myself as maintainer of the virtio-video files added
> in this series.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b56ccdd92..c6cc04c4f7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2176,6 +2176,14 @@ F: hw/virtio/vhost-user-gpio*
>   F: include/hw/virtio/vhost-user-gpio.h
>   F: tests/qtest/libqos/virtio-gpio.*
>   
> +virtio-video
> +M: Albert Esteve <aesteve@redhat.com>
> +S: Supported
> +F: hw/display/vhost-user-video.c
> +F: hw/display/vhost-user-video-pci.c
> +F: include/hw/virtio/vhost-user-video.h
> +F: tools/vhost-user-video/*

Please add tests/qtest/libqos/virtio-video.* here, too.

  Thomas



