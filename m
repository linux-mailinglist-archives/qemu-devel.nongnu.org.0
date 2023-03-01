Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8E16A6CD8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 14:07:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXM97-0006l4-Nw; Wed, 01 Mar 2023 08:05:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXM8l-0006fH-O3
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:05:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXM8j-0007Wm-P7
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 08:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677675900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hEr7S2tY3CSG53qLQG3ftobebPDE/si7g0Pdjw1Wlss=;
 b=HpDihHhmMP76bHscrfIOihErh2vk7e5UV39mX6fVVjzyJ/87qTYIPy1umckAf6KA0iuiqn
 cVVBeIJM5uNgInxVKO0fHOS5coR8rpcZJUoSr7KwNx+k3ss96JRPWu5h0Hom5vyAzFMup0
 ktXIMK7fubc9mo7yRWGXxUeFbj785SE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-396-n-JOIR11OyWTZ5at5IT-3g-1; Wed, 01 Mar 2023 08:04:59 -0500
X-MC-Unique: n-JOIR11OyWTZ5at5IT-3g-1
Received: by mail-wm1-f69.google.com with SMTP id
 f14-20020a7bcc0e000000b003dd41ad974bso5311680wmh.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 05:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hEr7S2tY3CSG53qLQG3ftobebPDE/si7g0Pdjw1Wlss=;
 b=0UZ9Y4kaElKsNyXTLU+GUJsR3aRU3QLbKzslU3VZ/tsMtxtqykbQZV0W1sSXtWtRff
 NI+TJPqGyBL3IdyA53MyK0Ef4dFjjtZ9s7rwh1Qzyf1KzpbB3NATGyQbKtmaM0ePCNXi
 0vrnT9cvhAygk3AwpmGSwESv62+dmX9SlFjuLgvN/WqBG+T1lJ+ZK9kJLWQCauxBWqfY
 5v+1YFaTJ8htycOrcWePsGyUs3L+1LyWsWBZEiNXadbbF+gC5Jv6Obj3+bqVv3x1HHeq
 87tzTqUxv0y4yV2zFH2WIH3Jhru4REk2j98MM/c2v5B6dmREw8G3+kWIQ3Od5VX8VHvJ
 8Rmw==
X-Gm-Message-State: AO0yUKVWL7iPsQxl9tlX00hwsIGVejdpmmV73qcod3gyOFIbgcYLmnA5
 Jid4SGJ87rAM2vZuqd27g8deHWuac1eUYjCmuAOQcqUYdcSYmzlDNOb6SMxDgBzVKXowNPpjPC6
 3BAzp618sqQcI+Ts=
X-Received: by 2002:a05:600c:16c4:b0:3db:15b1:fb28 with SMTP id
 l4-20020a05600c16c400b003db15b1fb28mr5509763wmn.19.1677675897567; 
 Wed, 01 Mar 2023 05:04:57 -0800 (PST)
X-Google-Smtp-Source: AK7set986GWIXLee7mUK4jwL+8uqD9BbEVlRgagCYFx9+h5juKnNMFIc/3CqlrXlE/E0mxdwmrz2jQ==
X-Received: by 2002:a05:600c:16c4:b0:3db:15b1:fb28 with SMTP id
 l4-20020a05600c16c400b003db15b1fb28mr5509725wmn.19.1677675897231; 
 Wed, 01 Mar 2023 05:04:57 -0800 (PST)
Received: from [192.168.8.101] (tmo-122-219.customers.d1-online.com.
 [80.187.122.219]) by smtp.gmail.com with ESMTPSA id
 n7-20020a5d4c47000000b002c5534db60bsm12497005wrt.71.2023.03.01.05.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 05:04:56 -0800 (PST)
Message-ID: <11be1f6c-2fc3-f6cd-bbf6-c6bdd790dec8@redhat.com>
Date: Wed, 1 Mar 2023 14:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v7 9/9] tests/qtest: Fix tests when no KVM or TCG
 are present
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Laurent Vivier <lvivier@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230228192628.26140-1-farosas@suse.de>
 <20230228192628.26140-10-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230228192628.26140-10-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 28/02/2023 20.26, Fabiano Rosas wrote:
> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.
> 
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
> 
> Fix tests that crash or hang in the above scenario. Do not include any
> test cases if TCG and KVM are missing.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
...
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3aef3a97a9..45490f5931 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -17,6 +17,9 @@
>   #include "libqtest.h"
>   #include "libqos/libqos-spapr.h"
>   
> +static bool has_tcg;
> +static bool has_kvm;

Any special reason for putting these here instead of making them local 
variables in the main() function?

>   static const uint8_t bios_avr[] = {
>       0x88, 0xe0,             /* ldi r24, 0x08   */
>       0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
> @@ -285,6 +288,13 @@ int main(int argc, char *argv[])
>       const char *arch = qtest_get_arch();
>       int i;
>   
> +    has_tcg = qtest_has_accel("tcg");
> +    has_kvm = qtest_has_accel("kvm");
> +
> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
> +
>       g_test_init(&argc, &argv, NULL);

Could you please put the new code below the g_test_init() ?
Just to avoid the problem that has been reported here:

  https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg08331.html

  Thanks,
   Thomas


>       for (i = 0; tests[i].arch != NULL; i++) {
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 109bc8e7b1..a6e3ca9f7d 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2460,11 +2460,16 @@ static bool kvm_dirty_ring_supported(void)
>   int main(int argc, char **argv)
>   {
>       const bool has_kvm = qtest_has_accel("kvm");
> +    const bool has_tcg = qtest_has_accel("tcg");
>       const bool has_uffd = ufd_version_check();
>       const char *arch = qtest_get_arch();
>       g_autoptr(GError) err = NULL;
>       int ret;
>   
> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
> +
>       g_test_init(&argc, &argv, NULL);
>   
>       /*
> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
> index 62b6eef464..05575f7687 100644
> --- a/tests/qtest/pxe-test.c
> +++ b/tests/qtest/pxe-test.c
> @@ -130,6 +130,12 @@ int main(int argc, char *argv[])
>   {
>       int ret;
>       const char *arch = qtest_get_arch();
> +    bool has_tcg = qtest_has_accel("tcg");
> +    bool has_kvm = qtest_has_accel("kvm");
> +
> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
>   
>       ret = boot_sector_init(disk);
>       if(ret)
> diff --git a/tests/qtest/vmgenid-test.c b/tests/qtest/vmgenid-test.c
> index efba76e716..8045d3d706 100644
> --- a/tests/qtest/vmgenid-test.c
> +++ b/tests/qtest/vmgenid-test.c
> @@ -164,6 +164,12 @@ static void vmgenid_query_monitor_test(void)
>   int main(int argc, char **argv)
>   {
>       int ret;
> +    bool has_tcg = qtest_has_accel("tcg");
> +    bool has_kvm = qtest_has_accel("kvm");
> +
> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
>   
>       ret = boot_sector_init(disk);
>       if (ret) {


