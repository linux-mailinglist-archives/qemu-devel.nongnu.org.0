Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D066F012A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:02:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prvd8-0007wU-Lk; Thu, 27 Apr 2023 03:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prvcr-0007uP-VJ
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:01:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prvcn-00036g-B7
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682578864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o42cPEIlL5hq6xgU1iacDO8RC2/CLSL+hygcefRcB30=;
 b=Z+CbRruKHIsa1wPkAoe32X0haqMLlsvPllntezg/Ve0DUjflE7MJ4zoV2w0QQywBFHsle9
 JCwhtRo/uR5ZR8K37rxk+47Zhijy90fXIVnQHK5n1KxbpeK1xf3caseH9g/AYrJ99BZbFG
 q6xnixcz8kB8Ka3As2ujkSrihcGbGmg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-AZjZJLgKOpWCMoUGg6EofA-1; Thu, 27 Apr 2023 03:01:02 -0400
X-MC-Unique: AZjZJLgKOpWCMoUGg6EofA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f080f53c49so46121205e9.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 00:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682578861; x=1685170861;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o42cPEIlL5hq6xgU1iacDO8RC2/CLSL+hygcefRcB30=;
 b=L4uIerHO2vkeZeQpusiA6/VXGMLcOeImauzVEz8lFV5+VSvwMYJIoDGewRoZDbBaF6
 F55zLhUEki+aJpLERfslijOZoZAc9lewJZthmF6ceA53C+Ucvasl6aQttiiEIHP1td07
 mFfWnCfpjgvDTL2aI9Tw0zQxL/GsSSA7pUePV18WQ4B+xNdtaKMoIiEMJ58R94CavF/6
 3CUUtV2P3U3R7j9bd00XER71hchgmqUO8n9w3qVgi0yJcMgMPZ9eYCy7vssINI6dawJV
 87vm1g2gY6kcTjtD2cS0nJ5f8kt6dX8aUoKwjAMplhPa2L4WFlvE4ZM/8nYxxGKo8r1e
 V1Hg==
X-Gm-Message-State: AC+VfDw1Cx4SWiveeHFoHlmNuqj4ET1NJ1EO9jOnY6jAlmzo3LIIWnk5
 xKzMOGj5HkUoEpai6RkJiFHOnaE1gCAIGWg8Hvyt9P/R5hggXZ7hkqrSeUnj2OogEVoDwQxdFYE
 pJKDtWPx5ixNgRVQ=
X-Received: by 2002:adf:e90f:0:b0:2fc:b3be:7436 with SMTP id
 f15-20020adfe90f000000b002fcb3be7436mr406935wrm.25.1682578861550; 
 Thu, 27 Apr 2023 00:01:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6NsFg/v2vufJp8tEhU73tavxXoldbyc25TSejLfPS8zvq9QV/rj3/VNvr8YkNpjGe26WfnXQ==
X-Received: by 2002:adf:e90f:0:b0:2fc:b3be:7436 with SMTP id
 f15-20020adfe90f000000b002fcb3be7436mr406903wrm.25.1682578861160; 
 Thu, 27 Apr 2023 00:01:01 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 t15-20020adfe10f000000b00304832cd960sm7751355wrz.10.2023.04.27.00.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 00:01:00 -0700 (PDT)
Message-ID: <f96890a3-0491-7fd7-3ce0-d4f873e64f03@redhat.com>
Date: Thu, 27 Apr 2023 09:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v11 12/13] tests/qtest: Restrict tpm-tis-i2c-test to
 CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-13-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230426180013.14814-13-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/04/2023 20.00, Fabiano Rosas wrote:
> The test set -accel tcg, so restrict it to when TCG is present.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index cfc66ade6f..48cd35b5b2 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -213,7 +213,8 @@ qtests_aarch64 = \
>       ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
>     (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
> +  (config_all.has_key('CONFIG_TCG') and                                            \
> +   config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
>     ['arm-cpu-features',
>      'numa-test',
>      'boot-serial-test',

Reviewed-by: Thomas Huth <thuth@redhat.com>


