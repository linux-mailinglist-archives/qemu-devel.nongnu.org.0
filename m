Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DC267523E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:20:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIoUd-0003l4-Sr; Fri, 20 Jan 2023 05:19:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIoUZ-0003k9-Lq
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:19:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIoUX-00006h-4X
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674209963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ePz7yb+ojbQCubOzDz2TJWD5Tn+FWaHHy1W4HDqqSTM=;
 b=F24JcRbuEEvEY01aqBAOvoEIpg1rtLSfLj+w29mcDRgycLFw5Nfqp+zvj8G11U7sC0izgU
 qJSIsB9+K8iAnsle5UsAhY5IPSHds2DrvXjV63EW+t4SoTwd6GeVLvDtb8tGZMLPRzKh1p
 JSyw8xW76ImswgqjM5ryWGEd08DDKFY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-McGJiEVQMNyW6-5C-QrncQ-1; Fri, 20 Jan 2023 05:19:21 -0500
X-MC-Unique: McGJiEVQMNyW6-5C-QrncQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 k5-20020a05620a414500b00708ef47754eso3111566qko.13
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 02:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ePz7yb+ojbQCubOzDz2TJWD5Tn+FWaHHy1W4HDqqSTM=;
 b=fPVIPWSTgUHoUpZ4kkj753oBQm0tS740bwaG5nJcWtHoE9RgT1ZOyA+aWDHgFRIHaL
 CXG1eCypZliPd9M2gLNgpGxi5g+uo9i7US7vLcSFKD3z+ssEJtsybyqpxBLUHmY3kqMR
 1hcxborHZfJjv8E/T+qT/vk0pzpBlKslIwH7KJJfYO0M0evMlbMYi+20VduWnKjLA/cC
 lAGY8RDyIXcNgU55KwpudBH+xqKePZhUqUovEH8txvgxd0YV9Fk/6RP4Qq0nVOA99Q15
 qXLa/bxgemslWfM3w0b4wsaHF9Pxjp9R4MrS+ySLeYk3uEX/LwEM6XBuGu+zc+Di/sTe
 zRFw==
X-Gm-Message-State: AFqh2krMJ0b5C173AqcpNh/1ksQXR4XZ0KpmjMjIsCUZ4KLSEdeNOCbK
 tqvse+Gkmk7UzhjmNr6IEZoXMpW2tNGNX8aoygxfiCm63ok0NoFNIoTUSTsQnK93dxk+Eqz6aR1
 wVPphhrTLLs34GjI=
X-Received: by 2002:ad4:4c4d:0:b0:536:ba5e:6ac0 with SMTP id
 cs13-20020ad44c4d000000b00536ba5e6ac0mr1013353qvb.40.1674209961448; 
 Fri, 20 Jan 2023 02:19:21 -0800 (PST)
X-Google-Smtp-Source: AMrXdXupi0IQKd5YrskZjXMOyf0kWioNWY25zah9stKJEDDKccjcnCVSA2T8AwAg3920hMMX+wPsog==
X-Received: by 2002:ad4:4c4d:0:b0:536:ba5e:6ac0 with SMTP id
 cs13-20020ad44c4d000000b00536ba5e6ac0mr1013338qvb.40.1674209961240; 
 Fri, 20 Jan 2023 02:19:21 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 w22-20020a05620a149600b007090bb886a2sm1650203qkj.118.2023.01.20.02.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 02:19:19 -0800 (PST)
Message-ID: <a7701410-a612-d9d5-1a66-d71adeadf2b5@redhat.com>
Date: Fri, 20 Jan 2023 11:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v4 05/15] tests/qtest: Restrict
 tpm-tis-devices-{swtpm}-test to CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-6-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119135424.5417-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 19/01/2023 14.54, Fabiano Rosas wrote:
> These tests set -accel tcg, so restrict them to when TCG is present.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/meson.build | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 1af63f8bd2..9dd5c2de6e 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -204,8 +204,8 @@ qtests_arm = \
>   # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>   qtests_aarch64 = \
>     (cpu != 'arm' and unpack_edk2_blobs ? ['bios-tables-test'] : []) +                            \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
> +  (config_all_devices.has_key('CONFIG_TCG') and config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ?   \
> +    ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
>     (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
>     (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
>     ['arm-cpu-features',
> @@ -295,11 +295,15 @@ qtests = {
>     'tpm-crb-test': [io, tpmemu_files],
>     'tpm-tis-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>     'tpm-tis-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> -  'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> -  'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'],
>     'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
>   }
>   
> +if config_all_devices.has_key('CONFIG_TCG')
> +   qtests += { 'tpm-tis-device-swtpm-test': [io, tpmemu_files, 'tpm-tis-util.c'],
> +               'tpm-tis-device-test': [io, tpmemu_files, 'tpm-tis-util.c'], }
> +endif

Hmmm, I think the second hunk is maybe not necessary - it's just for 
declaring the dependencies, but not for adding the tests to the set that is 
run later.

  Thomas



