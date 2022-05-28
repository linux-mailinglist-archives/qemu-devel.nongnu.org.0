Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A9536E93
	for <lists+qemu-devel@lfdr.de>; Sat, 28 May 2022 23:25:04 +0200 (CEST)
Received: from localhost ([::1]:52318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nv3vi-00070U-So
	for lists+qemu-devel@lfdr.de; Sat, 28 May 2022 17:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv3uo-0006JH-E7; Sat, 28 May 2022 17:24:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nv3um-00015R-VV; Sat, 28 May 2022 17:24:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l188-20020a1c25c5000000b003978df8a1e2so2445876wml.1; 
 Sat, 28 May 2022 14:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=zIGHVshfh/VikUqvKrvhXfm7K5EaTaFbPI9k1R3B3QM=;
 b=Gjof+E9drLhCJstlob0ryE+KdjAqFu1orco5bOHUPfM49537XQd68rMwJbcjhhX0H/
 M0yM3xp+PkuXyiTTvaBXWS8bpekqZ0zad7gLdEUu/QfXqDdywXBUoIXrkuxhLYByRjfa
 wlbe0QLvtxou6rDlpyW3BVmP04hnz6aOt/DHkpN0dcIAB/yagxYB6Ldldfk5gEBIlz3c
 m22hF+nvtITy3fc9urmarP6a6y2ehC58medtCwWn0aMcL+LoJ/Ai9XtOYxONMN9af07f
 UIlPFwTTNsbfgF0DuoL1Iw8SNjOaalMhv0gIA+x948VQMmLqsRRO0B5ofDEP1L8RxFmA
 wsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=zIGHVshfh/VikUqvKrvhXfm7K5EaTaFbPI9k1R3B3QM=;
 b=prDI/CjewgMtIHviNQRlnsrQzokZGAi0hwSwovEpCd/hFQhm7mYh56Zev0e09F5FUw
 a0vCH5jmXNnWmPgMTa7d1IH6J/S9i0NElKiZFnO3swXarv/cwusvajDZ7ouIMw9/kJoy
 k0uF0vrqhD9EUT91UCiCFb78Z8cszpsZTgJDIEw1Cj0SpAkCEgSlO28I5d/E5nVWNbBX
 1tt460DBzKGOPhV8ZBlk8q1KBVPMdrWq4djSKkfqJ3ANb7/pKSiYMHMscYxGu1NhzPzd
 4VYnEwXFVZhgfnUa/JW+OtOAoc/oWLxERfvBuyBO2iipmh9ElPdiQoPzzpHK0HZBPg+C
 t9pg==
X-Gm-Message-State: AOAM532C5RqVkj2z/XOjAewtIJA+r4PffqAZs7l9U3vjCPPWuSiR2wbU
 L8489w8761S23AtikKEnMz1vw3H3oig=
X-Google-Smtp-Source: ABdhPJzM9lqK4t3eYGzDQhKxZ49/sjKHJV1WyZZnqIKb08Qqj95EeFlTziQwrbxrhf49U8rQCfjscA==
X-Received: by 2002:a05:600c:3ac6:b0:397:7520:c78e with SMTP id
 d6-20020a05600c3ac600b003977520c78emr12548506wms.23.1653773042858; 
 Sat, 28 May 2022 14:24:02 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d006df08acd6a055550.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:6df0:8acd:6a05:5550])
 by smtp.gmail.com with ESMTPSA id
 m7-20020adffe47000000b0020d0b2de858sm4910784wrs.33.2022.05.28.14.24.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 28 May 2022 14:24:02 -0700 (PDT)
Date: Sat, 28 May 2022 21:23:57 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, sstabellini@kernel.org, anthony.perard@citrix.com,
 paul@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/3] PIIX3-IDE XEN cleanup
In-Reply-To: <20220513180957.90514-1-shentey@gmail.com>
References: <20220513180957.90514-1-shentey@gmail.com>
Message-ID: <43BCAA1E-7499-4584-AB60-C5004AA0643B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13=2E Mai 2022 18:09:54 UTC schrieb Bernhard Beschow <shentey@gmail=2Eco=
m>:
>v2:
>* Have pci_xen_ide_unplug() return void (Paul Durrant)
>* CC Xen maintainers (Michael S=2E Tsirkin)
>
>v1:
>This patch series first removes the redundant "piix3-ide-xen" device clas=
s and
>then moves a XEN-specific helper function from PIIX3 code to XEN code=2E =
The idea
>is to decouple PIIX3-IDE and XEN and to compile XEN-specific bits only if=
 XEN
>support is enabled=2E
>
>Testing done:
>'qemu-system-x86_64 -M pc -m 1G -cdrom archlinux-2022=2E05=2E01-x86_64=2E=
iso" boots
>successfully and a 'poweroff' inside the VM also shuts it down correctly=
=2E
>
>XEN mode wasn't tested for the time being since its setup procedure seems=
 quite
>sophisticated=2E Please let me know in case this is an obstacle=2E
>
>Bernhard Beschow (3):
>  hw/ide/piix: Remove redundant "piix3-ide-xen" device class
>  hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()
>  include/hw/ide: Unexport pci_piix3_xen_ide_unplug()
>
> hw/i386/pc_piix=2Ec          |  3 +--
> hw/i386/xen/xen_platform=2Ec | 48 +++++++++++++++++++++++++++++++++++++-
> hw/ide/piix=2Ec              | 42 ---------------------------------
> include/hw/ide=2Eh           |  3 ---
> 4 files changed, 48 insertions(+), 48 deletions(-)
>

Ping

Whole series is reviewed/acked=2E

