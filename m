Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3D675223
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 11:12:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIoNS-0007wB-EK; Fri, 20 Jan 2023 05:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIoNE-0007t8-I0
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:11:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIoNC-0007VQ-Gx
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 05:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674209509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=siKr8jsLQXRBtk6ijivgWUhEYt1K6vWFUpEfft3epPA=;
 b=fcpxjdO931hwNezliHLXLaXt8HM/pmfl9MuzSIZAZQWa7Dv4QbXG/hsy74zj9VxyLWYdBd
 CkqIBijsnnKudzyN4aqQoEKbFrSyojjMtfMiM/5bY6/0xi/lFKwGeaYt1IOdL1mifMDZxq
 3kWgw0CEvT9wctOCj1AkTDyANyHBt84=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-149-By5_E-ODPCKWdsZIIsK34A-1; Fri, 20 Jan 2023 05:11:45 -0500
X-MC-Unique: By5_E-ODPCKWdsZIIsK34A-1
Received: by mail-qk1-f197.google.com with SMTP id
 y3-20020a05620a44c300b00709109448a3so1163178qkp.19
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 02:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=siKr8jsLQXRBtk6ijivgWUhEYt1K6vWFUpEfft3epPA=;
 b=GA5fZKMiXMBWz2bkiXR8J0YO1UM8ME34PDp3LF4jtZtgU0cKo9IKO8OWXjCzCIE9bJ
 mZwf0/VXh/dDwqcIhwLQYqt/rvEyEWUIrEJOh5070Gd94ocNurcGDJ1jbzuuXRNL/TWQ
 iYDOCyxgOBFGsoAhxW50sKON/kI2WnbjIpDBwfy21rUiFv0bHSWR5fAWOQadPt6OR8gt
 G4LzkMENXEEW4cTic8op2K74YEPZ557Sf1GFZBd+GkMPOY+Twm4GbIzdsC6nH6MYkIXe
 51e4uDy2cR1PW/Vg6UDBKHNt6rhY0jY7+MRDff/oFGh5Cm3ozi9L0jcHIRTgaPaFkfLy
 O78Q==
X-Gm-Message-State: AFqh2kpTrH3HNjfVY6tf/eHLsreaTUqho+kXIRLo+lI7PIg86CS8+qDA
 U+cChEI75eUN0XGjZAL4tSzvGBzEySUSoUJ/4DcGJSorPD3YEYqMy2YQyUB5nHFvpT2JYed+7tV
 hUQAv4Vb3dONjEMQ=
X-Received: by 2002:a05:6214:2f0e:b0:532:2112:69fc with SMTP id
 od14-20020a0562142f0e00b00532211269fcmr23913483qvb.0.1674209505120; 
 Fri, 20 Jan 2023 02:11:45 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtHVlu7ezuCpb7V1z2uz4TixfckUoIgKfcWWDN9BoS8G4x31p+6/9pqxo5x8Lhy5FrFT5CNvA==
X-Received: by 2002:a05:6214:2f0e:b0:532:2112:69fc with SMTP id
 od14-20020a0562142f0e00b00532211269fcmr23913461qvb.0.1674209504847; 
 Fri, 20 Jan 2023 02:11:44 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de.
 [109.43.177.118]) by smtp.gmail.com with ESMTPSA id
 bi26-20020a05620a319a00b00706a1551408sm6383741qkb.4.2023.01.20.02.11.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 02:11:44 -0800 (PST)
Message-ID: <0aaf43fc-d8d4-7e48-d71e-818d917fad59@redhat.com>
Date: Fri, 20 Jan 2023 11:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v4 04/15] tests/qtest: arm-cpu-features: Match tests
 to required accelerators
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
 <20230119135424.5417-5-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119135424.5417-5-farosas@suse.de>
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
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/qtest/arm-cpu-features.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 4ff2014bea..1555b0bab8 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -21,7 +21,7 @@
>   #define SVE_MAX_VQ 16
>   
>   #define MACHINE     "-machine virt,gic-version=max -accel tcg "
> -#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
> +#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
>   #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
>                       "  'arguments': { 'type': 'full', "
>   #define QUERY_TAIL  "}}"
> @@ -613,31 +613,39 @@ int main(int argc, char **argv)
>   {
>       g_test_init(&argc, &argv, NULL);
>   
> -    qtest_add_data_func("/arm/query-cpu-model-expansion",
> -                        NULL, test_query_cpu_model_expansion);
> +    if (qtest_has_accel("tcg")) {
> +        qtest_add_data_func("/arm/query-cpu-model-expansion",
> +                            NULL, test_query_cpu_model_expansion);
> +    }
> +
> +    if (!g_str_equal(qtest_get_arch(), "aarch64")) {
> +        goto out;
> +    }
>   
>       /*
>        * For now we only run KVM specific tests with AArch64 QEMU in
>        * order avoid attempting to run an AArch32 QEMU with KVM on
>        * AArch64 hosts. That won't work and isn't easy to detect.
>        */
> -    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
> +    if (qtest_has_accel("kvm")) {
>           /*
>            * This tests target the 'host' CPU type, so register it only if
>            * KVM is available.
>            */
>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>                               NULL, test_query_cpu_model_expansion_kvm);
> +
> +        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
> +                            NULL, sve_tests_sve_off_kvm);
>       }
>   
> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
> +    if (qtest_has_accel("tcg")) {
>           qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-max-vq-8",
>                               NULL, sve_tests_sve_max_vq_8);
>           qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
>                               NULL, sve_tests_sve_off);
> -        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
> -                            NULL, sve_tests_sve_off_kvm);
>       }
>   
> +out:
>       return g_test_run();
>   }

Acked-by: Thomas Huth <thuth@redhat.com>


