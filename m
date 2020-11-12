Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A652B0163
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 09:57:33 +0100 (CET)
Received: from localhost ([::1]:44884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd8Q8-0001QX-2a
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 03:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kd8PF-0000zp-3Y
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 03:56:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kd8PB-0006Rm-Ai
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 03:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605171391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CgWNb/sGPYL2bN4nPWB8MVhHOfyI8DPpbA8arlZrpQ0=;
 b=i9kQq+2NkOhPIAZ7O/t02DFDD76q42KVKPiIJ/onG1Ug3U1UXVnz3as3wJeo1lguPyPmNk
 ZzFNfYXr0E0Zou5esF1bHFGB8tHW9ukIanf71bb49TIdu21TJAHWLtn8rkI4eUf/vrH9GE
 lLfevx5ZCtxYLrD++w4IiBOpt0+obag=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-LxbjdZ2-OyCooCSBjd0ayw-1; Thu, 12 Nov 2020 03:56:26 -0500
X-MC-Unique: LxbjdZ2-OyCooCSBjd0ayw-1
Received: by mail-wr1-f70.google.com with SMTP id y2so1640375wrl.3
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 00:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CgWNb/sGPYL2bN4nPWB8MVhHOfyI8DPpbA8arlZrpQ0=;
 b=f5oJmk5rFHmGvdKS+2nrBa+4CIoa315cQuG3gu25KzFH0yetnNoMt4D08Gr0CCiyVD
 w4uy+4Y+9tolqEHzCcGgO/YVLWmUtAtN42seH4QgoDXsThIqZvbA/WZLiDO9oqbloW5t
 xethlez33EYorgak5XK5Arqj1Y9428JEZc7aIiadvWOi5MMcLt2akW4U+ilUm6WQz1MV
 NWOQEpfw8ZIED13QlQjzWjFjEdcBQ3hm3Q1372N/L6bnywaEuVlkTvPo6AuwH+++z9ol
 iMUVzb8DZCEcmclzesOUeTXvLkTpr/wj73D2BC5cwKIkA/yq93zRyNuGngx4Ok4EOdCT
 fzZQ==
X-Gm-Message-State: AOAM531igtTmMpTN4utfzU10SfH8ObPKqHjlLXjRz2N9V4yfPX17KqkJ
 +4O0FMIgmO00Y4wwtfJEMH6ArkOdZ2Jc9opJ5aTOxpqu/Pf7kvLEAHWKnI/iHuE9J07J0Z4wV5y
 jAeDHogEj30aZWww=
X-Received: by 2002:a1c:2c2:: with SMTP id 185mr8554634wmc.103.1605171385346; 
 Thu, 12 Nov 2020 00:56:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEf88W9GZeGYLErBaaBYpMKKCqC5m8EedFMNEdv26mD7b5jVcI7m49erEJKqMJCKmTg3qa3g==
X-Received: by 2002:a1c:2c2:: with SMTP id 185mr8554608wmc.103.1605171385155; 
 Thu, 12 Nov 2020 00:56:25 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id d16sm5841627wrw.17.2020.11.12.00.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 00:56:24 -0800 (PST)
Date: Thu, 12 Nov 2020 03:56:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peng Liang <liangpeng10@huawei.com>
Subject: Re: [PATCH v2] ACPI: Avoid infinite recursion when dump-vmstate
Message-ID: <20201112035613-mutt-send-email-mst@kernel.org>
References: <20201112020638.874515-1-liangpeng10@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201112020638.874515-1-liangpeng10@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 00:51:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: imammedo@redhat.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 10:06:38AM +0800, Peng Liang wrote:
> There is a field with vmstate_ghes_state as vmsd in vmstate_ghes_state,
> which will lead to infinite recursion in dump_vmstate_vmsd.
> 
> Fixes: a08a64627b ("ACPI: Record the Generic Error Status Block address")
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> Acked-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  hw/acpi/generic_event_device.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 6df400e1ee16..5454be67d5f0 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -322,6 +322,16 @@ static const VMStateDescription vmstate_ged_state = {
>      }
>  };
>  
> +static const VMStateDescription vmstate_ghes = {
> +    .name = "acpi-ghes",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields     = (VMStateField[]) {
> +        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
>  static bool ghes_needed(void *opaque)
>  {
>      AcpiGedState *s = opaque;
> @@ -335,7 +345,7 @@ static const VMStateDescription vmstate_ghes_state = {
>      .needed = ghes_needed,
>      .fields      = (VMStateField[]) {
>          VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
> -                       vmstate_ghes_state, AcpiGhesState),
> +                       vmstate_ghes, AcpiGhesState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> -- 
> 2.26.2


