Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52042C5229
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 11:39:01 +0100 (CET)
Received: from localhost ([::1]:39774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiEg0-00082i-Qo
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 05:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kiEek-0007EO-LJ; Thu, 26 Nov 2020 05:37:42 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>)
 id 1kiEej-0004H7-8y; Thu, 26 Nov 2020 05:37:42 -0500
Received: by mail-ot1-x341.google.com with SMTP id 11so1469004oty.9;
 Thu, 26 Nov 2020 02:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2shOX+HFGjx9yof2t8AsTuEfNL0YMKvC4gSmFolDGQY=;
 b=lpYcEQnkmOJlR6C2GvlgFoc9TPG5YFUItL13tg5rv5f+NMCCYdWBYHUk9Jr5Sx8uSC
 XAlheBcPj3iWwqdfhnTBeK3dC/6pTcU2gCYFOwhLbioSX17P5i966QH09k5Y272f+Ozd
 MMDY+5JoxHnY2R+A9O0IPaULtjbfcxs+z5x0YlNtdzk3c9BFHbUg3eZVqcl3B8u+KBGe
 8ZTk+3sOnVGoTOEXAILIJvcuQKYcoLbMS1IDqs8rNTAub4+qDfR4Pw7ejHPhf1gZDDDm
 yIUv44G1LHpa2+5Sb/kqzK17Ue7ZqM8K2tyT1I8f46KxJhh24UTuxV6nbvY/IY0cla8r
 DmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2shOX+HFGjx9yof2t8AsTuEfNL0YMKvC4gSmFolDGQY=;
 b=crweY5UbhQyT81/9yJKanNr0rtA7YM5mmLZT5N2BbaYNZj1jYyjjyB4d4RZmsFKr/x
 uVzQcItr59MIXs2SakTOh/GQERCYQY26dk5v/ae59EI7AH9USU8x5rny5+hQ/rY8vVOY
 G+b5Oujal1c5P4KCE8xz8eOF0kGw3HI8PO1Oe9Ky44zhBX25smfCDo0ES4OxODOeRmiK
 s1mazAAb+ClX+oTND6svSXls64Tr6HGiOhhjMmaYjIVtrgNFcNjtQHjfGHav2oWz4/mC
 7g0Pbgglz/hqJ9hWMkqBEfArxK25YsAL/dkqlCb2vTqkGnasmFD/EXC9lxgIvv7ysU5b
 /KlA==
X-Gm-Message-State: AOAM532jlIjkz9o8JDU6xbhiKWmNk0GGi1tMsvxm3o3xVCylwOrbO88i
 OLW7NEM4xK6wuMnmri9qWqnztENuTlhtYoU0JFI=
X-Google-Smtp-Source: ABdhPJwYEFlO61IOOuH68cppSd9RmtPzOakXuEMmsZOGSPMJZF3IswLWSXuRpNF7SpL9anXymaSzZUx2nOkXW6ll+8k=
X-Received: by 2002:a9d:7e96:: with SMTP id m22mr1855365otp.181.1606387059699; 
 Thu, 26 Nov 2020 02:37:39 -0800 (PST)
MIME-Version: 1.0
References: <20201125102403.57709-1-alex.chen@huawei.com>
In-Reply-To: <20201125102403.57709-1-alex.chen@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 26 Nov 2020 18:37:03 +0800
Message-ID: <CAKXe6SJJRx8KQZXLBP8vGmA6_Xz_EZG9d3G-Ogx=3uf_r3Xarw@mail.gmail.com>
Subject: Re: [PATCH] test-qga: fix a resource leak in
 test_qga_guest_get_osinfo()
To: Alex Chen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x341.google.com
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
Cc: qemu-trivial@nongnu.org, zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alex Chen <alex.chen@huawei.com> =E4=BA=8E2020=E5=B9=B411=E6=9C=8825=E6=97=
=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=886:37=E5=86=99=E9=81=93=EF=BC=9A
>
> The fixture->fd is created in fixture_setup() and, likewise, needs to be =
closed
> in fixture_tear_down().
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
>  tests/test-qga.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/test-qga.c b/tests/test-qga.c
> index c1b173b3cb..eb33264e8e 100644
> --- a/tests/test-qga.c
> +++ b/tests/test-qga.c
> @@ -111,6 +111,7 @@ fixture_tear_down(TestFixture *fixture, gconstpointer=
 data)
>
>      g_rmdir(fixture->test_dir);
>      g_free(fixture->test_dir);
> +    close(fixture->fd);
>  }
>
>  static void qmp_assertion_message_error(const char     *domain,
> --
> 2.19.1
>
>

