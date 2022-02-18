Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8334BB456
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 09:34:54 +0100 (CET)
Received: from localhost ([::1]:59952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKyj7-0006iE-VV
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 03:34:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKyal-0000nS-DR
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:26:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nKyaj-0001fj-Qv
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 03:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645172773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=34AGYDQIQCJvMC1wHMCeWhFxliCSsTBdb++B/eEJ0pk=;
 b=QANYKufwU+iCatC+qLY2YM7QnTh9jCdWU7/w8UFFw9DR8SJoEZIvbRi8Y35vkr4jY98vPh
 wQsV0akeu1pVFYhzjxFjPeLNd4d5wIQbaXVaYDa1vYEsMFAhv2GJBxLI3q2qmS7UZEgjG9
 lftXNhTf+7k+bV++/JH6GhcnRiGUdag=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-O6LoXxX7MsqSbv-i9SfOXA-1; Fri, 18 Feb 2022 03:26:12 -0500
X-MC-Unique: O6LoXxX7MsqSbv-i9SfOXA-1
Received: by mail-ej1-f71.google.com with SMTP id
 d7-20020a1709061f4700b006bbf73a7becso2679412ejk.17
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 00:26:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=34AGYDQIQCJvMC1wHMCeWhFxliCSsTBdb++B/eEJ0pk=;
 b=EgUN3ijrs73pzmiw6SEyFUwcOgiYgWBAFVeMyK/FQatfQFWmZ4xMfnOVq7+kOrz/bO
 WMmhkrvVBAfmZxZAPxjHfSxUzQjDI1Ljn+qvWD6YqmSnNu+ydLkxGVAuhPpEAjkww+GL
 uNDQ2ioMTwW9JxkHlWcv85Wgnh//5rTY2rqPQPDlgXr6hncw9uQOdnLR0LvgSDnWAhSI
 v/8vxfpMgEz7YDu52ikP7f4VvTCo0qPjyxZViMD8gwvybyyX/3CCDsDwjfJ526++7LVG
 wcdaWlqg8jwbVIPajquBm3Dg3WAVw4HRlh5k35Niik92DVQRadQbycyC3RHpdQ3A09Bv
 Y5KQ==
X-Gm-Message-State: AOAM532hPE5ApjMhP4gSrgulGqYuFA0m1Js7o/f0FjXrOBmKygjPUMle
 FTAT5qZXtpxA59a3EdaTkoSQs91nLruv2YFU3ocAEIjEllDTJFhh8gMnvZ0V3C5QcX9HlQ9cF3S
 1VKUxWXnURT8Dh7s=
X-Received: by 2002:a17:907:29c6:b0:6c7:e441:9e07 with SMTP id
 ev6-20020a17090729c600b006c7e4419e07mr5613572ejc.293.1645172770863; 
 Fri, 18 Feb 2022 00:26:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFm12tp6nhOq40FJ8t6oi5jcY6FukHEMLY2gXHGddc9raQEh4rwbHqezevsEecUNl8H1BU+g==
X-Received: by 2002:a17:907:29c6:b0:6c7:e441:9e07 with SMTP id
 ev6-20020a17090729c600b006c7e4419e07mr5613561ejc.293.1645172770690; 
 Fri, 18 Feb 2022 00:26:10 -0800 (PST)
Received: from redhat.com ([2.55.156.211])
 by smtp.gmail.com with ESMTPSA id el9sm2038141ejc.168.2022.02.18.00.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 00:26:10 -0800 (PST)
Date: Fri, 18 Feb 2022 03:26:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lukasz Maniak <lukasz.maniak@linux.intel.com>
Subject: Re: [PATCH v5 00/15] hw/nvme: SR-IOV with Virtualization Enhancements
Message-ID: <20220218032528-mutt-send-email-mst@kernel.org>
References: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20220217174504.1051716-1-lukasz.maniak@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 =?utf-8?Q?=C5=81ukasz?= Gieryk <lukasz.gieryk@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 06:44:49PM +0100, Lukasz Maniak wrote:
> Changes since v4:
> - Added hello world example for SR-IOV to the docs
> - Moved AER initialization from nvme_init_ctrl to nvme_init_state
> - Fixed division by zero issue in calculation of vqfrt and vifrt
>   capabilities


So do you want to merge it all with nvme bits? which tree is this for?
Or would you like me to merge the pci bits for now?
Thanks!

> Knut Omang (2):
>   pcie: Add support for Single Root I/O Virtualization (SR/IOV)
>   pcie: Add some SR/IOV API documentation in docs/pcie_sriov.txt
> 
> Lukasz Maniak (4):
>   hw/nvme: Add support for SR-IOV
>   hw/nvme: Add support for Primary Controller Capabilities
>   hw/nvme: Add support for Secondary Controller List
>   docs: Add documentation for SR-IOV and Virtualization Enhancements
> 
> Łukasz Gieryk (9):
>   pcie: Add a helper to the SR/IOV API
>   pcie: Add 1.2 version token for the Power Management Capability
>   hw/nvme: Implement the Function Level Reset
>   hw/nvme: Make max_ioqpairs and msix_qsize configurable in runtime
>   hw/nvme: Remove reg_size variable and update BAR0 size calculation
>   hw/nvme: Calculate BAR attributes in a function
>   hw/nvme: Initialize capability structures for primary/secondary
>     controllers
>   hw/nvme: Add support for the Virtualization Management command
>   hw/nvme: Update the initalization place for the AER queue
> 
>  docs/pcie_sriov.txt          | 115 ++++++
>  docs/system/devices/nvme.rst |  82 +++++
>  hw/nvme/ctrl.c               | 674 ++++++++++++++++++++++++++++++++---
>  hw/nvme/ns.c                 |   2 +-
>  hw/nvme/nvme.h               |  55 ++-
>  hw/nvme/subsys.c             |  75 +++-
>  hw/nvme/trace-events         |   6 +
>  hw/pci/meson.build           |   1 +
>  hw/pci/pci.c                 | 100 ++++--
>  hw/pci/pcie.c                |   5 +
>  hw/pci/pcie_sriov.c          | 302 ++++++++++++++++
>  hw/pci/trace-events          |   5 +
>  include/block/nvme.h         |  65 ++++
>  include/hw/pci/pci.h         |  12 +-
>  include/hw/pci/pci_ids.h     |   1 +
>  include/hw/pci/pci_regs.h    |   1 +
>  include/hw/pci/pcie.h        |   6 +
>  include/hw/pci/pcie_sriov.h  |  77 ++++
>  include/qemu/typedefs.h      |   2 +
>  19 files changed, 1505 insertions(+), 81 deletions(-)
>  create mode 100644 docs/pcie_sriov.txt
>  create mode 100644 hw/pci/pcie_sriov.c
>  create mode 100644 include/hw/pci/pcie_sriov.h
> 
> -- 
> 2.25.1
> 
> 
> 


