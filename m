Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEC648B2A5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 17:53:41 +0100 (CET)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7KOy-0006iX-D5
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 11:53:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7KMu-0004Ws-5R
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:51:32 -0500
Received: from [2a00:1450:4864:20::42a] (port=36707
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7KMr-0004HV-Pc
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 11:51:31 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r28so5743591wrc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 08:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aih6jNKbePA+c45IL78gCAGbz8O4YqXBBMK0AAT8azw=;
 b=vLwjgQlP9IZ8SHmnIdpSjCcRVxwXVX3Iq0icM00NlsbpyL23iwkGs7B2JNdfNAMO6F
 Hu1TFvI8gLC8cMW3SPZEzS9u+4WlpMahTAoGhRxJvmknrJPq29xiWunpdQINMs/otJ5C
 PTn0Rvh+9Nw8uyZ38I7oiqtUIZtHdFCw7+Vm/M41D1ZnClLENROXaETTFAHnkvLC6vqJ
 EsRZGXfkhNik+7hMX9gKSvLJdPGK9McBekopRY5UpjFlNvB5zmUvTLlxOU1E07dxTgdo
 l01S3eZnS4jDshSQQ0dpKJA0Xsbq2A8ENc5KBAAh+byebhTIsPiadNQ3HtJCFHJJTK3u
 n5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aih6jNKbePA+c45IL78gCAGbz8O4YqXBBMK0AAT8azw=;
 b=ranuV0svbjoUF/m3QKq/fcfvBoBGWDOgJpHUIJ27XIfax4eoJ/afU5IqtLRrO6ITTB
 EDQe9UH5o0oZ5ckPvSsPoXLMXJ/xG6VUov3lfDlvEcDTZ1dWon/JHEh9A3c2BLnqNYkG
 cFEFeKZ24hK2jL75O3+c5cFPtAcq37QnoxDiEniX7GANJGk98bin7NMX4iF2PdRiu4fk
 p2KMWlN04/rFI89078CwFwaUViwR2fckVJQrarJzDigMj46E3ixiZ8klbnMEAMHQVEiI
 iG5Nu5tI0ZUAxzPyjWFl3FMjld4Sf20N8GNG7cuuFsYhCiBwdbHg5hKnronV9Di64YnR
 Gviw==
X-Gm-Message-State: AOAM531d4aQ05i8LobDh7Rp+X1sI5ewW5R1/7gdSo8isFXhADuX5wl4S
 Pc6K5S1gY7fGoDLH9a6RRkPkv06HiXFFth0pPT7h7Q==
X-Google-Smtp-Source: ABdhPJy14xiDsxIiaVSSzhhEzo6Bf1r887HgYoTn0WKZV9W9D1ItLYuB6VnEl4qyrBcmj2afDE6f08Y13dWnvyB5+8g=
X-Received: by 2002:adf:e907:: with SMTP id f7mr3835839wrm.319.1641919887855; 
 Tue, 11 Jan 2022 08:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20220104073121.3784280-1-clg@kaod.org>
 <20220104073121.3784280-7-clg@kaod.org>
In-Reply-To: <20220104073121.3784280-7-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 16:51:16 +0000
Message-ID: <CAFEAcA_N0dfFO6UXopDCmN2C6qukR5bgpTBPqJBbyfE2okxhCA@mail.gmail.com>
Subject: Re: [PULL 06/26] target/ppc: Improve logging in Radix MMU
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Jan 2022 at 07:31, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20211222071002.1568894-1-clg@kaod.org>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  target/ppc/mmu-radix64.c | 55 +++++++++++++++++++++++++++++++++++++---
>  1 file changed, 52 insertions(+), 3 deletions(-)

Hi; Coverity reports that this change introduces a use of
an uninitialized variable:

> @@ -306,6 +321,15 @@ static int ppc_radix64_partition_scoped_xlate(PowerP=
CCPU *cpu,
>      hwaddr pte_addr;
>      uint64_t pte;
>
> +    qemu_log_mask(CPU_LOG_MMU, "%s for %s @0x%"VADDR_PRIx
> +                  " mmu_idx %u (prot %c%c%c) 0x%"HWADDR_PRIx"\n",
> +                  __func__, access_str(access_type),
> +                  eaddr, mmu_idx,
> +                  *h_prot & PAGE_READ ? 'r' : '-',
> +                  *h_prot & PAGE_WRITE ? 'w' : '-',
> +                  *h_prot & PAGE_EXEC ? 'x' : '-',
> +                  g_raddr);

At the top of this function we now read the value at h_prot to
do this logging, but all the callsites pass in an uninitialized
value:

   int h_prot;
   ...
           ret =3D ppc_radix64_partition_scoped_xlate(cpu, 0, eaddr, prtbe_=
addr,
                                                 pate, &h_raddr, &h_prot, e=
tc);


Are the callsites wrong (should be initializing h_prot), or is the
logging wrong (and it's this function itself which is supposed to
initialize *h_prot as an extra return value) ?

This is CID 1468942.

thanks
-- PMM

