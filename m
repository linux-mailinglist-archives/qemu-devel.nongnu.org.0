Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F243AC91F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 12:48:25 +0200 (CEST)
Received: from localhost ([::1]:55226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luC2y-0001tG-4l
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 06:48:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1luC1o-0001Cf-G9
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:47:12 -0400
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732]:36432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1luC1m-0006Mf-Us
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 06:47:12 -0400
Received: by mail-qk1-x732.google.com with SMTP id i68so9838129qke.3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 03:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=SI3WgOAYa0sTVKrF3xRokS+1ARTTERGGpJz9soSFD7s=;
 b=sDHJDxInFL6y2UAeIX+Rz/vq7FPjkaQRMtsQzHgvnT4wnN033crB3Ow/KYCV2NSnUH
 19e6ZraE6NBlz410LZH6PFUxeMg0gJocfBLzwkj9s8hnAvPsHic/Qmrd9LpxZo7Xd382
 dH2NLlYoRRLCUnyVV2sbw3pu4rlj7wPtl+HfRCW9DdxBWI8SsNvntfwVRANr3IQKT/bv
 49WAZCImit6RdORNqruLtNAGLzhx8aGsxeVdE4NW5lml75qCtRwj9XVwFpNNVFJmG+i1
 e5IYHp0PhJBzk/Y/ZqV9UFA0XhUUV1PxkvZRUYQur3Y+2kV04kErEAIjMfg3t0GG1vHW
 txnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=SI3WgOAYa0sTVKrF3xRokS+1ARTTERGGpJz9soSFD7s=;
 b=jKXcnpvK29R+21iLeMnKDNWtQO6giVlYqcEmTToqch66ROemVxwfqfyMy1nk12py7u
 2HfbiDEqS9JZ622WudFV2gGoKV2N4nKOO8rahgin8Ak1WVhwzTE3Gy1YCb4MJq6EmK0W
 M0ZCcj5cy7gSL8g8xykhu36YzwAoXjfFzyhjKvO8e11QkCKn+oyukmsB4Xv+/gFNI9bs
 Ysp6YQ/b0t3MgsKi/yS/Eg2hywTKd3iF3c7DJtD3CycvvViMoxQ85DlReu8mrvsJWZKu
 jV1pN+wAD4Q20QeDAgrEcrXpOT0YZtD1Em9BryPLuLSLrHPNbaOA/cqWM5nbGb5b7ssW
 9TNw==
X-Gm-Message-State: AOAM531sEic4+5GdgxY1SxAHLlSyk2jv3M6YX4rwVmEzYEm27A9WO47w
 7G/Ermtl4QF1MKfApq1qG8P2viJVEl/9GXxDZq8=
X-Google-Smtp-Source: ABdhPJxqEBz4wsawWvBO8TObY6cpxnl1DKjkiZ9br880irGIyE76OiPmxnpi7XvXhGxQ4kynBCPjcebqKuyJaNx9OEc=
X-Received: by 2002:a25:ac97:: with SMTP id x23mr13357741ybi.387.1624013229468; 
 Fri, 18 Jun 2021 03:47:09 -0700 (PDT)
MIME-Version: 1.0
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 18 Jun 2021 18:46:57 +0800
Message-ID: <CAEUhbmWMzo7ZhZLjk_ScBv=AskOY670L62ujqm76tgC5Zjbq4A@mail.gmail.com>
Subject: Too slow edk2 bios boot?
To: Laszlo Ersek <lersek@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laszlo,

Using the QEMU shipped edk2 bios, for i386, it boots very quickly to
the EFI shell.

$ qemu-system-i386 -nographic -pflash edk2-i386-code.fd

However with x86_64, it takes a very long time to boot to the EFI
shell. It seems it got stuck in the PXE boot. Any ideas?

$ qemu-system-x86_64 -nographic -pflash edk2-x86_64-code.fd

BdsDxe: failed to load Boot0001 "UEFI QEMU DVD-ROM QM00003 " from
PciRoot(0x0)/Pci(0x1,0x1)/Ata(Secondary,Master,0x0): Not Found

>>Start PXE over IPv4.
  PXE-E16: No valid offer received.
BdsDxe: failed to load Boot0002 "UEFI PXEv4 (MAC:525400123456)" from
PciRoot(0x0)/Pci(0x3,0x0)/MAC(525400123456,0x1)/IPv4(0.0.0.0,0x0,DHCP,0.0.0.0,0.0.0.0,0.0.0.0):
Not Fd

>>Start PXE over IPv6.
  PXE-E16: No valid offer received.

I checked the boot manager, and it seems only 64-bit edk2 bios has
built-in PXE boot while 32-bit does not.

Any idea to speed up this whole PXE boot thing?

BTW it seems the shipped edk2 bios image does not work with QEMU
'-bios'. Only '-pflash' works.

Regards,
Bin

