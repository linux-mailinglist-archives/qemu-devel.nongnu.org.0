Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F5F252C09
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 13:03:57 +0200 (CEST)
Received: from localhost ([::1]:47310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAtDg-0000Yj-Kl
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 07:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kAt5X-0002Xu-GF
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:55:31 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liq3ea@gmail.com>) id 1kAt5V-0001pi-Ng
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 06:55:31 -0400
Received: by mail-ot1-x344.google.com with SMTP id t7so1148698otp.0
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 03:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NBFS1/HS/zOYoxL94070hIRVoqRtTMgsIpaJj4PD718=;
 b=s7IhKc7ZOezIrm0P4NN0fruwBeEo1wUd7Twn/SQArkXlB8+BTNcZGueUjxaj1+AJqy
 v05PunaUUI9CBBQATTOlGdDIDxWVhya8nbQnCJH37pgEddYWitc2X6qT/P8lLIa4b9ar
 bQRXmccq3L4lxgK4beqUFD7BJydRjcdBZWF43WKC/yn/YWhh7t3dZlCYpN1ZgMi0nvE0
 hEVmCJv+XsG3xClmPcBtlviw0em3sn5SQ68CpjCKdUXdus6xtzj9cO0Kg4uZGyKhjM8O
 jGvMft0TEP3uipUJEHgW31T1DiVQeTgr558tI4ud439JJqypeZdoMRs+8DA96/GAJeZn
 9DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NBFS1/HS/zOYoxL94070hIRVoqRtTMgsIpaJj4PD718=;
 b=JxR5fsVG40vfwW26zT+iJtzeTQaUuavECVwzjj+hLW9lOqGqAH/h+K6sB/crT/noDk
 BTaX2Xosw+ozP3baV3Hg1uk9OSRck0ixxXsKDzkqIvQUN0+KKtQhJuApHnw9BWEG/thJ
 vvBIYdsPRLv3Q0Gg6rCh+1+V2mwe21KpqPY4tQ14LC3CMZe9dRUKX/LdpgUs3NO9TUoK
 3EAWVSoommcydBe111fRlQLebuClUDRjLNRao8CYutb0blppf1dgQB3YJmaNDoDM0oLj
 5T5So0u8hzjw1Cv9jKwTlVY1QQ9JfnNAb/FfZBcV+XZKdjJoMNC972WroG4woJRmsYYg
 +Okg==
X-Gm-Message-State: AOAM5336pbINCh3hZCxHstK7aIiYJTpbEJuTKMwG95NMPjid49ok9pRo
 UvFt11IiSi758CMBdPBBEASB/mg11gtz63QsbPE=
X-Google-Smtp-Source: ABdhPJyHFtAEQyeppFDRDJBNvYw+CzFKAAnQZJqXNlkoGAKkZ5OtnkRnzf9yZoTQRcNHHtPelzXTX3IRz6wv54S1bzw=
X-Received: by 2002:a9d:788:: with SMTP id 8mr2853901oto.181.1598439327729;
 Wed, 26 Aug 2020 03:55:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200814160241.7915-1-pannengyuan@huawei.com>
 <20200814160241.7915-5-pannengyuan@huawei.com>
In-Reply-To: <20200814160241.7915-5-pannengyuan@huawei.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Wed, 26 Aug 2020 18:54:51 +0800
Message-ID: <CAKXe6SJ_1FF2O36E21f2pORhEjpg80QYbTidBVYOk0nhdodnXw@mail.gmail.com>
Subject: Re: [PATCH 04/12] elf2dmp/pdb: Plug memleak in pdb_init_from_file
To: Pan Nengyuan <pannengyuan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=liq3ea@gmail.com; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pan Nengyuan <pannengyuan@huawei.com> =E4=BA=8E2020=E5=B9=B48=E6=9C=8814=E6=
=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:51=E5=86=99=E9=81=93=EF=BC=9A
>
> Missing g_error_free in pdb_init_from_file() error path. Fix that.
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>

Reviewed-by: Li Qiang <liq3ea@gmail.com>

> ---
> Cc: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>  contrib/elf2dmp/pdb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/contrib/elf2dmp/pdb.c b/contrib/elf2dmp/pdb.c
> index a5bd40c99d..b3a6547068 100644
> --- a/contrib/elf2dmp/pdb.c
> +++ b/contrib/elf2dmp/pdb.c
> @@ -285,6 +285,7 @@ int pdb_init_from_file(const char *name, struct pdb_r=
eader *reader)
>      reader->gmf =3D g_mapped_file_new(name, TRUE, &gerr);
>      if (gerr) {
>          eprintf("Failed to map PDB file \'%s\'\n", name);
> +        g_error_free(gerr);
>          return 1;
>      }
>
> --
> 2.18.2
>
>

