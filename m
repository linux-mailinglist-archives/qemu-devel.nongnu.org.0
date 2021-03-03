Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148DF32BD17
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 23:13:48 +0100 (CET)
Received: from localhost ([::1]:58334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZkZ-0008Qd-4B
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 17:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHZff-0001RU-Bs
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 17:08:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHZfc-0007pH-LV
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 17:08:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614809319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ta2T9uz1JFQzlu06+K/2lLMfo+o2zkn/sy8USwwlayc=;
 b=airnfAApNx1aj1I1cGzaYrLtImNCNEhmlyW+4Oh6OVCC7KDc61n7jJIOZZSp59ffzTu1BT
 r+J8bcfNGA9NXCPOa8FNo4xI8wMErLCGAJm1TXVwRkXKmM0uMBhtcdstSRA1lIbH1ptYON
 FfcGS0BGSSvge+IEKce2U1sQYa3YFG0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-SnVKmNsRMIOasRuLdIfTpQ-1; Wed, 03 Mar 2021 17:08:38 -0500
X-MC-Unique: SnVKmNsRMIOasRuLdIfTpQ-1
Received: by mail-ej1-f72.google.com with SMTP id di5so2629670ejc.1
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 14:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ta2T9uz1JFQzlu06+K/2lLMfo+o2zkn/sy8USwwlayc=;
 b=h8txQ1VahgcY5xGVNg39xp1UKjeYapOevtC7Bv6S2verg3Ls9I+XkCEqc1cjDhURxZ
 fzTlvY9TK6B1xybJV5PMvZaPRWEUWJV3SfrK1OIOUCEK94GZZmXo9QjaZXq0+XVAaKdc
 CTe5a5FpfgqmQGQI0kCz51UUW0XBswfCXgN/cKKHQmojwiRage11m/7Zl5EvaogTLixC
 9phL53yDlx7vgDBvOjBjbsBT5HIJF4pmPSjiFyq0bSdeTnZkKyZRelNILmIkBaIE0Psb
 KtA/melf+3IsOmW2FCqnhxEMpkTsE8PWMkJbEerbADVjwQ5LtKDHlVk7jlGmZ0As+eqk
 hs1w==
X-Gm-Message-State: AOAM532XiU4E9oxQPHizYMsshUg9AxOAISTc0iZqF04cNgvmo3T3R0/l
 9KTVAQJiDmlKOBfGRvGDjdGNPbTvKwFszvhE5WIefbQeDiauJeeeSPFOdJLekOL0buSFpHyYrvJ
 2wuqleK1+nJaIgUE=
X-Received: by 2002:a17:906:a443:: with SMTP id
 cb3mr802794ejb.542.1614809316926; 
 Wed, 03 Mar 2021 14:08:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz56sT0NW8EjqxYz0A+fknbgl38ITC5jaTDGAMR0f5pUGqo4P8Tz8N/VIS/NfySqFVb3G/Aqw==
X-Received: by 2002:a17:906:a443:: with SMTP id
 cb3mr802778ejb.542.1614809316782; 
 Wed, 03 Mar 2021 14:08:36 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id m14sm15763480edd.63.2021.03.03.14.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 14:08:36 -0800 (PST)
Date: Wed, 3 Mar 2021 17:08:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4 03/28] cpu: Introduce cpu_virtio_is_big_endian()
Message-ID: <20210303170743-mutt-send-email-mst@kernel.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-4-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210303214708.1727801-4-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 10:46:43PM +0100, Philippe Mathieu-Daudé wrote:
> Introduce the cpu_virtio_is_big_endian() generic helper to avoid
> calling CPUClass internal virtio_is_big_endian() one.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Using virtio in the name here probably because virtio wants this?
That doesn't sound like a good naming strategy, name should
tell us what function does not how it's used.

> ---
>  include/hw/core/cpu.h | 9 +++++++++
>  hw/core/cpu.c         | 8 ++++++--
>  hw/virtio/virtio.c    | 4 +---
>  3 files changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 2d43f78819f..b12028c3c03 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -602,6 +602,15 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>   */
>  int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
>  
> +/**
> + * cpu_virtio_is_big_endian:
> + * @cpu: CPU
> +
> + * Returns %true if a CPU which supports runtime configurable endianness
> + * is currently big-endian.
> + */
> +bool cpu_virtio_is_big_endian(CPUState *cpu);
> +
>  #endif /* CONFIG_USER_ONLY */
>  
>  /**
> diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> index 4dce35f832f..daaff56a79e 100644
> --- a/hw/core/cpu.c
> +++ b/hw/core/cpu.c
> @@ -218,8 +218,13 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
>      return 0;
>  }
>  
> -static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
> +bool cpu_virtio_is_big_endian(CPUState *cpu)
>  {
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +
> +    if (cc->virtio_is_big_endian) {
> +        return cc->virtio_is_big_endian(cpu);
> +    }
>      return target_words_bigendian();
>  }
>  
> @@ -438,7 +443,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
>      k->write_elf64_note = cpu_common_write_elf64_note;
>      k->gdb_read_register = cpu_common_gdb_read_register;
>      k->gdb_write_register = cpu_common_gdb_write_register;
> -    k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
>      set_bit(DEVICE_CATEGORY_CPU, dc->categories);
>      dc->realize = cpu_common_realizefn;
>      dc->unrealize = cpu_common_unrealizefn;
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 1fd1917ca0f..fe6a4be99e4 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -1973,9 +1973,7 @@ static enum virtio_device_endian virtio_default_endian(void)
>  
>  static enum virtio_device_endian virtio_current_cpu_endian(void)
>  {
> -    CPUClass *cc = CPU_GET_CLASS(current_cpu);
> -
> -    if (cc->virtio_is_big_endian(current_cpu)) {
> +    if (cpu_virtio_is_big_endian(current_cpu)) {
>          return VIRTIO_DEVICE_ENDIAN_BIG;
>      } else {
>          return VIRTIO_DEVICE_ENDIAN_LITTLE;
> -- 
> 2.26.2


