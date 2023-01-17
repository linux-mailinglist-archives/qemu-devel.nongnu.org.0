Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A89966E0CE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 15:34:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHn29-0000eE-E2; Tue, 17 Jan 2023 09:33:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pHn20-0000aL-Ok
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:33:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pHn1x-0003oo-PP
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 09:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673966005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u0t1n5svpHol5zxgdc8vfDOVHhQhYh+lhsK+P5HXtpI=;
 b=EBcW861vU/dqODIYAZSaq2GjHHwAzXcTKbSUhQUkABBvhHksBZ7f6pI9CloLiIRdU4/nWx
 obPbAtApjIV31sXEZh071JNg8J5tzxOCbGmW/K/dNQH63/8eWqSBKegzb/guQo60ta1Ize
 fidsnBY79syhGRN1U3C5vZKV9nBn9V8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-MUcXswjGMnyWw6QhfCBy6w-1; Tue, 17 Jan 2023 09:33:00 -0500
X-MC-Unique: MUcXswjGMnyWw6QhfCBy6w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DB681C29D5F;
 Tue, 17 Jan 2023 14:32:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3D471121315;
 Tue, 17 Jan 2023 14:32:20 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Alexander Graf <agraf@csgraf.de>, Thomas Huth <thuth@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>
Subject: Re: [RFC PATCH v3 21/28] tests/qtest: Skip tests that depend on TCG
 when CONFIG_TCG=n
In-Reply-To: <20230113140419.4013-22-farosas@suse.de>
Organization: Red Hat GmbH
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-22-farosas@suse.de>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 17 Jan 2023 15:32:18 +0100
Message-ID: <87ilh58c5p.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Jan 13 2023, Fabiano Rosas <farosas@suse.de> wrote:

> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  tests/qtest/arm-cpu-features.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
> index 4be1415823..9a052e41fc 100644
> --- a/tests/qtest/arm-cpu-features.c
> +++ b/tests/qtest/arm-cpu-features.c
> @@ -217,6 +217,15 @@ static void assert_bad_props(QTestState *qts, const char *cpu_type)
>      qobject_unref(resp);
>  }
>  
> +static bool tcg_disabled(void)
> +{
> +#ifndef CONFIG_TCG
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
>  static uint64_t resp_get_sve_vls(QDict *resp)
>  {
>      QDict *props;
> @@ -338,6 +347,11 @@ static void sve_tests_sve_max_vq_8(const void *data)
>  {
>      QTestState *qts;
>  
> +    if (tcg_disabled()) {
> +        g_test_skip("TCG support disabled in this build");
> +        return;
> +    }
> +
>      qts = qtest_init(MACHINE "-cpu max,sve-max-vq=8");
>  
>      assert_sve_vls(qts, "max", BIT_ULL(8) - 1, NULL);
> @@ -373,6 +387,11 @@ static void sve_tests_sve_off(const void *data)
>  {
>      QTestState *qts;
>  
> +    if (tcg_disabled()) {
> +        g_test_skip("TCG support is disabled in this build");
> +        return;
> +    }
> +
>      qts = qtest_init(MACHINE "-cpu max,sve=off");
>  
>      /* SVE is off, so the map should be empty. */

I'm wondering whether the invocation of tcg and kvm test cases should be
reorganized a bit. Currently, we have test cases that use MACHINE (tcg),
and test cases that use MACHINE_KVM (kvm with a fallback to
tcg). MACHINE_KVM is used either for aarch64 && kvm
(test_query_cpu_model_expansion_kvm, which tests behaviour specific to
kvm), or for aarch64 (sve_tests_sve_off_kvm, which tests behaviour that
is the same for both kvm and tcg, and therefore tests tcg twice if kvm
is not available.)

So, should we
- drop "-accel tcg" from MACHINE_KVM,
- call sve_tests_sve_off_kvm only if kvm is available, and
- call the functions you skip here conditionally on tcg being available
  instead? (not sure whether not calling should be preferred to skipping
  in general)

> @@ -429,6 +448,11 @@ static void test_query_cpu_model_expansion(const void *data)
>  {
>      QTestState *qts;
>  
> +    if (tcg_disabled()) {
> +        g_test_skip("TCG support disabled in this build");
> +        return;
> +    }
> +
>      qts = qtest_init(MACHINE "-cpu max");
>  
>      /* Test common query-cpu-model-expansion input validation */


