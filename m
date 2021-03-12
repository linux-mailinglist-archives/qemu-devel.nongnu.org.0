Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109E83392D1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:12:23 +0100 (CET)
Received: from localhost ([::1]:35540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkOk-000759-2J
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:12:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKkJ3-0006ga-51
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:06:29 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:35344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKkIt-0005fT-2B
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:06:28 -0500
Received: by mail-ej1-x632.google.com with SMTP id dx17so54366763ejb.2
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 08:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ubYaA8YbVblQy9Lc+3sGLwqrCOqgsrOQyjLH5DAZIuk=;
 b=HmZcggtZ18eO/Tcsm8U479qBHsikl3JoSup85o0jJnhPt7JDpd8tMFdnDhQrisGjXK
 OLedsXkJSmrIne9x4mdzcy7h6VC+Flr2GyDLG0+OFIh7pf7mUQkyw9owjaB4HrRll8Eq
 82IaycLDC11n3g7mpCFF5n7QC9T41j0X57x/Xe2DFHkX6iskPzI+XE8EGI/W3PQ8bMWm
 IZPfW0eaG7TUxH8pd1k10f/V/7d1tLsZLsD0ieyumPATIkRrTbnRee7WxB0wK8wVakAf
 cgKxosCuQl1fC9kN/vqueFfNBNbLqwdDJBItZwJCgrpst2vEG3d33u+3FE5CJ1WTPfC2
 zy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ubYaA8YbVblQy9Lc+3sGLwqrCOqgsrOQyjLH5DAZIuk=;
 b=KOSWzR6CTC3bAD/8FFUiNMIrLn99ATBKkt1a9pgon74oi4yKHnUijdxt2N0F8+l9GZ
 iX3sVGeyYi+YWkyu6SOL6xuU9p33157kEnbXB5i6V+IoDTq0bB3qFLkxn7CZ5dfAllz4
 QXUIQvO/RC5ZWRrxpQNWbHuGRSwiK1Qswjbp7detyaAui5Xn0bZ47Xc8gm+YZUkWhVjY
 SeN475Sl/lert49U1RQXmqwc2QdkHUXfzpfRsZBHCSuQryoV7qzqjByqKYQDo4e1UNCJ
 LQ5j2o4CC7ZZZT8QGD6L8zFEbOR7eH/nZuVDJe5cRuFexTq96Mz1iETOSRiR63iaRjwC
 4tQQ==
X-Gm-Message-State: AOAM533RcO7YkNrDG/kqupUzDTkmlffv7A1jNj3VZRJeH24MQAeiet04
 sr9EvDTILY8ApLtrsZdv9nduGhX+v/KCjILfyZBueme0aX010NWo
X-Google-Smtp-Source: ABdhPJxaY+Ds5GxxP4BsJMJkkRoQ/hKpFmRCiXavlhpepsYBQiByBnx26y5xqOluWFD69iUDXcqoQXziOGhMkNiwmYM=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr9435266ejd.85.1615565177255; 
 Fri, 12 Mar 2021 08:06:17 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Mar 2021 16:05:58 +0000
Message-ID: <CAFEAcA8wAi6gYOLQG1u8wHS8--9+OENGyKs9mLiufJd9vHYQkg@mail.gmail.com>
Subject: finding all the places in an AddressSpace that alias a specific
 address
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm trying to fix an issue in Arm M-profile, where on reset the
CPU is supposed to load its initial PC and SP from a vector table.
This goes wrong if the vector table is in a guest image file (loaded
by the rom-blob loader) at address X which is not the same as the vector
table address Y but which is an aliased view of the same underlying RAM
(ie accesses to both X and Y go to the same real guest RAM).
Really the problem here is a reset-ordering one: the CPU reset code
runs before the hw/core/loader.c code has written the guest image
files to RAM. We currently try to work around that with:

        rom = rom_ptr(vecbase, 8);
        if (rom) {
            /* Address zero is covered by ROM which hasn't yet been
             * copied into physical memory.
             */
            initial_msp = ldl_p(rom);
            initial_pc = ldl_p(rom + 4);
        } else {
            /* Address zero not covered by a ROM blob, or the ROM blob
             * is in non-modifiable memory and this is a second reset after
             * it got copied into memory. In the latter case, rom_ptr
             * will return a NULL pointer and we should use ldl_phys instead.
             */
            initial_msp = ldl_phys(s->as, vecbase);
            initial_pc = ldl_phys(s->as, vecbase + 4);
        }

But the rom_ptr() check only matches if the ROM blob
is at the actual same guest address as the vector table base.

Arguably what we should try to sort out is the reset-ordering problem,
but that's a big job. I thought maybe we could for the moment at least
make the workaround we have today handle aliases.

For that I would need to find all the addresses in an AddressSpace
that alias vecbase, so that we can call rom_ptr() on all of them.
I think something like this would work:

    hwaddr xlat, len;
    RCU_READ_LOCK_GUARD();
    FlatView *fv = address_space_to_flatview(s->as);
    MemoryRegion *main_mr = flatview_translate(fv, vecbase, &xlat, &len,
                                               false, MEMTXATTRS_UNSPECIFIED);
    flatview_for_each_range(fv, callback_fn, ...);

where callback_fn() does:
    if (mr != main_mr) {
        return;
    }
    do arithmetic with flatview range start and len, etc to figure
    out the overall address in the AS corresponding to vecbase
    rom = rom_ptr(that_addr);
    ...

Does this seem like it would work ? Is there a nicer way ?

thanks
-- PMM

