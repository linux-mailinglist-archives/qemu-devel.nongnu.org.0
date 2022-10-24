Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A8B60BC47
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 23:34:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on4CM-0006PJ-0t; Mon, 24 Oct 2022 16:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1on4CJ-0006Oi-Ry
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:37:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1on4CH-0005ZX-S0
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 16:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666643840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xfQjFCtVQHtaxVu1MhKgrKagY5O7rpEyrfpGQfYwG3s=;
 b=VLsAqmQchjylgOVxuQOOovEgJQSqkP9u6CS2EuAqFcJm0E/Iwo9UWM/0alIksCtVUPxI/J
 fhfOmIbM7n1slyy/oAZOnv54qw13UQVtouDZs9SFz8KUILB92ryCxtcAoRPirqskEFo8cQ
 ebdhjoQt4Zesik4E2Sdsa//jZdwLgzU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-221-tp7YOjVqNJStXFOyCgbuOQ-1; Mon, 24 Oct 2022 16:37:19 -0400
X-MC-Unique: tp7YOjVqNJStXFOyCgbuOQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 h26-20020adfaa9a000000b002364ad63bbcso3844054wrc.10
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 13:37:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfQjFCtVQHtaxVu1MhKgrKagY5O7rpEyrfpGQfYwG3s=;
 b=ls9JbP+75Rp4+KnswpwhDJFvOlu03/8dhh5vh18RKS3z6oDF/Gqm9hzUL0lRYzuoUm
 81r/EuwKQIPicTvHzwlJP5fUTES8fCINBnctJs73gIOdOgvFbhja11F0AuBF9mlXKly1
 rJosk37UYgNS/FGX5ZVWDJxXsiFbzQO6DJwW+SFVpfHEp1JcyR6qI/aD5SF0cfUNDp1A
 LCP2+wts3s6XhU3gLcJ0M3Oqll7GxE3cjeUaZPohrI6NP4P89oSIFuVKqxJbML0JqN0m
 nRLs9iVWeYFCUytIFROvgFXqoQpxQHxfMpSpXpuRhmUN/JST4HlXbeKqOnpThi00c0Ii
 8PeQ==
X-Gm-Message-State: ACrzQf1qRE3iYHuuxsG3MgMhCm3e/E98I4ILmjxMaP02NID4t6/Ds31L
 GoB1xUE7OGojOqygpTbGv6uMV57SIqwwHqu9sA8D8BNvoZnyT9mWGZ/rOCMqh7iHTEuDjKrUKVW
 nwGpLLt2k7jHJA28=
X-Received: by 2002:a05:600c:314f:b0:3c6:f27d:fa52 with SMTP id
 h15-20020a05600c314f00b003c6f27dfa52mr31029990wmo.20.1666643837889; 
 Mon, 24 Oct 2022 13:37:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6sAhIGBL/A5pLc8O0rTKotLdjuvAhCCqkvbT1mUizFPEhDcKoQCC/z1eT83KJheDwSRjJPUQ==
X-Received: by 2002:a05:600c:314f:b0:3c6:f27d:fa52 with SMTP id
 h15-20020a05600c314f00b003c6f27dfa52mr31029978wmo.20.1666643837655; 
 Mon, 24 Oct 2022 13:37:17 -0700 (PDT)
Received: from redhat.com ([2.54.160.13]) by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003b4ff30e566sm86633wms.3.2022.10.24.13.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 13:37:17 -0700 (PDT)
Date: Mon, 24 Oct 2022 16:37:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 qemu-stable@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Eric DeVolder <eric.devolder@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v2] hw/acpi/erst.c: Fix memory handling issues
Message-ID: <20221024163701-mutt-send-email-mst@kernel.org>
References: <20221024100323-mutt-send-email-mst@kernel.org>
 <20221024154233.1043347-1-lk@c--e.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024154233.1043347-1-lk@c--e.de>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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

On Mon, Oct 24, 2022 at 05:42:33PM +0200, Christian A. Ehrhardt wrote:
> - Fix memset argument order: The second argument is
>   the value, the length goes last.
> - Fix an integer overflow reported by Alexander Bulekov.
> 
> Both issues allow the guest to overrun the host buffer
> allocated for the ERST memory device.
> 
> Cc: Eric DeVolder <eric.devolder@oracle.com
> Cc: Alexander Bulekov <alxndr@bu.edu>
> Cc: qemu-stable@nongnu.org
> Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>


queued, thanks!

> ---
>  hw/acpi/erst.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index df856b2669..aefcc03ad6 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -635,7 +635,7 @@ static unsigned read_erst_record(ERSTDeviceState *s)
>          if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>              rc = STATUS_FAILED;
>          }
> -        if ((s->record_offset + record_length) > exchange_length) {
> +        if (record_length > exchange_length - s->record_offset) {
>              rc = STATUS_FAILED;
>          }
>          /* If all is ok, copy the record to the exchange buffer */
> @@ -684,7 +684,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
>      if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>          return STATUS_FAILED;
>      }
> -    if ((s->record_offset + record_length) > exchange_length) {
> +    if (record_length > exchange_length - s->record_offset) {
>          return STATUS_FAILED;
>      }
>  
> @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
>      if (nvram) {
>          /* Write the record into the slot */
>          memcpy(nvram, exchange, record_length);
> -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
>          /* If a new record, increment the record_count */
>          if (!record_found) {
>              uint32_t record_count;
> -- 
> 2.34.1


