Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEB6362796
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:19:28 +0200 (CEST)
Received: from localhost ([::1]:35032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXT3v-0003yn-OU
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXSew-00051i-Os
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:53:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lXSem-0007Wk-C8
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618595606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pclVr/KY8UOuGrZFXxg2lMxcKH0Z+oPHoROLoY2WHuk=;
 b=c1ETC2tIkJ/UQ0BmeSC8l0SBXheFmbuPtUmhFK86GQh4oG5KG9PiUNhzxatJc7CzAmHihZ
 2SYxVjHIbx8Yu81P4rzjw2gVx2RSBMJtVDgdIMQmNRBOnQ8c3gqXa5wgpiqUfsJR3WOuXN
 ePI9hHRN/8Hh6eh4anSglhmH+C0g6eQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-WcYjk-qpPpiv2M_bavgjMw-1; Fri, 16 Apr 2021 13:53:24 -0400
X-MC-Unique: WcYjk-qpPpiv2M_bavgjMw-1
Received: by mail-wr1-f70.google.com with SMTP id
 m2-20020a5d64a20000b02900fd24e6af66so4800394wrp.21
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 10:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pclVr/KY8UOuGrZFXxg2lMxcKH0Z+oPHoROLoY2WHuk=;
 b=KwE0QVEkROcWXXDsey3sLRVHwEc7XxIQyeOS9BV8lUxOYu7esqdJztHL5L2t4Hl5ex
 xpUlLxe5HmUzXDMIjbCPLskc0uXcmPVtpd+4GB3636Q3kbeinVvwX1BmUiylHie9q4MZ
 ALraYPWmcjPdMs0D1KhbIBjf6vAPKT7Hx+9zJGSAvdQ53sAUYxi8YS80N9f99ZB6RBSu
 ol8JvHl7M0T7LFSC5W3ScXXRTcWjOkqBgdY1WJ4RqutSWaw38TffOljXVH686I0fbWVn
 RumXiWeujqozHWDnSy+JsWgjBi9xl3PzwZmfnASy9GmxWkZr+FCTtomQdZKR57qofjL+
 UqAg==
X-Gm-Message-State: AOAM531gYj5zexsylDYV4U3mOM/dJp+4Yjt9NNyVSQR7EzaRYSSS/91m
 RjW+iiFkB5KeZN4WcGX9uUIYHSPaST6lfzlClukWHl/Etz1evFE8PxuhpjGhpjsf83gcBHYH15h
 hRlnpTHfrhWINqdQ=
X-Received: by 2002:a05:600c:379a:: with SMTP id
 o26mr9040010wmr.66.1618595603531; 
 Fri, 16 Apr 2021 10:53:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv05Qhenq9HB6mu9/d/wTK0ZrWskNWyiToF8GWUmoCCwZWIsLe58qzIdvR201ip0HwBNRZKg==
X-Received: by 2002:a05:600c:379a:: with SMTP id
 o26mr9039987wmr.66.1618595603181; 
 Fri, 16 Apr 2021 10:53:23 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id v3sm10289421wmj.25.2021.04.16.10.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 10:53:22 -0700 (PDT)
Subject: Re: [PATCH 2/4] Do not include hw/boards.h if it's not really
 necessary
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210416171314.2074665-1-thuth@redhat.com>
 <20210416171314.2074665-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e55a2cf6-2994-5318-0fa5-9a9057457e84@redhat.com>
Date: Fri, 16 Apr 2021 19:53:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416171314.2074665-3-thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 4/16/21 7:13 PM, Thomas Huth wrote:
> Stop including hw/boards.h in files that don't need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  accel/tcg/tcg-accel-ops-icount.c | 1 -
>  accel/tcg/tcg-accel-ops-rr.c     | 1 -
>  accel/tcg/tcg-accel-ops.c        | 1 -
>  hw/acpi/cpu.c                    | 1 -
>  hw/acpi/memory_hotplug.c         | 1 -
>  hw/alpha/typhoon.c               | 1 -
>  hw/arm/aspeed.c                  | 1 -

It requires the macros declared by:

OBJECT_DECLARE_TYPE(MachineState, MachineClass, MACHINE)

>  hw/arm/omap1.c                   | 1 -
>  hw/arm/omap2.c                   | 1 -
>  hw/arm/strongarm.c               | 1 -
>  hw/arm/virt.c                    | 1 -

Ditto.

>  hw/avr/arduino.c                 | 1 -

Ditto.

>  hw/avr/atmega.c                  | 1 -
>  hw/display/next-fb.c             | 1 -
>  hw/hppa/machine.c                | 1 -

Ditto.

>  hw/i386/acpi-build.c             | 1 -
>  hw/i386/acpi-microvm.c           | 1 -
>  hw/i386/intel_iommu.c            | 1 -
>  hw/i386/pc.c                     | 1 -

Ditto (MACHINE_CLASS macro).

>  hw/i386/x86-iommu.c              | 1 -
>  hw/intc/sifive_plic.c            | 1 -
>  hw/mips/loongson3_virt.c         | 1 -

Ditto.

(skipping the rest).

>  hw/ppc/e500.c                    | 1 -
>  hw/ppc/mac_newworld.c            | 1 -
>  hw/ppc/mac_oldworld.c            | 1 -
>  hw/ppc/pnv.c                     | 1 -
>  hw/ppc/ppc4xx_devs.c             | 1 -
>  hw/ppc/rs6000_mc.c               | 1 -
>  hw/ppc/spapr.c                   | 1 -
>  hw/ppc/spapr_rtas.c              | 1 -
>  hw/remote/iohub.c                | 1 -
>  hw/s390x/s390-virtio-ccw.c       | 2 --
>  hw/tricore/tc27x_soc.c           | 1 -
>  hw/tricore/triboard.c            | 1 -
>  softmmu/vl.c                     | 1 -
>  35 files changed, 36 deletions(-)


