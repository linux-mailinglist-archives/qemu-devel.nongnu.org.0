Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCEE4BEB55
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 20:47:58 +0100 (CET)
Received: from localhost ([::1]:59982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMEf7-0005wF-At
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 14:47:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMEcR-0004Cn-HS
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nMEcN-0006OA-V5
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 14:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645472707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9F1egPL9RpC4qoEB4a8Rdu1ErosskkVT64zEA6xL3/Q=;
 b=isfajDXKX8CcLvO1jto7l8wWKYIocH2J7tP/W2wniViD70xlIkgbi8TKVELf3XTKAWuX2I
 mtQSdla8sCOpuWSGiFdDbfm7dQovChdf8RlyrbOd899HGpKKgf4b00uXqbEwnWSR8Y6Fzm
 dN5GJXfsKkWG4GV6fui9A6Fiv5AsTS4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-FkAthF_GO-6woCJb7JLW6Q-1; Mon, 21 Feb 2022 14:45:04 -0500
X-MC-Unique: FkAthF_GO-6woCJb7JLW6Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 u14-20020a05600c210e00b0037bddd0562eso7160wml.1
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 11:45:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9F1egPL9RpC4qoEB4a8Rdu1ErosskkVT64zEA6xL3/Q=;
 b=aiNDWrbzZWtrlDc65Hk/mMGgy6dl1qy1Gq8eGMOm4zsTu/29K38S1snR5QeM2UJ9Sk
 jehK2tOTbKjX//M1W2d6E++BhY17qXAG9aWwRustknZ5QNPkNCqbOb8XthK+rO5SuDuQ
 N6cUN1GzZ2JfOCHvspQvq9W1QkLMynfgceeCwlrMCueG5Sw5X2kwOhw/YMh9A39GFnqS
 tLGqQ8WgYvnbwvsat+SBucWPkpL0Wm3hjACEt81YRKKRFuOpvTsvXztK/CO5dtaC5HdN
 r76H0ftF1BGRGmml7MeFeq5rh//Oea5SvdmJcdBrek61m4DD+cDttYoIj5JSS6Bf5elt
 hVUw==
X-Gm-Message-State: AOAM532T82xMx6BR5+I5v66GGA9ftymq6L4PZ1VFF8ynWMCSLiDqA6yO
 9J5Tb1XaZGgFlYkAm2s4L00K7I2I9YjTSWWPn+YcZPKkQOx0JSK6yTT5N30UKC+HOreYm/2ZQsX
 +L9hLn5YMNaRZYlU=
X-Received: by 2002:a7b:c4ce:0:b0:37c:49b:403d with SMTP id
 g14-20020a7bc4ce000000b0037c049b403dmr467545wmk.90.1645472703097; 
 Mon, 21 Feb 2022 11:45:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzY48eGlee4obgnOS9xYS1/lB32N7pXuAIDy6WleRbgvsEtXsZaKtXbekuaxmyicKSqU/CFcw==
X-Received: by 2002:a7b:c4ce:0:b0:37c:49b:403d with SMTP id
 g14-20020a7bc4ce000000b0037c049b403dmr467522wmk.90.1645472702846; 
 Mon, 21 Feb 2022 11:45:02 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id d6sm50428395wrs.85.2022.02.21.11.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:45:01 -0800 (PST)
Date: Mon, 21 Feb 2022 19:44:58 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v2] hw/i386: Improve bounds checking in OVMF table parsing
Message-ID: <YhPrug59i7U0BUao@work-vm>
References: <20220216064024.153423-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220216064024.153423-1-dovmurik@linux.ibm.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dov Murik (dovmurik@linux.ibm.com) wrote:
> When pc_system_parse_ovmf_flash() parses the optional GUIDed table in
> the end of the OVMF flash memory area, the table length field is checked
> for sizes that are too small, but doesn't error on sizes that are too
> big (bigger than the flash content itself).
> 
> Add a check for maximal size of the OVMF table, and add an error report
> in case the size is invalid.  In such a case, an error like this will be
> displayed during launch:
> 
>     qemu-system-x86_64: OVMF table has invalid size 4047
> 
> and the table parsing is skipped.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> 
> ---
> 
> v2:
> - add error message example to commit description
> - replace magic numbers 48 and 50 with size calculations (thanks Phil MD)
> ---
>  hw/i386/pc_sysfw_ovmf.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i386/pc_sysfw_ovmf.c b/hw/i386/pc_sysfw_ovmf.c
> index f4dd92c588..1c9a16e9e6 100644
> --- a/hw/i386/pc_sysfw_ovmf.c
> +++ b/hw/i386/pc_sysfw_ovmf.c
> @@ -24,11 +24,14 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "hw/i386/pc.h"
>  #include "cpu.h"
>  
>  #define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
>  
> +static const int bytes_after_table_footer = 32;
> +
>  static bool ovmf_flash_parsed;
>  static uint8_t *ovmf_table;
>  static int ovmf_table_len;
> @@ -38,6 +41,8 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>      uint8_t *ptr;
>      QemuUUID guid;
>      int tot_len;
> +    int max_tot_len = flash_size - (bytes_after_table_footer +
> +                                    sizeof(guid) + sizeof(uint16_t));
>  
>      /* should only be called once */
>      if (ovmf_flash_parsed) {
> @@ -52,12 +57,13 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>  
>      /*
>       * if this is OVMF there will be a table footer
> -     * guid 48 bytes before the end of the flash file.  If it's
> -     * not found, silently abort the flash parsing.
> +     * guid 48 bytes before the end of the flash file
> +     * (= 32 bytes after the table + 16 bytes the GUID itself).
> +     * If it's not found, silently abort the flash parsing.
>       */
>      qemu_uuid_parse(OVMF_TABLE_FOOTER_GUID, &guid);
>      guid = qemu_uuid_bswap(guid); /* guids are LE */
> -    ptr = flash_ptr + flash_size - 48;
> +    ptr = flash_ptr + flash_size - (bytes_after_table_footer + sizeof(guid));
>      if (!qemu_uuid_is_equal((QemuUUID *)ptr, &guid)) {
>          return;
>      }
> @@ -66,7 +72,13 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>      ptr -= sizeof(uint16_t);
>      tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);

Instead of the max_tot_len calculation above, is it actually:
   max_tot_len = ptr - flash_ptr;

I think that works out the same and avoids doing the calculation in two
places; it's also logically what you have - you can't read over the
structure you just read.

Dave

> -    if (tot_len <= 0) {
> +    if (tot_len < 0 || tot_len > max_tot_len) {
> +        error_report("OVMF table has invalid size %d", tot_len);
> +        return;
> +    }
> +
> +    if (tot_len == 0) {
> +        /* no entries in the OVMF table */
>          return;
>      }
>  
> 
> base-commit: 48033ad678ae2def43bf0d543a2c4c3d2a93feaf
> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


