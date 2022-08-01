Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF45586CE2
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 16:32:39 +0200 (CEST)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIWTG-00085K-Oc
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 10:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIWPy-0004Us-Tc
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:29:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIWPv-00042L-Bl
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 10:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659364149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P7cnFRUOoZB1ZeBqlipJe9/HRNZPVAeqk3Q4SWtXtdA=;
 b=dy+cGwsPDhYfI6eKw9I74pP4z8HtalEczVFEtbHuz11DBmpVoDwzRYihS83u47RK85arw+
 QvbUcQeYoKL0NUv+7WVC4lLVXoNe62E6HPyeCLWdMGrVx74TkVh+DcmaX5lVXMKh8LNlEy
 050Tn3DMfdn/VKYOSjliB4RLtpjW7tw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-9ROQmTN-Pb22ZsQiiR_jCQ-1; Mon, 01 Aug 2022 10:29:08 -0400
X-MC-Unique: 9ROQmTN-Pb22ZsQiiR_jCQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i64-20020a1c3b43000000b003a2fe4c345cso6577578wma.0
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 07:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P7cnFRUOoZB1ZeBqlipJe9/HRNZPVAeqk3Q4SWtXtdA=;
 b=dmbpeLtX4x3TrQWBmxAV17mbptmE6Zi0UI5GvnwK/n3+iZmUrbEsWmzNO9yEw/7NGf
 4Tipx3JNwTfEetGSk1tATUNH/liH8HB5FnmiA75zzZXK3uc28WbCq38h6RxXydwL/D2k
 BrNxBzaweXvN5PA1WSQtiekrP9pX4MG0Pb8C5lLCGLcjYTn9uxDV/DxsmCxwCU05HGe2
 990UaQwfwssz7QW7nzg+EXnTzlKkubs1+5OmwqYaUVkq5u478mka3CcbfzuVgBQLg358
 R7407YKx2gI1t+L4wwlqCzZQWgeatxxKa/5C6KlHQIIt38kjri90pOmM+n+bd5EtjG/8
 W+LQ==
X-Gm-Message-State: ACgBeo2yettxmsDVJLSuL3hSSekiaWJcPRhXSvTYc2lbaOchrJ3ZJqj6
 NDS/0CAxhVImmDeXeH+eJ9GNKLU6pOckmGxC71GzK5AgNZKGK6wJ8PgKERsivri1J9yUDUXBb3p
 qXVYYFDfxv0s/B1k=
X-Received: by 2002:a5d:5584:0:b0:220:6c21:2fbf with SMTP id
 i4-20020a5d5584000000b002206c212fbfmr662349wrv.320.1659364147718; 
 Mon, 01 Aug 2022 07:29:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR440uvUiaiY2PaMl6iP1D+nzv5+Qqa3AYvsx9q1RbjHpJ5LmDbbtDdzg5TwdRe1cupqtA740w==
X-Received: by 2002:a5d:5584:0:b0:220:6c21:2fbf with SMTP id
 i4-20020a5d5584000000b002206c212fbfmr662333wrv.320.1659364147480; 
 Mon, 01 Aug 2022 07:29:07 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k19-20020a05600c1c9300b003a31fd05e0fsm30060875wms.2.2022.08.01.07.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 07:29:06 -0700 (PDT)
Date: Mon, 1 Aug 2022 15:29:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Hyman Huang <huangy81@chinatelecom.cn>, peterx@redhat.com
Subject: Re: [PATCH] tests/qtest/migration-test: Run the dirty ring tests
 only with the x86 target
Message-ID: <YufjMQXrtFgU+BqY@work-vm>
References: <20220801114644.208197-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801114644.208197-1-thuth@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Thomas Huth (thuth@redhat.com) wrote:
> kvm_dirty_ring_supported() only checks whether the dirty ring support
> is available on the x86 host, but it ignores whether the target QEMU
> architecture is x86 or not. Thus the test_vcpu_dirty_limit() test
> currently fails with the assert((strcmp(arch, "x86_64") == 0)) statement
> in dirtylimit_start_vm() if the users run e.g. "make check-qtest-aarch64"
> on their x86 host. Fix it by only executing the tests when we're running
> with a x86_64 target QEMU binary with KVM.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

I think that corresponds to a bug Juan mentioned where it was failing
with a i386 qemu as well.I guess there should be a more generic way!


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tests/qtest/migration-test.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 71595a74fd..f83360e0e0 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2439,6 +2439,7 @@ int main(int argc, char **argv)
>  {
>      char template[] = "/tmp/migration-test-XXXXXX";
>      const bool has_kvm = qtest_has_accel("kvm");
> +    const char *arch = qtest_get_arch();
>      int ret;
>  
>      g_test_init(&argc, &argv, NULL);
> @@ -2452,7 +2453,7 @@ int main(int argc, char **argv)
>       * is touchy due to race conditions on dirty bits (especially on PPC for
>       * some reason)
>       */
> -    if (g_str_equal(qtest_get_arch(), "ppc64") &&
> +    if (g_str_equal(arch, "ppc64") &&
>          (!has_kvm || access("/sys/module/kvm_hv", F_OK))) {
>          g_test_message("Skipping test: kvm_hv not available");
>          return g_test_run();
> @@ -2462,7 +2463,7 @@ int main(int argc, char **argv)
>       * Similar to ppc64, s390x seems to be touchy with TCG, so disable it
>       * there until the problems are resolved
>       */
> -    if (g_str_equal(qtest_get_arch(), "s390x") && !has_kvm) {
> +    if (g_str_equal(arch, "s390x") && !has_kvm) {
>          g_test_message("Skipping test: s390x host with KVM is required");
>          return g_test_run();
>      }
> @@ -2572,7 +2573,7 @@ int main(int argc, char **argv)
>  #endif /* CONFIG_TASN1 */
>  #endif /* CONFIG_GNUTLS */
>  
> -    if (kvm_dirty_ring_supported()) {
> +    if (g_str_equal(arch, "x86_64") && has_kvm && kvm_dirty_ring_supported()) {
>          qtest_add_func("/migration/dirty_ring",
>                         test_precopy_unix_dirty_ring);
>          qtest_add_func("/migration/vcpu_dirty_limit",
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


