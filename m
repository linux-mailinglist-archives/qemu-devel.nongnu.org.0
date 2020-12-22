Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C8A2E036E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 01:30:21 +0100 (CET)
Received: from localhost ([::1]:60742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krVZE-00047k-5n
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 19:30:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krVXs-0003GZ-UW
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:28:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:33760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1krVXr-0000PP-GF
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 19:28:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0593E22B2D
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 00:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608596934;
 bh=BMZMGgNs5iYHP55nahnrR8NIsoo4t4qF/v3Gn/TWrJs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t/PgWUBS3eF8rx6XF0qcYm1kg4WjFlCDU/ULS9tul2C3aTfuFFblW9GuVzlZSlkEc
 WMwnFge79qAJHE1j64QdznJEGuzGUvqJBqN/IepXvpHakLz5xlIgSw8fp42wyeJDOr
 sbK12H7SRb0IAESVkcAkgq0KOcZGh7DzTRH0/WGh3uW8qQ3ZpC51nvrCXOTSeqYaGz
 5+mwJIdXm2CiAjqYMhAF0lPYoIsv3+52sZn7mDQKwfWAUGrmmp/ECcRDWIO7pdyVCt
 hRAai2PS//xs7e5jfY0vxWb9PBkCY0OCz2hVQm1nPHZi5MAwDQI9fvAtHNquHDVIZS
 +Tuoqgn16SjDw==
Received: by mail-io1-f53.google.com with SMTP id q137so10471628iod.9
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 16:28:53 -0800 (PST)
X-Gm-Message-State: AOAM532D9xbafoxd7pbg4UY54/RCi0sLtoW+VvGtK2evoK8n23/OxCPA
 trA44LKz5UtrE/zsWPXo7PKUQiyEjq6hGjoD9u4=
X-Google-Smtp-Source: ABdhPJzL/J9auO+sDL8d9m8O2w05KmXk8yTGitvLzfvDbSjoVgJ7QNh5C2FecDDsZOWjYMNht6ev4LZzTGAa3Ft2mRM=
X-Received: by 2002:a6b:dc0f:: with SMTP id s15mr15994439ioc.180.1608596933514; 
 Mon, 21 Dec 2020 16:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219072139.39347-2-jiaxun.yang@flygoat.com>
 <7cd691f9-cad9-ebdc-6eed-4ef9eef13ec0@amsat.org>
In-Reply-To: <7cd691f9-cad9-ebdc-6eed-4ef9eef13ec0@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 22 Dec 2020 08:28:42 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6npgMW0kNrBWp-Edk=jtiPerFKiqSmoWqJjqbrSYLR=w@mail.gmail.com>
Message-ID: <CAAhV-H6npgMW0kNrBWp-Edk=jtiPerFKiqSmoWqJjqbrSYLR=w@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] hw/mips/fuloong2e: Correct cpuclock env
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Sun, Dec 20, 2020 at 2:23 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 12/19/20 8:21 AM, Jiaxun Yang wrote:
> > It was missed in 3ca7639ff00 ("hw/mips/fuloong2e:
> > Set CPU frequency to 533 MHz"), we need to tell kernel
> > correct clocks.
> >
> > Fixes: 3ca7639ff00 ("hw/mips/fuloong2e: Set CPU frequency to 533 MHz").
> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  hw/mips/fuloong2e.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

