Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB3643C54C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 10:36:18 +0200 (CEST)
Received: from localhost ([::1]:59800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfePx-0003cg-NL
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 04:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mfeNp-0002t9-5c
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:34:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mfeNl-00076g-Md
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 04:34:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635323641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fY2BqtJSKgWWaHDEVtLtwpK8/xYkhlqfp+e1UZ7aB1M=;
 b=BTmckgBMG4cYtEBjmu3dVq0lvDNtHE6MxKFnsF8dudRz/VO5QAiddm3OsbEtrOi4dm+WCy
 XIaIjcWTbFtpP6PMhS9dMkJkkqXXqJfeRnySXWUe0ol1zDI4noRPaiL5+HWH2BgsP7vY4j
 5yV9OSqap7w0lJY/GrsKLlxCuR6jN3g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-_umg_fsVOEeIBXOvRngw0w-1; Wed, 27 Oct 2021 04:33:59 -0400
X-MC-Unique: _umg_fsVOEeIBXOvRngw0w-1
Received: by mail-wm1-f69.google.com with SMTP id
 k126-20020a1ca184000000b003231d0e329bso1834679wme.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 01:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fY2BqtJSKgWWaHDEVtLtwpK8/xYkhlqfp+e1UZ7aB1M=;
 b=Ofq976MzCmQkpqN7Qu7npkxS9747XIy9oF0EwWn2P5HQ6HM0FJ9meN1hL8wF1DyC38
 PPpLGGeWH5fhUlHfgeW1X7g+pL1KHCRtBpLQ7dEenQyZIoLdBXVcurYsOXecC1rQeQ3+
 yO+ZYRiw61C2WdXb5uJzqHxOheUFVab+jM+sn6205q9PfSWl3CDZ/5B42tiACMGkv9MN
 RZLlbnRxX6ly9Sy8gercofmJquK/jNa4u+GHPIupwRJ/3r6ZgHckl22Cuh0NNGeyroxj
 C326VMXY0lspZnDJxVBKkaTH8+ilGVkgz8F+6cTVJsIZcXU7LQYYVhoUHTmPB1/UtFxs
 qpaw==
X-Gm-Message-State: AOAM532ovGhmvRnhFIuViAFk8g9Iat3SZeZVXaLfXpyanbOhM8Zfa/Zb
 t1fxiZNB+W99wFnm2YnbSdLGXiFSoRSGYSOItY+6vnDRWHxEp/oMvFGKbH7B5qCJQjKW1grxzio
 UteUj83vRwFgLmEs=
X-Received: by 2002:adf:ec03:: with SMTP id x3mr31911448wrn.281.1635323638519; 
 Wed, 27 Oct 2021 01:33:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0hyw8luCsNX4T4FWyYrVEMc7uA67zG7rDwHrzKilFdF4EsYw8s3qP00aH0Au66xhTa7IrlA==
X-Received: by 2002:adf:ec03:: with SMTP id x3mr31911418wrn.281.1635323638264; 
 Wed, 27 Oct 2021 01:33:58 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207e:a543:72f:c4d1:8911:6346])
 by smtp.gmail.com with ESMTPSA id c17sm14541472wrv.22.2021.10.27.01.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 01:33:57 -0700 (PDT)
Date: Wed, 27 Oct 2021 04:33:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] qtest: fix 'expression is always false' build failure in
 qtest_has_accel()
Message-ID: <20211027042734-mutt-send-email-mst@kernel.org>
References: <20211027074542.2607865-1-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211027074542.2607865-1-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 27, 2021 at 03:45:42AM -0400, Igor Mammedov wrote:
> If KVM is disabled or not present, qtest library build
> may fail with:
>    libqtest.c: In function 'qtest_has_accel':
>       comparison of unsigned expression < 0 is always false
>       [-Werror=type-limits]
>          for (i = 0; i < ARRAY_SIZE(targets); i++) {
> 
> due to empty 'targets' array.
> Fix it by compiling KVM related part only if
> CONFIG_KVM_TARGETS is set.
> 
> Fixes: e741aff0f43343 ("tests: qtest: add qtest_has_accel() to check if tested binary supports accelerator")
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>


> ---
>  tests/qtest/libqtest.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 25aeea385b..9833e16f84 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -931,6 +931,7 @@ bool qtest_has_accel(const char *accel_name)
>          return false;
>  #endif
>      } else if (g_str_equal(accel_name, "kvm")) {
> +#if defined(CONFIG_KVM_TARGETS)

Ugh.
        const char *targets[] = { CONFIG_KVM_TARGETS };

are you use CONFIG_KVM_TARGETS is not defined?

Looks like it's defined, just empty.

which is not standard C BTW.

How about we just add an empty string in meson?

diff --git a/meson.build b/meson.build
index 2c5b53cbe2..ff85e9c2af 100644
--- a/meson.build
+++ b/meson.build
@@ -75,7 +75,7 @@ else
   kvm_targets = []
 endif
 
-kvm_targets_c = ''
+kvm_targets_c = '""'
 if not get_option('kvm').disabled() and targetos == 'linux'
   kvm_targets_c = '"' + '" ,"'.join(kvm_targets) + '"'
 endif



>          int i;
>          const char *arch = qtest_get_arch();
>          const char *targets[] = { CONFIG_KVM_TARGETS };
> @@ -942,6 +943,9 @@ bool qtest_has_accel(const char *accel_name)
>                  }
>              }
>          }
> +#else
> +        return false;
> +#endif
>      } else {
>          /* not implemented */
>          g_assert_not_reached();
> -- 
> 2.27.0


