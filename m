Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88487168842
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 21:21:49 +0100 (CET)
Received: from localhost ([::1]:35896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5Eo0-0000uv-JP
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 15:21:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51030)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5Emo-0008Pg-E3
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 15:20:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5Emn-0006hM-HG
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 15:20:34 -0500
Received: from mga18.intel.com ([134.134.136.126]:50348)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5Emn-0006fd-7s; Fri, 21 Feb 2020 15:20:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 12:20:31 -0800
X-IronPort-AV: E=Sophos;i="5.70,469,1574150400"; d="scan'208";a="229957191"
Received: from ajakowsk-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.78.27.169])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 21 Feb 2020 12:20:30 -0800
Subject: Re: [PATCH v1] block/nvme: introduce PMR support from NVMe 1.4 spec
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20200218224811.30050-1-andrzej.jakowski@linux.intel.com>
 <20200221134555.GK1484511@stefanha-x1.localdomain>
 <e8aa39fd-b5eb-8ed2-445b-02cce3301748@linux.intel.com>
 <CAJSP0QWXsZXBr_iVJp11FHYYj2Zb1NU62vA6kaR36mOH9B8abA@mail.gmail.com>
 <CAJSP0QUFJoBANYO0=42vfcPS8MUZJdKab=g88cpVW6oD_UoV5A@mail.gmail.com>
From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Message-ID: <ecee88f1-0fcf-a421-bdde-6506db508e96@linux.intel.com>
Date: Fri, 21 Feb 2020 13:20:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAJSP0QUFJoBANYO0=42vfcPS8MUZJdKab=g88cpVW6oD_UoV5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
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
Cc: Kevin Wolf <kwolf@redhat.com>, Haozhong Zhang <haozhong.zhang@intel.com>,
 qemu block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <keith.busch@intel.com>,
 Zhang Yi <yi.z.zhang@linux.intel.com>, Junyan He <junyan.he@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/20 12:32 PM, Stefan Hajnoczi wrote:
> Hi Andrzej,
> After having looked at the PMRWBM part of the spec, I think that the
> Bit 1 mode should be implemented for slightly better performance.  Bit
> 0 mode is not well-suited to virtualization for the reasons I
> mentioned in the previous email.
> 
> The spec describes Bit 1 mode as "The completion of a read to the
> PMRSTS register shall ensure that all prior writes to the Persistent
> Memory Region have completed and are persistent".
> 
> Stefan

Make sense -- will incorporate that feedback in second version of patch.

