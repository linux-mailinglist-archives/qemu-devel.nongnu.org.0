Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6056B679539
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 11:31:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKGZb-0001vt-HW; Tue, 24 Jan 2023 05:30:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKGZa-0001vl-0P
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 05:30:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pKGZY-0003Ig-H9
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 05:30:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674556235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XNlBQMxC/ZWTxP5w2DLPrkm+B3GMpDCeD6q04Um8jRY=;
 b=ewD5dJMaodFFk0zgrTL33JG4nPm2WQKRgElrzIN4WoRlMm6h2rjDGNgjGLL97tM3Asb3jf
 c5dshv0juhVqP8oq1B+XVVvmLI8q3HCN6WNiahNCjT+PR+6IosOv/d4QZ4smjI7EQFyKre
 nfU3i6cOH7fLayO4Of9Kc889StCO/Zg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-lJDMvuS2N1GsrWTGbePaow-1; Tue, 24 Jan 2023 05:30:34 -0500
X-MC-Unique: lJDMvuS2N1GsrWTGbePaow-1
Received: by mail-qk1-f200.google.com with SMTP id
 br6-20020a05620a460600b007021e1a5c48so10627496qkb.6
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 02:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XNlBQMxC/ZWTxP5w2DLPrkm+B3GMpDCeD6q04Um8jRY=;
 b=t7XQl11TVTVbpx+thgp6jg58OZC/DG5MeVfh3AvwyEVAYppF62FpV0cLx2U6Wzvqe0
 6FytdO73WzqU7aI+6XRxeI0GB6s4iiqxtP+4Wy/VhGWEh39ulKdNyFt+m+AsGrlXm/p3
 WHl4DKxDn1n/GEKsdSfAbEOuYqY3Cp/1YOmVmdPBJFmiMBGJkB3P3Sj+QGAyW9hwtVE3
 w4sv9bS/vcwWe9qb27Wa5yRNzHC4Ma7OKrEvzyx+RKeq9wtE8GBkpyqclI/wcX+OSR/J
 zRg1DlY7XYUeyC8FRCol3iSMIBqKBeGMf8T4fcZi3Bl3QGxcC+68NZrF8jqRsFCvfFNl
 k44A==
X-Gm-Message-State: AFqh2kqw7mRrlbWCOrEsBfJbFrcN1MsC7So7q0OYCluIRYe4bYeYQVGB
 kbQDmMT3PClnZc06itv274CX7Bh4xHgeezMpZlc6Z/Vcih8bxkyLy0FnHzLUR2FGRWuZ7MXxbdd
 VYtGFNa3swfXKAQo=
X-Received: by 2002:a0c:e7ca:0:b0:537:4b24:7fba with SMTP id
 c10-20020a0ce7ca000000b005374b247fbamr22237511qvo.28.1674556233541; 
 Tue, 24 Jan 2023 02:30:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvDST+M/X9Fu/JIMqyIIoT6550U8Mw/TvFtiBpkXcc1/z5PpBJ37M0gu86CKO4fujU8mOMbTA==
X-Received: by 2002:a0c:e7ca:0:b0:537:4b24:7fba with SMTP id
 c10-20020a0ce7ca000000b005374b247fbamr22237483qvo.28.1674556233233; 
 Tue, 24 Jan 2023 02:30:33 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 l123-20020a37bb81000000b006fb8239db65sm1195410qkf.43.2023.01.24.02.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 02:30:32 -0800 (PST)
Date: Tue, 24 Jan 2023 11:30:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Sun Feng <loyou85@gmail.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, ani@anisinha.ca
Subject: Re: [PATCH] acpi: Set maximum size to 64k for "etc/acpi/rsdp" blob
Message-ID: <20230124113029.7a02e5ff@imammedo.users.ipa.redhat.com>
In-Reply-To: <1673954121-23942-1-git-send-email-loyou85@gmail.com>
References: <1673954121-23942-1-git-send-email-loyou85@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 17 Jan 2023 19:15:21 +0800
Sun Feng <loyou85@gmail.com> wrote:

> Migrate from aarch64 host with PAGE_SIZE 64k to 4k failed with following errors:
> 
> qmp_cmd_name: migrate-incoming, arguments: {"uri": "tcp:[::]:49152"}
> {"timestamp": {"seconds": 1673922775, "microseconds": 534702}, "event": "MIGRATION", "data": {"status": "setup"}}
> {"timestamp": {"seconds": 1673922776, "microseconds": 53003}, "event": "MIGRATION", "data": {"status": "active"}}
> 2023-01-17T02:32:56.058827Z qemu-system-aarch64: Length too large: /rom@etc/acpi/rsdp: 0x10000 > 0x1000: Invalid argument

this should mention/explain why it's happening.

i.e we now have 4k limit for RSDP, but then source somehow managed to start with 64k
allocated to for RSDP. It looks like limit isn't working as expected to me.

> 2023-01-17T02:32:56.058832Z qemu-system-aarch64: error while loading state for instance 0x0 of device 'ram'
> 2023-01-17T02:32:56.059236Z qemu-system-aarch64: load of migration failed: Invalid argument
> {"timestamp": {"seconds": 1673922776, "microseconds": 59248}, "event": "MIGRATION", "data": {"status": "failed"}}
> 2023-01-17 02:32:56.306+0000: shutting down, reason=failed
> 
> refer to the following commit, set blob "etc/acpi/rsdp" maximum size to 64k works.
> 
> 5033728 acpi: Set proper maximum size for "etc/acpi/rsdp" blob
> 6c2b24d acpi: Set proper maximum size for "etc/table-loader" blob
> 
> Signed-off-by: Sun Feng <loyou85@gmail.com>
> ---
>  hw/acpi/utils.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/utils.c b/hw/acpi/utils.c
> index 0c486ea..85f6ff3 100644
> --- a/hw/acpi/utils.c
> +++ b/hw/acpi/utils.c
> @@ -37,7 +37,7 @@ MemoryRegion *acpi_add_rom_blob(FWCfgCallback update, void *opaque,
>      } else if (!strcmp(name, ACPI_BUILD_LOADER_FILE)) {
>          max_size = 0x10000;
>      } else if (!strcmp(name, ACPI_BUILD_RSDP_FILE)) {
> -        max_size = 0x1000;
> +        max_size = 0x10000;
>      } else {
>          g_assert_not_reached();
>      }


