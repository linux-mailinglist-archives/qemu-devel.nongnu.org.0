Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B05A2776
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 14:14:14 +0200 (CEST)
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRYE0-00061x-LP
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 08:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oRY0N-0004lk-ST
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oRY0I-00058H-GS
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661515200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LdQIy1KpSymSb6Goznzjmj9STKPdJYTor12NmVUqIM=;
 b=OshDwdgjMz+dh0AT3l6Lmq9ktnP+ppltoXauWmrfhhlZgvY+UUsU94+0yek22szaMHgXg/
 oHtsF7vTAQeL3H2OHQbZT1Xe81Bd96iJoOvdfQJyULuyAlAaCllI/E7cn5cGoD8wNEVbAW
 HvftYsk/TPxz7Tv9AVKg+GWh/jGgzSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-oiahhW-INHmZLn3_NlvfTg-1; Fri, 26 Aug 2022 07:59:59 -0400
X-MC-Unique: oiahhW-INHmZLn3_NlvfTg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE7B785A589;
 Fri, 26 Aug 2022 11:59:58 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D222D492C3B;
 Fri, 26 Aug 2022 11:59:56 +0000 (UTC)
Subject: Re: [PATCH] fw_cfg: Don't set callback_opaque NULL in
 fw_cfg_modify_bytes_read()
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: imammedo@redhat.com, peter.maydell@linaro.org, linuxarm@huawei.com,
 chenxiang66@hisilicon.com
References: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <43c62060-7a5d-25cf-91a3-1c391d3a58f9@redhat.com>
Date: Fri, 26 Aug 2022 13:59:54 +0200
MIME-Version: 1.0
In-Reply-To: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/25/22 18:18, Shameer Kolothum wrote:
> Hi
> 
> On arm/virt platform, Chen Xiang reported a Guest crash while
> attempting the below steps,
> 
> 1. Launch the Guest with nvdimm=on
> 2. Hot-add a NVDIMM dev
> 3. Reboot
> 4. Guest boots fine.
> 5. Reboot again.
> 6. Guest boot fails.
> 
> QEMU_EFI reports the below error:
> ProcessCmdAddPointer: invalid pointer value in "etc/acpi/tables"
> OnRootBridgesConnected: InstallAcpiTables: Protocol Error
> 
> Debugging shows that on first reboot(after hot-adding NVDIMM),
> Qemu updates the etc/table-loader len,
> 
> qemu_ram_resize()
>   fw_cfg_modify_file()
>      fw_cfg_modify_bytes_read()
> 
> And in fw_cfg_modify_bytes_read() we set the "callback_opaque" for
> the "key" entry to NULL. Because of this, on the second reboot,
> virt_acpi_build_update() is called with a NULL "build_state" and
> returns without updating the ACPI tables. This seems to be 
> upsetting the firmware.
> 
> To fix this, don't change the callback_opaque in fw_cfg_modify_bytes_read().
> 
> Reported-by: chenxiang <chenxiang66@hisilicon.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> I am still not very convinced this is the root cause of the issue.
> Though it looks like setting callback_opaque to NULL while updating
> the file size is wrong, what puzzles me is that on the second reboot
> we don't have any ACPI table size changes and ideally firmware should
> see the updated tables from the first reboot itself.
> 
> Please take a look and let me know.
> 
> Thanks,
> Shameer
> 
> ---
>  hw/nvram/fw_cfg.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index d605f3f45a..dfe8404c01 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -728,7 +728,6 @@ static void *fw_cfg_modify_bytes_read(FWCfgState *s, uint16_t key,
>      ptr = s->entries[arch][key].data;
>      s->entries[arch][key].data = data;
>      s->entries[arch][key].len = len;
> -    s->entries[arch][key].callback_opaque = NULL;
>      s->entries[arch][key].allow_write = false;
>  
>      return ptr;
> 

I vaguely recall seeing the same issue report years ago (also in
relation to hot-adding NVDIMM). However, I have no capacity to
participate in the discussion. Making this remark just for clarity.

Laszlo


