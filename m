Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 259831C58D5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 May 2020 16:19:41 +0200 (CEST)
Received: from localhost ([::1]:50024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jVyQ8-0002Re-6K
	for lists+qemu-devel@lfdr.de; Tue, 05 May 2020 10:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jVyNA-0007Pz-LW
 for qemu-devel@nongnu.org; Tue, 05 May 2020 10:16:36 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24885
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jVyN9-0004vi-NY
 for qemu-devel@nongnu.org; Tue, 05 May 2020 10:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588688191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5oz5UNNZ+exrzQk6KTn4ulkeDcjXFA92PKpUnZ/kEA=;
 b=Qg1KAtlL5MCeAimiUxyjYOaEnzonKgNVsPb+veYV5JyZwa4v4MyOEZ44CNDHBbhWHyyTFs
 KNcJ/URc3llJ2Ci65LZMt9BWN3ZZdUDZPFFg15A8vXQ7WN/e2l3f0Gmb6nkLmnQtepeTOO
 uc0t9CShnyyoec6BRYYYwP359rLru9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-98ay6OsAOJSan9kMQSBzxw-1; Tue, 05 May 2020 10:16:28 -0400
X-MC-Unique: 98ay6OsAOJSan9kMQSBzxw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 566AC460;
 Tue,  5 May 2020 14:16:27 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09F8564421;
 Tue,  5 May 2020 14:16:15 +0000 (UTC)
Date: Tue, 5 May 2020 16:16:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 04/13] acpi: move acpi_build_facs to acpi-common.c
Message-ID: <20200505161613.10105643@redhat.com>
In-Reply-To: <20200505134305.22666-5-kraxel@redhat.com>
References: <20200505134305.22666-1-kraxel@redhat.com>
 <20200505134305.22666-5-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 00:37:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue,  5 May 2020 15:42:56 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

why do you need FACS with reduced profile?

> ---
>  hw/i386/acpi-common.h |  1 +
>  hw/i386/acpi-build.c  | 11 +----------
>  hw/i386/acpi-common.c |  7 +++++++
>  3 files changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/i386/acpi-common.h b/hw/i386/acpi-common.h
> index 9cac18dddf5b..583c320bbe7d 100644
> --- a/hw/i386/acpi-common.h
> +++ b/hw/i386/acpi-common.h
> @@ -11,5 +11,6 @@
>  void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>                       X86MachineState *x86ms, AcpiDeviceIf *adev,
>                       bool has_pci);
> +void acpi_build_facs(GArray *table_data);
>  
>  #endif
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4cce2192eeb0..a69b85a266e7 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -316,15 +316,6 @@ static void acpi_align_size(GArray *blob, unsigned align)
>      g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
>  }
>  
> -/* FACS */
> -static void
> -build_facs(GArray *table_data)
> -{
> -    AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
> -    memcpy(&facs->signature, "FACS", 4);
> -    facs->length = cpu_to_le32(sizeof(*facs));
> -}
> -
>  static void build_append_pcihp_notify_entry(Aml *method, int slot)
>  {
>      Aml *if_ctx;
> @@ -2417,7 +2408,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>       * requirements.
>       */
>      facs = tables_blob->len;
> -    build_facs(tables_blob);
> +    acpi_build_facs(tables_blob);
>  
>      /* DSDT is pointed to by FADT */
>      dsdt = tables_blob->len;
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index ab9b00581a15..5187653893a8 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -154,3 +154,10 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>                   table_data->len - madt_start, 1, NULL, NULL);
>  }
>  
> +/* FACS */
> +void acpi_build_facs(GArray *table_data)
> +{
> +    AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
> +    memcpy(&facs->signature, "FACS", 4);
> +    facs->length = cpu_to_le32(sizeof(*facs));
> +}


