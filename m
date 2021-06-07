Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3EA39DE10
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 15:50:48 +0200 (CEST)
Received: from localhost ([::1]:42908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqFeR-0001NC-Sh
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 09:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFcc-0008Po-BW
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:48:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lqFcV-0006MU-ML
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 09:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623073727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hIysnCtiHC2pVLiYlZTJxXOIkTU4pDX2O/mPtI6CF3w=;
 b=RM91GY6ICXvhIa2Gh/i8NqZBuirJnMhHmHcC9pp306XihLqgAEeV5SgN/VWSKS8eE82yqo
 fZpYYMA7q3YHs3lp06QrxqZb89oBKyuLcRJOSeqKGEzFUtvj6b8yM7DUv0KJ2S/SD+3ySO
 BNCS9mu1eFHpbSOu2wYsaUS5CXcqoJM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-mJ4MAgONN4-TSiD9_FBu8g-1; Mon, 07 Jun 2021 09:48:46 -0400
X-MC-Unique: mJ4MAgONN4-TSiD9_FBu8g-1
Received: by mail-wm1-f70.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso6821724wml.6
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 06:48:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hIysnCtiHC2pVLiYlZTJxXOIkTU4pDX2O/mPtI6CF3w=;
 b=mgmLuxaFiF/8FhafnCrY5hVBPym1Hm3XlEdscygqf78KzoXSx3PEmGyAM7+bLlgZdz
 8xBMY/VLmTft6qVhumZinUs3+O16aYt3RnAckWtoje4bN1Ia8ZrUOrRmR9Tbp/ev2ex3
 Gi/vR/wnidCikq65P9Fex/Im2vo70JHv9gcpnF7mc20lzy2x2xdlRuSUP7H/AmS0JJ+K
 ktxENhpEVPXYtJJykA6NMXN3oOqONIc6vHwjQ0WiPgEoEuB82Wp+lUr9g7uciRKnnbfh
 6Mf7uBMGouxk6wTNHpUYAM3UizP2CtzUGjJ4V6H6J3AasFKvUSL+krfFA9kjgYpCqXGi
 XAaA==
X-Gm-Message-State: AOAM531y2l8ixdg2rN6Fjs77OJJjctOQ1ixTaFkh1F4bgFHOs31b+Ol9
 LKXR8+JBpkEluH1J3J6lEqMVcEU0NM7jxv1+2WGcByqpTfzxC+G/ky6FhgjCb/SENymxsj09nPH
 ghtIFOOWP1W9SEu8=
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr16749243wmq.56.1623073724818; 
 Mon, 07 Jun 2021 06:48:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9Mf8AAprVI0pHkKsOFI/XFUxLGWuCfxRRUAeniyComMSLYh+LPpo9JWYSP+OB+TXKaf790g==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr16749227wmq.56.1623073724687; 
 Mon, 07 Jun 2021 06:48:44 -0700 (PDT)
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de.
 [217.87.87.121])
 by smtp.gmail.com with ESMTPSA id a4sm14775020wme.45.2021.06.07.06.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 06:48:44 -0700 (PDT)
Subject: Re: [PATCH v16 12/99] qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-13-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <63e38f3c-8c26-4acb-7576-7b954946c821@redhat.com>
Date: Mon, 7 Jun 2021 15:48:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-13-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
> 32-bit Arm hosts") we can remove the comment / check added in
> commit ab6b6a77774 and directly run the bios-tables-test.
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-13-philmd@redhat.com>
> ---
>   tests/qtest/meson.build | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index c3a223a83d..2c7415d616 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -176,14 +176,13 @@ qtests_arm = \
>      'boot-serial-test',
>      'hexloader-test']
>   
> -# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
>   qtests_aarch64 = \
> -  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
>     (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
>     ['arm-cpu-features',
>      'numa-test',
>      'boot-serial-test',
> +   'bios-tables-test',
>      'xlnx-can-test',
>      'migration-test']
>   
> 

Acked-by: Thomas Huth <thuth@redhat.com>


