Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83F63A4DD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 10:26:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozaOU-0004Ob-Rk; Mon, 28 Nov 2022 04:25:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozaOJ-0004OD-0y
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:25:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ozaOH-0004j2-DH
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 04:25:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669627524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VM5DgXIbzSZqYFmY+cyyr+XBJn838msUkT0cLqldeSU=;
 b=P7z5FEHPvGAI0JTomGmamAb32C+MSHohxGCEWzruMd3aOIEKAC1PDmdT05d50/hbbwmlxt
 nXOU6ty9zYHzgaa8H/HLOVvQifGFxcC7lKvSU4P4sDzIlQsaJp7nvneM6WvcUDAPO119/H
 RPyWVpsKyZMC/k/BHjdIt6SM2izBPVE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-530-e3ZhXHMCNnOx7ASZFVzw0g-1; Mon, 28 Nov 2022 04:25:23 -0500
X-MC-Unique: e3ZhXHMCNnOx7ASZFVzw0g-1
Received: by mail-wr1-f71.google.com with SMTP id
 o8-20020adfba08000000b00241e80f08e0so1670132wrg.12
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 01:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VM5DgXIbzSZqYFmY+cyyr+XBJn838msUkT0cLqldeSU=;
 b=FG+9o2jdNc0WC/S0aNjFyClz92V2ZJqBFEFrzZckpw+RSEcuu2PFhjQWlxtIpuv7lj
 upKjI4g34wwdMR70qE3FsBUNtFqPu9/tsttDtxfeGfD9h0t0l75WD5Tdxbci6ZSmuZ1F
 4rNWYg+miTfi2GqPUrpZrzPNdTVAj5ZKbPrqFzeVu3o0QNIUtrOKhB8CQGYR7V/mgaAP
 TIu+i07uO3PMIFh/T1eACqVCWx1InpIvkyhtgDVgfygs1oDBNP3gVXQKwAti1gEjo18S
 lKct7HXjRy0QKmL1AiSlBTz7wWkaffDylUKcr7P6aPCRrO7wud8KmXfC3OetUbID5y5Q
 aHcw==
X-Gm-Message-State: ANoB5pkOuQY+fUrfHeOzQnIph6eIGjc6YugT7eYy+LAG2kgiLbPgvSJk
 NTe9EJt9/5k9E3gfAcbGmtFnEVy9NRQZ6aazQKpTiTt8BINY/BHmADXEhxEKzEnQBnjI7z6gO2V
 pvPvvIZFJpzeIDAs=
X-Received: by 2002:a05:600c:19d1:b0:3cf:4d12:1b4b with SMTP id
 u17-20020a05600c19d100b003cf4d121b4bmr39380948wmq.23.1669627521887; 
 Mon, 28 Nov 2022 01:25:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6triIAB5asmbjTgrRX4r0jLYHtTKDmANxRltE4sxWb4q96tKschAz8qvJsHGtbQQTpcMSXYw==
X-Received: by 2002:a05:600c:19d1:b0:3cf:4d12:1b4b with SMTP id
 u17-20020a05600c19d100b003cf4d121b4bmr39380931wmq.23.1669627521595; 
 Mon, 28 Nov 2022 01:25:21 -0800 (PST)
Received: from redhat.com ([2.52.149.178]) by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c3b8300b003cfa81e2eb4sm15961067wms.38.2022.11.28.01.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 01:25:20 -0800 (PST)
Date: Mon, 28 Nov 2022 04:25:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, dgilbert@redhat.com
Subject: Re: [PATCH 00/12] pci: Move and clean up monitor command code
Message-ID: <20221128042502-mutt-send-email-mst@kernel.org>
References: <20221128080202.2570543-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128080202.2570543-1-armbru@redhat.com>
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

On Mon, Nov 28, 2022 at 09:01:50AM +0100, Markus Armbruster wrote:
> This is mainly about splitting off monitor-related code.  There's also
> a few UI fixes to HMP command pcie_aer_inject_error.  One UI issue
> remains: when the second argument is symbolic (found in table
> pcie_aer_error_list[]), then any -c is silently ignored.  Should it be
> rejected?  Should it override the value from the table?

Rejected I'd say.

> Markus Armbruster (12):
>   pci: Clean up a few things checkpatch.pl would flag later on
>   pci: Move QMP commands to new hw/pci/pci-qmp-cmds.c
>   pci: Move HMP commands from monitor/ to new hw/pci/pci-hmp-cmds.c
>   pci: Make query-pci stub consistent with the real one
>   pci: Build hw/pci/pci-hmp-cmds.c only when CONFIG_PCI
>   pci: Deduplicate get_class_desc()
>   pci: Move pcibus_dev_print() to pci-hmp-cmds.c
>   pci: Fix silent truncation of pcie_aer_inject_error argument
>   pci: Move HMP command from hw/pci/pcie_aer.c to pci-hmp-cmds.c
>   pci: Inline do_pcie_aer_inject_error() into its only caller
>   pci: Rename hmp_pcie_aer_inject_error()'s local variable @err
>   pci: Improve do_pcie_aer_inject_error()'s error messages
> 
>  hw/pci/pci-internal.h   |  25 +++++
>  include/monitor/hmp.h   |   1 +
>  include/sysemu/sysemu.h |   3 -
>  hw/pci/pci-hmp-cmds.c   | 234 ++++++++++++++++++++++++++++++++++++++++
>  hw/pci/pci-qmp-cmds.c   | 201 ++++++++++++++++++++++++++++++++++
>  hw/pci/pci-stub.c       |   9 +-
>  hw/pci/pci.c            | 226 +-------------------------------------
>  hw/pci/pcie_aer.c       | 113 +------------------
>  monitor/hmp-cmds.c      | 107 ------------------
>  hw/pci/meson.build      |   2 +
>  10 files changed, 476 insertions(+), 445 deletions(-)
>  create mode 100644 hw/pci/pci-internal.h
>  create mode 100644 hw/pci/pci-hmp-cmds.c
>  create mode 100644 hw/pci/pci-qmp-cmds.c
> 
> -- 
> 2.37.3


