Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F11D7435BA0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 09:25:01 +0200 (CEST)
Received: from localhost ([::1]:53500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdSRg-0006Th-H5
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 03:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mdSQJ-0005n0-0O
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:23:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mdSQG-0001jg-2a
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 03:23:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634801010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9oBrEl63pqlO0Qw2PN1ZUFmkcvLm+cFPjeBkxHwYfK8=;
 b=HTRaJ15sYT/TSuhpTyyN76hH6SMHVtFYxgjNdsFBZ/vSEGnKzCosXHdbs3n3ZfxMqD80CN
 noNhjIRApbYSQQRUlDHB6hlDSj0i2ce6IT+472sJA7m1/m8uB4KX5iwnQoHjMRdvvW7K1K
 04+pxA4Pouq7yPNNLB+LNonErVA3eic=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-Hgm21rPaOYGMSnrUR5JdgQ-1; Thu, 21 Oct 2021 03:23:27 -0400
X-MC-Unique: Hgm21rPaOYGMSnrUR5JdgQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 e14-20020a056402088e00b003db6ebb9526so23342078edy.22
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 00:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9oBrEl63pqlO0Qw2PN1ZUFmkcvLm+cFPjeBkxHwYfK8=;
 b=ki14ENfrJVJ8iYNMA60U8Moc9UHoekeAjiYFc/GKKMxd01Op/EUNNfXgfqzvd11qc0
 kdGupDnkGOl3unUG9ku4xhlPpU4pPmYyK73g/bx6cpC3KFPZNXQJZC6jKd4p2ywe8sdN
 wRCYCSMHkO+uCdRcL/Z1ATtOl5KUoslEl0ZbVw9MGO9m5mOVIDLWK7Qpxaty6/C5BSBN
 kpbx+0KqmR/QbJlaY7cxGXUEXQQZNOMPfQdF1fwGCbqoezSmF4teLITmjLHjXcLv7m1w
 GuId0X5k2kgsL1+VGJAIWYW9fP+1d3IldVcORdaq4JwfsYOhxcKYErkzzUf1k0BcdULr
 Luog==
X-Gm-Message-State: AOAM530NxlGbJ3b8CYQq5mE9NKydFvR1Ekl8Zd9oLNwPgv7ufWXmQK8Q
 RlvzpHOUl182LgnsW1OSXDxNM2ntVS/dS01+PMhDZy4lNjgGRjDAI/OlLEQYoewFGDv/l/B8AN8
 Gp+GPnbW2FShBm5o=
X-Received: by 2002:a17:906:5384:: with SMTP id
 g4mr5152552ejo.27.1634801006078; 
 Thu, 21 Oct 2021 00:23:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwU6i2rw+vdcwXa1tQXd3xHq2BpjI3G7iqZp/Ge4QvtHZMfqEcPPq4fWYBXVK2tggIUSar+1g==
X-Received: by 2002:a17:906:5384:: with SMTP id
 g4mr5152526ejo.27.1634801005840; 
 Thu, 21 Oct 2021 00:23:25 -0700 (PDT)
Received: from steredhat (host-79-30-88-77.retail.telecomitalia.it.
 [79.30.88.77])
 by smtp.gmail.com with ESMTPSA id b17sm2284637edy.47.2021.10.21.00.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 00:23:25 -0700 (PDT)
Date: Thu, 21 Oct 2021 09:23:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 0/3] multiboot: Use DMA instead port-based transfer
Message-ID: <20211021072323.guzsnnhrnim44qw7@steredhat>
References: <20211020140244.485249-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020140244.485249-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: adam@l4re.org, qemu-devel@nongnu.org, marcus.haehnel@kernkonzept.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 20, 2021 at 04:02:41PM +0200, Paolo Bonzini wrote:
>An updated version of the patch at
>https://patchew.org/QEMU/YWM6jboU9fUib6Iy@os.inf.tu-dresden.de/,
>which includes the necessary glue for compatibility with older
>machine types.  When fw_cfg DMA is disabled, the existing ROM
>is used instead.
>
>Marcus Hähnel (1):
>  optionrom: add a DMA-enabled multiboot ROM
>
>Paolo Bonzini (2):
>  target/i386: move linuxboot_dma_enabled to X86MachineState
>  target/i386: use DMA-enabled multiboot ROM for new-enough QEMU machine
>    types
>
> hw/i386/microvm.c                 |   5 ++-
> hw/i386/multiboot.c               |  10 ++++-
> hw/i386/multiboot.h               |   4 +-
> hw/i386/pc.c                      |   8 ++--
> hw/i386/pc_piix.c                 |   3 +-
> hw/i386/pc_q35.c                  |   3 +-
> hw/i386/x86.c                     |   7 ++--
> include/hw/i386/pc.h              |   3 --
> include/hw/i386/x86.h             |   5 ++-
> pc-bios/meson.build               |   1 +
> pc-bios/multiboot_dma.bin         | Bin 0 -> 1024 bytes
> pc-bios/optionrom/Makefile        |   4 +-
> pc-bios/optionrom/multiboot.S     |   4 +-
> pc-bios/optionrom/multiboot_dma.S |   2 +
> pc-bios/optionrom/optionrom.h     |  66 ++++++++++++++++++++++++++++++
> 15 files changed, 102 insertions(+), 23 deletions(-)
> create mode 100644 pc-bios/multiboot_dma.bin
> create mode 100644 pc-bios/optionrom/multiboot_dma.S
>
>-- 
>2.31.1
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


