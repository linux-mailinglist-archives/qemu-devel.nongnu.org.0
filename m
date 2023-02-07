Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E73468D986
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 14:39:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOAd-0007fC-O5; Tue, 07 Feb 2023 08:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOAb-0007em-1P
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:38:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPOAZ-0005iU-Iw
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675777078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ciRK0i/PyWxb1PpRPh1uQfM29ax3WRg8ZHB4sI/V9PM=;
 b=H6jO1W6BEkUvek3QimqNZr9RcbE6h4I4++WY9UsX7Hn195mEssEon8Hroy2VpKmfhqimQA
 6+B+z1EjaQ/qAwSZjbJV5i82Pni+Af4ZE5IZWD2T9zhyUZugD6b4JhaY35k79FvnayBWXi
 8vvDcjrU8mPyEVxfE7tZjaLxPX3XPpE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-294-wO7NDjahNFaEEK1Qr6ilRg-1; Tue, 07 Feb 2023 08:37:57 -0500
X-MC-Unique: wO7NDjahNFaEEK1Qr6ilRg-1
Received: by mail-qk1-f197.google.com with SMTP id
 op32-20020a05620a536000b0072e2c4dea65so7951843qkn.12
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 05:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ciRK0i/PyWxb1PpRPh1uQfM29ax3WRg8ZHB4sI/V9PM=;
 b=ZWpFTg1jZ73TWJGvEcfD04oFDN2WDQusIaJdTLkkD52HqAaYDOL16xRM5DP0IhRFIm
 GyP9WlSxR12shYMQdMLCxrcvUha7tzyBB0tztyUVOip6LuxFZUE93jzmc07KRAJz2bGh
 A08T/MipXjNRAUrjbvasqDf7LsWVNhITIjLCZ5IPP288naAAthggqs26bcykm2HQDu02
 1ylSaQuqsB06qIf4vWlu6T8A844RHhg/nFw+ucX3x7HQawmRSgd+po+KfKNRNr1P5e3P
 Y8w/yRZO98MRgK+sbkllVVQnEuPP2HSubX9awUu6JqVit6BY6W+rwcKKR7unIzX/w9UC
 WbSA==
X-Gm-Message-State: AO0yUKWKs3L+7GdOvcWVbTI279Juweeatfm68Rsq7tXzz95u24LO8hmy
 V/5iY6M77FNUXYz9VqxEwaO6VRpQvC/AqHqipT3d1tXQSFBugJHNGi4gT8XhQAnGboGlojXR8OP
 J7jTjw4coXvzyhlo=
X-Received: by 2002:a05:6214:48e:b0:53c:f2f1:f192 with SMTP id
 pt14-20020a056214048e00b0053cf2f1f192mr5236278qvb.22.1675777077266; 
 Tue, 07 Feb 2023 05:37:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/oIbm9/mlywx+J9cnvdUfuqgMjLOXtiJU0F52eqs1MLd5x9R/yH2jaJlG8JvOK3OTr+QL2Rw==
X-Received: by 2002:a05:6214:48e:b0:53c:f2f1:f192 with SMTP id
 pt14-20020a056214048e00b0053cf2f1f192mr5236255qvb.22.1675777077053; 
 Tue, 07 Feb 2023 05:37:57 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 a27-20020a05620a103b00b0070736988c10sm9405273qkk.110.2023.02.07.05.37.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:37:56 -0800 (PST)
Message-ID: <cc33623d-3719-f5f0-a5e7-19ee19bce3e7@redhat.com>
Date: Tue, 7 Feb 2023 14:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 04/12] tests/qtest: Skip virtio-serial-console tests if
 device not present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230206150416.4604-1-farosas@suse.de>
 <20230206150416.4604-5-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206150416.4604-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/02/2023 16.04, Fabiano Rosas wrote:
> The virtconsole device might not be present in the QEMU build that is
> being tested. Skip the test if that's the case.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/virtio-serial-test.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/virtio-serial-test.c b/tests/qtest/virtio-serial-test.c
> index 2541034822..f4e05e8fdd 100644
> --- a/tests/qtest/virtio-serial-test.c
> +++ b/tests/qtest/virtio-serial-test.c
> @@ -28,6 +28,10 @@ static void register_virtio_serial_test(void)
>   {
>       QOSGraphTestOptions opts = { };
>   
> +    if (!qtest_has_device("virtconsole")) {
> +        return;
> +    }

Maybe it makes more sense to check for CONFIG_VIRTIO_SERIAL in the 
meson.build file first?

  Thomas


