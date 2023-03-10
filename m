Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B587B6B3BBB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:09:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZgD-0007AO-OI; Fri, 10 Mar 2023 05:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1paZgA-000777-IJ
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:08:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1paZg8-00078H-Bn
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678442925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RUpaRZtvDE6dumiX9MCrj7jilPejIULl9NYGQmI8ieI=;
 b=TpVQc20sEptVwtrMpJoH2faEF3MMm7kVbxmaXxhsFO0c3k1jupnh3F17QUAi3YEE8GDAXb
 BAoQ9MWKJWldIvugLNCSRAqfyJ0YbjmDnNiaH8Y3xE7ic8ixXV1qnSJ7PpJDU/5GZV5u2E
 GgLvqjQd9nxxwDpLrxEhA27zHehp8aE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-ErmspO1YNf6H0ByK0OBurg-1; Fri, 10 Mar 2023 05:08:44 -0500
X-MC-Unique: ErmspO1YNf6H0ByK0OBurg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z6-20020a7bc7c6000000b003e0107732f4so1616182wmk.1
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:08:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678442923;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RUpaRZtvDE6dumiX9MCrj7jilPejIULl9NYGQmI8ieI=;
 b=1k5o6QmGDQeRRF33IZTe8a4tbFbdLatk2piqkYHgdX4sR+yAYGSlym7H3Fj4zfe6fI
 /R9/xR1z5QnMc/uXR9mkZyobWpt2L16k2uNOU7OTRe4XRlyZWpGSig+yeg2ev8Dxl5G0
 RcFTjJvN1inoRlYpmthAjTtqbhWPD4DNDbM2EVLKNrs1jYNIyZyUGCe4mSx/JBz+azcE
 xU3pM72ep7oPf72xbRFX738I3DIbOTyq/lagJTL5WiG/vdb7BuHHJvpCcigr8oG7ZloW
 uWiPVneDGa/Sqgc2lKsfrlRiw5ChBVn0mvpwmacbVx6IWBsAmKjyKDORdRKQEcu7wzxX
 vIWw==
X-Gm-Message-State: AO0yUKUW+e4x97MYIPKZcnCU+vFiLKhikn5e55CKXtpaZCeT1SRk5NBE
 P74C5TdOkI5Qa1dUlamEG4R7jDcbEkaULmZt4sAm1R/Eg6SeSRR7cHb0vBVEs6VB8qfJCUYCYoZ
 jTm6DQ/fCWjMatHk=
X-Received: by 2002:a05:600c:4f08:b0:3ea:e554:7815 with SMTP id
 l8-20020a05600c4f0800b003eae5547815mr2083803wmq.9.1678442923408; 
 Fri, 10 Mar 2023 02:08:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9tJE72mdXDl5CYACvCp4TeUWur23s/IzN4XBi+188TG1QpPmZT7WHUeLFw5D1Zk+lt+DFYEA==
X-Received: by 2002:a05:600c:4f08:b0:3ea:e554:7815 with SMTP id
 l8-20020a05600c4f0800b003eae5547815mr2083767wmq.9.1678442923057; 
 Fri, 10 Mar 2023 02:08:43 -0800 (PST)
Received: from redhat.com ([2.52.9.88]) by smtp.gmail.com with ESMTPSA id
 l11-20020a05600c2ccb00b003e0015c8618sm2789642wmc.6.2023.03.10.02.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:08:42 -0800 (PST)
Date: Fri, 10 Mar 2023 05:08:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v8 08/11] tests/qtest: Fix tests when no KVM or TCG are
 present
Message-ID: <20230310050550-mutt-send-email-mst@kernel.org>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-9-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309201434.10831-9-farosas@suse.de>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Thu, Mar 09, 2023 at 05:14:31PM -0300, Fabiano Rosas wrote:
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
> Make sure that calls to qtest_has_accel are placed after g_test_init
> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
> printed before other messages") to avoid TAP parsing errors.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Juan Quintela <quintela@redhat.com>

I don't like it that we are hard-coding the list of accelerators
like this. Make a wrapper?

> ---
> This currently affects Arm, but will also affect x86 after the xenpvh
> series gets merged. This patch fixes both scenarios.
> ---
>  tests/qtest/bios-tables-test.c | 10 ++++++++--
>  tests/qtest/boot-serial-test.c | 10 ++++++++++
>  tests/qtest/migration-test.c   |  9 ++++++++-
>  tests/qtest/pxe-test.c         |  7 ++++++-
>  tests/qtest/vmgenid-test.c     |  8 ++++++--
>  5 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index d29a4e47af..5cbad2f29f 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2109,8 +2109,7 @@ static void test_acpi_virt_oem_fields(void)
>  int main(int argc, char *argv[])
>  {
>      const char *arch = qtest_get_arch();
> -    const bool has_kvm = qtest_has_accel("kvm");
> -    const bool has_tcg = qtest_has_accel("tcg");
> +    bool has_kvm, has_tcg;
>      char *v_env = getenv("V");
>      int ret;
>  
> @@ -2120,6 +2119,13 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +

why are you moving these? init at declaration time is
generally cleaner.

> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
> +
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          ret = boot_sector_init(disk);
>          if (ret) {
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3aef3a97a9..406b4421cc 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -17,6 +17,9 @@
>  #include "libqtest.h"
>  #include "libqos/libqos-spapr.h"
>  
> +static bool has_tcg;
> +static bool has_kvm;
> +
>  static const uint8_t bios_avr[] = {
>      0x88, 0xe0,             /* ldi r24, 0x08   */
>      0x80, 0x93, 0xc1, 0x00, /* sts 0x00C1, r24 ; Enable tx */
> @@ -287,6 +290,13 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    has_tcg = qtest_has_accel("tcg");
> +    has_kvm = qtest_has_accel("kvm");
> +

and here why do we need them global?

> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
> +
>      for (i = 0; tests[i].arch != NULL; i++) {
>          if (g_str_equal(arch, tests[i].arch) &&
>              qtest_has_machine(tests[i].machine)) {
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index d4ab3934ed..7eedee7b2d 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2459,7 +2459,7 @@ static bool kvm_dirty_ring_supported(void)
>  
>  int main(int argc, char **argv)
>  {
> -    const bool has_kvm = qtest_has_accel("kvm");
> +    bool has_kvm, has_tcg;
>      const bool has_uffd = ufd_version_check();
>      const char *arch = qtest_get_arch();
>      g_autoptr(GError) err = NULL;
> @@ -2467,6 +2467,13 @@ int main(int argc, char **argv)
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +

same. why the move?

> +    if (!has_tcg && !has_kvm) {
> +        return 0;
> +    }
> +
>      /*
>       * On ppc64, the test only works with kvm-hv, but not with kvm-pr and TCG
>       * is touchy due to race conditions on dirty bits (especially on PPC for
> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
> index 62b6eef464..935b661dac 100644
> --- a/tests/qtest/pxe-test.c
> +++ b/tests/qtest/pxe-test.c
> @@ -131,11 +131,16 @@ int main(int argc, char *argv[])
>      int ret;
>      const char *arch = qtest_get_arch();
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        return 0;
> +    }
> +
>      ret = boot_sector_init(disk);
>      if(ret)
>          return ret;
>  
> -    g_test_init(&argc, &argv, NULL);
>  
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          test_batch(x86_tests, false);
> diff --git a/tests/qtest/vmgenid-test.c b/tests/qtest/vmgenid-test.c
> index efba76e716..9eb6371ae8 100644
> --- a/tests/qtest/vmgenid-test.c
> +++ b/tests/qtest/vmgenid-test.c
> @@ -165,13 +165,17 @@ int main(int argc, char **argv)
>  {
>      int ret;
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        return 0;
> +    }
> +
>      ret = boot_sector_init(disk);
>      if (ret) {
>          return ret;
>      }
>  
> -    g_test_init(&argc, &argv, NULL);
> -
>      qtest_add_func("/vmgenid/vmgenid/set-guid",
>                     vmgenid_set_guid_test);
>      qtest_add_func("/vmgenid/vmgenid/set-guid-auto",
> -- 
> 2.35.3


