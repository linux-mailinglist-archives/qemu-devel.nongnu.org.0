Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5924B5151
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:16:05 +0100 (CET)
Received: from localhost ([::1]:54984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJbD2-0003IB-5g
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:16:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJaor-00013m-0m
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:51:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nJaom-0006X1-KB
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644843059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ptEDWa0zMNnSSHzC0Z8C8XIN9xtOBWP1UNfFfVDtz34=;
 b=eez616R5v8sefnqTLc7++BONIEdcXknayAwwgSTBHq1zY1Hu3+jBZYwAV08uKZnJo78PNr
 9wDVy7e0vBWBaF/RMpWqtm24uQSKaeUDBSCFOFJTTO/CUynoVyRL+sbWOmeWpl6rUc26NF
 U3Dx0sZhs6yp63yDUtTB7UjLZGcIkfg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-aDTLp6GmOK6CBuOzWDqxhA-1; Mon, 14 Feb 2022 07:50:58 -0500
X-MC-Unique: aDTLp6GmOK6CBuOzWDqxhA-1
Received: by mail-ej1-f71.google.com with SMTP id
 v2-20020a170906292200b006a94a27f903so5815073ejd.8
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ptEDWa0zMNnSSHzC0Z8C8XIN9xtOBWP1UNfFfVDtz34=;
 b=jxY6Mci/LnlUzGb/tTl4wkHO9U9a7OrTiIE9F7BSG5mwebajffbSCk1sfvCIwKXTyt
 Iar6Zm1YZTkgdDRdjA0dvLt3i4GclnJShgTtL96oS9IeSV6RgT05Wj8JMWoIHCkvhR1u
 +di5GbHOqscNZvgPhMWqLjFuPBT3JTwTLC+fVdlZPVP9pB/65GM7kpGvmHPTS8FEi10V
 mfn8Ih/rcX8+SsVdMdUWMICetlAQ78w8MYoCo91l1UWYEwx7hQBJQpVIJpxHHw1Mrk3m
 hQsYM7jbbdNG2FtFWNPky+O0psAJyYXAJ8uQqVeGPW69mvKdLkW4nm3k1pXsYZSWv6kB
 fz0Q==
X-Gm-Message-State: AOAM533OP7s7CMBBYKSnClEdgJ80PtmxWNmLe9uA0hbFjNzVpdcLzwEg
 jix//aErHmW03xJBWgvYT8H1oWKKFVgEChTPI9lizPw5mLUOW/43mxeKokDix3id57z6o5d5bCK
 mtePgGyx1HadrXog=
X-Received: by 2002:a17:906:74de:: with SMTP id
 z30mr7521805ejl.217.1644843056888; 
 Mon, 14 Feb 2022 04:50:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU1ogHNTsjjVtqSDvL7gr9qkUEHQKJ6c/z2XC2HAGCke4x6C8wRCgdvzhiNW+9VLmDjSAyyA==
X-Received: by 2002:a17:906:74de:: with SMTP id
 z30mr7521792ejl.217.1644843056645; 
 Mon, 14 Feb 2022 04:50:56 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id z6sm4507660edb.69.2022.02.14.04.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 04:50:56 -0800 (PST)
Date: Mon, 14 Feb 2022 13:50:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v2 2/3] hw/smbios: fix table memory corruption with
 large memory vms
Message-ID: <20220214135054.2602fa82@redhat.com>
In-Reply-To: <20220207113129.2701722-3-ani@anisinha.ca>
References: <20220207113129.2701722-1-ani@anisinha.ca>
 <20220207113129.2701722-3-ani@anisinha.ca>
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

On Mon,  7 Feb 2022 17:01:28 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> With the current smbios table assignment code, we can have only 512 DIMM slots
it's a bit confusing, since it's not DIMM slots in QEMU sense (we do not expose
DIMM devices via SMBIOS/E820). So maybe clarify here that initial RAM is split
into 16GB (with 'DIMM' type ) chunks/entries when it's described in SMBIOS table 17.

> (each DIMM of 16 GiB in size) before tables 17 and 19 conflict with their
> addresses.

Are you sure it's addresses that are wrong? 

> A guest with more than 8 TiB of memory will hit this limitation and
> would fail with the following assertion in isa-debugcon:
> 
> ASSERT_EFI_ERROR (Status = Already started)
> ASSERT /builddir/build/BUILD/edk2-ca407c7246bf/OvmfPkg/SmbiosPlatformDxe/SmbiosPlatformDxe.c(125): !EFI_ERROR (Status)
> 
> This change adds an additional offset between tables 17 and 19 when configuring
> VMs larger than 8 TiB of memory. The value of the offset is calculated
> to be equal to the additional space required to be reserved between the tables
> in order to accomodate more DIMM devices without the table memories colliding.

s/DIMM devices/DIMM entries/

not sure what 'table memories colliding' is, maybe rephrase and
be more accurate about what happens here.

> In normal cases where the VM memory is smaller or equal to 8 TiB, this offset
> value is 0. Hence in this case, no additional memory space is reserved and
> table addresses remain as before.
> 
> Since table addresses are altered for large memory VMs, this change can break
> migration in those cases. However, in those situations, qemu crashes anyway
> without this fix and hence we do not preserve the old bug by introducing
> compat knobs/machine types.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2023977
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  hw/smbios/smbios.c | 19 +++++++++++++++----
>  1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 56b412ce35..d7de740363 100644
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
> +         * table 17 and table 19 so that they do not overlap. For example,

it's not tables that overlap, but something else

> +         * for a VM with larger than 8 TB guest memory and DIMM size of 16 GiB,
> +         * the default space between the two tables (T19_BASE - T17_BASE = 512)
> +         * is not enough.
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

other than used language/terminology, the rest looks fine tom


