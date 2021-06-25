Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204C3B4116
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 12:03:46 +0200 (CEST)
Received: from localhost ([::1]:59462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwigb-0000cw-Go
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 06:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwiDj-0001fy-4S
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lwiDg-0000rp-3S
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624613631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TN0/Mu3ou8A0HwhAUGyQuqtrXJ6OS3Q70e4VavGhVjE=;
 b=itITKXSkNodL/YzNU2TuLfpX+OdxGDZvN8MU7TYJeowqJ6tXsxPWl7flAew0SCRZVlPd4A
 zGlOpUp9Q669312rXwS3VKArAjPG573N2JGfiT/BAIrk121LaMBCNaT4z2KOT/TMb0LQzy
 NxXasvtXCJ6s3zmqWW1WSU0SqIWumkM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-YtwwN7v8NDiWUiFdj5EqUg-1; Fri, 25 Jun 2021 05:33:50 -0400
X-MC-Unique: YtwwN7v8NDiWUiFdj5EqUg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l6-20020a0560000226b029011a80413b4fso3270850wrz.23
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TN0/Mu3ou8A0HwhAUGyQuqtrXJ6OS3Q70e4VavGhVjE=;
 b=Y9Qe3N45ijo8WAdT9E4IWFBpLzwhVvd097JlfFES+PT8xkjPiKc7Gmnbmuy0lHFvqB
 9dxzD9ugMyNa4q57nuLZSXAzOllDZMXeRwL5SqN+HM2nRezlaRNkZ1LCZxijCeIp9L59
 7qB+u5nzgnCWmTh3dm1/NkyyvUanpZF86aFrw0jT3+datvhyoR8WlQUv12wIkydR7TRZ
 vIiUqYxKdIWqaZ7LtaY/JeTBLjhpVKlw4ZGJSIRsp+/mFq/CFlDv7Eh1MxkJ///al5/T
 Rke0QAM9at2AFpxPt9cebf6OdoNkq125Js1VocZaDtkAbROYqjSs+uvtY+cpGxJXWoJN
 iwjQ==
X-Gm-Message-State: AOAM531vpaDC4nZVnTasUvWoMjPpLSymy12WXeL+JGcz1x/joOt/A3li
 NLvlkuAQFAvns2tInZPH9DNxW5ZABNt9IGO2H4zGM7wyDxT80zvkfcvCgjkD7/3rpwoMZzpogij
 nJ2ytuybsecotJRg=
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr9719108wro.231.1624613629112; 
 Fri, 25 Jun 2021 02:33:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8vdz30YglUYsMrwV6HJzfx20XopGLJGKzeNc9IuJ95O2Al5VNhTVvdNUIWuM1PIspv0EQjQ==
X-Received: by 2002:adf:ed4a:: with SMTP id u10mr9719079wro.231.1624613628846; 
 Fri, 25 Jun 2021 02:33:48 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id d15sm5652938wrb.42.2021.06.25.02.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 02:33:48 -0700 (PDT)
Subject: Re: [PATCH 02/53] tests: qtest: add qtest_has_accel() to check if
 tested binary supports accelerator
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210625091818.1047980-1-imammedo@redhat.com>
 <20210625091818.1047980-3-imammedo@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8d82ef6f-e846-a1ef-6cad-3e9665532bbd@redhat.com>
Date: Fri, 25 Jun 2021 11:33:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625091818.1047980-3-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/25/21 11:17 AM, Igor Mammedov wrote:
> Currently it is not possible to create tests that have KVM as a hard
> requirement on a host that doesn't support KVM for tested target
> binary (modulo going through the trouble of compiling out
> the offending test case).
> 
> Following scenario makes test fail when it's run on non x86 host:
>   qemu-system-x86_64 -enable-kvm -M q35,kernel-irqchip=on -smp 1,maxcpus=288
> 
> This patch introduces qtest_has_accel() to let users check if accel is
> available in advance and avoid executing non run-able test-cases.
> 
> It implements detection of TCG and KVM only, the rest could be
> added later on, when we actually start testing them in qtest.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> PS:
> There is an alternative 'runtime' approach on list:
> 'query-accels' series.
> https://patchwork.kernel.org/project/qemu-devel/patch/20210503211020.894589-4-philmd@redhat.com/
> 
> on upside this impl. much cheaper to execute than the 'query-accels'
> as it doesn't need to run QEMU for probing.
> 
> v4:
>   - s/qtest_has_kvm/qtest_has_accel/
>   - add TCG detection (based on --disable-tcg)
> v3:
>   - make it work with --disable-kvm
>        (Claudio Fontana <cfontana@suse.de>)
> v2:
>   - fix access() check.
>      s/access()/!access()/
>   - format C array items at meson.build time
> 
> CC: thuth@redhat.com
> CC: lvivier@redhat.com
> CC: f4bug@amsat.org
> ---
>  tests/qtest/libqos/libqtest.h |  8 ++++++++
>  meson.build                   |  6 ++++++
>  tests/qtest/libqtest.c        | 27 +++++++++++++++++++++++++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
> index a68dcd79d4..59e9271195 100644
> --- a/tests/qtest/libqos/libqtest.h
> +++ b/tests/qtest/libqos/libqtest.h
> @@ -588,6 +588,14 @@ bool qtest_big_endian(QTestState *s);
>   */
>  const char *qtest_get_arch(void);
>  
> +/**
> + * qtest_has_accel:
> + * @accel_name: Accelerator name to check for.
> + *
> + * Returns: true if the accelerator is built in.
> + */
> +bool qtest_has_accel(const char *accel_name);
> +
>  /**
>   * qtest_add_func:
>   * @str: Test case path.
> diff --git a/meson.build b/meson.build
> index d8a92666fb..7eeb201179 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -76,6 +76,12 @@ else
>    kvm_targets = []
>  endif
>  
> +kvm_targets_c = ''
> +if not get_option('kvm').disabled() and targetos == 'linux'
> +  kvm_targets_c = '"' + '" ,"'.join(kvm_targets) + '"'
> +endif
> +config_host_data.set('CONFIG_KVM_TARGETS', kvm_targets_c)
> +
>  accelerator_targets = { 'CONFIG_KVM': kvm_targets }
>  if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
>    # i368 emulator provides xenpv machine type for multiple architectures
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 825b13a44c..643769e416 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -920,6 +920,33 @@ const char *qtest_get_arch(void)
>      return end + 1;
>  }
>  
> +bool qtest_has_accel(const char *accel_name)
> +{
> +    if (g_str_equal(accel_name, "tcg")) {
> +#if defined(CONFIG_TCG)

The point of the "alternative 'runtime' approach" was to remove
access to accel-specific definitions in tests/ and you are
adding yet another one :( Maybe now it is acceptable, I am not
sure since I haven't followed the latest accelerator modularization
effort series. So I'll defer that to the active developers doing
it.

> +        return true;
> +#else
> +        return false;
> +#endif
> +    } else if (g_str_equal(accel_name, "kvm")) {
> +        int i;
> +        const char *arch = qtest_get_arch();
> +        const char *targets[] = { CONFIG_KVM_TARGETS };
> +
> +        for (i = 0; i < ARRAY_SIZE(targets); i++) {
> +            if (!strncmp(targets[i], arch, strlen(arch))) {
> +                if (!access("/dev/kvm", R_OK | W_OK)) {
> +                    return true;
> +                }
> +            }
> +        }
> +    } else {
> +        /* not implemented */
> +        g_assert_not_reached();
> +    }
> +    return false;
> +}
> +
>  bool qtest_get_irq(QTestState *s, int num)
>  {
>      /* dummy operation in order to make sure irq is up to date */
> 


