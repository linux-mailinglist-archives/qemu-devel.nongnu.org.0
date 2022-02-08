Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC674ADE56
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 17:27:15 +0100 (CET)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHTKk-0003DA-RZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 11:27:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSFW-0002G3-74
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:17:46 -0500
Received: from [2a00:1450:4864:20::42d] (port=42807
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSFT-0007um-Vx
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:17:45 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h6so12650311wrb.9
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oDRyezidbo4gcexlUVM6Y7NZWzWCgOf/AN+jgiNmXWo=;
 b=NFvUNKQzCwRJ3lkiKj+afaf4hpHs0jITyCZzdlOQ5aOhiK/NIDNrHnWEBPBxaQpuR+
 5e4gxCgFAnm7NdA/vtj9kwrBBlpVJassuSFhGJhnx8oIKXFQ+LBcNzXwp2vqs8jxvnOt
 qTer3CeXibVXGtyypEoe9TC2MQPuIuBy/gJ6b+aIqD2RmOsaqGp6SEJcCcm2Ji3fQpgT
 JAXpW8i6QuJx1PzPb2uUS3BQJSogZIoKa3WwhzOz57rJ/gq79CMrAZEnMp15V1nklkPJ
 /E7vlEyNEm+p5NIq1obep7BCh9Dt+tAmMZ0k4APFoWPYqWHDv75dEZYNU8fmVJF7Btr5
 W6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oDRyezidbo4gcexlUVM6Y7NZWzWCgOf/AN+jgiNmXWo=;
 b=mkDsFH2PTDWcdywINTtdGCdj6GO38+emwsGSMRdGaXrA6JA1sIwOY0I4viGj6thvb9
 3Pc0TDyual6WcWIkjYU/CepBf2Ty1makKRqsoPcCM2whjz8JRIKmNn1yweaRxgkR4veC
 6Ka2Fm2iI34k5LfZY+DT4rjcgzUGlzsOJpy9zeZ21dWHvuuq1Z9VBWfciAxsD3sZasaZ
 Oq5/v7D0NoNBUtoKJ1PwNyaBW5Ya/9wCkC//Kw3eTlry0Wl0L5vTJMEADc6tHJcjb85u
 U0mG7oU75TqdIkpe+ie+v6hGRNF789yZMP8aZ5gDhZc8nSeuUAufimwyYMLsF1FAMFrh
 PRHg==
X-Gm-Message-State: AOAM5338aEwa2vzy5bsg+cAlMmqii/jb7Dtjq9PAjONE1O5DAKEIc3Wa
 R0qwT9iEYEN+E4YNBuOSokA4XYhfgICD0gXnf915EQ==
X-Google-Smtp-Source: ABdhPJxkpfed0jKdAmSkfvo7RxzN8CVYytnUd/BBc+t2hDRPdcY17DPFV8Axwto7ovt3y2Ksd+YwwRlCIo8ziVRCgUg=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr4124528wrz.2.1644333461769; 
 Tue, 08 Feb 2022 07:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
In-Reply-To: <20220208133842.112017-2-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 15:17:30 +0000
Message-ID: <CAFEAcA9teH-ejt3NKh1rqQPToM_S-DC2JdHUkMof4YwHXoaXtA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: quintela@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, alex.williamson@redhat.com, imammedo@redhat.com,
 stefanb@linux.vnet.ibm.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 15:08, Eric Auger <eric.auger@redhat.com> wrote:
>
> Representing the CRB cmd/response buffer as a standard
> RAM region causes some trouble when the device is used
> with VFIO. Indeed VFIO attempts to DMA_MAP this region
> as usual RAM but this latter does not have a valid page
> size alignment causing such an error report:
> "vfio_listener_region_add received unaligned region".
> To allow VFIO to detect that failing dma mapping
> this region is not an issue, let's use a ram_device
> memory region type instead.

This seems like VFIO's problem to me. There's nothing
that guarantees alignment for memory regions at all,
whether they're RAM, IO or anything else.

> +    s->crb_cmd_buf = qemu_memalign(qemu_real_host_page_size,
> +                                HOST_PAGE_ALIGN(CRB_CTRL_CMD_SIZE));
> +
>      memory_region_init_io(&s->mmio, OBJECT(s), &tpm_crb_memory_ops, s,
>          "tpm-crb-mmio", sizeof(s->regs));
> -    memory_region_init_ram(&s->cmdmem, OBJECT(s),
> -        "tpm-crb-cmd", CRB_CTRL_CMD_SIZE, errp);
> +    memory_region_init_ram_device_ptr(&s->cmdmem, OBJECT(s), "tpm-crb-cmd",
> +                                      CRB_CTRL_CMD_SIZE, s->crb_cmd_buf);
> +    vmstate_register_ram(&s->cmdmem, dev);
>
>      memory_region_add_subregion(get_system_memory(),
>          TPM_CRB_ADDR_BASE, &s->mmio);
> @@ -309,12 +315,25 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
>      qemu_register_reset(tpm_crb_reset, dev);
>  }

As QEMU code goes, this seems much worse than what it replaces.
To have a memory region backed by RAM and migrated in the
usual way, memory_region_init_ram() is the right thing.

thanks
-- PMM

