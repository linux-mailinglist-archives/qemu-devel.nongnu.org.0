Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4773A1681EB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 16:38:36 +0100 (CET)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j5ANv-0000Kb-C8
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 10:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38196)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5AMM-0007YH-Oy
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:36:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5AML-0002RS-JB
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 10:36:58 -0500
Received: from mga01.intel.com ([192.55.52.88]:3589)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrzej.jakowski@linux.intel.com>)
 id 1j5AML-000249-7H; Fri, 21 Feb 2020 10:36:57 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 07:36:51 -0800
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="225246469"
Received: from ajakowsk-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.78.27.169])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 21 Feb 2020 07:36:50 -0800
Subject: Re: [PATCH v1] block/nvme: introduce PMR support from NVMe 1.4 spec
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <20200218224811.30050-1-andrzej.jakowski@linux.intel.com>
 <20200221134555.GK1484511@stefanha-x1.localdomain>
From: Andrzej Jakowski <andrzej.jakowski@linux.intel.com>
Message-ID: <e8aa39fd-b5eb-8ed2-445b-02cce3301748@linux.intel.com>
Date: Fri, 21 Feb 2020 08:36:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200221134555.GK1484511@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
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
Cc: kwolf@redhat.com, Haozhong Zhang <haozhong.zhang@intel.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 keith.busch@intel.com, Zhang Yi <yi.z.zhang@linux.intel.com>,
 Junyan He <junyan.he@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/20 6:45 AM, Stefan Hajnoczi wrote:
> Why is msync(2) done on memory loads instead of stores?

This is my interpretation of NVMe spec wording with regards to PMRWBM field
which says:

"The completion of a memory read from any Persistent
Memory Region address ensures that all prior writes to the
Persistent Memory Region have completed and are
persistent."

