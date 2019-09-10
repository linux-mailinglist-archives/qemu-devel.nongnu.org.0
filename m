Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1988BAF212
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 21:53:33 +0200 (CEST)
Received: from localhost ([::1]:44642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7mCi-0005Fw-4s
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 15:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33208)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sean.j.christopherson@intel.com>) id 1i7m5Y-0005y4-0u
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 15:46:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sean.j.christopherson@intel.com>) id 1i7m5W-000594-Ew
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 15:46:07 -0400
Received: from mga09.intel.com ([134.134.136.24]:45239)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sean.j.christopherson@intel.com>)
 id 1i7m5W-00056C-7K
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 15:46:06 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 12:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; d="scan'208";a="189448727"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.41])
 by orsmga006.jf.intel.com with ESMTP; 10 Sep 2019 12:45:57 -0700
Date: Tue, 10 Sep 2019 12:45:57 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Larry Dewey <ldewey@suse.com>
Message-ID: <20190910194556.GC11151@linux.intel.com>
References: <20190806185649.2476-1-sean.j.christopherson@intel.com>
 <20190806185649.2476-4-sean.j.christopherson@intel.com>
 <0be06fee919426129b2f379609f76bd260fba49c.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0be06fee919426129b2f379609f76bd260fba49c.camel@suse.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-devel] [RFC PATCH 03/20] vl: Add "sgx-epc" option to
 expose SGX EPC sections to guest
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 06, 2019 at 09:49:44PM +0000, Larry Dewey wrote:
> I was playing with the new objects, etc, and found if the user
> specifies -sgx-epc, and a memory device, but does not specify -cpu
> host, +sgx, the vm runs without any warnings, while obviously not doing
> anything to the memory. Perhaps some warnings if not everything which
> is required is provided?

Yeah, I waffled on what to do in this scenario.  Ditto for the opposite
scenario of having SGX enabled without EPC.   I agree a warning or error
would be helpful for EPC-without-SGX.  The SGX-without-EPC case at least
makes some sense, e.g. to mimic BIOS not partitioning EPC, and doesn't
waste resources.

