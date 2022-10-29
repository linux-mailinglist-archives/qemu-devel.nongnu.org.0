Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C74612128
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 09:55:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oogfx-00045K-UB; Sat, 29 Oct 2022 03:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oogfn-00042w-3c
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 03:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oogfi-0006Io-M8
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 03:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667030066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Pyxjv+1qdW72frgMj4/L02Sk256zp7qPaOh7hVcBUg=;
 b=c5IXxaR7htYmVHhsCbbkg0PKLjIS0lEXDA5swmusi2wSujMvhobR92DYm/Kw/m3XiKCZFX
 j4793cPNmJlNImgLoObaKQDItzHP628jJhIKU1BtzA+l2bvHpcNix7NNDRehYH9wi2w6FN
 p3C6U0rchj18fPkbtZufgQSw2eTVY4U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-zEae0znOP4WaCbko-qZzVA-1; Sat, 29 Oct 2022 03:54:23 -0400
X-MC-Unique: zEae0znOP4WaCbko-qZzVA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso1533573wrc.10
 for <qemu-devel@nongnu.org>; Sat, 29 Oct 2022 00:54:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Pyxjv+1qdW72frgMj4/L02Sk256zp7qPaOh7hVcBUg=;
 b=WHAN16UDTAbfc6YO70TlXxr4NtPYOa/u5W2zfB+DnYXIhG6X9GbkBODS32lV5a+XsZ
 S593hRjgFQ75hyOcLrfops7VInvSWOHI+4Wyd5lFES49+2bHcQxXno0cwExriCO2HOqY
 aA9Si/aexMvCBP2NiCOO+umj6jJOTvteKOwsmA7K98kypSnBATAHLBbRZkySA8taYcdY
 1JM+JjeQFQf4MxyeqOOQbjdtGDwQTb8uPJsufYcDP+klOzimRcOjcg+DzgFHGdewOdmY
 HLqVjODemHDJD4xnEqoy4wekgnu07SMvT2TtFggOwG1VIeyjP5RYjyXQLOWpxj10hjJk
 PBRw==
X-Gm-Message-State: ACrzQf3vxe7OAq1itclCpEU/TokesjsvfHbrFFMkaAQRjJxHbJjKfMdc
 rsdqKNekgTozQIM3SE4+sZMyHzXSNaHF4jaBrznupCnxmnrX4eYvnft+mmQTVb6MznDS8kBotZy
 /3cGQTAl+M1dDWBc=
X-Received: by 2002:adf:e44f:0:b0:236:59a3:c5a8 with SMTP id
 t15-20020adfe44f000000b0023659a3c5a8mr1750853wrm.396.1667030062431; 
 Sat, 29 Oct 2022 00:54:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5oubxO4tmMNPFfBkWWl9OeuQ3myl6dCGh7uKbTEqG187uH3eWSVlzpG9J7akdbxVSkSUjYMA==
X-Received: by 2002:adf:e44f:0:b0:236:59a3:c5a8 with SMTP id
 t15-20020adfe44f000000b0023659a3c5a8mr1750842wrm.396.1667030062224; 
 Sat, 29 Oct 2022 00:54:22 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bp7-20020a5d5a87000000b00236545edc91sm813767wrb.76.2022.10.29.00.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 00:54:21 -0700 (PDT)
Date: Sat, 29 Oct 2022 03:54:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: peter.maydell@linaro.org, imammedo@redhat.com, ani@anisinha.ca,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org,
 jonathan.cameron@huawei.com, linuxarm@huawei.com,
 yangyicong@hisilicon.com, prime.zeng@huawei.com,
 hesham.almatary@huawei.com, ionela.voinescu@arm.com,
 darren@os.amperecomputing.com
Subject: Re: [PATCH v2 3/4] tests: acpi: aarch64: add topology test for aarch64
Message-ID: <20221029035356-mutt-send-email-mst@kernel.org>
References: <20221027032613.18377-1-yangyicong@huawei.com>
 <20221027032613.18377-4-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027032613.18377-4-yangyicong@huawei.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Oct 27, 2022 at 11:26:12AM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Add test for aarch64's ACPI topology building for all the supported
> levels.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

And same comment here.
Pls follow the process in bios-tables-test

> ---
>  tests/qtest/bios-tables-test.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index e6096e7f73..099b723444 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1533,6 +1533,27 @@ static void test_acpi_virt_tcg(void)
>      free_test_data(&data);
>  }
>  
> +static void test_acpi_virt_tcg_topology(void)
> +{
> +    test_data data = {
> +        .machine = "virt",
> +        .variant = ".topology",
> +        .tcg_only = true,
> +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> +        .ram_start = 0x40000000ULL,
> +        .scan_len = 128ULL * 1024 * 1024,
> +    };
> +
> +    data.smbios_cpu_max_speed = 2900;
> +    data.smbios_cpu_curr_speed = 2700;
> +    test_acpi_one("-cpu cortex-a57 "
> +                  "-smbios type=4,max-speed=2900,current-speed=2700 "
> +                  "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
> +    free_test_data(&data);
> +}
> +
>  static void test_acpi_q35_viot(void)
>  {
>      test_data data = {
> @@ -1864,6 +1885,7 @@ int main(int argc, char *argv[])
>      } else if (strcmp(arch, "aarch64") == 0) {
>          if (has_tcg) {
>              qtest_add_func("acpi/virt", test_acpi_virt_tcg);
> +            qtest_add_func("acpi/virt/topology", test_acpi_virt_tcg_topology);
>              qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
>              qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
>              qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
> -- 
> 2.24.0


