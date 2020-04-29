Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F6E1BD41C
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 07:41:50 +0200 (CEST)
Received: from localhost ([::1]:50046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTfTh-0000gp-OG
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 01:41:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jTfSe-0000BF-UF
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 01:40:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jTfSe-00036H-I1
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 01:40:44 -0400
Received: from charlie.dont.surf ([128.199.63.193]:45486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jTfSc-0002qD-IX; Wed, 29 Apr 2020 01:40:42 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 77100BF425;
 Wed, 29 Apr 2020 05:40:38 +0000 (UTC)
Date: Wed, 29 Apr 2020 07:40:35 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: Re: [PATCH v4 00/18] nvme: factor out cmb/pmr setup
Message-ID: <20200429054035.qjpyllea6ywnudc3@apples.localdomain>
References: <20200422110152.397572-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200422110152.397572-1-its@irrelevant.dk>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/29 01:40:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Javier Gonzalez <javier.gonz@samsung.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apr 22 13:01, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Changes since v3
> ~~~~~~~~~~~~~~~~
> * Remove the addition of a new PROPERTIES macro in "nvme: move device
>   parameters to separate struct" (Philippe)
> 
> * Add NVME_PMR_BIR constant and use it in PMR setup.
> 
> * Split "nvme: factor out cmb/pmr setup" into
>   - "nvme: factor out cmb setup",
>   - "nvme: factor out pmr setup" and
>   - "nvme: do cmb/pmr init as part of pci init"
>   (Philippe)
> 
> 
> Klaus Jensen (18):
>   nvme: fix pci doorbell size calculation
>   nvme: rename trace events to pci_nvme
>   nvme: remove superfluous breaks
>   nvme: move device parameters to separate struct
>   nvme: use constants in identify
>   nvme: refactor nvme_addr_read
>   nvme: add max_ioqpairs device parameter
>   nvme: remove redundant cmbloc/cmbsz members
>   nvme: factor out property/constraint checks
>   nvme: factor out device state setup
>   nvme: factor out block backend setup
>   nvme: add namespace helpers
>   nvme: factor out namespace setup
>   nvme: factor out pci setup
>   nvme: factor out cmb setup
>   nvme: factor out pmr setup
>   nvme: do cmb/pmr init as part of pci init
>   nvme: factor out controller identify setup
> 
>  hw/block/nvme.c       | 543 ++++++++++++++++++++++++------------------
>  hw/block/nvme.h       |  31 ++-
>  hw/block/trace-events | 180 +++++++-------
>  include/block/nvme.h  |   8 +
>  4 files changed, 429 insertions(+), 333 deletions(-)
> 
> -- 
> 2.26.2
> 
> 

Gentle bump on this.

I apparently managed to screw up the git send-email this time, loosing a
bunch of CCs in the process. Sorry about that.

