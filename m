Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792CC6E967E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:00:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUpQ-0001fG-SK; Thu, 20 Apr 2023 10:00:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ppUpI-0001da-0T
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:59:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ppUpF-0006nq-UC
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 09:59:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681999192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYBR6Uft8trUDBfxK0nZ9GzxgII6V5rGa9d1il5RRwA=;
 b=I1l8hKK/nGUEiF1z3lMd/AGNAk9VetVXaErLKup9fmWgGDqHyAnUHDrSqO4saQhGa9fVJW
 8Anb77A7lt65aQ5qdpKToG6AJp6ad9I5YlOTJVtKCt2wU7mIXPqgD47jy4sRMPzsEdwZru
 ZNIwo0WHUwD+noee9F0aWIe6EFYud78=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-eThfMmkgN-qewwb9_pumbQ-1; Thu, 20 Apr 2023 09:59:51 -0400
X-MC-Unique: eThfMmkgN-qewwb9_pumbQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef6c09fa0dso4104286d6.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 06:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999190; x=1684591190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mYBR6Uft8trUDBfxK0nZ9GzxgII6V5rGa9d1il5RRwA=;
 b=eK2nyuI9Lkt3mrNYToh9A4VbrEm/HTPAe+yoSHM40YbIxF+k75CDrsFTfjPRlIAA3H
 eRy6ekXc07Lc/4lWk8QZqFNZbEqbRYu/8lBTFeP4yRb/qyCLHyOAKH9+ShYx8E9NViHT
 uau8llhpNhU84Jq5jLwHvZ/72JeRCWJQwjt2LIddYTWFqX6TqFato2wyqGrrO23dhUzZ
 VGTyZJxMgkVAhcZkL8CPjmw6rG7xJ3WUidh/m59NF0Of69bdiQUv1DhTY+zcBhXp+8rO
 HPzHxAlIwuIqycotn4Bk9kBEl6peNG331G79NOBB2pDhsD7KtlErQcw8TFZrPfPR+6UX
 eszA==
X-Gm-Message-State: AAQBX9dYxJCtSyIYICMLgK2tHunnhTsGXPLyP1ZhBOLKGOkIf+wZW1tf
 n5erPtIeYVgdzXlHCLS/0e3Q7EgPtAT0r9xdtY8KZiYfpM+T9Xi3VMcpNyhgaeL2opCcd9TVJit
 CgQbugFTHlOQi8Xk=
X-Received: by 2002:ad4:5c6e:0:b0:5a7:a434:c300 with SMTP id
 i14-20020ad45c6e000000b005a7a434c300mr2456999qvh.15.1681999190465; 
 Thu, 20 Apr 2023 06:59:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350YgzydJ9mG+p9qZSXzLaPSy+ftH0UIPIG/qufSdmoyFT4yp6VmwWtBFh6jxNMwLaJeI/LtvFg==
X-Received: by 2002:ad4:5c6e:0:b0:5a7:a434:c300 with SMTP id
 i14-20020ad45c6e000000b005a7a434c300mr2456950qvh.15.1681999190126; 
 Thu, 20 Apr 2023 06:59:50 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a0ca913000000b005ead964bfa2sm409010qva.127.2023.04.20.06.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 06:59:49 -0700 (PDT)
Date: Thu, 20 Apr 2023 15:59:43 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, Eduardo Habkost
 <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck
 <cohuck@redhat.com>, Juan Quintela <quintela@redhat.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v10 07/11] tests/qtest: Fix tests when no KVM or TCG are
 present
Message-ID: <20230420155943.0c081b50@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230412121829.14452-8-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
 <20230412121829.14452-8-farosas@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 12 Apr 2023 09:18:25 -0300
Fabiano Rosas <farosas@suse.de> wrote:

> It is possible to have a build with both TCG and KVM disabled due to
> Xen requiring the i386 and x86_64 binaries to be present in an aarch64
> host.
> 
> If we build with --disable-tcg on the aarch64 host, we will end-up
> with a QEMU binary (x86) that does not support TCG nor KVM.
> 
> Skip tests that crash or hang in the above scenario. Do not include
> any test cases if TCG and KVM are missing.
> 
> Make sure that calls to qtest_has_accel are placed after g_test_init
> in similar fashion to commit ae4b01b349 ("tests: Ensure TAP version is
> printed before other messages") to avoid TAP parsing errors.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> ---
>  tests/qtest/bios-tables-test.c | 11 +++++++++--
>  tests/qtest/boot-serial-test.c |  5 +++++
>  tests/qtest/migration-test.c   |  9 ++++++++-
>  tests/qtest/pxe-test.c         |  8 +++++++-
>  tests/qtest/vmgenid-test.c     |  9 +++++++--
>  5 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 8733589437..9c3642717d 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2082,8 +2082,7 @@ static void test_acpi_virt_oem_fields(void)
>  int main(int argc, char *argv[])
>  {
>      const char *arch = qtest_get_arch();
> -    const bool has_kvm = qtest_has_accel("kvm");
> -    const bool has_tcg = qtest_has_accel("tcg");
> +    bool has_kvm, has_tcg;
>      char *v_env = getenv("V");
>      int ret;
>  
> @@ -2093,6 +2092,14 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +
> +    if (!has_tcg && !has_kvm) {
> +        g_test_skip("No accelerator available");

perhaps 'No KVM or TCG ...' would be a bit better

> +        return 0;
> +    }
> +
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          ret = boot_sector_init(disk);
>          if (ret) {
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3aef3a97a9..28bab3d5e4 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -287,6 +287,11 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No accelerator available");
> +        return 0;
> +    }
> +
>      for (i = 0; tests[i].arch != NULL; i++) {
>          if (g_str_equal(arch, tests[i].arch) &&
>              qtest_has_machine(tests[i].machine)) {
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 3b615b0da9..24deb2d432 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2462,7 +2462,7 @@ static bool kvm_dirty_ring_supported(void)
>  
>  int main(int argc, char **argv)
>  {
> -    bool has_kvm;
> +    bool has_kvm, has_tcg;
>      bool has_uffd;
>      const char *arch;
>      g_autoptr(GError) err = NULL;
> @@ -2471,6 +2471,13 @@ int main(int argc, char **argv)
>      g_test_init(&argc, &argv, NULL);
>  
>      has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +
> +    if (!has_tcg && !has_kvm) {
> +        g_test_skip("No accelerator available");
> +        return 0;
> +    }
> +
>      has_uffd = ufd_version_check();
>      arch = qtest_get_arch();
>  
> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
> index 62b6eef464..5813adcf56 100644
> --- a/tests/qtest/pxe-test.c
> +++ b/tests/qtest/pxe-test.c
> @@ -131,11 +131,17 @@ int main(int argc, char *argv[])
>      int ret;
>      const char *arch = qtest_get_arch();
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No accelerator available");
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
> index efba76e716..a597cde707 100644
> --- a/tests/qtest/vmgenid-test.c
> +++ b/tests/qtest/vmgenid-test.c
> @@ -165,13 +165,18 @@ int main(int argc, char **argv)
>  {
>      int ret;
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No accelerator available");
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


