Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B781D7012
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 07:04:00 +0200 (CEST)
Received: from localhost ([::1]:32806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaXwV-0007sM-Db
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 01:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jaXvB-0007MU-74; Mon, 18 May 2020 01:02:37 -0400
Received: from charlie.dont.surf ([128.199.63.193]:51428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jaXv9-00041b-Ml; Mon, 18 May 2020 01:02:36 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 0F14BBF607;
 Mon, 18 May 2020 05:02:30 +0000 (UTC)
Date: Mon, 18 May 2020 07:02:27 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: Re: [PATCH v6 07/20] hw/block/nvme: fix pin-based interrupt behavior
Message-ID: <20200518050227.i7yxsoovnedqbcqf@apples.localdomain>
References: <20200514044611.734782-1-its@irrelevant.dk>
 <20200514044611.734782-8-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200514044611.734782-8-its@irrelevant.dk>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 01:02:32
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On May 14 06:45, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> First, since the device only supports MSI-X or pin-based interrupt, if
> MSI-X is not enabled, it should not accept interrupt vectors different
> from 0 when creating completion queues.
> 
> Secondly, the irq_status NvmeCtrl member is meant to be compared to the
> INTMS register, so it should only be 32 bits wide. And it is really only
> useful when used with multi-message MSI.
> 
> Third, since we do not force a 1-to-1 correspondence between cqid and
> interrupt vector, the irq_status register should not have bits set
> according to cqid, but according to the associated interrupt vector.
> 
> Fix these issues, but keep irq_status available so we can easily support
> multi-message MSI down the line.
> 
> Fixes: 5e9aa92eb1a5 ("hw/block: Fix pin-based interrupt behaviour of NVMe")
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme.c | 12 ++++++++----
>  hw/block/nvme.h |  2 +-
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 

Gentle ping on this and [PATCH v6 08/20].


Thanks,
Klaus

