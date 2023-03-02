Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4FF6A78E2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 02:31:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXXlh-0004mM-H0; Wed, 01 Mar 2023 20:30:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXlV-0004lV-EZ
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:29:51 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1pXXlS-00054r-RT
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 20:29:48 -0500
Received: by mail-pl1-x636.google.com with SMTP id z2so15950982plf.12
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 17:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1677720585;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=4NSj820n/OLL0cvzbAOh+WiZFVVe3LmL3YlRv5wYkZ4=;
 b=XX+3f9jfxv3O/Wy4FePqy+lHlAUE4f8Qkz7xUKFobWsJe1IlhEkvxshJg/EHJAh/Zy
 hUItocWjvlsP0cC1iuJYN54f7VL0KxrSXK4ycfP5l7QIHoaQNI+Znetoj6edCHZ8MZwL
 vIwVTkfzJ35i9ou9b5pKUZnT0XAGxJh8v9QpFM48XOEFNMnKrti/OOMeDxUjCJZNmkdy
 K/EUwmXzgUlQEVs5QljnJgcdxk3lP6sykf0rvIhlL6SnyHRjWdpBwwzxsp3WZcX4vI2a
 tXv7gKG0bL7yvcFOzWnnqYnMkyZdfBfNxbLntLT4Hx8b35vxIcmm+XGzYbdElnEsLjvG
 5LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677720585;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4NSj820n/OLL0cvzbAOh+WiZFVVe3LmL3YlRv5wYkZ4=;
 b=RJCuveZ7t77yeH1P0+Dyxtq9NgqNk3hgT+ZRTOCDK7e8o6RGyGfks2ynniBYnwb1Op
 8qk6a42RgR24xxWQVuCV9n5IPkm8Bh72GR0Z6G1m4Oy+bzn9s5yHZH3mYzP2QZCBvlPE
 Y/Asln2LVkzpbwy6M1340VD6kDgvfqqqDQRcyWaz4m69uDR8jx0Hcm/OnOVZ9AvjujMe
 3KJvdxpshIwrW63Ejxh2+E05C7+ZVtlmqrUcFpt//jCov9QtMW7nshFNie+Y/VLiQkEc
 ksXVxq8x/18Qa6N/Vl5LzIGdAkFB6M7dL21dvZau4ZMPljlUokjbycgLAKn9ltUm3lba
 fI1Q==
X-Gm-Message-State: AO0yUKW0UsORUVjux3ROYIdo+fAJAseyzuA4AsdHiKOPlOqLkPkUub7y
 j70ddtd6J1vOR2uEfNNaNBe1OVXyYjdQNtsC
X-Google-Smtp-Source: AK7set+rkyCgms9l1ZzH2XogH7nANf/QwgNPjJIt0UWd4spQ30UNuV5ucfd0q/9nlXFPZHkRPbbvIg==
X-Received: by 2002:a17:903:2308:b0:19d:16ed:3e34 with SMTP id
 d8-20020a170903230800b0019d16ed3e34mr10651303plh.26.1677720584670; 
 Wed, 01 Mar 2023 17:29:44 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 b11-20020a1709027e0b00b0019a95764e68sm8940609plm.294.2023.03.01.17.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 17:29:44 -0800 (PST)
Date: Wed, 01 Mar 2023 17:29:44 -0800 (PST)
X-Google-Original-Date: Wed, 01 Mar 2023 17:28:55 PST (-0800)
Subject: Re: [PATCH v2 1/2] hw/riscv: Skip re-generating DT nodes for a given
 DTB
In-Reply-To: <20230228074522.1845007-1-bmeng@tinylab.org>
CC: qemu-devel@nongnu.org, dbarboza@ventanamicro.com,
 Alistair Francis <Alistair.Francis@wdc.com>, bin.meng@windriver.com,
 zhiwei_liu@linux.alibaba.com, liweiwei@iscas.ac.cn, qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng@tinylab.org
Message-ID: <mhng-ec363adb-e2f4-4522-9956-b68b437bad49@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, 27 Feb 2023 23:45:21 PST (-0800), bmeng@tinylab.org wrote:
> Launch qemu-system-riscv64 with a given dtb for 'sifive_u' and 'virt'
> machines, QEMU complains:
>
>   qemu_fdt_add_subnode: Failed to create subnode /soc: FDT_ERR_EXISTS
>
> The whole DT generation logic should be skipped when a given DTB is
> present.
>
> Fixes: b1f19f238cae ("hw/riscv: write bootargs 'chosen' FDT after riscv_load_kernel()")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>
> (no changes since v1)
>
>  hw/riscv/sifive_u.c | 1 +
>  hw/riscv/virt.c     | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
> index ad3bb35b34..76db5ed3dd 100644
> --- a/hw/riscv/sifive_u.c
> +++ b/hw/riscv/sifive_u.c
> @@ -118,6 +118,7 @@ static void create_fdt(SiFiveUState *s, const MemMapEntry *memmap,
>              error_report("load_device_tree() failed");
>              exit(1);
>          }
> +        return;
>      } else {
>          fdt = ms->fdt = create_device_tree(&fdt_size);
>          if (!fdt) {
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index 86c4adc0c9..0c7b4a1e46 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -1014,6 +1014,7 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
>              error_report("load_device_tree() failed");
>              exit(1);
>          }
> +        return;
>      } else {
>          ms->fdt = create_device_tree(&s->fdt_size);
>          if (!ms->fdt) {

Thanks, these two are queued up.

