Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB452669B85
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:12:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKyD-0008Np-QS; Fri, 13 Jan 2023 09:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGKy1-0008LP-IH
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:23:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pGKxz-0006c4-Jq
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673619814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3kkzOjzxf5gTH5Zv05I5NJOY6jMe0ZSsTM8iC04NDY=;
 b=Jg2RYXCgBZZnL9iZnv/72EA/t4VUpLWHsGTnaimgTuhHnXZuwYlaadQ90I71geGaAP5vgS
 eWdcavcAXgl0EzGRnvvKc+n1yu9+Cf9Jk/2EDWLalFqixkac8LqA3fR2jWQhHXdVACdXbF
 yx/6QjvrgxeA8AWSQo9djQZ6XN0xYuc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-146-RE_Q1YIoMAiYdPHauf2aKg-1; Fri, 13 Jan 2023 09:23:33 -0500
X-MC-Unique: RE_Q1YIoMAiYdPHauf2aKg-1
Received: by mail-wm1-f72.google.com with SMTP id
 fm25-20020a05600c0c1900b003d9702a11e5so11010570wmb.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O3kkzOjzxf5gTH5Zv05I5NJOY6jMe0ZSsTM8iC04NDY=;
 b=HI5BeZFPDAmM3wH13YB8L9vligyfED6j8j2nboo1Paa4z1yJK/l1+V/i/OMm7KtYoL
 LDeoa62f1kL752ZWm6jA6vtYFUaTR7zA0l//OdAj2JwCLOhjCt6OtxJds/tMT8XDqOWU
 WUU2pwAH0TKlVUx9bsmr6p+VTq4ft7DckZQfg9YLGYk19q/9dp01whYg1kJ2LwSFanKq
 mlPa+HX1ckudI1LLtKv/y2PcNJUer4DqtqUePCaY/c2JpaGBWpcqxDxhvtxHbgmhfvzw
 UGZiYWABApj9r5s2khD+ycSo013nv1Ji8HphKsOAdviQVtqU9+t6WS0ejalGOOC0KhB4
 Em6g==
X-Gm-Message-State: AFqh2koBS1EuCpoliJZvQeYpK8gJMsDlZ/VYja2pH1cM+8TUyDLVuDcL
 iLGohdzdC2AalBYkZuo6lgIUe1syJuXnvV7HlB/Ey8KqsaLtWeX51DuVP7QLZABoYfjdkok5LId
 Fa4PaNR7IKFBjiT8=
X-Received: by 2002:a05:600c:4f07:b0:3da:1bb0:4d78 with SMTP id
 l7-20020a05600c4f0700b003da1bb04d78mr4343458wmq.14.1673619812342; 
 Fri, 13 Jan 2023 06:23:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvsSOKG+lVupPxWnZjWprNvkiFCBEWkmrk1JsgpsXeq7DozQzJzaf25WUrG1gTjs8it+jC1RQ==
X-Received: by 2002:a05:600c:4f07:b0:3da:1bb0:4d78 with SMTP id
 l7-20020a05600c4f0700b003da1bb04d78mr4343444wmq.14.1673619812099; 
 Fri, 13 Jan 2023 06:23:32 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-39.web.vodafone.de.
 [109.43.177.39]) by smtp.gmail.com with ESMTPSA id
 az20-20020a05600c601400b003d96bdddd3dsm25799869wmb.15.2023.01.13.06.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 06:23:31 -0800 (PST)
Message-ID: <4b9fd01e-6d6c-3046-dde0-dc8ce8de0f45@redhat.com>
Date: Fri, 13 Jan 2023 15:23:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v3 22/28] tests/qtest: Restrict bcm2835-dma-test to
 CONFIG_RASPI
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-23-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230113140419.4013-23-farosas@suse.de>
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

On 13/01/2023 15.04, Fabiano Rosas wrote:
> We will soon enable the build without TCG, which does not support many
> machines, so only run the bcm2835-dma-test when the corresponding
> machine is present.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index f0ebb5fac6..1af63f8bd2 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -207,11 +207,11 @@ qtests_aarch64 = \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
>     (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
>     ['arm-cpu-features',
>      'numa-test',
>      'boot-serial-test',
> -   'migration-test',
> -   'bcm2835-dma-test']
> +   'migration-test']
>   
>   qtests_s390x = \
>     (slirp.found() ? ['pxe-test', 'test-netfilter'] : []) +                 \

Reviewed-by: Thomas Huth <thuth@redhat.com>


