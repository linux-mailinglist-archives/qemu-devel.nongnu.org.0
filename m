Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DFD646AC9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 09:42:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3CTG-0000Pj-F6; Thu, 08 Dec 2022 03:41:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p3CSv-0000OI-Gq
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 03:41:14 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p3CSp-0007MZ-MX
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 03:41:12 -0500
Received: by mail-wm1-x336.google.com with SMTP id n7so523388wms.3
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 00:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkhTd19TGd6DyVZdFbwsIXpQkeUT50DTDJW6NLgew20=;
 b=Cj/jxqqYO4q0bq4VvRUp7AAUtkW4p6aWcKp7EChw4j0ehRk60Nh50oJxVOlbAXYLiX
 mklKlW5VUonqLC9r5N7DvTUpwzQj+E5zjVuuBBy0l6Qw24elm3P/quzeYxs+GmIOQQS6
 J0UZaLQduB+FxaBVm3+xUEgtnk4rDH9+XPyRYS0j2BV0GLOIWybbz4WrDCnlNIxzGfnh
 2PZCt2UHvaDYDKL3YNofVOl93P+UsJiET5bPZI7vXRZ9OJXBBhCPeeLjDRJ1e4fbxoWi
 /i8HFCIBxUGvPJpzQ73FSseorOJj4rTbo2F7dPRMwOLgtTg8kfzhWX0WNeue2gfHuHIj
 /TOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mkhTd19TGd6DyVZdFbwsIXpQkeUT50DTDJW6NLgew20=;
 b=B08UAoQiP3ivNYP3kF4MQ3TW30XO7NCYMNFy7x25XcBHh8+xGKLyPVKLWjBP+ChIBO
 GtJRrV69VcgbNiq9Whlz1jnUOfTvhVeYu95eQktwo9rCfwoZsgoFSqjIVfPcoIpkA1Cl
 34nlIp2sgi20SlTiTXTME5MCQ6eHsxsZ5bEkk9aw7ty+N7jgoCz8ofBbAmualIxJ6nwa
 ai93l8i5TB22cKZdwSimYWIx+lUcJt8RIcsBaSKUO+e1xMtA++IjRkDNB5s8Nis1QiiT
 3Er/SttGbzkEAcvcJL8pLIrF8d3mdQfBtWSKb0qYHrvTJ5IXKtkXP6XKf0MIfB0mL+vC
 ne8Q==
X-Gm-Message-State: ANoB5plxce5CFgNUHz1SNMBjlemkjS0dxCxSzxg2apLrkv+oUJ+MhWdC
 1DKFHwhbDM7o61rmIHQ2jVEIIg==
X-Google-Smtp-Source: AA0mqf4z4TbxMFH52K4ZkeQN7xzFCMQFO+en/b+5MPg/1aQ6INtfl2ZRgV/4NeV5VKE8te8lAzOwqg==
X-Received: by 2002:a7b:ce84:0:b0:3c6:e63e:24e with SMTP id
 q4-20020a7bce84000000b003c6e63e024emr1667405wmj.37.1670488864605; 
 Thu, 08 Dec 2022 00:41:04 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a05600c4f4200b003cf87623c16sm2162720wmq.4.2022.12.08.00.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 00:41:04 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 85A281FFB7;
 Thu,  8 Dec 2022 08:41:03 +0000 (GMT)
References: <20221207174129.77593-1-philmd@linaro.org>
 <20221207174129.77593-2-philmd@linaro.org>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>, Stafford
 Horne <shorne@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Marek Vasut <marex@denx.de>, Laurent Vivier <laurent@vivier.eu>,
 =?utf-8?Q?C=C3=A9dric?= Le
 Goater <clg@kaod.org>, Yanan Wang <wangyanan55@huawei.com>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Fabiano Rosas
 <farosas@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Greg Kurz <groug@kaod.org>, Artyom
 Tarasenko <atar4qemu@gmail.com>, Anton Johansson <anjo@rev.ng>,
 qemu-ppc@nongnu.org, Chris Wulff <crwulff@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH-for-8.0 1/4] cputlb: Restrict SavedIOTLB to system
 emulation
Date: Thu, 08 Dec 2022 08:40:09 +0000
In-reply-to: <20221207174129.77593-2-philmd@linaro.org>
Message-ID: <87lenis2xs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Commit 2f3a57ee47 ("cputlb: ensure we save the IOTLB data in
> case of reset") added the SavedIOTLB structure -- which is
> system emulation specific -- in the generic CPUState structure.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  accel/tcg/cputlb.c    | 4 ++--
>  include/hw/core/cpu.h | 6 ++++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 6f1c00682b..0ea96fbcdf 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -1395,7 +1395,7 @@ static uint64_t io_readx(CPUArchState *env, CPUTLBE=
ntryFull *full,
>  static void save_iotlb_data(CPUState *cs, MemoryRegionSection *section,
>                              hwaddr mr_offset)
>  {
> -#ifdef CONFIG_PLUGIN
> +#if defined(CONFIG_PLUGIN) && !defined(CONFIG_USER_ONLY)

cputlb is softmmu only so I don't think we need to check CONFIG_USER_ONLY h=
ere.

>      SavedIOTLB *saved =3D &cs->saved_iotlb;
>      saved->section =3D section;
>      saved->mr_offset =3D mr_offset;
> @@ -1699,7 +1699,7 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchStat=
e *env, target_ulong addr,
>      return qemu_ram_addr_from_host_nofail(p);
>  }
>=20=20
> -#ifdef CONFIG_PLUGIN
> +#if defined(CONFIG_PLUGIN) && !defined(CONFIG_USER_ONLY)
>  /*
>   * Perform a TLB lookup and populate the qemu_plugin_hwaddr structure.
>   * This should be a hot path as we will have just looked this path up
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 8830546121..bc3229ae13 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -222,7 +222,7 @@ struct CPUWatchpoint {
>      QTAILQ_ENTRY(CPUWatchpoint) entry;
>  };
>=20=20
> -#ifdef CONFIG_PLUGIN
> +#if defined(CONFIG_PLUGIN) && !defined(CONFIG_USER_ONLY)
>  /*
>   * For plugins we sometime need to save the resolved iotlb data before
>   * the memory regions get moved around  by io_writex.
> @@ -406,9 +406,11 @@ struct CPUState {
>=20=20
>  #ifdef CONFIG_PLUGIN
>      GArray *plugin_mem_cbs;
> +#if !defined(CONFIG_USER_ONLY)
>      /* saved iotlb data from io_writex */
>      SavedIOTLB saved_iotlb;
> -#endif
> +#endif /* !CONFIG_USER_ONLY */
> +#endif /* CONFIG_PLUGIN */
>=20=20
>      /* TODO Move common fields from CPUArchState here. */
>      int cpu_index;


--=20
Alex Benn=C3=A9e

