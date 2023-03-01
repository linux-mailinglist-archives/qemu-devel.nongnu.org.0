Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFAB6A7672
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:55:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXUPE-0004kp-G4; Wed, 01 Mar 2023 16:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUPC-0004kP-DS
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:54:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXUPA-000620-W9
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677707672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vZkr8nDyx5NdIY8rUX0qdQ7EJqXixGN16DtsL7K32jk=;
 b=SisaqXMxWo1+Zahb1mD3KVUfH3fJw12SCicW/Suu7fRgniCuvUUK8jGzzs+zIenDrv/1/Q
 DLRIYgPjUlvMsS1e5LHXTPQrc80ycU+DeuhZxmBV38wJ0e+oT4uWEc//o74BWoAtGpiJfS
 OaGdl5+a1BUUAqyk5w3zpFbEPky0G1I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-668-j6SI7DvLMKi0-jn4n-xTVA-1; Wed, 01 Mar 2023 16:54:31 -0500
X-MC-Unique: j6SI7DvLMKi0-jn4n-xTVA-1
Received: by mail-wm1-f72.google.com with SMTP id
 4-20020a05600c024400b003eb2e295c05so5054162wmj.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:54:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677707670;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZkr8nDyx5NdIY8rUX0qdQ7EJqXixGN16DtsL7K32jk=;
 b=WfEHJAkV7JlvztAFnleL4SBiEtmJHP3zmm4n8DOqR5BbhYW4/uI4NAHW3TWopwFIXd
 UlhOtIecUn6j2scSZLqoIEsEpl5nsGXl5IbTThV3fsAvx8mKrO7aX0Fga/TzhSpnNRAd
 0acPtRF7NDVpCNq3hgUnZYv9Dc3fOckgWw8OfMRt1W5biZwF79VxJznCePGaEJyP/aWo
 hDjCoHTv0zzq2lbgZFO4l+Zy06ThWMFMNIw9ptvfO9SpyYfv6G/5yfVaDm8wfF501VtL
 EiI2zZwkNuvpPUr9f5CZ1YGaF6IpmZIqdlvbgyuKRK5v/XKxPnAxidlf0sC97b9OykKd
 jmhw==
X-Gm-Message-State: AO0yUKVIj1NmunRjF4sQ66FHW34KlHtYskTIgzijNg3e3hIaviQq4vHi
 V/kzC5+zLQ6Epsw1FcNDiRAZ/DYLpb4GKoY96jcywSNna7X8djWfjsQ2TH+Yr3Jq/3eb+RSRgN7
 r9Ea0Dy81FPun7TQ=
X-Received: by 2002:a05:600c:a42:b0:3e2:1f00:bff7 with SMTP id
 c2-20020a05600c0a4200b003e21f00bff7mr6308543wmq.12.1677707670133; 
 Wed, 01 Mar 2023 13:54:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8DKsfkguH/N7HOoJwYYzs64dHEczSt4kvr/TdYo3R9NnbcLLlUCwEh5DBRzQnJEWFAIyrnVQ==
X-Received: by 2002:a05:600c:a42:b0:3e2:1f00:bff7 with SMTP id
 c2-20020a05600c0a4200b003e21f00bff7mr6308528wmq.12.1677707669773; 
 Wed, 01 Mar 2023 13:54:29 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 bg12-20020a05600c3c8c00b003e8dc7a03basm820085wmb.41.2023.03.01.13.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:54:29 -0800 (PST)
Date: Wed, 1 Mar 2023 16:54:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Sergio Lopez <slp@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 0/5] hw/timer/i8254: Un-inline and simplify IRQs
Message-ID: <20230301165402-mutt-send-email-mst@kernel.org>
References: <20230215174353.37097-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230215174353.37097-1-philmd@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Wed, Feb 15, 2023 at 06:43:48PM +0100, Philippe Mathieu-Daudé wrote:
> i8254_pit_init() uses a odd pattern of "use this IRQ output
> line if non-NULL, otherwise use the ISA IRQ #number as output".
> 
> Rework as simply "Use this IRQ output".


Acked-by: Michael S. Tsirkin <mst@redhat.com>


Given it also affects KVM I will let Paolo merge this.

> Un-inline/rename/document functions.
> 
> Based-on: <20230215161641.32663-1-philmd@linaro.org>
>           "hw/ide: Untangle ISA/PCI abuses of ide_init_ioport" v2
> https://lore.kernel.org/qemu-devel/20230215161641.32663-1-philmd@linaro.org/
> 
> Philippe Mathieu-Daudé (5):
>   hw/timer/hpet: Include missing 'hw/qdev-properties.h' header
>   hw/timer/i8254: Factor i8254_pit_create() out and document
>   hw/i386/pc: Un-inline i8254_pit_init()
>   hw/timer/i8254: Really inline i8254_pit_init()
>   hw/i386/kvm: Factor i8254_pit_create_try_kvm() out
> 
>  hw/i386/kvm/i8254.c        | 18 ++++++++++++++
>  hw/i386/microvm.c          |  6 +----
>  hw/i386/pc.c               | 15 +++++-------
>  hw/isa/i82378.c            |  2 +-
>  hw/isa/piix4.c             |  4 ++--
>  hw/isa/vt82c686.c          |  2 +-
>  hw/mips/jazz.c             |  2 +-
>  hw/timer/hpet.c            |  1 +
>  hw/timer/i8254.c           | 16 +++++++++++++
>  include/hw/timer/i8254.h   | 48 +++++++++++++-------------------------
>  target/i386/kvm/kvm-stub.c |  6 +++++
>  11 files changed, 69 insertions(+), 51 deletions(-)
> 
> -- 
> 2.38.1


