Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDCB68C5CE
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:31:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6Gh-0003tE-Gy; Mon, 06 Feb 2023 13:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pP6GR-0003su-Dd
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:30:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pP6GN-0001yY-Sa
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675708245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9RfjlJ3LA5BJBdNgE9yiDeovJKarS9gDDkuQuGnsUbE=;
 b=D0fdqvQYVq2HV++rnuUgYXOpq3GLMW+HogpGYAtCyARpZDow/ZLVTm1yEkwJKGdO6riXPV
 FuSmnaWGEbqqrVUelwS3XGbuDe9dDVIBRQc2siCamir3LVriaa7+fwFmG8DOeBmOE4mj3E
 ey1Qvi5YQ34zkktuDL/bBhLDhxewKvU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-0sYwlXM8OuOgKHhfeNifJQ-1; Mon, 06 Feb 2023 13:30:44 -0500
X-MC-Unique: 0sYwlXM8OuOgKHhfeNifJQ-1
Received: by mail-pg1-f199.google.com with SMTP id
 h16-20020a63df50000000b004f74bc0c71fso3117485pgj.18
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 10:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9RfjlJ3LA5BJBdNgE9yiDeovJKarS9gDDkuQuGnsUbE=;
 b=vviZzJRPdSHLd1UzEnq7bTldCSKWP2H+0QPSZYeo/KoiXqrGZnZWbuR/fLQnaFsdxE
 EDiQS+F8Al9Z00coYQuqnkG6CVIMYQJilNwTEzpmlZYMrm611955MPqhRQyhYO5k81sW
 gQb3W8/W4lrEOyfti1GNxRlfOV0wyoNFOoDFvYfFSVSYG8agBI1EctpnygJbOFlYzCNM
 9EaljJdJf50xH/eQcNgsTuPEQj80VcaahMdcCE6/Z27sWqsGBNqwSS8nSkWkOG26yJ2W
 8Wp6TrJrMAmTlYWvrrPxIlQPJbcIHYiLhBjZ9jDq4rdr5iQYQqj69ccuj5/wkujcTOkI
 ekIQ==
X-Gm-Message-State: AO0yUKW6GhDppNoW1mJduXSYm4Hr+wI4eqmFvPiSSMfx0u9nbzfypKUc
 hHvtl8HOPcjgKbdSbZeAGOx2V1LxeWEEu9yHTOAg2O8jP9WhaZytcRco7F1UGKPlGofbNjdXRIZ
 PNIPhYYFzUmDEMiBbnR+Fd5BN8iK5+tU=
X-Received: by 2002:a17:90a:4d4b:b0:22b:faf6:fed6 with SMTP id
 l11-20020a17090a4d4b00b0022bfaf6fed6mr164221pjh.64.1675708242846; 
 Mon, 06 Feb 2023 10:30:42 -0800 (PST)
X-Google-Smtp-Source: AK7set8HiCacuFT/lplp1DQQgkx9FtngAgxDsL/SiIQMlZ1f9AKK8pozLyOlvFR+bkL197M6Ce3TT8lLmrFRRScFubU=
X-Received: by 2002:a17:90a:4d4b:b0:22b:faf6:fed6 with SMTP id
 l11-20020a17090a4d4b00b0022bfaf6fed6mr164214pjh.64.1675708242638; Mon, 06 Feb
 2023 10:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20230206182544.711117-1-jsnow@redhat.com>
In-Reply-To: <20230206182544.711117-1-jsnow@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 6 Feb 2023 13:30:31 -0500
Message-ID: <CAFn=p-Z6FNkg3hFhCtMqPSUAWdUwuv976LY++Li87bEAi9UteA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Mark IDE and Floppy as "Odd Fixes"
To: qemu-devel@nongnu.org
Cc: Lev Kujawski <lkujaw@mailbox.org>, Bernhard Beschow <shentey@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

On Mon, Feb 6, 2023 at 1:25 PM John Snow <jsnow@redhat.com> wrote:
>
> I have not been able to give these devices the love they need for a
> while now. Update the maintainers file to reflect the truth of the
> matter.

I have not been able to give these devices the love they need for a
while now. My backlog is considerable, and the time I am able to
dedicate to ensuring that fixes don't break legacy operating systems is
slim. My native understanding of older operating systems and legacy
software is also quite sparse. Since the pandemic started, I haven't had
any access to any physical hardware to validate our emulation, either.

I need more expertise in verifying and validating that patches to these
systems to not harm older operating systems. If you know of any
automated (or semi-automated) tests that can be used as a test suite to
help validate that new patches don't regress support, I'd love to
discuss it.

Help Wanted, please! I don't want to keep letting people down over my
inability to give proper attention to these devices.

>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa10ecaeb94..97d0f2fdc8f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1784,7 +1784,7 @@ F: hw/misc/edu.c
>  IDE
>  M: John Snow <jsnow@redhat.com>
>  L: qemu-block@nongnu.org
> -S: Supported
> +S: Odd Fixes
>  F: include/hw/ide.h
>  F: include/hw/ide/
>  F: hw/ide/
> @@ -1809,7 +1809,7 @@ T: git https://github.com/cminyard/qemu.git master-ipmi-rebase
>  Floppy
>  M: John Snow <jsnow@redhat.com>
>  L: qemu-block@nongnu.org
> -S: Supported
> +S: Odd Fixes
>  F: hw/block/fdc.c
>  F: hw/block/fdc-internal.h
>  F: hw/block/fdc-isa.c
> --
> 2.39.0
>


