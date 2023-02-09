Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A176901D2
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 09:07:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ1xL-00032E-9E; Thu, 09 Feb 2023 03:06:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ1xF-00031S-E9
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:06:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pQ1xD-0008HZ-Ti
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 03:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675930010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QgkB5mKfuE1Ti8FZ2NT7U1HUXxDOxpo6DxCfUmzkLHg=;
 b=NBZlY1jnFIKK3XYhGFQ3WE//yqNmjcghc5DXbt5NzTo8U1ncGzTjtserSq6EgsG+Pudbmi
 AC9C9XksQpXZYAz7y675eV2VhvQDzvs90Ezv6Nzo84yd6is5QXhiiV/Vz2JtWYkV3Tcvy2
 PPWMyIcSm65GfBF7x7dB5AVhio2Y75c=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-631-RDzqrGyaNC6mv55OrNNApg-1; Thu, 09 Feb 2023 03:06:49 -0500
X-MC-Unique: RDzqrGyaNC6mv55OrNNApg-1
Received: by mail-qv1-f69.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso814947qvu.12
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 00:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QgkB5mKfuE1Ti8FZ2NT7U1HUXxDOxpo6DxCfUmzkLHg=;
 b=OfmUA9oweuCfNmpCY1OHNwR7prnwcPNiG0kQI5el+AZ0GWl3diyHgsAteM4h7+Y+v6
 eLSpgiNJNTOyfGMCOzwXTWKFN5mf+8+2Bv6LzFbjISngQSLIHV3a1NaUmCQOVYy18Xen
 4ai+dmzyLuYZDyIkmap2ER0/zAdKNGb9ZFRCeSxYy0nyhebCr5nC1FKBOP7hMrpKojil
 M7emqofR8l4YSJIoHembF8KmXCwUi/LlNbfbbabFSZpnCxCB7AMh2Ql1fOAOpdUCo+EE
 x/PA1IuWDG/gRonYJp/Q1L67b94a1Khjv07/BwV5ghXlP4bN6dEmWq1L9ivL1MR+32t7
 ubBQ==
X-Gm-Message-State: AO0yUKV1AMTaxdlDJZ+yTBC0PafiWLI9xoyEBlrwJmkEA5urh0xgYe9Z
 VGWtP3cOzDu/aA6QtMm1I6BaFbfZMajH0kR9r0wW3rTjXQ4Xm3bpn+WzjCv0hDlpJVejmDxQgpN
 WUJCRloU4w09V1Aw=
X-Received: by 2002:a05:622a:413:b0:3b6:3406:81cb with SMTP id
 n19-20020a05622a041300b003b6340681cbmr18190993qtx.14.1675930008915; 
 Thu, 09 Feb 2023 00:06:48 -0800 (PST)
X-Google-Smtp-Source: AK7set+TUgk4OCOJChZMswTw4xi81tXmA6xOhwTScWAB+N6UmlFH2hk19fSiHe0L/MQoxEOcZC2Dbw==
X-Received: by 2002:a05:622a:413:b0:3b6:3406:81cb with SMTP id
 n19-20020a05622a041300b003b6340681cbmr18190971qtx.14.1675930008716; 
 Thu, 09 Feb 2023 00:06:48 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-209.web.vodafone.de.
 [109.43.176.209]) by smtp.gmail.com with ESMTPSA id
 o186-20020a37bec3000000b007208a81e11esm887567qkf.41.2023.02.09.00.06.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 00:06:48 -0800 (PST)
Message-ID: <b4df66ae-3368-e082-8090-4bc8a39fd60a@redhat.com>
Date: Thu, 9 Feb 2023 09:06:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 04/12] tests/qtest: Don't build virtio-serial-test.c if
 device not present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20230208194700.11035-1-farosas@suse.de>
 <20230208194700.11035-5-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230208194700.11035-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08/02/2023 20.46, Fabiano Rosas wrote:
> The virtconsole device might not be present in the QEMU build that is
> being tested.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 5c8b031ce0..eccdfca235 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -255,10 +255,14 @@ qos_test_ss.add(
>     'virtio-net-test.c',
>     'virtio-rng-test.c',
>     'virtio-scsi-test.c',
> -  'virtio-serial-test.c',
>     'virtio-iommu-test.c',
>     'vmxnet3-test.c',
>   )
> +
> +qos_test_ss.add(
> +  (config_all_devices.has_key('CONFIG_VIRTIO_SERIAL') ? ['virtio-serial-test.c'] : [])
> +)

The check below uses "if config ..." instead ... so for consistency, I think 
it would be nicer to do:

if config_all_devices.has_key('CONFIG_VIRTIO_SERIAL')
     qos_test_ss.add(files('virtio-serial-test.c'))
endif

  Thomas


>   if config_host.has_key('CONFIG_POSIX')
>     qos_test_ss.add(files('e1000e-test.c'))
>   endif


