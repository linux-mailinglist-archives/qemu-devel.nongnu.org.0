Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CBD6F0C17
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 20:43:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps6Yw-0003mn-5i; Thu, 27 Apr 2023 14:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ps6YY-0003lb-Kk
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:41:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ps6YV-0008IO-J6
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 14:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682620882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fd5Ug5ZILzQtJxf/iMUPyrZegtwcSGD6L/iLxtkDwYI=;
 b=SNMLiZOQPp2pZuiArWBd+Dj+hEzzHxMUl9X2Nc00C0VRnfzaId+FNl2XM6xXfkKk1dMRmH
 vBoAtiD78BddCt2tSU8onhMVlQgKZE/9N/AmCuDIrOKNhzuLerJtfFn/jUj4t2o4U3LQle
 oKh8+mBYBMGe12uMnhEgr5bYcbfpoIg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-abPqYDs0Ma2rh_WK11tCXg-1; Thu, 27 Apr 2023 14:41:17 -0400
X-MC-Unique: abPqYDs0Ma2rh_WK11tCXg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f8b5e23d23so5363223f8f.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 11:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682620876; x=1685212876;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fd5Ug5ZILzQtJxf/iMUPyrZegtwcSGD6L/iLxtkDwYI=;
 b=Z6TEHGh9u0/nvqrHMCl5taanQsijhIhHiRCrKJd/oyHhpa/vM4XvEX2savMTMyOOff
 ItfifjPlwwxtxG/GTsdy31+iSCPKvxPx1U8NoAiRhEMKcy+sO+TrpHr5sS9dsjLkfO4Z
 SPDfEsT8uB3riX2hWvt50cmlM8+b6ObL5NNmv8JAh/rpgN6M1lg4yZ1jVx5qomz3kquX
 XCzf0WRMPkmTw3Px5lNvVEfhzidjKWmWNNA4XizlGd9H/T3IVjob2nBJ40Nvh4rV5Yg7
 vDhnjcoDquGA/JvEmkRbNtxKx6CbghE65/urKiMFIzFxLZUS8jU8TGGz4IKT6jyRfMXB
 nJ0g==
X-Gm-Message-State: AC+VfDzksQV76u/lUA8CT2QD+uYwAFq3dFXLKXwORgSUtHhQH4YtpjSE
 aG4/QcZy0ulJhWvwJegMZ5OQAL/8db2Z4jEbBTwwMs+MUlFxiaYx/WbJlcePvHtjxsW/75bKQym
 YXphX5WvPBTPzPnE=
X-Received: by 2002:adf:ce09:0:b0:2fe:c0ea:18a8 with SMTP id
 p9-20020adfce09000000b002fec0ea18a8mr2037750wrn.49.1682620875871; 
 Thu, 27 Apr 2023 11:41:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4r6U/z03Y3sXqApW8AbEpFx+1XgKXWutwRgCTXxZ05gqML+1QqbIgZYbVHDdXikLFdp7xkkQ==
X-Received: by 2002:adf:ce09:0:b0:2fe:c0ea:18a8 with SMTP id
 p9-20020adfce09000000b002fec0ea18a8mr2037724wrn.49.1682620875545; 
 Thu, 27 Apr 2023 11:41:15 -0700 (PDT)
Received: from redhat.com ([2.52.19.183]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d474c000000b002f4c2ea66absm19204927wrs.85.2023.04.27.11.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 11:41:15 -0700 (PDT)
Date: Thu, 27 Apr 2023 14:41:10 -0400
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
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v11 08/13] tests/qtest: Fix tests when no KVM or TCG are
 present
Message-ID: <20230427144055-mutt-send-email-mst@kernel.org>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-9-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426180013.14814-9-farosas@suse.de>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, Apr 26, 2023 at 03:00:08PM -0300, Fabiano Rosas wrote:
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
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>


makes sense to me

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  tests/qtest/bios-tables-test.c | 11 +++++++++--
>  tests/qtest/boot-serial-test.c |  5 +++++
>  tests/qtest/migration-test.c   |  9 ++++++++-
>  tests/qtest/pxe-test.c         |  8 +++++++-
>  tests/qtest/vmgenid-test.c     |  9 +++++++--
>  5 files changed, 36 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 464f87382e..7fd88b0e9c 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2045,8 +2045,7 @@ static void test_acpi_virt_oem_fields(void)
>  int main(int argc, char *argv[])
>  {
>      const char *arch = qtest_get_arch();
> -    const bool has_kvm = qtest_has_accel("kvm");
> -    const bool has_tcg = qtest_has_accel("tcg");
> +    bool has_kvm, has_tcg;
>      char *v_env = getenv("V");
>      int ret;
>  
> @@ -2056,6 +2055,14 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +
> +    if (!has_tcg && !has_kvm) {
> +        g_test_skip("No KVM or TCG accelerator available");
> +        return 0;
> +    }
> +
>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>          ret = boot_sector_init(disk);
>          if (ret) {
> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
> index 3aef3a97a9..6dd06aeaf4 100644
> --- a/tests/qtest/boot-serial-test.c
> +++ b/tests/qtest/boot-serial-test.c
> @@ -287,6 +287,11 @@ int main(int argc, char *argv[])
>  
>      g_test_init(&argc, &argv, NULL);
>  
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available");
> +        return 0;
> +    }
> +
>      for (i = 0; tests[i].arch != NULL; i++) {
>          if (g_str_equal(arch, tests[i].arch) &&
>              qtest_has_machine(tests[i].machine)) {
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 60dd53d3ec..be73ec3c06 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -2477,7 +2477,7 @@ static bool kvm_dirty_ring_supported(void)
>  
>  int main(int argc, char **argv)
>  {
> -    bool has_kvm;
> +    bool has_kvm, has_tcg;
>      bool has_uffd;
>      const char *arch;
>      g_autoptr(GError) err = NULL;
> @@ -2486,6 +2486,13 @@ int main(int argc, char **argv)
>      g_test_init(&argc, &argv, NULL);
>  
>      has_kvm = qtest_has_accel("kvm");
> +    has_tcg = qtest_has_accel("tcg");
> +
> +    if (!has_tcg && !has_kvm) {
> +        g_test_skip("No KVM or TCG accelerator available");
> +        return 0;
> +    }
> +
>      has_uffd = ufd_version_check();
>      arch = qtest_get_arch();
>  
> diff --git a/tests/qtest/pxe-test.c b/tests/qtest/pxe-test.c
> index 62b6eef464..e4b48225a5 100644
> --- a/tests/qtest/pxe-test.c
> +++ b/tests/qtest/pxe-test.c
> @@ -131,11 +131,17 @@ int main(int argc, char *argv[])
>      int ret;
>      const char *arch = qtest_get_arch();
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available");
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
> index efba76e716..324db08c7a 100644
> --- a/tests/qtest/vmgenid-test.c
> +++ b/tests/qtest/vmgenid-test.c
> @@ -165,13 +165,18 @@ int main(int argc, char **argv)
>  {
>      int ret;
>  
> +    g_test_init(&argc, &argv, NULL);
> +
> +    if (!qtest_has_accel("tcg") && !qtest_has_accel("kvm")) {
> +        g_test_skip("No KVM or TCG accelerator available");
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


