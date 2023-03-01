Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3481F6A7630
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:32:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXU39-0002tg-BB; Wed, 01 Mar 2023 16:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXU32-0002sd-8A
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:31:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXU30-0007Tl-O6
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:31:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677706295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uiNCerQo3l7CeVmG/GS4pA6rN3/iU/2bumjYtChVESE=;
 b=a1WCYRl4o+l6V+mJL6EUWii0fgORgVTd8XHAQrMVqcvdii3uSIsY1AlimEE2rMx96BeK1l
 Ka66ZWz/myKUULQzczd+zW1XZUZa7M+ptL42DwIP4QC1v7bD/9qjSMl2uD2fD7RrRT0n6e
 X82+OMBl40Ino42PnhDk4SffdmMwPVU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-440-vD0nAPZvOfCWd2JRHf32bw-1; Wed, 01 Mar 2023 16:31:33 -0500
X-MC-Unique: vD0nAPZvOfCWd2JRHf32bw-1
Received: by mail-wr1-f70.google.com with SMTP id
 bh3-20020a05600005c300b002c70d6e2014so2851231wrb.10
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:31:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677706292;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uiNCerQo3l7CeVmG/GS4pA6rN3/iU/2bumjYtChVESE=;
 b=SUzYFow1m6RAG3IGsMCnoVPek6Q529t7Jfzta48ADznX3lfcnWyx+2BC9/m7H2bmMI
 vTAb0mNfyyPPbCoMr5doRhOQpDJlDThErBnPMrg6Rj1l94jJDrV3zPc1QtmntHlGfudj
 umvs4gkFY3jLlSOlJqBpaB0h5pYJXmK55vbDG9/e+2xoZY1IWSk3qGIu1q/zMxqQI7Y1
 8dTa2YMh+DoQKoms899RMWQ6q0CyMebvBZxmYgBow67B8GWpq/3NxZ8GVl42LORmi/Zv
 B16KXeESD8gIAUXeIf6H4ehgQYLpgFxUjaHf8OyoPck7X0blSvACC2hI8LSMte7XgQnw
 H8CQ==
X-Gm-Message-State: AO0yUKXien1VJd6OH4YeIERJ3qF2vWqXsOfFEOBi0fl8Car7/Ema6q2Z
 C/EXUduoAM8dF0skhVhhS2BFZH/ej0bKzjE2XQDqLTLKK9LUbCj7kEj1/Yc9XOiVwpswNnx8nkS
 uwpDymKItefEcHDQ=
X-Received: by 2002:a5d:4051:0:b0:2c7:1aaa:2b49 with SMTP id
 w17-20020a5d4051000000b002c71aaa2b49mr5636187wrp.23.1677706292416; 
 Wed, 01 Mar 2023 13:31:32 -0800 (PST)
X-Google-Smtp-Source: AK7set8viHf2yYcjo0e4YQLUDQ6DcSdycuaNzaBQ0nyUHbfo0kpNrg0fo8KIIX5yInZoiN759mq4tA==
X-Received: by 2002:a5d:4051:0:b0:2c7:1aaa:2b49 with SMTP id
 w17-20020a5d4051000000b002c71aaa2b49mr5636171wrp.23.1677706292085; 
 Wed, 01 Mar 2023 13:31:32 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 d18-20020adfe892000000b002c707b336c9sm13650534wrm.36.2023.03.01.13.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:31:31 -0800 (PST)
Date: Wed, 1 Mar 2023 16:31:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Eduardo Habkost <eduardo@habkost.net>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 12/12] hw: Move ich9.h to southbridge/
Message-ID: <20230301162609-mutt-send-email-mst@kernel.org>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-13-shentey@gmail.com>
 <554823d7-7437-d164-a93c-29faeef7857e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <554823d7-7437-d164-a93c-29faeef7857e@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Feb 27, 2023 at 01:22:37PM +0100, Philippe Mathieu-Daudé wrote:
> On 13/2/23 18:30, Bernhard Beschow wrote:
> > ICH9 is a south bridge which doesn't necessarily depend on x86, so move
> > it into the southbridge folder, analoguous to PIIX.
> 
> However it is still tied to it due to:
> 
> hw/isa/lpc_ich9.c:315:    cpu_interrupt(first_cpu, CPU_INTERRUPT_SMI);
> hw/isa/lpc_ich9.c:462:                cpu_interrupt(cs, CPU_INTERRUPT_SMI);
> hw/isa/lpc_ich9.c:465:            cpu_interrupt(current_cpu,
> CPU_INTERRUPT_SMI);
> target/i386/cpu.h:1145:#define CPU_INTERRUPT_SMI CPU_INTERRUPT_TGT_EXT_2

I guess at least the commit log should be changed then.


> > Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> > ---
> >   MAINTAINERS                             | 1 +
> >   include/hw/{i386 => southbridge}/ich9.h | 6 +++---
> >   hw/acpi/ich9.c                          | 2 +-
> >   hw/acpi/ich9_tco.c                      | 2 +-
> >   hw/i2c/smbus_ich9.c                     | 2 +-
> >   hw/i386/acpi-build.c                    | 2 +-
> >   hw/i386/pc_q35.c                        | 2 +-
> >   hw/isa/lpc_ich9.c                       | 2 +-
> >   hw/pci-bridge/i82801b11.c               | 2 +-
> >   tests/qtest/tco-test.c                  | 2 +-
> >   10 files changed, 12 insertions(+), 11 deletions(-)
> >   rename include/hw/{i386 => southbridge}/ich9.h (99%)


