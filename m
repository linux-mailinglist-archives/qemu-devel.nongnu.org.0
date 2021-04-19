Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAED363F91
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 12:28:10 +0200 (CEST)
Received: from localhost ([::1]:59182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYR8T-0001Ff-2T
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 06:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYR3g-0004UK-BA
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:23:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYR3d-0002Oo-8f
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618827788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nYq3QW1MDnJs5zq84qvaKW5Gk+t0mY7KCvLlo4OLNv8=;
 b=Qaq0ov8yOInYCuQ6kb1Wo7u2ZJbYozDpUOchoNwzZIYLZNORT7DzAWugBTf0ONu8mNWvOE
 2OKbi7rtqYvr4EO/+nvmqF+q+4YTEk0unyX/3LJlrhZPtOBB7shixwsQ/LovAQHUgrlXPh
 aHt1+ZyqPRcbBAJPAh/qWfkLp+lUNZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-mrzkgKsZNRSoihK2jtp7dw-1; Mon, 19 Apr 2021 06:23:06 -0400
X-MC-Unique: mrzkgKsZNRSoihK2jtp7dw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 461168030A0;
 Mon, 19 Apr 2021 10:23:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCD6760C5F;
 Mon, 19 Apr 2021 10:23:00 +0000 (UTC)
Subject: Re: [RFC v14 52/80] tests: device-introspect-test: cope with ARM
 TCG-only devices
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210416162824.25131-1-cfontana@suse.de>
 <20210416162824.25131-53-cfontana@suse.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <75c0236b-a8f1-c462-355b-945e509d90f5@redhat.com>
Date: Mon, 19 Apr 2021 12:22:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210416162824.25131-53-cfontana@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/04/2021 18.27, Claudio Fontana wrote:
> Skip the test_device_intro_concrete for now for ARM KVM-only build,
> as on ARM we currently build devices for ARM that are not
> compatible with a KVM-only build.
> 
> We can remove this workaround when we fix this in KConfig etc,
> and we only list and build machines that are compatible with KVM
> for KVM-only builds.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/qtest/device-introspect-test.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
> index bbec166dbc..1ff15e2247 100644
> --- a/tests/qtest/device-introspect-test.c
> +++ b/tests/qtest/device-introspect-test.c
> @@ -329,12 +329,30 @@ int main(int argc, char **argv)
>       qtest_add_func("device/introspect/none", test_device_intro_none);
>       qtest_add_func("device/introspect/abstract", test_device_intro_abstract);
>       qtest_add_func("device/introspect/abstract-interfaces", test_abstract_interfaces);
> +
> +    /*
> +     * XXX currently we build also boards for ARM that are incompatible with KVM.
> +     * We therefore need to check this explicitly, and only test virt for kvm-only
> +     * arm builds.
> +     * After we do the work of Kconfig etc to ensure that only KVM-compatible boards
> +     * are built for the kvm-only build, we could remove this.
> +     */
> +#ifndef CONFIG_TCG
> +    {
> +        const char *arch = qtest_get_arch();
> +        if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
> +            goto add_machine_test_done;
> +        }
> +    }
> +#endif /* !CONFIG_TCG */
>       if (g_test_quick()) {
>           qtest_add_data_func("device/introspect/concrete/defaults/none",
>                               g_strdup(common_args), test_device_intro_concrete);
>       } else {
>           qtest_cb_for_every_machine(add_machine_test_case, true);
>       }
> +    goto add_machine_test_done;

That last goto does not make much sense, since the label is right below.

  Thomas


> + add_machine_test_done:
>       return g_test_run();
>   }
> 


