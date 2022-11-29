Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 457FF63BFE2
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 13:17:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozzWK-0005Gc-ON; Tue, 29 Nov 2022 07:15:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozzW0-0005Dp-QS
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:15:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ozzVy-0004uf-AR
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 07:15:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669724100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8CHeB8QIsBbLDuJ1eha+3rH7tY+61gYN6upb1AfT7Vg=;
 b=KWH76k/D12ZlEOF3HrWf9qMmllZpKZK8zZJVLmfaLd3xeenSRdYQQZ2oOOVMsPw1/Ble0R
 b5sg/oq39L2YkESCJCpeJeZwHsPXcKV8LACTHW+hU+bEq8xI6CqdBU6Bk6z6r/69KU8B8/
 IultKGhk7Sgoe0HDhBAOP32AadGAHjY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-333-0QBZf2BTOxKyb_SBEzErDQ-1; Tue, 29 Nov 2022 07:14:58 -0500
X-MC-Unique: 0QBZf2BTOxKyb_SBEzErDQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 d4-20020adfa404000000b002421ca8cb07so1284938wra.2
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 04:14:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8CHeB8QIsBbLDuJ1eha+3rH7tY+61gYN6upb1AfT7Vg=;
 b=FwNMpV1X3IuzN1LZt9KQ9dk2AlVqpa3V+DuLQy1bcW9VqjKu035rE56oAloHQ3DSjw
 mdSn678bnMY/VzGUW7+gSJF0pRxPvIkaSaF8eXxJCAz9oBztsFW32kFSSF9e3I4L/BZR
 5Tqg1D8+S1QaefCOaBKqDMWwF46cNaR46d9RTzXT62flprirtG4sZoYLZMU1zyeB9dTm
 vlIydBzgnXhM8P+t52HkKjo9VlPyqc79V0KDbh/36NUWz1SuvHdzfHM1QrBI0zKSOryx
 7Y99SBLIjOVbFaJHiT+/09lEyrsvD0svxFozIsZfvtt18XHJQwuEExg9j8mwQBaZHHIu
 agqQ==
X-Gm-Message-State: ANoB5pkJC6atltchpZuQYUIJSxpYXxcc7YdlvBSpcfMCQQF8zNQNcy0a
 csrQ0kSzYM1ZyEpB20XYiSjn2oJuV78wq3fJ1qB+VoB87k4b8oBM5N8TralXQq6W8V5DG7Georj
 euExqun91AiY36Cw=
X-Received: by 2002:a05:600c:304a:b0:3cf:9d6c:6302 with SMTP id
 n10-20020a05600c304a00b003cf9d6c6302mr28224977wmh.164.1669724097658; 
 Tue, 29 Nov 2022 04:14:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6HFf+3SNkK14H4nySbeTsFsG5kgfKxeLq8OZ4P5xKtSVGOEMJ/3VCvDgoozVugYQ8wGcFEZw==
X-Received: by 2002:a05:600c:304a:b0:3cf:9d6c:6302 with SMTP id
 n10-20020a05600c304a00b003cf9d6c6302mr28224953wmh.164.1669724097429; 
 Tue, 29 Nov 2022 04:14:57 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b003b4c979e6bcsm2086032wms.10.2022.11.29.04.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 04:14:56 -0800 (PST)
Date: Tue, 29 Nov 2022 12:14:54 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, marcel.apfelbaum@gmail.com
Subject: Re: [PATCH 08/12] pci: Fix silent truncation of
 pcie_aer_inject_error argument
Message-ID: <Y4X3vt1M+boYDm7Q@work-vm>
References: <20221128080202.2570543-1-armbru@redhat.com>
 <20221128080202.2570543-9-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128080202.2570543-9-armbru@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Markus Armbruster (armbru@redhat.com) wrote:
> PCI AER error status is 32 bit.  When the HMP command's second
> argument parses as a number, values greater than ULONG_MAX get
> rejected, but values between UINT32_MAX+1 and ULONG_MAX get silently
> truncated.  Fix to reject them, too.
> 
> While there, use qemu_strtoul() instead of strtoul() so checkpatch.pl
> won't complain.

WOuldn't qemu_strtoui do the num > UINT32_MAX for you?

Dave

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/pci/pcie_aer.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index eff62f3945..ccca5a81cc 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -30,6 +30,7 @@
>  #include "hw/pci/pci_bus.h"
>  #include "hw/pci/pcie_regs.h"
>  #include "qapi/error.h"
> +#include "qemu/cutils.h"
>  
>  //#define DEBUG_PCIE
>  #ifdef DEBUG_PCIE
> @@ -963,6 +964,7 @@ static int do_pcie_aer_inject_error(Monitor *mon,
>      const char *id = qdict_get_str(qdict, "id");
>      const char *error_name;
>      uint32_t error_status;
> +    unsigned long num;
>      bool correctable;
>      PCIDevice *dev;
>      PCIEAERErr err;
> @@ -983,14 +985,14 @@ static int do_pcie_aer_inject_error(Monitor *mon,
>  
>      error_name = qdict_get_str(qdict, "error_status");
>      if (pcie_aer_parse_error_string(error_name, &error_status, &correctable)) {
> -        char *e = NULL;
> -        error_status = strtoul(error_name, &e, 0);
> -        correctable = qdict_get_try_bool(qdict, "correctable", false);
> -        if (!e || *e != '\0') {
> +        if (qemu_strtoul(error_name, NULL, 0, &num) < 0
> +            || num > UINT32_MAX) {
>              monitor_printf(mon, "invalid error status value. \"%s\"",
>                             error_name);
>              return -EINVAL;
>          }
> +        error_status = num;
> +        correctable = qdict_get_try_bool(qdict, "correctable", false);
>      }
>      err.status = error_status;
>      err.source_id = pci_requester_id(dev);
> -- 
> 2.37.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


