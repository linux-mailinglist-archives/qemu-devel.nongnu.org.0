Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D367365F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 12:09:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISmg-0001ij-5D; Thu, 19 Jan 2023 06:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pISme-0001iL-9j
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:08:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pISmc-0000I1-IN
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 06:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674126517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJyY5SyRPd05rQpITcjmKdkYdCswBH9bA+C1ckXwwII=;
 b=Ut4Rc3KNBuTafGVUbcokp9puQaiVA2F+THTvSRCmF8asY5oBcseg9w6/079eKKKjpAA4Yd
 a8AYohkOPwLSReIWr5x5AxM43hY3ArqzIxCMjFnn9e/UpUzp9bk+yYgGBlfD+NBGmlF6nk
 7LqY8dDLcTU8leaOdCxb2NDJKZYCpDs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-504-aJfedeU1OKuEk_p1I3SF-Q-1; Thu, 19 Jan 2023 06:08:36 -0500
X-MC-Unique: aJfedeU1OKuEk_p1I3SF-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 fl5-20020a05600c0b8500b003db12112fdeso1033672wmb.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 03:08:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bJyY5SyRPd05rQpITcjmKdkYdCswBH9bA+C1ckXwwII=;
 b=EbSPTguw5l+lAhFdWuXrPtCzlRpeg/6CtolIMnjVU6I/PZwePF/2JzZczDHzsNv9E/
 2Av9pkig/227t6fcTgUZE2dSxZJmIO7rIqHrqda0fX3hN0IjNUqe5GvpHHCPHH6Lvnbh
 CAm5gruOZZ7IDtP0uQ/Wdb3Krke0sZdWVI4wONVLhJTs4oDVzdZeFyD5WSA6CbxEUOt4
 VeE45mroCh/7W7SUfJV55oO9GXsZMfDD6UOms+GNv2BtkU+s7vxwU+duC3NZgZVsY/uV
 2BEVs5u1SlP1pMOmqlcW39uWbqsLl9PLUud5Cxb4mzkCzdro1vEtKGpXT52r0s8TFCAj
 hAqQ==
X-Gm-Message-State: AFqh2koggcn8LxszEwBiauR981cbFS+EzwSqSfF7dAUgks3A95lvkPJ+
 JYKhEFeY7vgeT7R8AZa0Ra2I6EosikK6Yynqdkx/DSiWmJjY1TAZALjIYqSgaklgvStns83om4b
 MS1Pk6kVPk/a8h2k=
X-Received: by 2002:a5d:6288:0:b0:2bd:bc57:3c5b with SMTP id
 k8-20020a5d6288000000b002bdbc573c5bmr8037351wru.33.1674126515397; 
 Thu, 19 Jan 2023 03:08:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtl82TPm/pOc85y9tB8Kuo6Xr4Fv1S9sXn1oRt8ESw5lXt+Zhd0THat73+eL3HbWJpzvIGuzA==
X-Received: by 2002:a5d:6288:0:b0:2bd:bc57:3c5b with SMTP id
 k8-20020a5d6288000000b002bdbc573c5bmr8037336wru.33.1674126515177; 
 Thu, 19 Jan 2023 03:08:35 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 co22-20020a0560000a1600b002a01e64f7a1sm10108993wrb.88.2023.01.19.03.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 03:08:34 -0800 (PST)
Date: Thu, 19 Jan 2023 11:08:32 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org
Subject: Re: [PATCH 5/8] tests/qtest/migration-test: Only use available
 accelerators
Message-ID: <Y8kksKspvrbgHB9f@work-vm>
References: <20230119100537.5114-1-philmd@linaro.org>
 <20230119100537.5114-6-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230119100537.5114-6-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

* Philippe Mathieu-Daudé (philmd@linaro.org) wrote:
> For example, avoid when TCG is disabled:
> 
>   $ make check-qtest-aarch64
>   ...
>   20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
>   qemu-system-aarch64: -accel tcg: invalid accelerator tcg
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

With the ordering proviso of the previous patch,


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 36e6074653..1e7f1ea162 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -45,6 +45,8 @@
>  
>  unsigned start_address;
>  unsigned end_address;
> +static bool has_tcg;
> +static bool has_kvm;
>  static bool uffd_feature_thread_id;
>  
>  /*
> @@ -604,9 +606,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
>      got_stop = false;
>  
>      cmd_common = g_string_new("");
> -    g_string_append(cmd_common, "-accel tcg ");
> -    g_string_append_printf(cmd_common, "-accel kvm%s ",
> -                           args->use_dirty_ring ? ",dirty-ring-size=4096" : "");
> +    if (has_tcg) {
> +        g_string_append(cmd_common, "-accel tcg ");
> +    }
> +    if (has_kvm) {
> +        g_string_append_printf(cmd_common, "-accel kvm%s ",
> +                               args->use_dirty_ring
> +                               ? ",dirty-ring-size=4096" : "");
> +    }
>  
>      bootpath = g_strdup_printf("%s/bootsect", tmpfs);
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
> @@ -2458,12 +2465,14 @@ static bool kvm_dirty_ring_supported(void)
>  
>  int main(int argc, char **argv)
>  {
> -    const bool has_kvm = qtest_has_accel("kvm");
>      const bool has_uffd = ufd_version_check();
>      const char *arch = qtest_get_arch();
>      g_autoptr(GError) err = NULL;
>      int ret;
>  
> +    has_tcg = qtest_has_accel("tcg");
> +    has_kvm = qtest_has_accel("kvm");
> +
>      g_test_init(&argc, &argv, NULL);
>  
>      /*
> -- 
> 2.38.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


