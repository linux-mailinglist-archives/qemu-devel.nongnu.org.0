Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F328C4505D3
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 14:44:00 +0100 (CET)
Received: from localhost ([::1]:57168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmcHA-0006gp-4G
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 08:44:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcE7-0004ZK-DP
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:40:51 -0500
Received: from [2a00:1450:4864:20::42f] (port=34743
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mmcE4-0004aQ-Lx
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 08:40:51 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d5so30805421wrc.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 05:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QvRVK5lj+6pdoso32NupYmtgW6boEgcwejPFuAqqqMc=;
 b=lT7owlu9kJkl1DLiwDtaWf0BfcwxScHS1nkQk3oSy0mThst9XyTf9WnvWCVk0eQ8xi
 +7Wuug0OFye3gA7Gyv776v7uJV6hP3ZHE/ZBVKl5ZLtZm4D7H6lu8GeYJuK8xJmlIR1k
 3v6j0LFRLzCzvECJdozDQTMy7Byh2unTGJYz7AuziTpMOG0fyRLzQemoPCZAhgUAw2XX
 hOyoTO40pqzlPylb6kjNJvkg7rvBBxOy9nV8wyL7iSNPVO3t4OX6oEpSc+pHaJRCfdSb
 54ZtA3cXJ8MYWv78R1muAXVUoQuvmtBGKx3IaBVqEfxEYNsjIX3t4eyzdJsX2ZAjykoo
 fkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QvRVK5lj+6pdoso32NupYmtgW6boEgcwejPFuAqqqMc=;
 b=2CKdQUpeq3bWgfGCZWi6/EL6QjeFNNpcZbgLwyozfIGZPtEqc5jOwjFvJbvmAR+Or0
 1LMLR5SD3B8+HW26PSui/73MpWauFI2VZR1SA9W8qOzk2Uxch5vwWzTKXMlp6F5nRB7N
 TkuOKN5GhHhhv9G4qWqmcYGE1n8ExJVX7vkC1TrZ5hPEo4LPT3O/P0P1CGB1Po+lcUWU
 MP7fIFLNQov/OFdutDEsjKkBdIE6wkPNaNibXsFiAVj0kF2hQXB77lLPRoZDOXvUa33H
 q8jZKx0vDWLYMODshV/Bsp//K6HwffzVUm7lAt3++aVlk1bp4owBUqLgVllZQZ8umAuu
 pWeQ==
X-Gm-Message-State: AOAM532de1XqnhIuMr+PE8BviJ0pOh3ESt7iEWYAUVXzNv/w2/gAQEMt
 wZXln2DfdpUujxcLmfLd8VVRqmfx0cUm6jt+1M5N/A==
X-Google-Smtp-Source: ABdhPJyv83Li++NvDv4PDTOCnV+/Fvv1WQCJ3i+dOUkU8EDnX72tela3jDWscYXtZXKe2iHpb6yXT0aBzmqkRWA1LC4=
X-Received: by 2002:a05:6000:381:: with SMTP id
 u1mr47959699wrf.302.1636983647148; 
 Mon, 15 Nov 2021 05:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20211115125536.3341681-1-armbru@redhat.com>
 <20211115125536.3341681-2-armbru@redhat.com>
In-Reply-To: <20211115125536.3341681-2-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Nov 2021 13:40:36 +0000
Message-ID: <CAFEAcA94NzZq6fnvvF6aRJtHV29Wnrtudz4QKSoADo6=-QF5JA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] hw/sd/ssi-sd: Do not create SD card within
 controller's realize
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, edgar.iglesias@gmail.com, sundeep.lkml@gmail.com,
 qemu-block@nongnu.org, andrew.smirnov@gmail.com, hskinnemoen@google.com,
 joel@jms.id.au, atar4qemu@gmail.com, alistair@alistair23.me,
 b.galvani@gmail.com, nieklinnenbank@gmail.com, qemu-arm@nongnu.org,
 clg@kaod.org, kwolf@redhat.com, qemu-riscv@nongnu.org, andrew@aj.id.au,
 f4bug@amsat.org, Andrew.Baumann@microsoft.com, jcd@tribudubois.net,
 kfting@nuvoton.com, hreitz@redhat.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Nov 2021 at 12:56, Markus Armbruster <armbru@redhat.com> wrote:
>
> ssi_sd_realize() creates an "sd-card" device.  This is inappropriate,
> and marked FIXME.
>
> Move it to the boards that create these devices.  Prior art: commit
> eb4f566bbb for device "generic-sdhci", and commit 26c607b86b for
> device "pl181".
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---

> @@ -670,7 +672,7 @@ static void sifive_u_machine_init(MachineState *machine)
>
>      /* Connect an SPI flash to SPI0 */
>      flash_dev = qdev_new("is25wp256");
> -    dinfo = drive_get_next(IF_MTD);
> +    dinfo = drive_get(IF_MTD, 0, 0);
>      if (dinfo) {
>          qdev_prop_set_drive_err(flash_dev, "drive",
>                                  blk_by_legacy_dinfo(dinfo),


This part looks like it should have been in the other patch.

-- PMM

