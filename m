Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93F0407060
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 19:15:17 +0200 (CEST)
Received: from localhost ([::1]:53192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOk7R-000217-01
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 13:15:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mOk5Y-0000vX-7A
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:13:20 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:46662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@phystech.edu>)
 id 1mOk5U-0001Xj-H2
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 13:13:18 -0400
Received: by mail-lj1-x22a.google.com with SMTP id w4so4277926ljh.13
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 10:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=phystech-edu.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=fu+XkOs/s6GHsvCf63ljjIE1wiWwjPgd4Hlk1LiQqRU=;
 b=KftBMAwSIU0EDW7bHFztAJT72AzGAbfs7WAg9U5TlfUzL+2E380b0qTUhlUHoHTr9e
 JNAaSaJR9bXp5HyjY1R2AkaXFeIIv5iKijxHjoS8yLHt9mOJhtGyoLuqP2lLUU0hAFF2
 Ns43VmONWMlJbUVfe4oD7i1VcVyitwnOZO9sMn8fxzgyFHznvVeL45j66v8AgRtpMW3i
 BNbD5Bj5ZxiW1CSBSIGbK/5vNl7UcAteXtDLZoazsvjBk7i0eB6lcCLl4MSmQ0sxZOr1
 YDfEXOs1/SAVMrqpcvyCfZmDqwmyaCLJvmta/dbYRZar7416J6Zz2W2RTrZUg5ALeBEE
 SX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=fu+XkOs/s6GHsvCf63ljjIE1wiWwjPgd4Hlk1LiQqRU=;
 b=4Fjly7z5OqdVUvVyDcj7yn8NgR5Jc3mjivitoNjLhG3b9Ctu6xulXIT/+mG9rZ5Ape
 YO98Wc8B5ginBHTfCevYa2JKl/F5Ff9/CmozsCTdrttIjZvkh6pNs2r45vx77hWQynuC
 SZHIBq8Giqt25OhMT9AWpnMjVgQ7E3nDIm+vDKuHlRVZZFvH9K3HnPeJyUoyX6VrGkUI
 CI9jQAhZ/i9gR8tatgkq78YAE/rhp2nsqj8Mqeunr1oqPY5I2OiD9wg12e0iWt+Lqj8o
 DwP+FyyT5m/WlcJcGjl2GL7t0SfxBuYsIuTUf81YFGVNNhGVI1LjUHLrkN4JwyEqMqak
 f4dQ==
X-Gm-Message-State: AOAM532Z4R0JPWR9/50GWLWauFTl1aYdRGw/GgNKbd9lkavvlN+PqJ2X
 +LrcBVKlwhhsZwqzN6MzHwozNA==
X-Google-Smtp-Source: ABdhPJwavX6dP5TVSeBbdkf2Gk1zr8zB7/GO+Sf3ScSagnmPcKQAynJI+FfuQPqR2hnugRljnpTqzw==
X-Received: by 2002:a2e:2414:: with SMTP id k20mr5042046ljk.482.1631293993312; 
 Fri, 10 Sep 2021 10:13:13 -0700 (PDT)
Received: from 192.168.1.7 ([2a00:1370:810e:18d4:6011:88a9:c1bb:af5f])
 by smtp.gmail.com with ESMTPSA id p3sm609068lfa.228.2021.09.10.10.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 10:13:13 -0700 (PDT)
Date: Fri, 10 Sep 2021 20:13:09 +0300
From: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/2] elf2dmp: Fail cleanly if PDB file specifies zero
 block_size
Message-ID: <20210910201309.5caec4c6@192.168.1.7>
In-Reply-To: <20210910170656.366592-3-philmd@redhat.com>
References: <20210910170656.366592-1-philmd@redhat.com>
 <20210910170656.366592-3-philmd@redhat.com>
Organization: MIPT
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=viktor.prutyanov@phystech.edu; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Fri, 10 Sep 2021 19:06:56 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> From: Peter Maydell <peter.maydell@linaro.org>
>=20
> Coverity points out that if the PDB file we're trying to read
> has a header specifying a block_size of zero then we will
> end up trying to divide by zero in pdb_ds_read_file().
> Check for this and fail cleanly instead.
>=20
> Fixes: Coverity CID 1458869
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> Message-Id: <20210901143910.17112-3-peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Informal T-b tag on
> https://lore.kernel.org/qemu-devel/20210909004313.1dadb24e@192.168.1.7/
> Tested-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>  contrib/elf2dmp/pdb.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/contrib/elf2dmp/pdb.c b/contrib/elf2dmp/pdb.c
> index b3a65470680..adcfa7e154c 100644
> --- a/contrib/elf2dmp/pdb.c
> +++ b/contrib/elf2dmp/pdb.c
> @@ -215,6 +215,10 @@ out_symbols:
> =20
>  static int pdb_reader_ds_init(struct pdb_reader *r, PDB_DS_HEADER
> *hdr) {
> +    if (hdr->block_size =3D=3D 0) {
> +        return 1;
> +    }
> +
>      memset(r->file_used, 0, sizeof(r->file_used));
>      r->ds.header =3D hdr;
>      r->ds.toc =3D pdb_ds_read(hdr, (uint32_t *)((uint8_t *)hdr +

Tested-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>

--=20
Viktor Prutyanov

