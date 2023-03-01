Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C66A760A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:17:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXToN-0000ZZ-Vs; Wed, 01 Mar 2023 16:16:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXToL-0000Yv-98
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:16:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXToJ-0002uQ-CG
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677705386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4HhkdaIwu6j5wa6M5L8Lg9apLoZat1ruK/7X+VCNU8s=;
 b=QBH3Bk5OiBkHT0ST38zfUIdfodn6RzJ/57RLSNKVXFc02jsvhu7JtfBnTkSlWlDkhrrB2Y
 B8JIWMTkUmeh1MEMJWkz7JdnQAM6KuMwT+0zehsUZymNDmJbQ+uiFjQWvNKwnAfySlZJpo
 W7LVcm3zM0If/HlhIJd9eUe+jO/asVs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-O4S_ibRSPWuIr1xqy1P0dg-1; Wed, 01 Mar 2023 16:16:24 -0500
X-MC-Unique: O4S_ibRSPWuIr1xqy1P0dg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k26-20020a05600c0b5a00b003dfe4bae099so229417wmr.0
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677705382;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HhkdaIwu6j5wa6M5L8Lg9apLoZat1ruK/7X+VCNU8s=;
 b=RbQCWUa5M38J98fyULaWl45tWFXVjkTKm9EQj1oCanu2auJJBfi88bm80OoFElhUnO
 /9qg1LvnWMJMK6m2JOJer1jVFw2Il5QQfkBvGzMjdGWbgcZHteDyNZsi1rpODp4veF04
 mvOcVmm8orYxVAJd++2Q2aK/UahySSA3Cc/HraBaicyqU5KYiIuSexL3BQ+UtUxlEp/u
 nB5jm6ALZcUB0NU3FH2JQyF0T/da9rrSkbj2QztRlHtTwkXZj3F1lLd7NVl7devmbMpa
 sGk3/F8apuuzeLTbfDU1R6838e/KjoB+N7oej2cAdfWWoClsch6fdPG2Wsann+hWsLA3
 Ovcw==
X-Gm-Message-State: AO0yUKVXTTt8SbKMMeX2lT1PQckfzBpFYmAEy+Fd7ZFXX65CqgnhAGgq
 x2a8vWlkl7aIpa2uqHaHB3v5ti7iimX3+Urb+kKHW2lDuT8AE7tiGIs7eIJyPVjqLIiyT1bWrYM
 NFxe9KuHxx1MJEvA=
X-Received: by 2002:a05:600c:3197:b0:3e1:f8af:8772 with SMTP id
 s23-20020a05600c319700b003e1f8af8772mr6045985wmp.9.1677705382109; 
 Wed, 01 Mar 2023 13:16:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/gtgaZCHQFxrPJaSagbqK0jbBeNMj82Q3nxeRr/bDwO8ObZW6PR8zTg9AW9ANuOtSPfyVARg==
X-Received: by 2002:a05:600c:3197:b0:3e1:f8af:8772 with SMTP id
 s23-20020a05600c319700b003e1f8af8772mr6045968wmp.9.1677705381749; 
 Wed, 01 Mar 2023 13:16:21 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 w3-20020adff9c3000000b002c7e1a39adcsm13728177wrr.23.2023.03.01.13.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:16:21 -0800 (PST)
Date: Wed, 1 Mar 2023 16:16:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: Re: [PATCH v5 00/18] pci hotplug tracking
Message-ID: <20230301161540-mutt-send-email-mst@kernel.org>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216180356.156832-1-vsementsov@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Thu, Feb 16, 2023 at 09:03:38PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Hi all!
> 
> v5: - don't deprecate IDs and return to ID & QOM scheme
>     - split complicated HOTPLUG_STATE patch into several ones


One small point: when you change patchset subject, that is ok,
but pls reply to old patchset with an email explaining that.

> ----
> 
> The main patches are the last four ones:
> 
> - introduce HOTPLUG_STATE event, that inform when hotplug controller
> change it's state, especially indicator leds
> 
> - query-hotplug command, that provides same information as event on
> demand
> 
> - DEVICE_ON event - a kind of counterpart for DEVICE_DELETED, signals
> when device is finally accepted by guest, power indicator is on and so
> on.
> 
> That's all for smarter handling of SHPC and PCIe-native hotplug.
> 
> If you want to test new events, don't forget
>   -global ICH9-LPC.acpi-pci-hotplug-with-bridge-support=off
> flag, to disable ACPI hotplug default.
> 
> Vladimir Sementsov-Ogievskiy (18):
>   pci/shpc: set attention led to OFF on reset
>   pci/shpc: change shpc_get_status() return type to uint8_t
>   pci/shpc: shpc_slot_command(): handle PWRONLY -> ENABLED transition
>   pci/shpc: more generic handle hot-unplug in shpc_slot_command()
>   pci/shpc: pass PCIDevice pointer to shpc_slot_command()
>   pci/shpc: refactor shpc_device_plug_common()
>   pcie: pcie_cap_slot_write_config(): use correct macro
>   pcie_regs: drop duplicated indicator value macros
>   pcie: drop unused PCIExpressIndicator
>   pcie: pcie_cap_slot_enable_power() use correct helper
>   pcie: introduce pcie_sltctl_powered_off() helper
>   pcie: set power indicator to off on reset by default
>   pci: introduce pci_find_the_only_child()
>   qapi/qdev.json: unite DEVICE_* event data into single structure
>   qapi: add HOTPLUG_STATE infrastructure
>   shpc: implement HOTPLUG_STATE event and query-hotplug
>   pcie: implement HOTPLUG_STATE event and query-hotplug
>   qapi: introduce DEVICE_ON event
> 
>  qapi/qdev.json                  | 224 ++++++++++++++++++++++++++++++--
>  include/hw/hotplug.h            |  12 ++
>  include/hw/pci/pci.h            |   1 +
>  include/hw/pci/pci_bridge.h     |   2 +
>  include/hw/pci/pcie.h           |  10 +-
>  include/hw/pci/pcie_regs.h      |  14 --
>  include/hw/pci/shpc.h           |   2 +
>  include/monitor/qdev.h          |   7 +
>  hw/core/hotplug.c               |  13 ++
>  hw/pci-bridge/pci_bridge_dev.c  |  14 ++
>  hw/pci-bridge/pcie_pci_bridge.c |   1 +
>  hw/pci/pci.c                    |  33 +++++
>  hw/pci/pcie.c                   | 122 +++++++++++++++--
>  hw/pci/pcie_port.c              |   1 +
>  hw/pci/shpc.c                   | 214 ++++++++++++++++++++++--------
>  softmmu/qdev-monitor.c          |  67 ++++++++++
>  16 files changed, 639 insertions(+), 98 deletions(-)
> 
> -- 
> 2.34.1


