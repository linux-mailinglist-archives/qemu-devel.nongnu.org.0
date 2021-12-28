Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4BF480AA3
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 16:07:57 +0100 (CET)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2E4y-00050s-D7
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 10:07:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dennis.lissov@gmail.com>)
 id 1n2DQC-0005DE-TJ
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 09:25:48 -0500
Received: from [2a00:1450:4864:20::236] (port=39451
 helo=mail-lj1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dennis.lissov@gmail.com>)
 id 1n2DQB-0002GH-2o
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 09:25:48 -0500
Received: by mail-lj1-x236.google.com with SMTP id x4so13417619ljc.6
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 06:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GUfc0YkkmhcdekSITpF31vxFFCiF9qZPhScbvYBicwo=;
 b=Aunxf8xqWaT9UvVbjB1aT9aQWKIqjqLM8DRwX/oZJM5F3jUEvypt6zYMsrvMQlMDFD
 +AykeMxOoLddW+q+z6m/UqcrbT2gN63f+oCZM7PeGd4Y/swWya/HOoM1neI9NHUWgncx
 s2/jGRW+5a7Bwe3i8O6fu9gZMQRN+ZwTK8OljusqSCFqWHzh9uPfF2F4oVIcqIhdJPRg
 /oALczcYV5bg4Y2WhSUBEwQ/W8qdPy7uL7mo5LbzJuSqtAP550BL4FMCZ+o6UscHmpiT
 oFgVUROcSZKdQOJcdkPYpWLcbCjudUxu4kdvq0o7JoqHwzwdeBfA0bi1qPzroFDtsjYR
 Gr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GUfc0YkkmhcdekSITpF31vxFFCiF9qZPhScbvYBicwo=;
 b=F+Sme2WoZXbUyYLj3y1Jet1bNR/Cl9jPNnGdySxazbDInYTFLmFgH7jK4WTpdDJd1I
 1SIHfFZypcmWiGZI6A88t/q6Ao1A8RW4fJuEXngo96AFfifOJCS4i8aO7k/nDIOaE4d7
 OIUohXCev2t9IMZ2kjLviFmllhgtw+f6EtrbK+5x+ckUxYxyRACvQUOJ0AfsoDmK9Ytr
 iIyZzCcbt17oW4WsLHWb4G2gCkIKz9lJFO9xsj9181K2lDeBys3CWr3eZOYKpxoxfjNl
 Jcb9mJYTh24T4f0Hz1tqgdhI6Uk2O8dbp71LNkqW9GeY3vuzOqJViUlqZSNcoNOiQi17
 +j9Q==
X-Gm-Message-State: AOAM532Wy/wR/nXElZG0B3AY+FDbzNIGoklI+TtVbBFeo0IGe2reXEif
 t0wTNVpwvYQju7to/J5mv5giWF5Fs7auFH2z
X-Google-Smtp-Source: ABdhPJzgkqD898TTJbMT7NbQnoV+0nJ8UuzDEQku5Lg6x/BhyQnjnsKj2KrIgvHdCcm/loTj/qZLXA==
X-Received: by 2002:a2e:b5dc:: with SMTP id g28mr10623084ljn.486.1640701542847; 
 Tue, 28 Dec 2021 06:25:42 -0800 (PST)
Received: from dennis-tp.localnet ([185.13.112.121])
 by smtp.gmail.com with ESMTPSA id f22sm1558999ljc.38.2021.12.28.06.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 06:25:42 -0800 (PST)
From: Denis Lisov <dennis.lissov@gmail.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 1/4] acpi: fix QEMU crash when started with SLIC table
Date: Tue, 28 Dec 2021 17:25:41 +0300
Message-ID: <5346724.vFx2qVVIhK@dennis-tp>
In-Reply-To: <20211227193120.1084176-2-imammedo@redhat.com>
References: <20211227193120.1084176-1-imammedo@redhat.com>
 <20211227193120.1084176-2-imammedo@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::236
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=dennis.lissov@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 28 Dec 2021 10:06:12 -0500
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
Cc: Igor Mammedov <imammedo@redhat.com>, dlenski@gmail.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 27 December 2021 22:31:17 MSK Igor Mammedov wrote:
> if QEMU is started with used provided SLIC table blob,
> 
>   -acpitable sig=SLIC,oem_id='CRASH
> ',oem_table_id="ME",oem_rev=00002210,asl_compiler_id="",asl_compiler_rev=00
> 000000,data=/dev/null it will assert with:
> 
>   hw/acpi/aml-build.c:61:build_append_padded_str: assertion failed: (len <=
> maxlen)
> 
> and following backtrace:
> 
>   ...
>   build_append_padded_str (array=0x555556afe320, str=0x555556afdb2e "CRASH
> ME", maxlen=0x6, pad=0x20) at hw/acpi/aml-build.c:61 acpi_table_begin
> (desc=0x7fffffffd1b0, array=0x555556afe320) at hw/acpi/aml-build.c:1727
> build_fadt (tbl=0x555556afe320, linker=0x555557ca3830, f=0x7fffffffd318,
> oem_id=0x555556afdb2e "CRASH ME", oem_table_id=0x555556afdb34 "ME") at
> hw/acpi/aml-build.c:2064 ...
> 
> which happens due to acpi_table_begin() expecting NULL terminated
> oem_id and oem_table_id strings, which is normally the case, but
> in case of user provided SLIC table, oem_id points to table's blob
> directly and as result oem_id became longer than expected.
> 
> Fix issue by handling oem_id consistently and make acpi_get_slic_oem()
> return NULL terminated strings.
> 
> PS:
> After [1] refactoring, oem_id semantics became inconsistent, where
> NULL terminated string was coming from machine and old way pointer
> into byte array coming from -acpitable option. That used to work
> since build_header() wasn't expecting NULL terminated string and
> blindly copied the 1st 6 bytes only.
> 
> However commit [2] broke that by replacing build_header() with
> acpi_table_begin(), which was expecting NULL terminated string
> and was checking oem_id size.
> 
> 1) 602b45820 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> 2)
> Fixes: 4b56e1e4eb08 ("acpi: build_fadt: use
> acpi_table_begin()/acpi_table_end() instead of build_header()") Resolves:
> https://gitlab.com/qemu-project/qemu/-/issues/786
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/core.c       | 4 ++--
>  hw/i386/acpi-build.c | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index 1e004d0078..3e811bf03c 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -345,8 +345,8 @@ int acpi_get_slic_oem(AcpiSlicOem *oem)
>          struct acpi_table_header *hdr = (void *)(u - sizeof(hdr->_length));
> 
>          if (memcmp(hdr->sig, "SLIC", 4) == 0) {
> -            oem->id = hdr->oem_id;
> -            oem->table_id = hdr->oem_table_id;
> +            oem->id = g_strndup(hdr->oem_id, 6);
> +            oem->table_id = g_strndup(hdr->oem_table_id, 8);
>              return 0;
>          }
>      }
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 8383b83ee3..0234fe7588 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -2723,6 +2723,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState
> *machine)
> 
>      /* Cleanup memory that's no longer used. */
>      g_array_free(table_offsets, true);
> +    g_free(slic_oem.id);
> +    g_free(slic_oem.table_id);
>  }
> 
>  static void acpi_ram_update(MemoryRegion *mr, GArray *data)

Tested-by: Denis Lisov <dennis.lissov@gmail.com>



