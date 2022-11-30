Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1837A63D550
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 13:15:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Lzm-0004et-UB; Wed, 30 Nov 2022 07:15:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0Lze-0004dD-VK
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 07:15:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p0Lzd-0008HC-3u
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 07:15:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669810511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taLuJgfMIJbVMS5XWpSdzvvHb7JLRlL7Y3QPjE3zeCc=;
 b=aOwNurwQl8Fh2zb0kqkKZ88QnvUjvf2CmgNfivJpT4siiIM7aos5WwxttafDgh+9HpoYJb
 Owpr7kjndBNMN1TLv1P+km4OhZsGu1OKykJhS9cpM0Ik4uqKsuxSQJnnrpALUEhH6eTg3x
 8EjE2RCun1/hSt0isxNE5t+RSbeJ4kY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-OFjpdhqAPKqLCwumWJZs3A-1; Wed, 30 Nov 2022 07:15:10 -0500
X-MC-Unique: OFjpdhqAPKqLCwumWJZs3A-1
Received: by mail-wr1-f69.google.com with SMTP id
 v14-20020adf8b4e000000b0024174021277so3525637wra.13
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 04:15:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=taLuJgfMIJbVMS5XWpSdzvvHb7JLRlL7Y3QPjE3zeCc=;
 b=UMOjXXpDlam8eRg524CLC+Em7vAa7xZ70uRf8JlZbAmcg8IlJ/wnUA8sw5YaiEK14G
 RalTXCrKH2GPMn1Au+62rDTe+mxy9ULtJSnNu7WcleMP3CXhNCUyvKBxIZkM6kN8QvOd
 pmENFZcZkNyFBVuME0aMUYDZehxxoAa9g5G7u9sR3Xcok/PJT+0xMk5pXwDV5nXwOm+V
 b7IHHdiyakKRIAvHXagsiBzZcYLS+oreOzbXwrwphh3ZHEgVE1OFM9Pu/QJmeQbH37wu
 3SkeIemuHMVOsShZ0czxFdT4KyeiYVdO7eEP4rCmb/6IURX68VC3dY/MReaxPm1LeKci
 QEig==
X-Gm-Message-State: ANoB5pkFrPCxRGNZhVj4e8AZxOatfs+Rc+WfUKSy5Ci8rgkyb0/bDHgR
 MLWfbtj0gDPSkYzNhCIaH7TiKB8eczM90NxZX5Dxh6SgzV0+C7JX+RzqQ5QB3nZgSFqDGL7UH48
 D2X7orWzB6yAPMtA=
X-Received: by 2002:a05:6000:110e:b0:22e:41e:29fe with SMTP id
 z14-20020a056000110e00b0022e041e29femr16208637wrw.83.1669810509008; 
 Wed, 30 Nov 2022 04:15:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Da3uDC2og7tkKvvUPm0kVSBQmoCoJpmv9+p34SOEYmHGSgtcz+D9hTePbrtt9KAZUjT2hPQ==
X-Received: by 2002:a05:6000:110e:b0:22e:41e:29fe with SMTP id
 z14-20020a056000110e00b0022e041e29femr16208607wrw.83.1669810508734; 
 Wed, 30 Nov 2022 04:15:08 -0800 (PST)
Received: from [192.168.8.102] (tmo-073-221.customers.d1-online.com.
 [80.187.73.221]) by smtp.gmail.com with ESMTPSA id
 z2-20020a05600c220200b003cfd10a33afsm5152784wml.11.2022.11.30.04.15.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 04:15:08 -0800 (PST)
Message-ID: <8b1853f5-8f93-0cac-4753-94e1f49066a7@redhat.com>
Date: Wed, 30 Nov 2022 13:15:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 1/5] tests/qtests: override "force-legacy" for gpio
 virtio-mmio tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20221130112439.2527228-1-alex.bennee@linaro.org>
 <20221130112439.2527228-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221130112439.2527228-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.257, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 30/11/2022 12.24, Alex Bennée wrote:
> The GPIO device is a VIRTIO_F_VERSION_1 devices but running with a
> legacy MMIO interface we miss out that feature bit causing confusion.
> For the GPIO test force the mmio bus to support non-legacy so we can
> properly test it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1333
> ---
>   tests/qtest/libqos/virtio-gpio.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/libqos/virtio-gpio.c b/tests/qtest/libqos/virtio-gpio.c
> index 762aa6695b..f22d7b5eb5 100644
> --- a/tests/qtest/libqos/virtio-gpio.c
> +++ b/tests/qtest/libqos/virtio-gpio.c
> @@ -154,7 +154,8 @@ static void virtio_gpio_register_nodes(void)
>       QOSGraphEdgeOptions edge_opts = { };
>   
>       /* vhost-user-gpio-device */
> -    edge_opts.extra_device_opts = "id=gpio0,chardev=chr-vhost-user-test";
> +    edge_opts.extra_device_opts = "id=gpio0,chardev=chr-vhost-user-test "
> +        "-global virtio-mmio.force-legacy=false";
>       qos_node_create_driver("vhost-user-gpio-device",
>                               virtio_gpio_device_create);
>       qos_node_consumes("vhost-user-gpio-device", "virtio-bus", &edge_opts);

Acked-by: Thomas Huth <thuth@redhat.com>


