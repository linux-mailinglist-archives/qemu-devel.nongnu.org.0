Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38898338851
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:11:08 +0100 (CET)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKdp5-0001lR-87
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdk0-0004jh-P6
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:05:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKdjy-0002Zv-G0
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rFfbze+sTZ5lzSU5wFFhGjRmtZs2psUE0Wgnu1Uk/r4=;
 b=ccdifl0BKVneRuM+Bw87aNSY41gXJLce3N9FdOS1+zkr3GZ6Cj9wWFHoPfhH1Va//WN5Qx
 V2RbTfOsmBzOL4TF5D5npm9pgcaim59ls5UpvLCUi6/E5QtKDjR2se962ZOzsbZ4w/XgkT
 pltX9RMsICAMXR1GnnD6M2EohJlrRa0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-7_ROaCEyOtWq1UHbVE1hoA-1; Fri, 12 Mar 2021 04:05:46 -0500
X-MC-Unique: 7_ROaCEyOtWq1UHbVE1hoA-1
Received: by mail-wm1-f70.google.com with SMTP id c7so5084025wml.8
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:05:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rFfbze+sTZ5lzSU5wFFhGjRmtZs2psUE0Wgnu1Uk/r4=;
 b=Oc0xSTqkDwDl8vrGeL3LYodtshwG0dKNw2sDMEt+7kRWXW4EeErWlOsbl250dpzRea
 iYGfLopX9pfTV8q7FsaK+2e6pYCMVhtqtPoAu5XsRJBPrrLGKBG/B4j5wOHDCjgtJllY
 HacXAPDUB8Y6BJ2KJWZkGCr+l0IYMe1LBO1aacF/6r1vj1roTN5s7WLqmBHXUN2Rnd09
 gHlkOSts/fEbyUCmsSrJzCBUfiG1MYBpjUkzqgHOUguJCqPeyH+rVD5nws0wEdpLh01c
 7GwNCPBUhaktTT59hs8aT+dtobvTWQ+73laQZcZebeqwsRmlD+cVEs5yTRWngHk6bOY+
 I0yw==
X-Gm-Message-State: AOAM531Be5rnKoozS+Ku5uoNshgZUe3n7i46Q6ttNScdMq82eyLOcJxs
 5X1GVJY2yY6SQxHcm4Oqi03fgcoB0Q/Pl/vFvrs1DdYvbcomJO+8acuLQFq7CRmSyZGPtPGUqga
 IklDZ+Vd8GQANkGI=
X-Received: by 2002:a5d:4532:: with SMTP id j18mr12637538wra.239.1615539944604; 
 Fri, 12 Mar 2021 01:05:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfutWFQijhlDp0low9BHoDvXcTpYji0z7VHQuvF4FXfj0X5JkENJxOKMEPBxZoFgmGXrbnTA==
X-Received: by 2002:a5d:4532:: with SMTP id j18mr12637514wra.239.1615539944392; 
 Fri, 12 Mar 2021 01:05:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id z7sm7134563wrt.70.2021.03.12.01.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:05:43 -0800 (PST)
Subject: Re: [PATCH 5/6] qtest/arm-cpu-features: Check TCG availability at
 runtime
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-6-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <dc9eb036-7b28-848e-30ae-3eb9ef150631@redhat.com>
Date: Fri, 12 Mar 2021 10:05:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210311231202.1536040-6-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 00:12, Philippe Mathieu-Daudé wrote:
> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, skip these TCG specific tests
> when TCG is not built into the QEMU binary.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/arm-cpu-features.c | 23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 2b70104515d..7acdccd10ef 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -20,7 +20,7 @@
>    */
>   #define SVE_MAX_VQ 16
>   
> -#define MACHINE     "-machine virt,gic-version=max -accel tcg "
> +#define MACHINE_TCG "-machine virt,gic-version=max -accel tcg "
>   #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
>   #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
>                       "  'arguments': { 'type': 'full', "
> @@ -352,7 +352,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
>   {
>       QTestState *qts;
>   
> -    qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
> +    qts = qtest_init(MACHINE_TCG "-cpu max,sve-max-vq=8");
> +    if (!qtest_probe_accel(qts, "tcg")) {
> +        g_test_skip("TCG not available, skipping test");
> +        goto done;

... and likewise here probing seems unnecessary.

Paolo

> +    }
>   
>       assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
>   
> @@ -380,6 +384,7 @@ static void sve_tests_sve_max_vq_8(const void *data)
>       assert_sve_vls(qts, "max", 0xff, "{ 'sve256': true }");
>       assert_error(qts, "max", "cannot disable sve256", "{ 'sve256': false }");
>   
> +done:
>       qtest_quit(qts);
>   }
>   
> @@ -387,7 +392,11 @@ static void sve_tests_sve_off(const void *data)
>   {
>       QTestState *qts;
>   
> -    qts = qtest_init(MACHINE "-cpu max,sve=off");
> +    qts = qtest_init(MACHINE_TCG "-cpu max,sve=off");
> +    if (!qtest_probe_accel(qts, "tcg")) {
> +        g_test_skip("TCG not available, skipping test");
> +        goto done;
> +    }
>   
>       /* SVE is off, so the map should be empty. */
>       assert_sve_vls(qts, "max", 0, NULL);
> @@ -405,6 +414,7 @@ static void sve_tests_sve_off(const void *data)
>       assert_sve_vls(qts, "max", 0x3,
>                      "{ 'sve': true, 'sve128': true, 'sve256': true }");
>   
> +done:
>       qtest_quit(qts);
>   }
>   
> @@ -448,7 +458,11 @@ static void test_query_cpu_model_expansion(const void *data)
>   {
>       QTestState *qts;
>   
> -    qts = qtest_init(MACHINE "-cpu max");
> +    qts = qtest_init(MACHINE_TCG "-cpu max");
> +    if (!qtest_probe_accel(qts, "tcg")) {
> +        g_test_skip("TCG not available, skipping test");
> +        goto done;
> +    }
>   
>       /* Test common query-cpu-model-expansion input validation */
>       assert_type_full(qts);
> @@ -489,6 +503,7 @@ static void test_query_cpu_model_expansion(const void *data)
>                        "{ 'aarch64': false }");
>       }
>   
> +done:
>       qtest_quit(qts);
>   }
>   
> 


