Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35316A760D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:18:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTpV-0002PV-J2; Wed, 01 Mar 2023 16:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTpT-0002HH-4P
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:17:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXTpR-0003Ex-9q
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677705456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PKp34oxNGUDGRcUTMvERKkFhboZYhoklPAUawXOlP5A=;
 b=UgAHSeMqxveXjEzCpV/CHAZ08WmksWMwoJgK/GN8L6mIrQBMO8GxAc7aPV2XkGd8MXIQaK
 a8lL81KL/zCJP1te+nOmfdEaYuJzC3/UV+umGpVxQWEUYdVECbjrw0sSUq/TyFnn5c9CAc
 AjF7zgF09wJPzFh5VWkkXDPWEscK8j4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-657-Czu4dJMGNSuwQe1s6Jospg-1; Wed, 01 Mar 2023 16:17:34 -0500
X-MC-Unique: Czu4dJMGNSuwQe1s6Jospg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso5006445wmi.7
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677705453;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PKp34oxNGUDGRcUTMvERKkFhboZYhoklPAUawXOlP5A=;
 b=g8V5ECMVTFnG+3/IszFvZDsb9xUXUGEqWleKaaujXhcqxc2MdxD5AU8VEbzIyIncwX
 UTN8ykepH+g8wKB4meYkHeU/Nc1Yj8NgvE2jHYu+EEYnwetnvIzqhPleIu16fkn4uhYh
 kjgsP776no/cloTW4wCFkovwrgkFe0FE5POnLPRW6Ac46r0zxM871yU9xLhNzMmPMGNL
 oeufgCU2daKGFZH3gqHsPieGzwAT34sSv+qJYzI3n16eyvv7wHdQBUssjmPO60YoGSM8
 S+gLJeGFwrrdYqSfiIJI8orWMq3Xj0EPQbokK8y9B2zD7R3AxaQNkyhtjOVUXFYAmK+r
 xOUA==
X-Gm-Message-State: AO0yUKUUFJOHoiKDXbIlMgrMP3JjvK0s+r1HRWHO+MgZGUacawL4LuxN
 EpcLRtcthOjfILqV/19ViBoGUZex2ZHDKSaEhUqxXx0fzQMbSzCfgmAG5F6VfS5lGluVtFimd8z
 cqhk5Eilt4DhGuSE=
X-Received: by 2002:a05:600c:4a9f:b0:3eb:2da5:e19 with SMTP id
 b31-20020a05600c4a9f00b003eb2da50e19mr6104647wmp.27.1677705452951; 
 Wed, 01 Mar 2023 13:17:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZtL1qBSai4ReJI/sw04V6RVknhSWS6vZSet2oQBL8tqD6LQxUuXtWG74ElBIHxrqPhEIElw==
X-Received: by 2002:a05:600c:4a9f:b0:3eb:2da5:e19 with SMTP id
 b31-20020a05600c4a9f00b003eb2da50e19mr6104631wmp.27.1677705452636; 
 Wed, 01 Mar 2023 13:17:32 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 c21-20020a7bc015000000b003e214803343sm645656wmb.46.2023.03.01.13.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:17:32 -0800 (PST)
Date: Wed, 1 Mar 2023 16:17:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: Re: [PATCH v5 00/18] pci hotplug tracking
Message-ID: <20230301161637-mutt-send-email-mst@kernel.org>
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


picked up 1-12

new events and commands need more review, in particular by qapi
maintainers.

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


