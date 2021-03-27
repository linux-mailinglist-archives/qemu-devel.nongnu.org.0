Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE06C34B774
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 14:58:34 +0100 (CET)
Received: from localhost ([::1]:49202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQ9ST-0001HR-8t
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 09:58:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQ9RN-0000ro-V2
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 09:57:25 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lQ9RM-0005NW-E7
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 09:57:25 -0400
Received: by mail-oi1-f181.google.com with SMTP id m13so8640840oiw.13
 for <qemu-devel@nongnu.org>; Sat, 27 Mar 2021 06:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7V7mYp8iKZ6TgtA1E484Y8k0j678mzYx66d474JGGEY=;
 b=WrXWKf79bGSTHvhDd4ZhgwWDOtUhf6gHDX5pAbl2Soq4frkZ0mosbqXzaJ2ipGQ11B
 GFRkNFhXqZbgcp35/+PXDOZYfW7vA2+oKNP+L9GfXBMr6Ps/BZ2lGo4R5e1ZdxghZLaK
 vdSw4ie24SE+I6F5/BXvmRk8siy1wVI1iAV2AjWFBlZWKPuBCF9xX2Ip7CTIHzmb5DZR
 deh6feeivX13sRD6Y/asgRqu02it+F36xeWiPkF6KTmTSFjf0+iO901wzjHIWgA8FwZt
 3OINqU7KISXOKwRLDdFbV2/Hofs0oOjGjMHT4LTWSxc3ouehf4C8WMkKrvwQxDOBKnc3
 yaNA==
X-Gm-Message-State: AOAM530EakkorUZluSPs/woPJdgjKXoQT8C5+YuwGb0ZLLALeppMZZvx
 j2eyhhWSQ1iEGkgUzC90VT6oA8uax1ZHh7ELoGU=
X-Google-Smtp-Source: ABdhPJyheprmRGrZTWzmnZ+bc5Orv2y3CZXtbKP0z8qtGXOWK/CLqmkc+tafLQl3j/kaJlDYAt5rW99Dus+K4G7gzm0=
X-Received: by 2002:aca:bb06:: with SMTP id l6mr13192093oif.121.1616853443306; 
 Sat, 27 Mar 2021 06:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20180405012241.25714-1-f4bug@amsat.org>
 <20180405012241.25714-4-f4bug@amsat.org>
In-Reply-To: <20180405012241.25714-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 27 Mar 2021 14:57:12 +0100
Message-ID: <CAAdtpL4DPzLhr76JCibG=VTQWsVg8Y-zchzQApjkoEPTePRzmQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] memory: Fix memory_region 'priority' property sign
To: Paolo Bonzini <pbonzini@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, 
 KONRAD Frederic <frederic.konrad@adacore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.181;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f181.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On Thu, Apr 5, 2018 at 3:23 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Priorities can be negative, fix this limitation.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/memory.c b/memory.c
> index e77f9e4036..eaa5fa7f23 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -1258,7 +1258,7 @@ static void memory_region_initfn(Object *obj)
>                          memory_region_get_addr,
>                          NULL, /* memory_region_set_addr */
>                          NULL, NULL, &error_abort);
> -    object_property_add(OBJECT(mr), "priority", "uint32",
> +    object_property_add(OBJECT(mr), "priority", "int32",
>                          memory_region_get_priority,
>                          NULL, /* memory_region_set_priority */
>                          NULL, NULL, &error_abort);
> --
> 2.16.3
>

