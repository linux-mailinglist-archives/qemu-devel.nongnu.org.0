Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6905B41329F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 13:34:41 +0200 (CEST)
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSe2q-0007ON-2x
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 07:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSe0Z-0006EP-UJ
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 07:32:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mSe0Q-0006tG-88
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 07:32:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632223928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9CGYQ1e6P94b6EsYsFQfr5miJ//eLAOI5sfZ0QlQH0c=;
 b=F7ZetmcOXmK/VJ+qqpuYDpjj+FGz2l9BK4VIf32VDFCy2mN/9xkMtuKSd74iA2oGwFZi1K
 vBRE8UK2elvYaWV9QcMy7Ju+rrqK4AjqrTxVbJPE8JqYyZOuKdeHxt70z2ygK8xtljpZd2
 AMLtUfOhu/eNrc4QytokL1DicmL1xH4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-iU7E1sW-NFmcgSSfKJFtpg-1; Tue, 21 Sep 2021 07:32:05 -0400
X-MC-Unique: iU7E1sW-NFmcgSSfKJFtpg-1
Received: by mail-ed1-f71.google.com with SMTP id
 d1-20020a50f681000000b003d860fcf4ffso5970414edn.22
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 04:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CGYQ1e6P94b6EsYsFQfr5miJ//eLAOI5sfZ0QlQH0c=;
 b=w416N7MFE9gMuu859rpkT9ivUSJg0cg87j447F/3GSumzgbrMOkObG/p5SzkYK6SwF
 BdhUohi8SSPLnzXSdg/nM0zgIJ9D3GZaGQe0ftDBd5zaNfaN/KxVRDPwpW4FhIB+hkr4
 pSzyg5ObWzjD+HIHSSfOUTe4yNSQ50fP2oFF3LsTJEYFgnNghdN/DzKRNSfA8ZOmG+o4
 NtLNAhQGRpwga2IY3YKql4dbi8gNl2XFqZGerjfJdQkxw7DS0n3wLyZa7X6HH++71ci+
 fqSSAzQBtZCTzOIm2r3B6LRcQ86tvTLiXNYgB8ipQRRsq9StRl5iy8RuBdykKHt5lL7n
 +4aA==
X-Gm-Message-State: AOAM533K8Pm5OAk8mo8KUqUFgvO7xIlGvvXuGdUETfNwzHv//4cIJIZx
 zZ08n4CF1MSO7YCj4oKJ/10fS9VW9C7d+lpJWqG8srNZEex42BCTdVlsnGZUTxbV2rYp7O0RALs
 mkovwsnPCl812odU=
X-Received: by 2002:a17:907:785a:: with SMTP id
 lb26mr35120760ejc.77.1632223923826; 
 Tue, 21 Sep 2021 04:32:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytGg6whyv/ElGqlm1JNnpM9m5eRJw1SWHaVmo5o1+S3rAuAO9xhiwTS4xvE47o2hOtylq+Ig==
X-Received: by 2002:a17:907:785a:: with SMTP id
 lb26mr35120738ejc.77.1632223923625; 
 Tue, 21 Sep 2021 04:32:03 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id k21sm7160894ejj.55.2021.09.21.04.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 04:32:03 -0700 (PDT)
Date: Tue, 21 Sep 2021 13:32:02 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v6 09/10] ACPI ERST: bios-tables-test testcase
Message-ID: <20210921133202.28e05608@redhat.com>
In-Reply-To: <1628202639-16361-10-git-send-email-eric.devolder@oracle.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-10-git-send-email-eric.devolder@oracle.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  5 Aug 2021 18:30:38 -0400
Eric DeVolder <eric.devolder@oracle.com> wrote:

> This change implements the test suite checks for the ERST table.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  tests/qtest/bios-tables-test.c | 43 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 51d3a4e..6ee78ec 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1378,6 +1378,45 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
>      test_acpi_tcg_acpi_hmat(MACHINE_PC);
>  }
>  
> +static void test_acpi_erst(const char *machine)
> +{
> +    test_data data;
> +
> +    memset(&data, 0, sizeof(data));
> +    data.machine = machine;
> +    /*data.variant = ".acpierst";*/
> +    test_acpi_one(" -object memory-backend-file,id=erstnvram,"
> +                    "mem-path=tests/acpi-erst.XXXXXX,size=0x10000,share=on"
> +                    " -device acpi-erst,memdev=erstnvram",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
> +static void test_acpi_piix4_erst(void)
> +{
> +    test_acpi_erst(MACHINE_PC);
> +}
> +
> +static void test_acpi_q35_erst(void)
> +{
> +    test_acpi_erst(MACHINE_Q35);
> +}
> +
> +static void test_acpi_microvm_erst(void)
> +{
> +    test_data data;
> +
> +    test_acpi_microvm_prepare(&data);
> +    data.variant = ".pcie";
> +    data.tcg_only = true; /* need constant host-phys-bits */
> +    test_acpi_one(" -machine microvm,acpi=on,ioapic2=off,rtc=off,pcie=on "
> +                    "-object memory-backend-file,id=erstnvram,"
> +                    "mem-path=tests/acpi-erst.XXXXXX,size=0x10000,share=on "
                                 ^^^^
shouldn't the path be generated with g_dir_make_tmp() & co + corresponding cleanup

> +                    "-device acpi-erst,memdev=erstnvram",
> +                  &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_virt_tcg(void)
>  {
>      test_data data = {
> @@ -1560,7 +1599,11 @@ int main(int argc, char *argv[])
>          qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
>          if (strcmp(arch, "x86_64") == 0) {
>              qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
> +            qtest_add_func("acpi/microvm/acpierst", test_acpi_microvm_erst);
>          }
> +        qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_erst);
> +        qtest_add_func("acpi/q35/acpierst", test_acpi_q35_erst);
> +
>      } else if (strcmp(arch, "aarch64") == 0) {
>          qtest_add_func("acpi/virt", test_acpi_virt_tcg);
>          qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);


