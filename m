Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4F11548CC
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 17:07:38 +0100 (CET)
Received: from localhost ([::1]:41688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izjgn-0003gE-FW
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 11:07:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1izjfm-0002qW-RH
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 11:06:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1izjfk-0001MO-Vq
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 11:06:34 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27242
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1izjfk-0001H9-Qj
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 11:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581005191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f5gxHJorGkNvYfdDWlcoZ0y2MnMJCHX/bGzx9gddK4c=;
 b=PKnE9dR1tiw3Y4m+6t1eG1l6haFXl+x3BBR5WZgyRasv3wwfTKBdUX++3/JcMjSFDC+HHy
 5E3rqF4kg7DVvFQjji4Szyn3yn/GbO9LqbFf3CNPcLKU6fPwccoR57oupQaZrMqUSfHICJ
 flvzDO9zdLPxUG+mDO4avaxZr26tGdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-w6T5HID3MNaE0NZcx9Xttg-1; Thu, 06 Feb 2020 11:06:15 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DF898010F8;
 Thu,  6 Feb 2020 16:06:13 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E329E60BEC;
 Thu,  6 Feb 2020 16:06:05 +0000 (UTC)
Date: Thu, 6 Feb 2020 17:06:04 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 2/7] hw/acpi/nvdimm: Fix for NVDIMM incorrect DSM
 output buffer length
Message-ID: <20200206170604.12899caf@redhat.com>
In-Reply-To: <20200117174522.22044-3-shameerali.kolothum.thodi@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-3-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: w6T5HID3MNaE0NZcx9Xttg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Jan 2020 17:45:17 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> As per ACPI spec 6.3, Table 19-419 Object Conversion Rules, if
> the Buffer Field <= to the size of an Integer (in bits), it will
> be treated as an integer. Moreover, the integer size depends on
> DSDT tables revision number. If revision number is < 2, integer
> size is 32 bits, otherwise it is 64 bits. Current NVDIMM common
> DSM aml code (NCAL) uses CreateField() for creating DSM output
> buffer. This creates an issue in arm/virt platform where DSDT
> revision number is 2 and results in DSM buffer with a wrong
> size(8 bytes) gets returned when actual length is < 8 bytes.
> This causes guest kernel to report,
> 
> "nfit ACPI0012:00: found a zero length table '0' parsing nfit"
> 
> In order to fix this, aml code is now modified such that it builds
> the DSM output buffer in a byte by byte fashion when length is
> smaller than Integer size.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> Please find the previous discussion on this here,
> https://patchwork.kernel.org/cover/11174959/
> 
> ---
>  hw/acpi/nvdimm.c                            | 36 +++++++++++++++++++--
>  tests/qtest/bios-tables-test-allowed-diff.h |  2 ++
>  2 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
> index 9fdad6dc3f..5e7b8318d0 100644
> --- a/hw/acpi/nvdimm.c
> +++ b/hw/acpi/nvdimm.c
> @@ -964,6 +964,7 @@ static void nvdimm_build_common_dsm(Aml *dev)
>      Aml *method, *ifctx, *function, *handle, *uuid, *dsm_mem, *elsectx2;
>      Aml *elsectx, *unsupport, *unpatched, *expected_uuid, *uuid_invalid;
>      Aml *pckg, *pckg_index, *pckg_buf, *field, *dsm_out_buf, *dsm_out_buf_size;
> +    Aml *whilectx, *offset;
>      uint8_t byte_list[1];
>  
>      method = aml_method(NVDIMM_COMMON_DSM, 5, AML_SERIALIZED);
> @@ -1117,13 +1118,42 @@ static void nvdimm_build_common_dsm(Aml *dev)
>      /* RLEN is not included in the payload returned to guest. */
>      aml_append(method, aml_subtract(aml_name(NVDIMM_DSM_OUT_BUF_SIZE),
>                 aml_int(4), dsm_out_buf_size));
> +
> +    /*
> +     * As per ACPI spec 6.3, Table 19-419 Object Conversion Rules, if
> +     * the Buffer Field <= to the size of an Integer (in bits), it will
> +     * be treated as an integer. Moreover, the integer size depends on
> +     * DSDT tables revision number. If revision number is < 2, integer
> +     * size is 32 bits, otherwise it is 64 bits.
> +     * Because of this CreateField() canot be used if RLEN < Integer Size.
> +     * Hence build dsm_out_buf byte by byte.
> +     */
> +    ifctx = aml_if(aml_lless(dsm_out_buf_size, aml_sizeof(aml_int(0))));

this decomplies into

 If (Local1 < SizeOf ())

which doesn't look right

> +    offset = aml_local(2);
> +    aml_append(ifctx, aml_store(aml_int(0), offset));
> +    aml_append(ifctx, aml_name_decl("TBUF", aml_buffer(1, NULL)));
> +    aml_append(ifctx, aml_store(aml_buffer(0, NULL), dsm_out_buf));
> +
> +    whilectx = aml_while(aml_lless(offset, dsm_out_buf_size));
> +    /* Copy 1 byte at offset from ODAT to temporary buffer(TBUF). */
> +    aml_append(whilectx, aml_store(aml_derefof(aml_index(
> +                                   aml_name(NVDIMM_DSM_OUT_BUF), offset)),
> +                                   aml_index(aml_name("TBUF"), aml_int(0))));
> +    aml_append(whilectx, aml_concatenate(dsm_out_buf, aml_name("TBUF"),
> +                                         dsm_out_buf));
> +    aml_append(whilectx, aml_increment(offset));
> +    aml_append(ifctx, whilectx);
> +
> +    aml_append(ifctx, aml_return(dsm_out_buf));
> +    aml_append(method, ifctx);
> +
> +    /* If RLEN >= Integer size, just use CreateField() operator */
>      aml_append(method, aml_store(aml_shiftleft(dsm_out_buf_size, aml_int(3)),
>                                   dsm_out_buf_size));
>      aml_append(method, aml_create_field(aml_name(NVDIMM_DSM_OUT_BUF),
>                 aml_int(0), dsm_out_buf_size, "OBUF"));
> -    aml_append(method, aml_concatenate(aml_buffer(0, NULL), aml_name("OBUF"),
> -                                       dsm_out_buf));
> -    aml_append(method, aml_return(dsm_out_buf));
> +    aml_append(method, aml_return(aml_name("OBUF")));
> +
>      aml_append(dev, method);
>  }
>  
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..eb8bae1407 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/pc/SSDT.dimmpxm",
> +"tests/data/acpi/q35/SSDT.dimmpxm",


