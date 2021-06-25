Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70DC3B3D60
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 09:30:01 +0200 (CEST)
Received: from localhost ([::1]:60312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwgHo-0002PO-Sn
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 03:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwgFJ-0000Z5-O3; Fri, 25 Jun 2021 03:27:25 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:42897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwgFI-00024E-3l; Fri, 25 Jun 2021 03:27:25 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id 8so3245487ybn.9;
 Fri, 25 Jun 2021 00:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RpsjxhnHk1FNIcCdmLXszLkSUmiVW6+CpQQW2OZWlnM=;
 b=q2Qh9Q8foG5bRljkXGVxCW9/mbJLLxYBw3P1aM5qsKnaGQAPxRFXNJjXypjQFLOLiJ
 wQRS9b/4a/kHIDtuZY6gHyAwPevNz/Fkh7tzTG7pmt7Y9bRW7hz8gStJxp6EPYO1uoYR
 9jpJFm6DjSDzjE3zhiib2UDnlNU4+583lDDDtAYZWUmWZeXTH4nacONWoEK6n0x5JrP4
 bP8DACKyh2rMENfetkBIkjavbpknF3Rb/VspIor5F+FVnKWIciMiscItZ3QMYEBuwJ00
 U2OCbEooJTDZ6DsTkMIp8OCR89oF9XKXTHZKlOU4dgczh14ztEaUWcEWOdGjsRd9Nyd7
 fmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RpsjxhnHk1FNIcCdmLXszLkSUmiVW6+CpQQW2OZWlnM=;
 b=TvAZCtmTar0ZMWoE8cYegts2PNy16uD0GVCvt/psugPdysI+16kIj/LtLe3Sh4Uf1A
 z6rLvEmn7/f0ZVT5lLmEAYk07OlaHpOw4qvKlkQ9ccQ7kSIgMU2TqZGfq0cTm8Fe32wP
 hRNAb/TquM4UTfDMY0eK5eV2SKXrz05Tj7R0hBVowA3uGFH1C6txYoa2bdaYhuV6CbsZ
 UKC+k1hFuqnLrpuyK1iyNSXWNIfEWTztuTi0SSORq+KeME03NSr/cWwMjlHFGcjoUV6J
 ExXtPWE4D1XXZ1FRuNoAXE/db8509sx0/eBnZImVxqnTuy7pj0C4Anv1Izw6F4/B8uYN
 4Csg==
X-Gm-Message-State: AOAM5305g2GHZYwHCRuUCC4+1FRYEzkzJEqML++3suTH033xbx9Tucxz
 5yq5iObZhSTyyTpuEz+Zy7E3GJHtvLqg/2cv7go=
X-Google-Smtp-Source: ABdhPJwJRsHbnai505ekpAuFFgL2ppLF4l+rRIO+KpJ7A8RgUxKzJcvoScOms+Cx5ahM8ahDE8300ff2DMZRkyojVlc=
X-Received: by 2002:a25:4297:: with SMTP id p145mr8370573yba.387.1624606042164; 
 Fri, 25 Jun 2021 00:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-2-f4bug@amsat.org>
In-Reply-To: <20210624142209.1193073-2-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Jun 2021 15:27:10 +0800
Message-ID: <CAEUhbmVFDn2Bd=R2TCfNTnhWM8LyMc+XpABi_RXrzDUnziRrJg@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] hw/sd: When card is in wrong state, log which
 state it is
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2d.google.com
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
Cc: Qemu-block <qemu-block@nongnu.org>, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 10:22 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> We report the card is in an inconsistent state, but don't precise

%s/don't/is not

> in which state it is. Add this information, as it is useful when
> debugging problems.
>
> Since we will reuse this code, extract as sd_invalid_state_for_cmd()
> helper.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

