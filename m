Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D14C94B9BC9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 10:13:33 +0100 (CET)
Received: from localhost ([::1]:36102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcqy-0003oz-JR
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 04:13:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKcYh-0000fP-1K
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:54:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nKcYe-0005T6-22
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 03:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645088074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rUMLfWXNVUh+lZW/g69jrk8hr13JwmSk9bfhikshjA0=;
 b=UmHjagYZgZOJIyH1bkML++0vD4eQ//NBEffo80wYxTEr5vr+ODG+7bxHSXLHbZsLd1TNov
 Iv0I3QsxfmN1L5vn1Bro1+f8gEJaRMYAnYm74ujflsXNo1WOjC2JmlFsOdx3ckutCyDMo0
 OgnSnr0s+A1QUspi/l0OZgXRPa9j5UM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-5sg9PxhaO6KQ4X15imGSoA-1; Thu, 17 Feb 2022 03:54:33 -0500
X-MC-Unique: 5sg9PxhaO6KQ4X15imGSoA-1
Received: by mail-ed1-f71.google.com with SMTP id
 g5-20020a056402090500b0040f28e1da47so3143058edz.8
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 00:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rUMLfWXNVUh+lZW/g69jrk8hr13JwmSk9bfhikshjA0=;
 b=2IV28IhNsojSdbiAxwNOxRsWDJDH9RlUDJIB8thWUvMyn6Rxg7dXtYlcU0EsBvutea
 2/19Z2O4QpDs5zXFCCD9Fx0tLLBF2OyFP1E5TjOQOhapWihKAGcSI2D95tfTpE8cviUH
 dE3MFMyOF8qoNtnCBlNZS8D639vtOVN6inHGNFjS/f29gn97zdU9V6da9RMwPnhAi99t
 JhC6w8UEaGV6Gv9x7axtqe0yXX1fCkHXZ7x9YOWzzQbESv/JmxP0PWQy1EZEKr0mKxya
 wpudaz8dAlgA8zjJReoAh4Y6sFxmgQ1oO7lPD/CaXbLbLA7VVqvB1WvKOq6KVhplgogv
 z/DQ==
X-Gm-Message-State: AOAM533T28uv6hlDBtep6UyE++DMPMEBvHYj+9X4cwxMObzIN3Pksupr
 T1gOV0mFURHB646pwrmfioVX5h7SIMAkipto1azmFaEbz4ZdFTxMc3kyQ2KKD4JYAtetYTcD/6e
 7Po6eGNnfc6Es9Bo=
X-Received: by 2002:a17:906:eb8b:b0:6ce:b96c:bdcf with SMTP id
 mh11-20020a170906eb8b00b006ceb96cbdcfmr1488396ejb.371.1645088071878; 
 Thu, 17 Feb 2022 00:54:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/rXLBcLL3huVF8b6FHbzx8dmah+8GLKkEmoWa/UdlS333augjWtdp31Zqyj26D0iZJv7bQw==
X-Received: by 2002:a17:906:eb8b:b0:6ce:b96c:bdcf with SMTP id
 mh11-20020a170906eb8b00b006ceb96cbdcfmr1488375ejb.371.1645088071510; 
 Thu, 17 Feb 2022 00:54:31 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id k7sm925578eje.162.2022.02.17.00.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 00:54:30 -0800 (PST)
Date: Thu, 17 Feb 2022 09:54:30 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3 2/3] hw/smbios: fix table memory corruption with
 large memory vms
Message-ID: <20220217095430.38d2b6b7@redhat.com>
In-Reply-To: <20220214141237.47946-3-ani@anisinha.ca>
References: <20220214141237.47946-1-ani@anisinha.ca>
 <20220214141237.47946-3-ani@anisinha.ca>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 19:42:35 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> The current smbios table implementation splits the main memory in 16 GiB
> (DIMM like) chunks. With the current smbios table assignment code, we can have
> only 512 such chunks before the 16 bit handle numbers in the header for tables
> 17 and 19 conflict. A guest with more than 8 TiB of memory will hit this
> limitation and would fail with the following assertion in isa-debugcon:
> 
> ASSERT_EFI_ERROR (Status = Already started)
> ASSERT /builddir/build/BUILD/edk2-ca407c7246bf/OvmfPkg/SmbiosPlatformDxe/SmbiosPlatformDxe.c(125): !EFI_ERROR (Status)
> 
> This change adds an additional offset between tables 17 and 19 handle numbers
> when configuring VMs larger than 8 TiB of memory. The value of the offset is
> calculated to be equal to the additional space required to be reserved
> in order to accomodate more DIMM entries without the table handles colliding.
> In normal cases where the VM memory is smaller or equal to 8 TiB, this offset
> value is 0. Hence in this case, no additional handle numbers are reserved and
> table handle values remain as before.
> 
> As table handles are altered for large memory VMs, this change can break
> migration in those cases. However, in those situations, qemu crashes anyway
1. pls explain how migration breaks
2. it's not QEMU which crashes

> without this fix and hence we do not preserve the old bug by introducing
> compat knobs/machine types.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2023977
s/buglink/Resolves/

> Signed-off-by: Ani Sinha <ani@anisinha.ca>

with above fixed

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/smbios/smbios.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> changelog:
> v3: reworded the commit log and comment in code.
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 56b412ce35..44c53797a4 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -799,12 +799,13 @@ static void smbios_build_type_17_table(unsigned instance, uint64_t size)
>      SMBIOS_BUILD_TABLE_POST;
>  }
>  
> -static void smbios_build_type_19_table(unsigned instance,
> +static void smbios_build_type_19_table(unsigned instance, unsigned offset,
>                                         uint64_t start, uint64_t size)
>  {
>      uint64_t end, start_kb, end_kb;
>  
> -    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + instance, true); /* required */
> +    SMBIOS_BUILD_TABLE_PRE(19, T19_BASE + offset + instance,
> +                           true); /* required */
>  
>      end = start + size - 1;
>      assert(end > start);
> @@ -996,7 +997,7 @@ void smbios_get_tables(MachineState *ms,
>                         uint8_t **anchor, size_t *anchor_len,
>                         Error **errp)
>  {
> -    unsigned i, dimm_cnt;
> +    unsigned i, dimm_cnt, offset;
>  
>      if (smbios_legacy) {
>          *tables = *anchor = NULL;
> @@ -1026,6 +1027,16 @@ void smbios_get_tables(MachineState *ms,
>  
>          dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) / MAX_DIMM_SZ;
>  
> +        /*
> +         * The offset determines if we need to keep additional space betweeen
> +         * table 17 and table 19 header handle numbers so that they do
> +         * not overlap. For example, for a VM with larger than 8 TB guest
> +         * memory and DIMM like chunks of 16 GiB, the default space between
> +         * the two tables (T19_BASE - T17_BASE = 512) is not enough.
> +         */
> +        offset = (dimm_cnt > (T19_BASE - T17_BASE)) ? \
> +                 dimm_cnt - (T19_BASE - T17_BASE) : 0;
> +
>          smbios_build_type_16_table(dimm_cnt);
>  
>          for (i = 0; i < dimm_cnt; i++) {
> @@ -1033,7 +1044,7 @@ void smbios_get_tables(MachineState *ms,
>          }
>  
>          for (i = 0; i < mem_array_size; i++) {
> -            smbios_build_type_19_table(i, mem_array[i].address,
> +            smbios_build_type_19_table(i, offset, mem_array[i].address,
>                                         mem_array[i].length);
>          }
>  


