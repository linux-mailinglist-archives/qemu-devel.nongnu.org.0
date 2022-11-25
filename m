Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D01D638E32
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 17:23:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oybTv-0007VK-6z; Fri, 25 Nov 2022 11:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oybTr-0007Uq-3W
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 11:23:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1oybTp-0005Ju-2V
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 11:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669393385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YWCXUI8hlBFCK52qSc7sFMKGGauxIB+5P+I0n0zzbuc=;
 b=LSCT9IZ1CEOxgjFe+WrssHn0xgJ+6ovIqy0sJKGXubV5ZbybyX5DyP6i3Of6+m1ReOAQpr
 q/suEfgisGs3DbWt4NZ/uhcEJ/VykoKZiX4fHB+f8zgVozDaXBYMIuuoM4jWm9Nd6XuebS
 1RWFXrNlW1AKNWGotnyyWWzIeQfHxSs=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-MSMHnI22Nz6pukDpOKvOCg-1; Fri, 25 Nov 2022 11:23:04 -0500
X-MC-Unique: MSMHnI22Nz6pukDpOKvOCg-1
Received: by mail-oi1-f200.google.com with SMTP id
 p133-20020acaf18b000000b0035b236c8554so1751867oih.15
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 08:23:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YWCXUI8hlBFCK52qSc7sFMKGGauxIB+5P+I0n0zzbuc=;
 b=8EBbhyJgt1RTbHjwPb93fbO/9f7vWbdkWIMKzZ1JHcVV0k89AKlU5DMIdGDau1L8/z
 WAabaeajP1gGoH4umIuE3HaA2mftfVgglO+7bHCc2U0Lh8sdhxqBns/Se8Fqoc1cumZl
 Q2LoDJzSmuXXOxvxDfMbuXx25TGJe5eqJ0RQh0KwyzYQqpe8hqVF10Sl0Qv68vLNsCvE
 wIryHyCHnumaLzBMq/5JV78JLTahRzavCtqkbdIVkaqJXxyLsFIS2YxcNMyXY5+WmU9K
 2KEfMrYwII5QtcvBAMqXHxEBCDsOIT6kCTnGueQoqJrIpjj02kUJyQfanCeVUpVxSNXH
 rA/w==
X-Gm-Message-State: ANoB5pklGvwE/ivkyFyDDEMI2QufSARiWKcJh6i2aN3Ja889KUsJ4a7N
 xQTYRnGnVKm1entqxq2h1Ef8IxjqHKb8TyCkTQU3sJ67fz6Rmh6zXfTya1rZj/YNqHTXKBWS7KN
 9c60E+X4/e/H1DkxyM84aHdMA6SGZSgo=
X-Received: by 2002:a9d:6b8e:0:b0:66c:72e6:c95d with SMTP id
 b14-20020a9d6b8e000000b0066c72e6c95dmr9517073otq.10.1669393383801; 
 Fri, 25 Nov 2022 08:23:03 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7VU5qAM/qqEGSP3sAxQ8ibrjUGTrAnPhd+cQOgZ8mFKxmbJlZidGKLBE4pFB4hCHVzFq4c5cLNO4qhaKXkO5k=
X-Received: by 2002:a9d:6b8e:0:b0:66c:72e6:c95d with SMTP id
 b14-20020a9d6b8e000000b0066c72e6c95dmr9517059otq.10.1669393383558; Fri, 25
 Nov 2022 08:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20221125154030.42108-1-philmd@linaro.org>
In-Reply-To: <20221125154030.42108-1-philmd@linaro.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Fri, 25 Nov 2022 17:22:52 +0100
Message-ID: <CAA8xKjVwNyqkXOFiuNYCC-im6C8v4DOCAosxfpZFfRsXQoBogg@mail.gmail.com>
Subject: Re: [RFC PATCH-for-7.2 0/4] hw/display/qxl: Avoid buffer overrun in
 qxl_phys2virt()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mcascell@redhat.com;
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

On Fri, Nov 25, 2022 at 4:40 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> memory_region_get_ram_ptr() returns a host pointer for a
> MemoryRegion. Sometimes we do offset calculation using this
> pointer without checking the underlying MemoryRegion size.
>
> Wenxu Yin reported a buffer overrun in QXL. This series
> aims to fix it. I haven't audited the other _get_ram_ptr()
> uses (yet). Eventually we could rename it _get_ram_ptr_unsafe
> and add a safer helper which checks for overrun.

This is now CVE-2022-4144. Please add proper "Fixes:" tag, if possible.

Thank you for the fix.

> Worth considering for 7.2?
>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/display/qxl: Have qxl_log_command Return early if no log_cmd
>     handler
>   hw/display/qxl: Document qxl_phys2virt()
>   hw/display/qxl: Pass qxl_phys2virt size
>   hw/display/qxl: Avoid buffer overrun in qxl_phys2virt()
>
>  hw/display/qxl-logger.c | 22 +++++++++++++++++++---
>  hw/display/qxl-render.c | 11 +++++++----
>  hw/display/qxl.c        | 25 +++++++++++++++++++------
>  hw/display/qxl.h        | 23 ++++++++++++++++++++++-
>  4 files changed, 67 insertions(+), 14 deletions(-)
>
> --
> 2.38.1
>


--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


