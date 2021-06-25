Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023893B44D5
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 15:51:05 +0200 (CEST)
Received: from localhost ([::1]:59158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmEa-0002q2-2s
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 09:51:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmDT-0001U1-AX; Fri, 25 Jun 2021 09:49:55 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:36356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lwmDQ-0005k3-Tr; Fri, 25 Jun 2021 09:49:55 -0400
Received: by mail-yb1-xb29.google.com with SMTP id s129so4716944ybf.3;
 Fri, 25 Jun 2021 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Swhn1H2CgaZ4ZbrOTY98zkS7sP9n+z1rLMj1Q/kTQGs=;
 b=IVrtYKyhSAdmhpXM6eSX4TXMigS4af5S/w64+hwwXWkRJdDJl8CTUAkVJsFbGuStVr
 fcztIAga2X24gHtB2cpbEHsp/U8tLb2MV69T0z0X+r+67LmbC3fSzIQt3hGz5FOsHPUS
 3s1NhyRI6vpIITZaqP2FIsH8YsvzSn53uviFzc7+tgw2WMY0f9CoekwwMTHkARAhWRJ1
 bvZn6gztDb1MfEujWozMd/aN16G/HnFZLbXos7qCcsWkfsFi7amOKV7rtPaxB0s/YOkA
 7dIhX1xCGulFRyBnkTt5T2b6SER/SPvxrl0BhHHUVpKRGdmDImlNrtQMpmM0mo6CaSzw
 /Ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Swhn1H2CgaZ4ZbrOTY98zkS7sP9n+z1rLMj1Q/kTQGs=;
 b=fM1jYfxn0hYXPPp+CQmirvAyfDoRjCxl8s72WJn1e+QXHhZ/wcu7JVskXKbavoy6rt
 DiqWYlcQabXBX7U1006R6rZTECHVCiYd2WkIkOvrAEz7/RC34nqANjiAwOG4gwyE1iRz
 XG+Qv85wtaeA8tX7SFB6dMjy0Zkm88qKbZD0e02IP08BgzYCUJ2rRiktSx5hGv6f52N3
 97QIIYTgCMrOPPQsVdr0m9DxT7/a3rXkoESbpl2zUyFl6+jgBbNG7E+dc0IkAlH3iY1a
 ZaqUhL+vC8pjm0me9Zz6QllgGtyNxMho0LHeg4i2hOYO7+jy0IYL3c0VgnvTL81BZ54Z
 6Dag==
X-Gm-Message-State: AOAM530DAG1l/ldkDk9bAWHEebH4T3fmG4g68gBK1ifZjtJ/ZTgiJs8X
 +LMOuS4QvUdHVkGH9UYfImu0qjP5QoSgEqAhKnc=
X-Google-Smtp-Source: ABdhPJz9iUzNulWDMv/F8ctt9eBCg+gra1foOUGzJ/sKFLEQaPq0rI/LQzxE6Prwe9bErtliCQiIVShDnkVRxr+rQC4=
X-Received: by 2002:a25:6c04:: with SMTP id h4mr12566418ybc.122.1624628988600; 
 Fri, 25 Jun 2021 06:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210624142209.1193073-1-f4bug@amsat.org>
 <20210624142209.1193073-8-f4bug@amsat.org>
In-Reply-To: <20210624142209.1193073-8-f4bug@amsat.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 25 Jun 2021 21:49:37 +0800
Message-ID: <CAEUhbmWdCzDKu4XOq_H74_dGiLsaT-0OBmwhBEO-dQFWtZpkiA@mail.gmail.com>
Subject: Re: [RFC PATCH 07/10] hw/sd: Add sd_cmd_GO_IDLE_STATE() handler
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb29.google.com
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

On Thu, Jun 24, 2021 at 10:29 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

