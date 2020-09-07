Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7DF25FAB4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 14:50:45 +0200 (CEST)
Received: from localhost ([::1]:45294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFGbc-0006LX-HB
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 08:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFGal-0005Q2-6R
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 08:49:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49770
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFGaj-0003mZ-D9
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 08:49:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599482988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6oxdZHTvtM+NYeQDoldGRQo6EWKabki1qPZAA60cqc8=;
 b=BA8pVf7ocMn0UCrvw6bg2+Y8/w8QRmiH/QElqN7VXTsM+nqb6lEqSNyeMZOBCiV+ydee/4
 MEPO3/ZM+mobNaRrlirEQzi4d15MG5GQCBUHD0DNrEhcx44pgxjODbSV4D2QYia43fabdm
 ulY0osq+WWVdJmAExTcAaFGJwCsas38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482--5fTnHFUOAWUMGL336KExQ-1; Mon, 07 Sep 2020 08:49:46 -0400
X-MC-Unique: -5fTnHFUOAWUMGL336KExQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45E2356BE5;
 Mon,  7 Sep 2020 12:49:45 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-115-56.ams2.redhat.com
 [10.36.115.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37F8110027AB;
 Mon,  7 Sep 2020 12:49:44 +0000 (UTC)
Subject: Re: [PATCH v5 07/10] x86: acpi: introduce AcpiPmInfo::smi_on_cpuhp
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200907112348.530921-1-imammedo@redhat.com>
 <20200907112348.530921-8-imammedo@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f5b28def-19f6-9804-70c7-3cc53d589943@redhat.com>
Date: Mon, 7 Sep 2020 14:49:43 +0200
MIME-Version: 1.0
In-Reply-To: <20200907112348.530921-8-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 03:19:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: boris.ostrovsky@oracle.com, aaron.young@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/07/20 13:23, Igor Mammedov wrote:
> Translate the "CPU hotplug with SMI" feature bit, from the property
> added in the last patch, to a dedicated boolean in AcpiPmInfo.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  hw/i386/acpi-build.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 7a5a8b3521..e61c17a484 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -95,6 +95,7 @@ typedef struct AcpiPmInfo {
>      bool s3_disabled;
>      bool s4_disabled;
>      bool pcihp_bridge_en;
> +    bool smi_on_cpuhp;
>      uint8_t s4_val;
>      AcpiFadtData fadt;
>      uint16_t cpu_hp_io_base;
> @@ -194,6 +195,7 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
>      pm->cpu_hp_io_base = 0;
>      pm->pcihp_io_base = 0;
>      pm->pcihp_io_len = 0;
> +    pm->smi_on_cpuhp = false;
>  
>      assert(obj);
>      init_common_fadt_data(machine, obj, &pm->fadt);
> @@ -207,12 +209,16 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
>              object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
>      }
>      if (lpc) {
> +        uint64_t smi_features = object_property_get_uint(lpc,
> +            ICH9_LPC_SMI_NEGOTIATED_FEAT_PROP, NULL);
>          struct AcpiGenericAddress r = { .space_id = AML_AS_SYSTEM_IO,
>              .bit_width = 8, .address = ICH9_RST_CNT_IOPORT };
>          pm->fadt.reset_reg = r;
>          pm->fadt.reset_val = 0xf;
>          pm->fadt.flags |= 1 << ACPI_FADT_F_RESET_REG_SUP;
>          pm->cpu_hp_io_base = ICH9_CPU_HOTPLUG_IO_BASE;
> +        pm->smi_on_cpuhp =
> +            !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT));
>      }
>  
>      /* The above need not be conditional on machine type because the reset port
> 

Tested-by: Laszlo Ersek <lersek@redhat.com>


