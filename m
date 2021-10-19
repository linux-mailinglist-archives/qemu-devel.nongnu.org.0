Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDF432F45
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:21:53 +0200 (CEST)
Received: from localhost ([::1]:33816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjRY-0008L8-DC
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:21:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjLD-0002LN-44
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:15:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mcjL8-0004LV-H8
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:15:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634627713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1vBi/GvGHaGPop25rFYYVW6Pq41McgNV349uqaUE00=;
 b=fHNmo5OgNGv0C3vyugUHuGGlyKVLgVkHy7MAsJJwOwsL0E+h0Qa5ClSq0So4utKuyXOuyb
 Ot6OHSBlcJq0dsnwds3JNy0KosrG9e6aGkQ+KET3TIxNQPZq3Wt34mwxvI7M6pRX/86CKD
 UsyUfo+UnTwtrtBrDV6aPJ6xjl8jdIs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-xRa3svpqPmOk4-qS7RTiQQ-1; Tue, 19 Oct 2021 03:15:12 -0400
X-MC-Unique: xRa3svpqPmOk4-qS7RTiQQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 s22-20020a1ca916000000b0030dcdcd37c5so413062wme.8
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 00:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F1vBi/GvGHaGPop25rFYYVW6Pq41McgNV349uqaUE00=;
 b=i0KW2peEsX6NED/6DN8iHrXf7O4S8e9GFABkI2ZY0vnxfzsLkmmg2EVSfWOZRU6xdW
 HUuSDw98H/A/sgvQyncL2LntvvRI9nwqI5WqY1jtm76z1Vfxl9xu9lELUc1yFP1qdc16
 0i1XfP8heAp3VOMC1MXpv1HXk6t0J4g1iOBcfzTU1Y+sHfi1jk6PVetbtwbBz1dUMAYt
 PkLWerty39KOalV7ukgIC2Ub2UbGeyUb0rPueFuEMhkOQfJeYiaRvsWKzte1oVp+vPqi
 6VEFfq/MVIFmQgW3AbJvQW2Kdiw6QQovZK/cAPlqGLGUSv/MYR9RaY4bVGqSuLhfWD2u
 fxOw==
X-Gm-Message-State: AOAM533hNUcLdZm7r7KKn5ffAroseFa9KTSh23xTCNj3pzcxdVnTjACN
 nfz1XnNllunO72h12yOAycScAbNHqSP6BIxJu0RmF9Bjr1hfIAyCrwBi7pckjgwAqXHNjv8IqNB
 rHiaym4p1EcyF00Q=
X-Received: by 2002:a1c:29c2:: with SMTP id p185mr4167794wmp.43.1634627711372; 
 Tue, 19 Oct 2021 00:15:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvrG+mLI7istE0rrgfJBY7SI2cQ0QyUj51gggZ/T3L7b3MyiHYR1KmWXuv/cIbav0CMYqLNw==
X-Received: by 2002:a1c:29c2:: with SMTP id p185mr4167777wmp.43.1634627711199; 
 Tue, 19 Oct 2021 00:15:11 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id o26sm1421216wmc.17.2021.10.19.00.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 00:15:10 -0700 (PDT)
Date: Tue, 19 Oct 2021 09:15:10 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 4/6] hw/riscv: sifive_e: Use MachineState::ram and
 MachineClass::default_ram_id
Message-ID: <20211019091510.2233398e@redhat.com>
In-Reply-To: <20211018153829.24382-4-bmeng.cn@gmail.com>
References: <20211018153829.24382-1-bmeng.cn@gmail.com>
 <20211018153829.24382-4-bmeng.cn@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Oct 2021 23:38:27 +0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

same issues as in 2/6

> ---
> 
>  hw/riscv/sifive_e.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 6e95ea5896..caae860664 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -75,7 +75,6 @@ static void sifive_e_machine_init(MachineState *machine)
>  
>      SiFiveEState *s = RISCV_E_MACHINE(machine);
>      MemoryRegion *sys_mem = get_system_memory();
> -    MemoryRegion *main_mem = g_new(MemoryRegion, 1);
>      int i;
>  
>      /* Initialize SoC */
> @@ -83,10 +82,8 @@ static void sifive_e_machine_init(MachineState *machine)
>      qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
>  
>      /* Data Tightly Integrated Memory */
> -    memory_region_init_ram(main_mem, NULL, "riscv.sifive.e.ram",
> -        memmap[SIFIVE_E_DEV_DTIM].size, &error_fatal);
>      memory_region_add_subregion(sys_mem,
> -        memmap[SIFIVE_E_DEV_DTIM].base, main_mem);
> +        memmap[SIFIVE_E_DEV_DTIM].base, machine->ram);
>  
>      /* Mask ROM reset vector */
>      uint32_t reset_vec[4];
> @@ -142,6 +139,7 @@ static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
>      mc->init = sifive_e_machine_init;
>      mc->max_cpus = 1;
>      mc->default_cpu_type = SIFIVE_E_CPU;
> +    mc->default_ram_id = "riscv.sifive.e.ram";
>  
>      object_class_property_add_bool(oc, "revb", sifive_e_machine_get_revb,
>                                     sifive_e_machine_set_revb);


