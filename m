Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01D3337CF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 09:50:59 +0100 (CET)
Received: from localhost ([::1]:51732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJuYU-0001hp-RX
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 03:50:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWS-00086u-To; Wed, 10 Mar 2021 03:48:52 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJuWN-0007xG-IL; Wed, 10 Mar 2021 03:48:52 -0500
Received: by mail-yb1-xb32.google.com with SMTP id p193so17033976yba.4;
 Wed, 10 Mar 2021 00:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R5vK9yKDgv0rJiyKhOTd8/OfFuyMkOKYgtW8z40CXOk=;
 b=Tb5ehqqN0JHM/se3Se33pkt+SFx3QcIkCk+NahlJ4LUi3uWo4ZXOTN3OUytIY1tZQQ
 3hAH74KO+55fEWgihZZN5cXtv89Nxxpux3elPVVPJupm40kpit1bAjPxNdd2YBVQZmsJ
 EEPz+4MKdUZOhAmBZFw4rkz4Kwpx1OwvHr2d7M+gdrD2n8cUVfgepGHTFGQfpcvDFIrF
 9k++uB2pte6t3jwciVmw1qWfxIAh9dEupkbFM1awCG0t1LOChYE9CoZnTM9th5ef7ZGg
 QvIrjW7iTIK9nvIkiBbApWt7V7o3PyvPE8Pmc53KmC1utrsIKRRWes+6MBgY6mkkp2Ui
 nYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R5vK9yKDgv0rJiyKhOTd8/OfFuyMkOKYgtW8z40CXOk=;
 b=VaFkZEH1Q9B0lPL2FR/ye3zbLo0uss29FpVsID3Gu4AUyaqhK+53LOTwdphYp0/N4o
 lzWZFgWqe95ctX1EKynUFeiC6WgHaB9DYoTVS4+WP9ky+54Weu17N8xaU7arJh0fRPar
 cdzaqT3aBUhRoAmrUufpPKbeL4Qh5XeXlkwG71OI2kPj64gL9PUE9TOpgm7oVkqSk5y1
 uci+SzK9NCD83Kc0AyB/2jfvzhpyf/5I4x8YHFMKYQdyylMgVJafoAEfP73eJIrZDmi5
 SQZZT5MA8iZk3miXKYp7Hqvu0RdFTnHZyTyzRZL8Yn0zQrHVfttywMOjadUANzfP8SZK
 R5Kw==
X-Gm-Message-State: AOAM533gmNhoc5KNNNvLqSAejPhRvMIrA/LWuUSaUAUymEkuUJxthdoc
 1aTIPWzGcpyGSAJ+KJcongPjSo4P6q/iPwvL57M=
X-Google-Smtp-Source: ABdhPJy/9+opIm3AVJSFyeAZc8/anrRMkDb12cZQG+WAmBXCClQtHOcFlzjfo7N67UOE95tYceSFJnDXBvwnVwmCn9E=
X-Received: by 2002:a25:2d1f:: with SMTP id t31mr2815927ybt.239.1615366126300; 
 Wed, 10 Mar 2021 00:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-4-philmd@redhat.com>
In-Reply-To: <20210309235028.912078-4-philmd@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 10 Mar 2021 16:48:34 +0800
Message-ID: <CAEUhbmUxqcjBeFWwbpmw-8EZ6hnmwOJ6mHSwOt5poCnTLuKecQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] hw/block/pflash_cfi02: Extract
 pflash_cfi02_fill_cfi_table()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb32.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 7:52 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Fill the CFI table in out of DeviceRealize() in a new function:
> pflash_cfi02_fill_cfi_table().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/block/pflash_cfi02.c | 193 +++++++++++++++++++++-------------------
>  1 file changed, 99 insertions(+), 94 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

