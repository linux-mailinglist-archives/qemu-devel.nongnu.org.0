Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F1472148
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 23:08:01 +0200 (CEST)
Received: from localhost ([::1]:47360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hq20u-0003gI-2d
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 17:08:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54677)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kbusch@kernel.org>) id 1hq20h-0003E2-MU
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 17:07:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbusch@kernel.org>) id 1hq20g-0001IH-Sh
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 17:07:47 -0400
Received: from mga17.intel.com ([192.55.52.151]:62465)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbusch@kernel.org>)
 id 1hq20e-00019p-Rl; Tue, 23 Jul 2019 17:07:45 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 14:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; d="scan'208";a="253352897"
Received: from unknown (HELO localhost.localdomain) ([10.232.112.69])
 by orsmga001.jf.intel.com with ESMTP; 23 Jul 2019 14:07:40 -0700
Date: Tue, 23 Jul 2019 15:04:43 -0600
From: Keith Busch <kbusch@kernel.org>
To: Matt Fitzpatrick <matt.fitzpatrick@oakgatetech.com>
Message-ID: <20190723210443.GD4002@localhost.localdomain>
References: <8115eb18-38c0-2bd9-b7d7-2d0c96a106e7@oakgatetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8115eb18-38c0-2bd9-b7d7-2d0c96a106e7@oakgatetech.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.151
Subject: Re: [Qemu-devel] [RFC,v1] Namespace Management Support
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
Cc: keith.busch@intel.com, kwolf@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 02, 2019 at 10:39:36AM -0700, Matt Fitzpatrick wrote:
> Adding namespace management support to the nvme device. Namespace creation
> requires contiguous block space for a simple method of allocation.

I guess that means this won't handle creating a large namespace
from fragmented unallocated space after various create+delete
scenarios. Capping the create size to the max contiguous extent may not
be so bad, but it may be confusing when UNVMCAP exceeds the largest
possible namespace you can create when we have no good way to report
the max possible creation size.

